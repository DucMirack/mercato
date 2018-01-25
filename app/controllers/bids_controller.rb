class BidsController < ApplicationController
  before_action :set_bid, only: [:show, :update, :destroy]

  # GET /bids
  def index
    @bids = Bid.all

    render json: @bids
  end

  # GET /bids/1
  def show
    render json: @bid
  end

  # POST /bids
  def create
    @bid = Bid.new(bid_params)

    if @bid.save
      render json: @bid, status: :created, location: @bid
    else
      render json: @bid.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bids/1
  def update
    if @bid.update(bid_params)
      render json: @bid
    else
      render json: @bid.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bids/1
  def destroy
    @bid.destroy
  end

  #GET /bids/close_round
  def close_round
    winning_bids_array = []

    # -------- Pour tester avec le front ----------
    if params.has_key?(:user_id)
      user = User.find(params.values_at(:user_id)).first
      user.update_attribute(:is_round_closed, true)
      if User.all.all?(&:is_round_closed)
        current_round = user.nb_round
        bids = Bid.where(nb_round: current_round)

        if bids.empty? == false
          while bids.count > 0
            bids = Bid.where(id: bids.map(&:id))
            bids_with_same_player = bids.where(player: bids.first.player)
            # Récupère le bid avec la meilleure enchère
            winning_bid = bids_with_same_player.max_by(&:price)
            # Assigne le joueur à l'utilisateur qui l'a gagné
            winning_user = winning_bid.user
            winning_bid.player.user = winning_user
            # Soustrait l'argent du joueur gagné à l'utilisateur
            winning_user.money -= winning_bid.price
            winning_bids_array.push(winning_bid)
            # On enregistre les modifs en BDD
            winning_bid.player.save
            winning_user.save
            # Enlève les bids du même joueur qui viennent d'être comparé à toutes les bids
            bids -= bids_with_same_player
          end
          User.update_all(nb_round: current_round + 1)
          User.update_all(is_round_closed: false)
          render json: winning_bids_array.map(&:user)
          return
        else
         render json: {warning: "Aucune enchère sur ce tour"}
        end
      else render json: {info: "Tout les joueurs n'ont pas validé leur tour"}
      end
    # -------- Pour tester avec juste l'API ----------
    else 
      current_round = User.first.nb_round
      bids = Bid.where(nb_round: current_round)

      if bids.empty? == false
        while bids.count > 0
          bids = Bid.where(id: bids.map(&:id))
          bids_with_same_player = bids.where(player: bids.first.player)
          # Récupère le bid avec la meilleure enchère
          winning_bid = bids_with_same_player.max_by(&:price)
          # Assigne le joueur à l'utilisateur qui l'a gagné
          winning_user = winning_bid.user
          winning_bid.player.user = winning_user
          # Soustrait l'argent du joueur gagné à l'utilisateur
          winning_user.money -= winning_bid.price
          winning_bids_array.push(winning_bid)
          # On enregistre les modifs en BDD
          winning_bid.player.save
          winning_user.save
          # Enlève les bids du même joueur qui viennent d'être comparé à toutes les bids
          bids -= bids_with_same_player
        end
        User.update_all(nb_round: current_round + 1)
        render json: winning_bids_array.map(&:user)
        return
      end
      render json: {warning: "Aucune enchère sur ce tour"} if bids.empty?
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bid
      @bid = Bid.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def bid_params
      params.require(:bid).permit(:price, :is_win, :nb_round, :user_id, :player_id)
    end
end

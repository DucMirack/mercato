class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy, :get_players]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  # POST /users/login
  def login
    mail, password = params.values_at(:mail, :password)
    user = User.where(mail: mail, password: password)
    render json: user
  end

  def get_current_round
    render json: User.first.nb_round
  end

  def get_players 
    render json: @user.players
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:mail, :password, :last_name, :first_name, :pseudo, :nb_round, :is_round_closed, :is_mercato_closed, :money)
    end
end

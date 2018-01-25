import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';
import Cookies from 'universal-cookie'
import Price from './price.js'

class Home extends Component {
  
  constructor (props) {
    super(props)
    this.state = {
      player: this.getPlayer.bind(this),
      players: this.getPlayers.bind(this),
      user_id: null,
      mounted: false
    }
  }

  componentWillMount = () => {
    const cookies = new Cookies();
    this.setState({user_id: cookies.get('mercato-cookie')})
  }

  componentDidMount() {
    this.getPlayers()
    this.setState({mounted: true})
  }

  fetch (endpoint) {
    return new Promise((resolve, reject) => {
      window.fetch(endpoint)
      .then(response => response.json())
      .then(json => resolve(json))
      .catch(error => reject(error))
    })
  }


  getPlayers () {
    this.fetch('players/free')
      .then(players => {
        this.setState({players: players})
      })
  }
  getPlayer (id) {
      this.fetch(`players/${id}`)
        .then(player => this.setState({player: player}))
  }

  closeRound = () => {
    let url = 'http://127.0.0.1:3001/close-round?user_id=' + this.state.user_id
    fetch(url)
    .then((response => response.json()))
    .then(res => {
      console.log(res)
      window.location.reload()
    })
  }

  render() {
    if (this.state.players.length > 0){ 
      var players = this.state.players.map((item, i) => {
        return(<tr key={i}>
        <td> {item.name}</td>
        <td> {item.position}</td>
        <td> {item.min_price}</td>
        <Price
          min_price = {item.min_price}
          player_id = {item.id}
        />
        </tr>);
      })
    }
    return (
      <div className="Home">
        <table>
          <thead>
            <tr>
              <th> Nom </th>
              <th> Position </th>
              <th> Prix minimum </th>
              <th> Mise </th>
              <th> Parier  </th>
            </tr>
          </thead>
          <tbody>{players}</tbody>
          <td> <input type="submit" value="Fermer le tour"  onClick={this.closeRound}/></td>
        </table>
      </div>
    );
  }
}

export default Home;

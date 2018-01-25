import React, { Component } from 'react';
import './App.css';
import Cookies from 'universal-cookie'


class GetPlayers extends Component {
  
  constructor (props) {
    super(props)
    this.state = {
      user_id: null,
      players: []
    }
  }

  componentWillMount = () => {
    const cookies = new Cookies();
    this.setState({user_id: cookies.get('mercato-cookie')})
  }

  componentDidMount = () => {
    this.getPlayers()
  }

  getPlayers = () => {
    let url = 'http://127.0.0.1:3001/users/' + this.state.user_id + '/players'
    fetch(url)
      .then((response => response.json()))
      .then(players => {
         this.setState({players: players})
      })
  }

  render() {
    if (this.state.players.length > 0){ 
      var players = this.state.players.map((item, i) => {
        return(<tr key={i}>
        <td> {item.name}</td>
        <td> {item.position}</td>
        </tr>);
      })
    }
    return (
      <div className="Players">
        <table>
          <thead>
            <tr>
              <th> Nom </th>
              <th> Position </th>
            </tr>
          </thead>
          <tbody>{players}</tbody>
        </table>
      </div>
    );
  }
}

export default GetPlayers;

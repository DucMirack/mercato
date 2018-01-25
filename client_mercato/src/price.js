import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';
import Cookies from 'universal-cookie'


class Price extends Component {
  
  constructor (props) {
    super(props)
    this.state = {
      price: null,
      user_id: null
    }
  }

  componentWillMount = () => {
    const cookies = new Cookies();
    this.setState({user_id: cookies.get('mercato-cookie')})
  }

  handlePrice = (e) => {
    this.setState({price: e.target.value})
  }

  createBid = () => {
    fetch('http://127.0.0.1:3001/bids', {
        method: 'post',
        body: JSON.stringify({
                  price: this.state.price,
                  user_id: this.state.user_id,
                  player_id: this.props.player_id
                }),
        headers: {
          'Accept': 'application/json',
          'Content-type': 'application/json'
        }
      })
      .then((response => response.json()))
      .then((res) => {
        document.getElementById(this.props.player_id + "1").style.display = 'none'
        document.getElementById(this.props.player_id + "2").style.display = 'none'
      })
  }

  render() {
    return (
      <div>
        <td> <input id={this.props.player_id + "1"} type="number" placeholder={this.props.min_price} min={this.props.min_price} onChange={this.handlePrice}/></td>
        <td> <input id={this.props.player_id + "2"} type="submit" value="Miser sur le joueur" onClick={this.createBid}/></td>
      </div>
    );
  }
}

export default Price;

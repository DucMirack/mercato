import React, {Component} from 'react'
import axios from 'axios'
import Cookies from 'universal-cookie'
import {Redirect} from 'react-router-dom'
import './App.css'

class Auth extends Component {

  constructor(props){
  	super(props)
  	this.state = {
  		mail: null,
  		password: null,
  		redirect: false
  	}
  }

  login = () => {
  	if(this.state.mail != null && this.state.password != null){
  		fetch('http://127.0.0.1:3001/login', {
  			method: 'post',
  			body: JSON.stringify({
  			  				mail: this.state.mail,
  			  				password: this.state.password
  			  			}),
  			headers: {
  				'Accept': 'application/json',
  				'Content-type': 'application/json'
  			}
  		})
  		.then((response => response.json()))
  		.then((res) => {
  			if(res.length === 1 ){
  				const cookies = new Cookies();
  				cookies.set('mercato-cookie',res[0].id,{path: '/'});
  				this.setState({redirect: true})
  			}
  		})
  	}
  }

  change = (e) => {
  	switch (e.target.id){
  		case 'maillogin':
  			this.setState({mail: e.target.value})
  			break;
  		case 'passwordlogin':
  			this.setState({password: e.target.value})
  			break;
  	}
  }

	render() {
		if(this.state.redirect){
			return(
				<Redirect to='/' />
			)
		}
		return (
			<div className="col-3 offset-2 card mt-5">
        <h2>Connexion</h2>
        <div className="form-group">
          <label htmlFor="mail">Email address</label>
          <input type="email" className="form-control" id="maillogin" aria-describedby="emailHelp" placeholder="Enter email" onChange={this.change}/>
        </div>
        <div className="form-group">
          <label htmlFor="password">Password</label>
          <input type="password" className="form-control" id="passwordlogin" placeholder="Password" onChange={this.change}/>
        </div>
        <button type="submit" className="btn btn-primary" onClick={this.login}>Submit</button>
      </div>		);
	}
}

export default Auth;
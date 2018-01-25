import React from 'react'
import {Switch, Route} from 'react-router-dom'
import Home from './home'
import Auth from './auth'
import GetPlayers from './getPlayers'

const Main = () =>(
	<main>
		<Switch>
			<Route exact path='/login' component={Auth}/>
			<Route exact path='/players' component={GetPlayers}/>
			<Route exact path='/' component={Home}/>
		</Switch>
	</main>
	)
export default Main
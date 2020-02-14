import React from 'react';
import logo from './logo.svg';
import './App.css';
import {BrowserRouter as Router, Route, Link} from 'react-router-dom';
import otherpage from './otherpage';
import Fib from './fib';

function App() {
  return (
    <Router>
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <h1 className="App-title">Fib Calculator</h1>
          <Link to="/">Home</Link>
          <Link to="/otherpage">Other</Link>
        </header>
        <div>
              <Route exact path='/' component={Fib}/>
              <Route exact path='/otherpage' component={otherpage}/>
        </div>
      </div>
    </Router>
  );
}

export default App;

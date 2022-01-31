import logo from './logo.svg';
import './App.css';
import { BrowserRouter as Router, Route, Link} from 'react-router-dom'
import Fib from './Fib';
import OtherPage from './OtherPage.js';

function App() {
  return (
    <Router>
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <a
            className="App-link"
            href="https://reactjs.org"
            target="_blank"
            rel="noopener noreferrer"
          >
            Learn React
          </a>
          <Link to="/">Home</Link>
          <Link to="/otherpage">Other Page</Link>

          <div>
            <Route exact path="/" component={Fib} />
            <Route path="/otherpage" component={OtherPage}/>
          </div>
        </header>
      </div>
    </Router>
  );
}

export default App;

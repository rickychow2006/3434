import React from 'react';
import { Link } from "react-router-dom";


class Navbar extends React.Component {
    constructor(props) {
        super(props);   
    }

    // links to my personal sites using target: _blank to open new tab instead of
    // leaving my app
    // only rendered when user is logged out
    render() {
        return (
            <nav className='nav-bar'>
                <div className='navbar-left'>
                    <Link to='/' className='nav-home-link'>
                        <img src={window.slackLogo} className='slack-logo'/>
                        <p className='logo-text'>stack</p>
                    </Link>
                </div>
                <div className='navbar-right'>
                    <Link to='/login' className='nav-login-link'>Sign In</Link>
                    <Link to='/signup' className='nav-signup-link'>GET STARTED</Link>
                </div>
            </nav>
        )
    }
}

export default Navbar;
import Client from "./client";
import { connect } from "react-redux";
import { logout } from '../../actions/session_actions';


const mapDispatchToProps = dispatch => ({
    logout: () => dispatch(logout())
});

export default connect(mapDispatchToProps)(Client);
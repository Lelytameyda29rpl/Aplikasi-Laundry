import React from 'react';
//import Utama from'./Component/Utama';
import {Link} from 'react-router-dom';
import { Container, Nav, Navbar } from 'react-bootstrap';


class NavbarOwner extends React.Component {
  Logout=() =>{
    localStorage.removeItem("token")
    localStorage.removeItem("admin")
    window.location = "../Login"
  }
  render(){
    return(
      <div> 
       <Navbar bg="dark" variant="dark">
        <Container>
        <Navbar.Brand href="/">LAUNDRY</Navbar.Brand>
        <Nav className="me-auto">
          <Nav.Link href="/">Home</Nav.Link>
          <Nav.Link href="/TransaksiOwner">TransaksiOwner</Nav.Link> 
          <Nav.Link onClick={() => this.Logout()}>Logout</Nav.Link>
        </Nav>
        </Container>
        </Navbar>
      
      </div>
    );
  }
}

export default NavbarOwner;
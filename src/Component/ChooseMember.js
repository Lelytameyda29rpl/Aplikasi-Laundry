import React from "react";
import axios from "axios";
import { Modal, Form, Button } from "react-bootstrap";
import NavbarAdmin from '../Component/NavbarAdmin';
import NavbarKasir from '../Component/NavbarKasir';
import NavbarOwner from '../Component/NavbarOwner';


export default class Member extends React.Component {
    constructor() {
        super()
        this.state = {
            token: "",
            member: [],
            id_member: "",
            nama: "",
            alamat: "",
            jenis_kelamin: "",
            tlp: "",
            isModalOpen: false,
            action: ""

        }
        if (localStorage.getItem("token")) {//pengecekan ada token apa tidak
            this.state.role = localStorage.getItem('role')
            //token dibutuhkan setiap saat mau ngakses API, token diambil dari local storage, data login disimpan ke local storage
            //if (localStorage.getItem("role") === "admin"){
                //this.state.token = localStorage.getItem("token")
            //} else {
               // window.alert("Anda bukan Admin")
                //window.location = "/"
            //}
            
        } else {
            window.location = "/login"
        }
    }

    headerConfig = () => {
        let header = {
            headers: { Authorization: `Bearer ${this.state.token}` }
        }
        return header
    }

    handleClose = () => {
        this.setState({
            isModalOpen: false
        });
    }

    getMember = () => {
        let member = (localStorage.getItem("nama"))
        let url = "http://localhost:8080/member"
        axios.get(url)
            .then(res => {
                this.setState({
                    member: res.data.member,
                })
            })
            .catch(err => {
                console.log(err.message)
            })
        console.log(member)
    }

    handleEdit = (item) => {
        this.setState({
            isModalOpen: true,
            id_member: item.id_member,
            nama: item.nama,
            alamat: item.alamat,
            jenis_kelamin: item.jenis_kelamin,
            tlp: item.tlp,
            action: "update"
        })
    }

    Add = () => {
        this.setState({
            isModalOpen: true,
            id_outlet: "",
            nama: "",
            alamat: "",
            jenis_kelamin: "",
            tlp: "",
            action: "insert"
        });
    }

    choose= item => {
        if (window.confirm(`Choose ${item.nama} ?`)){
            localStorage.setItem("id_member", item.id_member)
            localStorage.setItem("nama_member", item.nama)
            window.location = "/ChoosePaket"
        }
    }

    dropMember = id_member => {
        if (window.confirm("are you sure will delete this item?")) {
            let url = "http://localhost:8080/member/" + id_member
            axios.delete(url, this.headerConfig())
                .then(response => {
                    window.alert(response.data.message)
                    this.getMember()
                })
                .catch(error => console.log(error))
        }
    }

    handleSave = e => {
        e.preventDefault()
        let form = {
            id_member: this.state.id_member,
            nama: this.state.nama,
            alamat: this.state.alamat,
            jenis_kelamin: this.state.jenis_kelamin,
            tlp: this.state.tlp
        }

        let url = ""
        if (this.state.action === "insert") {
            url = "http://localhost:8080/member"
            axios.post(url, form, this.headerConfig())
                .then(response => {
                    window.alert(response.data.message)
                    this.getMember()
                    this.handleClose()
                })
                .catch(error => console.log(error))
        } else if (this.state.action === "update") {
            url = "http://localhost:8080/member/" + this.state.id_member
            axios.put(url, form, this.headerConfig())
                .then(response => {
                    window.alert(response.data.message)
                    this.getMember()
                    this.handleClose()
                })
                .catch(error => console.log(error))
        }
    }

    searching = event => {
        if(event.keyCode === 13){
            // 13 adalah kode untuk tombol enter
            let keyword = this.state.keyword.toLowerCase()
            let tempMember = this.state.member
            let result = tempMember.filter(item => {
                return item.nama.toLowerCase().includes(keyword) 

            })
            this.setState({member: result})
        }
    }

    componentDidMount = () => {//dijalankan setelah constructor untuk emnjalan get admin karena fungsi tersebut tak ada aksi seperti button
        this.getMember()
    }

    render() {
        return (
            <div>
                {this.state.role == "admin" &&
                            <NavbarAdmin />
                        }
                {this.state.role == "kasir" &&
                            <NavbarKasir />
                        }
                {this.state.role == "owner" &&
                    <NavbarOwner />
                }
                {/* <div className="back"> */}
                <div className="container">
                <div class="card mt-3">
            <div class="card-header bg-white">
            <div className='alert bg-warning text-white mb-4'>
                        <h2 class="text-center"><b>Data Choose Member</b></h2>
	        </div>
            
                <br></br>
                    <input type="text" className="form-control my-2" placeholder="Pencarian" value={this.state.keyword} onChange={ev => this.setState({keyword: ev.target.value})} onKeyUp={ev => this.searching(ev)}/>
                    {/* <h3 className="text-bold text-info mt-2">Admin List</h3> */}
                    <table className="table table-bordered table-striped table-hover">
                        <thead>
                            <tr  align="center">
                                <th>NO</th>
                                <th>Nama</th>
                                <th>Alamat</th>
                                <th>Jenis Kelamin</th>
                                <th>Telephone</th>
                                <th>Option</th>
                            </tr>
                        </thead>
                        <tbody  align="center">
                            {this.state.member.map((item, index) => {
                                return (
                                    <tr key={index}>
                                        <td>{index + 1}</td>
                                        <td>{item.nama}</td>
                                        <td>{item.alamat}</td>
                                        <td>{item.jenis_kelamin}</td>
                                        <td>{item.tlp}</td>
                                        <td>
                                        {/* button untuk menambah ke keranjang belanja */}
                                        <button className="btn btn-sm btn-info m-1"
                                        onClick={() => this.choose(item)}>
                                        Choose
                                        </button>
                                            
                                        </td>
                                    </tr>
                                )
                            })}
                        </tbody>
                    </table>
                    <button className="btn btn-success" onClick={() => this.Add()}>
                        Add Member
                    </button>

                    {/* modal admin  */}
                    <Modal show={this.state.isModalOpen} onHide={this.handleClose}>
                        <Modal.Header closeButton>
                            <Modal.Title>Form Member</Modal.Title>
                        </Modal.Header>
                        <Form onSubmit={e => this.handleSave(e)}>
                            <Modal.Body>
                                <Form.Group className="mb-3 text-dark bg-transparent" controlId="nama">
                                    <Form.Label className="text-black" >Nama Member </Form.Label>
                                    <Form.Control className="text-dark bg-transparent" type="text" name="nama" placeholder="Masukkan Nama" value={this.state.nama}
                                        onChange={e => this.setState({ nama: e.target.value })} required
                                    />
                                </Form.Group>
                                <Form.Group className="mb-3" controlId="alamat">
                                    <Form.Label className="text-black">Alamat</Form.Label>
                                    <Form.Control className="text-dark bg-transparent" type="text" name="alamat" placeholder="Masukkan Alamat" value={this.state.alamat}
                                        onChange={e => this.setState({ alamat: e.target.value })} required
                                    />
                                </Form.Group>
                                <Form.Group className="mb-3" controlId="jenis_kelamin">
                                    <Form.Label className="text-black">Jenis Kelamin</Form.Label>
                                    <Form.Control className="text-dark bg-transparent" type="text" name="jenis_kelamin" placeholder="Masukkan Jenis Kelamin" value={this.state.jenis_kelamin}
                                        onChange={e => this.setState({ jenis_kelamin: e.target.value })} required
                                    />
                                </Form.Group>
                                <Form.Group className="mb-3" controlId="tlp">
                                    <Form.Label className="text-black">Telephone</Form.Label>
                                    <Form.Control className="text-dark bg-transparent" type="text" name="tlp" placeholder="Masukkan Telephone" value={this.state.tlp}
                                        onChange={e => this.setState({ tlp: e.target.value })} required
                                    />
                                </Form.Group>

                            </Modal.Body>
                            <Modal.Footer>
                                <Button variant="secondary" onClick={this.handleClose}>
                                    Close
                                </Button>
                                <Button variant="primary" type="submit" onClick={this.handleClose}>
                                    Save
                                </Button>
                            </Modal.Footer>
                        </Form>
                    </Modal>
                </div>
            </div>
            </div>
            </div>
        )
    }
}
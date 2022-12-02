import React from 'react';
import {Routes, Route} from 'react-router-dom';

import Home from './Home';
import Login from './Login';
import Member from './Member';
import ChooseMember from './ChooseMember';
import Outlet from './Outlet';
import Paket from './Paket';
import ChoosePaket from './ChoosePaket';
import Transaksi from './Transaksi';
import TransaksiOwner from './TransaksiOwner';
import Cart from '../Pages/Cart';
import User from './User';
import Detail from './Detail';
import Cetak from './Cetak';

const Utama = () => (
    <Routes>
        <Route exact path = "/" element = {<Home/>} />
        <Route path = "/Login" element = {<Login/>} />
        <Route path = "/Member" element = {<Member/>} />
        <Route path = "/ChooseMember" element = {<ChooseMember/>} />
        <Route path = "/Outlet" element = {<Outlet/>} />
        <Route path = "/Paket" element = {<Paket/>} />
        <Route path = "/ChoosePaket" element = {<ChoosePaket/>} />
        <Route path = "/Transaksi" element = {<Transaksi/>} />
        <Route path = "/TransaksiOwner" element = {<TransaksiOwner/>} />
        <Route path = "/Cart" element = {<Cart/>} />
        <Route path = "/User" element = {<User/>} />
        <Route path = "/Detail" element = {<Detail/>} />
        <Route path = "/Cetak" element = {<Cetak/>} />
    </Routes>
)

export default Utama;
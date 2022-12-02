-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 29 Nov 2022 pada 09.15
-- Versi server: 10.4.20-MariaDB
-- Versi PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ukl_laundry`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `id_detail_transaksi` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `id_paket` int(11) NOT NULL,
  `qty` double DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `detail_transaksi`
--

INSERT INTO `detail_transaksi` (`id_detail_transaksi`, `id_transaksi`, `id_paket`, `qty`, `keterangan`, `createdAt`, `updatedAt`) VALUES
(2, 1, 1, 2, 'lunas', '2022-04-18 00:40:22', '2022-04-18 00:40:22'),
(4, 1, 1, 1, 'lunas', '2022-05-19 04:32:26', '2022-05-19 04:32:26'),
(6, 1, 1, 1, 'lunas', '2022-05-19 04:34:54', '2022-05-19 04:34:54'),
(7, 3, 1, 3, 'lunas', '2022-05-19 04:35:47', '2022-05-19 04:35:47'),
(8, 5, 1, 2, NULL, '2022-04-13 03:39:50', '2022-05-19 23:28:38'),
(9, 6, 1, 1, NULL, '2022-04-13 03:39:50', '2022-05-19 23:31:46'),
(10, 7, 1, 2, NULL, '2022-04-13 03:39:50', '2022-05-19 23:57:10'),
(11, 8, 1, 3, NULL, '2022-04-13 03:39:50', '2022-05-25 06:06:37'),
(12, 9, 6, 5, NULL, '2022-05-19 00:10:25', '2022-05-25 07:13:26'),
(13, 10, 5, 2, NULL, '2022-05-19 00:09:28', '2022-05-25 07:22:20'),
(14, 11, 4, 5, NULL, '2022-05-19 00:04:32', '2022-05-27 01:37:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `member`
--

CREATE TABLE `member` (
  `id_member` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `jenis_kelamin` enum('L','P') DEFAULT NULL,
  `tlp` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `member`
--

INSERT INTO `member` (`id_member`, `nama`, `alamat`, `jenis_kelamin`, `tlp`, `createdAt`, `updatedAt`) VALUES
(1, 'Rama', 'Tangerang', 'L', '081234567890', '2022-04-13 02:25:07', '2022-05-12 04:30:13'),
(4, 'Ayesha', 'Jakarta', 'P', '081155996633', '2022-05-17 03:15:04', '2022-05-17 03:15:20'),
(7, 'Altair', 'Bandung', 'L', '085673829014', '2022-05-19 00:31:45', '2022-05-19 00:31:45');

-- --------------------------------------------------------

--
-- Struktur dari tabel `outlet`
--

CREATE TABLE `outlet` (
  `id_outlet` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `tlp` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `outlet`
--

INSERT INTO `outlet` (`id_outlet`, `nama`, `alamat`, `tlp`, `createdAt`, `updatedAt`) VALUES
(1, 'Laundry Jaya', 'Jl. Kusuma, Tanggerang', '082345678902', '2022-04-13 02:52:47', '2022-04-13 02:56:47'),
(3, 'Laundry Kusuma', 'Jl. Bunga, Kediri', '081335', '2022-05-12 04:14:15', '2022-05-12 04:14:25'),
(6, 'Laundry Klasik', 'Jl.Jayeng, Tulungagung', '082256', '2022-05-19 00:34:42', '2022-05-19 00:34:42');

-- --------------------------------------------------------

--
-- Struktur dari tabel `paket`
--

CREATE TABLE `paket` (
  `id_paket` int(11) NOT NULL,
  `id_outlet` int(11) NOT NULL,
  `jenis` enum('kiloan','selimut','bed_cover','kaos','lain') DEFAULT NULL,
  `nama_paket` varchar(255) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `paket`
--

INSERT INTO `paket` (`id_paket`, `id_outlet`, `jenis`, `nama_paket`, `harga`, `createdAt`, `updatedAt`) VALUES
(1, 1, 'selimut', 'Laundry Selimut', 16000, '2022-04-13 03:39:50', '2022-04-13 03:42:01'),
(4, 3, 'kaos', 'Laundry Kaos', 7000, '2022-05-19 00:04:32', '2022-05-19 00:04:32'),
(5, 1, 'kiloan', 'Laundry Kiloan', 25000, '2022-05-19 00:09:28', '2022-05-19 00:09:28'),
(6, 3, 'bed_cover', 'Laondry Bed Cover', 21000, '2022-05-19 00:10:25', '2022-05-19 00:10:25');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sequelizemeta`
--

CREATE TABLE `sequelizemeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `sequelizemeta`
--

INSERT INTO `sequelizemeta` (`name`) VALUES
('20220412035348-create-member.js'),
('20220412035555-create-outlet.js'),
('20220412035814-create-user.js'),
('20220412040000-create-paket.js'),
('20220412040620-create-transaksi.js'),
('20220412040748-create-detail-transaksi.js');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_outlet` int(11) NOT NULL,
  `kode_invoice` varchar(255) DEFAULT NULL,
  `id_member` int(11) NOT NULL,
  `tgl` datetime DEFAULT NULL,
  `batas_waktu` datetime DEFAULT NULL,
  `tgl_bayar` datetime DEFAULT NULL,
  `biaya_tambahan` int(11) DEFAULT NULL,
  `diskon` double DEFAULT NULL,
  `pajak` int(11) DEFAULT NULL,
  `status` enum('baru','proses','selesai','diambil') DEFAULT NULL,
  `dibayar` enum('dibayar','belum_dibayar') DEFAULT NULL,
  `id_user` int(11) NOT NULL,
  `total` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_outlet`, `kode_invoice`, `id_member`, `tgl`, `batas_waktu`, `tgl_bayar`, `biaya_tambahan`, `diskon`, `pajak`, `status`, `dibayar`, `id_user`, `total`, `createdAt`, `updatedAt`) VALUES
(1, 1, '103', 1, '2022-04-18 00:00:00', '2022-04-18 00:00:00', '2022-04-16 00:00:00', 0, 900, 5000, 'baru', '', 1, NULL, '2022-04-18 00:36:52', '2022-04-18 00:36:52'),
(3, 1, '105', 1, '2022-05-19 00:00:00', '2022-04-25 00:00:00', '2022-04-19 00:00:00', 0, 700, 9000, 'proses', '', 1, NULL, '2022-05-19 04:32:23', '2022-05-19 04:35:47'),
(5, 1, 'Cuci1653002918680', 1, '2022-05-19 00:00:00', '2022-05-22 23:28:38', NULL, 1280, 1280, 2560, 'baru', '', 1, NULL, '2022-05-19 23:28:38', '2022-05-19 23:28:38'),
(6, 1, 'Cuci1653003106515', 1, '2022-05-19 00:00:00', '2022-05-22 23:31:46', '2022-05-20 00:00:00', 640, 640, 1280, 'diambil', 'dibayar', 1, NULL, '2022-05-19 23:31:46', '2022-05-20 00:11:53'),
(7, 1, 'Cuci1653004630389', 1, '2022-05-19 00:00:00', '2022-05-22 23:57:10', '2022-05-19 00:00:00', 1600, 1600, 3200, 'diambil', 'dibayar', 1, NULL, '2022-05-19 23:57:10', '2022-05-19 23:58:14'),
(8, 1, 'Cuci1653458797376', 4, '2022-05-25 00:00:00', '2022-05-28 06:06:37', '2022-05-25 00:00:00', 2400, 2400, 4800, 'diambil', 'dibayar', 1, 50400, '2022-05-25 06:06:37', '2022-05-25 06:07:09'),
(9, 3, 'Cuci1653462806689', 4, '2022-05-25 00:00:00', '2022-05-28 07:13:26', '2022-05-25 00:00:00', 5250, 5250, 10500, 'diambil', 'dibayar', 4, 110250, '2022-05-25 07:13:26', '2022-05-25 07:15:05'),
(10, 1, 'Cuci1653463340696', 7, '2022-05-25 00:00:00', '2022-05-28 07:22:20', '2022-05-25 00:00:00', 2500, 2500, 5000, 'diambil', 'dibayar', 4, 52500, '2022-05-25 07:22:20', '2022-05-25 07:22:37'),
(11, 1, 'Cuci1653615475906', 1, '2022-05-27 00:00:00', '2022-05-30 01:37:55', '2022-05-27 00:00:00', 1750, 1750, 3500, 'diambil', 'dibayar', 4, 36750, '2022-05-27 01:37:55', '2022-05-27 01:38:12');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` text DEFAULT NULL,
  `id_outlet` int(11) NOT NULL,
  `role` enum('admin','kasir','owner') DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `nama`, `username`, `password`, `id_outlet`, `role`, `createdAt`, `updatedAt`) VALUES
(1, 'Elfan', 'admin', '827ccb0eea8a706c4c34a16891f84e7b', 1, 'admin', '2022-04-13 03:04:54', '2022-04-13 03:13:31'),
(4, 'Aldira', 'kasir', '7a674153c63cff1ad7f0e261c369ab2c', 1, 'kasir', '2022-05-17 02:36:03', '2022-05-25 07:19:21'),
(5, 'Altair', 'owner', 'a36b0dcd1e6384abc0e1867860ad3ee3', 1, 'owner', '2022-05-18 03:50:31', '2022-05-18 03:50:31');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD PRIMARY KEY (`id_detail_transaksi`),
  ADD KEY `id_transaksi` (`id_transaksi`),
  ADD KEY `id_paket` (`id_paket`);

--
-- Indeks untuk tabel `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id_member`);

--
-- Indeks untuk tabel `outlet`
--
ALTER TABLE `outlet`
  ADD PRIMARY KEY (`id_outlet`);

--
-- Indeks untuk tabel `paket`
--
ALTER TABLE `paket`
  ADD PRIMARY KEY (`id_paket`),
  ADD KEY `id_outlet` (`id_outlet`);

--
-- Indeks untuk tabel `sequelizemeta`
--
ALTER TABLE `sequelizemeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_outlet` (`id_outlet`),
  ADD KEY `id_member` (`id_member`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_outlet` (`id_outlet`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  MODIFY `id_detail_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `member`
--
ALTER TABLE `member`
  MODIFY `id_member` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `outlet`
--
ALTER TABLE `outlet`
  MODIFY `id_outlet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `paket`
--
ALTER TABLE `paket`
  MODIFY `id_paket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD CONSTRAINT `detail_transaksi_ibfk_1` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id_transaksi`),
  ADD CONSTRAINT `detail_transaksi_ibfk_2` FOREIGN KEY (`id_paket`) REFERENCES `paket` (`id_paket`);

--
-- Ketidakleluasaan untuk tabel `paket`
--
ALTER TABLE `paket`
  ADD CONSTRAINT `paket_ibfk_1` FOREIGN KEY (`id_outlet`) REFERENCES `outlet` (`id_outlet`);

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_outlet`) REFERENCES `outlet` (`id_outlet`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_member`) REFERENCES `member` (`id_member`),
  ADD CONSTRAINT `transaksi_ibfk_3` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Ketidakleluasaan untuk tabel `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_outlet`) REFERENCES `outlet` (`id_outlet`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

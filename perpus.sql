-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 16, 2024 at 10:51 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpus`
--

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `id` int(11) NOT NULL,
  `nisn` varchar(16) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `jenis_kelamin` enum('Laki-Laki','Perempuan') NOT NULL,
  `no_telp` varchar(13) NOT NULL,
  `alamat` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`id`, `nisn`, `nama_lengkap`, `jenis_kelamin`, `no_telp`, `alamat`, `created_at`, `updated_at`) VALUES
(1, '12345678', 'Adimas', 'Laki-Laki', '088888888', 'Kampung Jahe', '2024-08-06 07:04:45', '2024-08-06 07:04:45');

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `judul` varchar(50) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `penerbit` varchar(50) NOT NULL,
  `tahun_terbit` varchar(5) NOT NULL,
  `penulis` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id`, `id_kategori`, `judul`, `jumlah`, `penerbit`, `tahun_terbit`, `penulis`, `created_at`, `updated_at`) VALUES
(2, 2, 'IPA Kelas 3', 100, 'PPKDJP', '2024', 'Adimas', '2024-08-06 04:26:01', '2024-08-06 04:26:50'),
(4, 2, 'IPS kelas 4', 100, 'PPKDJP', '2020', 'Adimas', '2024-08-06 04:30:20', '2024-08-12 03:55:19'),
(6, 1, 'Bahasa Indonesia', 12, 'PPKDJP', '2020', 'Adimas', '2024-08-06 04:38:39', '2024-08-12 03:49:28'),
(7, 1, 'Bahasa Inggris', 2, 'PPKDJP', '2026', 'Adimas', '2024-08-07 07:09:29', '2024-08-12 03:49:32'),
(8, 1, 'Mandarin', 50, 'PPKDJP', '2024', 'Adimas', '2024-08-07 07:13:00', '2024-08-07 07:13:00'),
(9, 1, 'Jepang', 60, 'PPKDJP', '2024', 'Adimas', '2024-08-07 07:13:17', '2024-08-07 07:13:17'),
(10, 1, 'Korea', 10, 'PPKDJP', '2024', 'Adimas', '2024-08-07 07:13:34', '2024-08-07 07:13:34'),
(11, 2, 'IPS Kelas 10', 20, 'PPKDJP', '2024', 'Adimas', '2024-08-07 07:23:18', '2024-08-07 07:23:18'),
(12, 1, 'Mandarin 2', 50, 'PPKDJP', '2024', 'Adimas', '2024-08-07 07:25:45', '2024-08-07 07:25:45'),
(13, 5, 'Kalkulus 1', 10, 'PPKDJP', '2020', 'Adimas', '2024-08-07 07:58:55', '2024-08-12 03:49:41');

-- --------------------------------------------------------

--
-- Table structure for table `detail_peminjaman`
--

CREATE TABLE `detail_peminjaman` (
  `id` int(11) NOT NULL,
  `id_peminjaman` int(11) NOT NULL,
  `id_buku` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_peminjaman`
--

INSERT INTO `detail_peminjaman` (`id`, `id_peminjaman`, `id_buku`, `id_kategori`) VALUES
(6, 6, 8, 1),
(7, 7, 13, 5),
(8, 8, 9, 1),
(9, 9, 6, 1),
(10, 9, 13, 5),
(11, 9, 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` int(11) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL,
  `keterangan` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `nama_kategori`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 'BAHASA', 'Bahasa Dunia', '2024-07-31 07:30:30', '2024-08-07 07:14:16'),
(2, 'SAINS', 'Pengetahuan', '2024-07-31 07:31:52', '2024-08-07 07:14:23'),
(5, 'MATEMATIKA', 'Sangat Menyenangkan', '2024-08-07 07:58:33', '2024-08-07 07:58:33');

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `id` int(11) NOT NULL,
  `nama_level` varchar(50) NOT NULL,
  `keterangan` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`id`, `nama_level`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', '', '2024-08-06 01:20:41', '2024-08-06 01:21:43'),
(2, 'Admin', '', '2024-08-06 01:20:41', '2024-08-06 01:21:46');

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id` int(11) NOT NULL,
  `id_anggota` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `kode_transaksi` varchar(30) NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_kembali` date NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`id`, `id_anggota`, `id_user`, `kode_transaksi`, `tgl_pinjam`, `tgl_kembali`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(6, 1, 3, 'PJ12082024001', '2024-08-12', '2024-08-19', 1, '2024-08-12 06:54:09', '2024-08-16 07:41:56', 0),
(7, 1, 3, 'PJ12082024007', '2024-07-29', '2024-08-14', 2, '2024-08-12 07:06:30', '2024-08-16 06:57:18', 0),
(8, 1, 3, 'PJ12082024008', '2024-08-31', '2024-09-30', 2, '2024-08-12 07:23:52', '2024-08-16 06:58:30', 0),
(9, 1, 3, 'PJ16082024009', '2024-08-16', '2024-08-23', 2, '2024-08-16 02:23:15', '2024-08-16 06:59:15', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pengembalian`
--

CREATE TABLE `pengembalian` (
  `id` int(11) NOT NULL,
  `id_peminjaman` int(11) NOT NULL,
  `kode_pengembalian` varchar(30) NOT NULL,
  `tgl_pengembalian` date NOT NULL,
  `terlambat` int(1) NOT NULL,
  `denda` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengembalian`
--

INSERT INTO `pengembalian` (`id`, `id_peminjaman`, `kode_pengembalian`, `tgl_pengembalian`, `terlambat`, `denda`, `created_at`, `updated_at`) VALUES
(1, 7, '', '2024-08-16', 0, 2000000, '2024-08-16 06:57:18', '2024-08-16 06:57:18'),
(2, 8, '', '0000-00-00', 0, 0, '2024-08-16 06:58:30', '2024-08-16 06:58:30'),
(3, 9, '', '2024-08-16', 0, 0, '2024-08-16 06:59:15', '2024-08-16 06:59:15');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `id_level` int(11) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `id_level`, `nama_lengkap`, `email`, `password`, `created_at`, `updated_at`) VALUES
(2, 1, 'Rio Hairul', 'rioh12@gmail.com', '7c222fb2927d828af22f592134e8932480637c0d', '2024-07-29 02:14:48', '2024-08-06 01:27:12'),
(3, 2, 'Fajar Adimas', 'fajaradimas@gmail.com', '7c222fb2927d828af22f592134e8932480637c0d', '2024-07-31 02:13:21', '2024-08-06 01:27:16'),
(9, 1, 'tes123', 'tes123@gmail.com', '7c222fb2927d828af22f592134e8932480637c0d', '2024-07-31 03:46:53', '2024-08-06 01:27:18'),
(10, 2, 'tes12', 'tes12@gmail.com', 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '2024-08-06 02:24:32', '2024-08-06 02:54:38'),
(12, 2, 'tes1', 'tes1@gmail.com', '7c222fb2927d828af22f592134e8932480637c0d', '2024-08-06 02:59:36', '2024-08-06 02:59:36');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detail_peminjaman`
--
ALTER TABLE `detail_peminjaman`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `anggota`
--
ALTER TABLE `anggota`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `detail_peminjaman`
--
ALTER TABLE `detail_peminjaman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `level`
--
ALTER TABLE `level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pengembalian`
--
ALTER TABLE `pengembalian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

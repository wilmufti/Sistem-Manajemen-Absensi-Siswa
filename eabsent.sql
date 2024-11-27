-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 25, 2024 at 01:26 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eabsent`
--
CREATE DATABASE IF NOT EXISTS `eabsent` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `eabsent`;

-- --------------------------------------------------------

--
-- Table structure for table `absen`
--

CREATE TABLE `absen` (
  `id_absen` int(11) NOT NULL,
  `nis` char(10) DEFAULT NULL,
  `id_mapel` int(11) DEFAULT NULL,
  `id_pertemuan` int(11) DEFAULT NULL,
  `ket` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `absen`
--

INSERT INTO `absen` (`id_absen`, `nis`, `id_mapel`, `id_pertemuan`, `ket`) VALUES
(1, '1001', 1, 1, 'Hadir'),
(2, '1001', 1, 2, 'Alpha'),
(3, '1001', 1, 2, 'Izin'),
(4, '1001', 2, 2, 'Izin'),
(5, '1002', 3, 2, 'Hadir'),
(6, '2222', 1, 2, 'Hadir');

-- --------------------------------------------------------

--
-- Table structure for table `mapel`
--

CREATE TABLE `mapel` (
  `id_mapel` int(11) NOT NULL,
  `nama_mapel` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mapel`
--

INSERT INTO `mapel` (`id_mapel`, `nama_mapel`) VALUES
(1, 'Matematika'),
(2, 'Fisika'),
(3, 'Biologi'),
(4, 'Kimia'),
(5, 'Bahasa Indonesia'),
(6, 'Bahasa Inggris'),
(7, 'Sejarah'),
(8, 'Pendidikan Pancasila');

-- --------------------------------------------------------

--
-- Table structure for table `pertemuan`
--

CREATE TABLE `pertemuan` (
  `id_pertemuan` int(11) NOT NULL,
  `tgl` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pertemuan`
--

INSERT INTO `pertemuan` (`id_pertemuan`, `tgl`) VALUES
(1, '2024-11-01'),
(2, '2024-11-05'),
(3, '2024-11-10'),
(4, '2024-11-15'),
(5, '2024-11-20'),
(6, '2024-11-25');

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `nis` char(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `kls` varchar(10) NOT NULL,
  `prodi` varchar(50) NOT NULL,
  `jns_klmn` enum('Laki - Laki','Perempuan') NOT NULL,
  `no_telp` varchar(15) DEFAULT NULL,
  `mapel_plhn1` int(11) DEFAULT 1,
  `mapel_plhn2` int(11) DEFAULT 2,
  `mapel_plhn3` int(11) DEFAULT 3
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`nis`, `nama`, `kls`, `prodi`, `jns_klmn`, `no_telp`, `mapel_plhn1`, `mapel_plhn2`, `mapel_plhn3`) VALUES
('1001', 'AADI', 'X-A', 'IPA', 'Laki - Laki', '08123456789', 1, 2, 3),
('1002', 'Budi', 'X-B', 'IPA', 'Laki - Laki', '08123456790', 2, 3, 4),
('1004', 'Dina', 'XI-A', 'IPA', 'Perempuan', '08123456792', 4, 5, 6),
('1005', 'Eka', 'XI-B', 'IPS', 'Laki - Laki', '08123456793', 5, 6, 7),
('1006', 'Fauzi', 'XII-A', 'IPA', 'Laki - Laki', '08123456794', 6, 7, 8),
('2222', 'iqbal', 'xiii', 'ips', 'Perempuan', '021564564894', 1, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin'),
(2, 'johndoe', 'john12345'),
(3, 'janedoe', 'jane12345'),
(4, 'michael', 'mike2024'),
(5, 'sarah', 'sarah2024');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absen`
--
ALTER TABLE `absen`
  ADD PRIMARY KEY (`id_absen`),
  ADD KEY `nis` (`nis`),
  ADD KEY `id_mapel` (`id_mapel`),
  ADD KEY `id_pertemuan` (`id_pertemuan`);

--
-- Indexes for table `mapel`
--
ALTER TABLE `mapel`
  ADD PRIMARY KEY (`id_mapel`);

--
-- Indexes for table `pertemuan`
--
ALTER TABLE `pertemuan`
  ADD PRIMARY KEY (`id_pertemuan`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`nis`),
  ADD KEY `mapel_plhn1` (`mapel_plhn1`),
  ADD KEY `mapel_plhn2` (`mapel_plhn2`),
  ADD KEY `mapel_plhn3` (`mapel_plhn3`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absen`
--
ALTER TABLE `absen`
  MODIFY `id_absen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `mapel`
--
ALTER TABLE `mapel`
  MODIFY `id_mapel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pertemuan`
--
ALTER TABLE `pertemuan`
  MODIFY `id_pertemuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `absen`
--
ALTER TABLE `absen`
  ADD CONSTRAINT `absen_ibfk_1` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`),
  ADD CONSTRAINT `absen_ibfk_2` FOREIGN KEY (`id_mapel`) REFERENCES `mapel` (`id_mapel`),
  ADD CONSTRAINT `absen_ibfk_3` FOREIGN KEY (`id_pertemuan`) REFERENCES `pertemuan` (`id_pertemuan`);

--
-- Constraints for table `siswa`
--
ALTER TABLE `siswa`
  ADD CONSTRAINT `siswa_ibfk_1` FOREIGN KEY (`mapel_plhn1`) REFERENCES `mapel` (`id_mapel`),
  ADD CONSTRAINT `siswa_ibfk_2` FOREIGN KEY (`mapel_plhn2`) REFERENCES `mapel` (`id_mapel`),
  ADD CONSTRAINT `siswa_ibfk_3` FOREIGN KEY (`mapel_plhn3`) REFERENCES `mapel` (`id_mapel`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

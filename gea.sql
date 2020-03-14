-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 06, 2020 at 04:41 PM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `gea`
--

-- --------------------------------------------------------

--
-- Table structure for table `biaya_admin_emas`
--

CREATE TABLE IF NOT EXISTS `biaya_admin_emas` (
  `transaksi` varchar(50) NOT NULL,
  `channel` varchar(50) NOT NULL,
  `biaya` varchar(100) NOT NULL,
  PRIMARY KEY (`transaksi`,`channel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `biaya_admin_emas`
--

INSERT INTO `biaya_admin_emas` (`transaksi`, `channel`, `biaya`) VALUES
('BELI', 'AGEN PEGADAIAN', 'Rp 57.500'),
('BELI', 'APLIKASI PDS', 'Rp 50.000'),
('BELI', 'APLIKASI PSD SYARIAH', 'Rp 70.000'),
('BELI', 'OUTLET PEGADAIAN', '0,01 Gram'),
('BUKA', 'AGEN PEGADAIAN', 'Rp 10.000,-'),
('BUKA', 'APLIKASI PDS', 'Rp 0'),
('BUKA', 'APLIKASI PSD SYARIAH', 'Rp 0'),
('BUKA', 'OUTLET PEGADAIAN', 'Rp 10.000,-'),
('GANTI', 'OUTLET PEGADAIAN', 'Rp 10.000,-'),
('TES', 'TES', 'TES'),
('TITIP', 'AGEN PEGADAIAN', 'Rp 30.000'),
('TITIP', 'APLIKASI PDS', 'Rp 0'),
('TITIP', 'APLIKASI PSD SYARIAH', 'Rp 30.000'),
('TITIP', 'OUTLET PEGADAIAN', 'Rp 30.000,-'),
('TRANSFER', 'APLIKASI PDS', 'Rp 0,-'),
('TRANSFER', 'OUTLET PEGADAIAN', 'Rp 2.000'),
('TUTUP', 'OUTLET PEGADAIAN', 'Rp 30.000,-');

-- --------------------------------------------------------

--
-- Table structure for table `diskon_bunga`
--

CREATE TABLE IF NOT EXISTS `diskon_bunga` (
  `min` decimal(10,2) DEFAULT NULL,
  `max` decimal(10,2) DEFAULT NULL,
  `rate` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `diskon_bunga`
--

INSERT INTO `diskon_bunga` (`min`, `max`, `rate`) VALUES
(90.00, 90.00, 0.00),
(89.00, 89.99, 0.56),
(88.00, 88.99, 1.67),
(87.00, 87.99, 2.78),
(86.00, 86.99, 3.89),
(85.00, 85.99, 5.01),
(84.00, 84.99, 6.12),
(83.00, 83.99, 7.23),
(82.00, 82.99, 8.34),
(81.00, 81.99, 9.45),
(80.00, 80.99, 10.56),
(79.00, 79.99, 11.67),
(78.00, 78.99, 12.78),
(77.00, 77.99, 13.89),
(76.00, 76.99, 15.01),
(75.00, 75.99, 16.12),
(74.00, 74.99, 17.23),
(73.00, 73.99, 18.34),
(72.00, 72.99, 19.45),
(71.00, 71.99, 20.56),
(70.00, 70.99, 21.67),
(69.00, 69.99, 22.78),
(68.00, 68.99, 23.89),
(67.00, 67.99, 25.01),
(66.00, 66.99, 26.12),
(65.00, 65.99, 27.23),
(64.00, 64.99, 28.34),
(63.00, 63.99, 29.45),
(62.00, 62.99, 30.56),
(61.00, 61.99, 31.67),
(60.00, 60.99, 32.78),
(59.00, 59.99, 33.89),
(58.00, 58.99, 35.01),
(57.00, 57.99, 36.12),
(56.00, 56.99, 37.23),
(55.00, 55.99, 38.34),
(54.00, 54.99, 39.45),
(53.00, 53.99, 40.56),
(52.00, 52.99, 41.67),
(51.00, 51.99, 42.78),
(50.00, 50.99, 43.89),
(49.00, 49.99, 45.01),
(48.00, 48.99, 46.12),
(47.00, 47.99, 47.23),
(46.00, 46.99, 48.34),
(45.00, 45.99, 49.45),
(44.00, 44.99, 50.56),
(43.00, 43.99, 51.67),
(42.00, 42.99, 52.78),
(41.00, 41.99, 53.89),
(40.00, 40.99, 55.01),
(39.00, 39.99, 56.12),
(38.00, 38.99, 57.23),
(37.00, 37.99, 58.34),
(36.00, 36.99, 59.45),
(35.00, 35.99, 60.56),
(34.00, 34.99, 61.67),
(33.00, 33.99, 62.78),
(32.00, 32.99, 63.89),
(31.00, 31.99, 65.01),
(30.00, 30.99, 66.12),
(29.00, 29.99, 67.23),
(28.00, 28.99, 68.34),
(27.00, 27.99, 69.45),
(26.00, 26.99, 70.56),
(25.00, 25.99, 71.67),
(24.00, 24.99, 72.78),
(23.00, 23.99, 73.89),
(22.00, 22.99, 75.01),
(21.00, 21.99, 76.12),
(20.00, 20.99, 77.23),
(19.00, 19.99, 78.34),
(18.00, 18.99, 79.45),
(17.00, 17.99, 80.56),
(16.00, 16.99, 81.67),
(15.00, 15.99, 82.78),
(14.00, 14.99, 83.89),
(13.00, 13.99, 85.01),
(12.00, 12.99, 86.12),
(11.00, 11.99, 87.23),
(10.00, 10.99, 88.34),
(9.00, 9.99, 89.45),
(8.00, 8.99, 90.56),
(7.00, 7.99, 91.67),
(6.00, 6.99, 92.78),
(5.00, 5.99, 93.89),
(4.00, 4.99, 95.01),
(3.00, 3.99, 96.12),
(2.00, 2.99, 97.23),
(1.00, 1.99, 98.34);

-- --------------------------------------------------------

--
-- Table structure for table `harga_emas`
--

CREATE TABLE IF NOT EXISTS `harga_emas` (
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `jual` decimal(15,2) DEFAULT NULL,
  `beli` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`tanggal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `harga_emas`
--

INSERT INTO `harga_emas` (`tanggal`, `jual`, `beli`) VALUES
('2020-02-25', 760000.00, 737000.00),
('2020-03-03', 784000.00, 760000.00),
('2020-03-04', 788000.00, 764000.00),
('2020-03-05', 788000.00, 764000.00),
('2020-03-06', 788000.00, 764000.00);

-- --------------------------------------------------------

--
-- Table structure for table `harga_kendaraan`
--

CREATE TABLE IF NOT EXISTS `harga_kendaraan` (
  `kendaraan` varchar(50) DEFAULT NULL,
  `negara` varchar(50) DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `tipe` varchar(50) NOT NULL DEFAULT '',
  `harga` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`tipe`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `harga_kendaraan`
--

INSERT INTO `harga_kendaraan` (`kendaraan`, `negara`, `brand`, `tipe`, `harga`) VALUES
('MOTOR', 'JEPANG', 'HONDA', 'ADV', 37080000.00),
('MOTOR', 'JEPANG', 'YAMAHA', 'AEROX', 28560000.00),
('MOBIL', 'JEPANG', 'TOYOTA', 'AGYA', 150600000.00),
('MOBIL', 'JEPANG', 'TOYOTA', 'ALPHARD', 997850000.00),
('MOBIL', 'JEPANG', 'TOYOTA', 'AVANZA', 233700000.00),
('MOBIL', 'JEPANG', 'DAIHATSU', 'AYLA', 155350000.00),
('MOTOR', 'JEPANG', 'HONDA', 'BEAT', 16550000.00),
('MOBIL', 'JEPANG', 'HONDA', 'BRIO', 202200000.00),
('MOBIL', 'JEPANG', 'HONDA', 'BRV', 293800000.00),
('MOTOR', 'JEPANG', 'YAMAHA', 'BYSON', 22950000.00),
('MOBIL', 'JEPANG', 'TOYOTA', 'CALYA', 163400000.00),
('MOTOR', 'JEPANG', 'HONDA', 'CBR', 72300000.00),
('MOBIL', 'JEPANG', 'HONDA', 'CIVIC', 536500000.00),
('MOBIL', 'LAINNYA', 'WULING', 'CONFERO', 267000000.00),
('MOBIL', 'LAINNYA', 'WULING', 'CORTEZ', 290000000.00),
('MOTOR', 'JEPANG', 'HONDA', 'CRF', 34120000.00),
('MOBIL', 'JEPANG', 'HONDA', 'CRV', 543700000.00),
('MOBIL', 'JEPANG', 'SUZUKI', 'ERTIGA', 260500000.00),
('MOBIL', 'JEPANG', 'TOYOTA', 'FORTUNER', 538950000.00),
('MOTOR', 'JEPANG', 'HONDA', 'GENIO', 17980000.00),
('MOBIL', 'JEPANG', 'DATSUN', 'GO', 160490000.00),
('MOBIL', 'JEPANG', 'TOYOTA', 'HILUX', 484200000.00),
('MOBIL', 'JEPANG', 'HONDA', 'HRV', 420800000.00),
('MOBIL', 'JEPANG', 'SUZUKI', 'IGNIS', 195000000.00),
('MOBIL', 'JEPANG', 'TOYOTA', 'INNOVA', 405250000.00),
('MOBIL', 'JEPANG', 'HONDA', 'JAZZ', 295000000.00),
('MOTOR', 'JEPANG', 'YAMAHA', 'JUPITER MX', 18900000.00),
('MOTOR', 'JEPANG', 'YAMAHA', 'JUPITER Z1', 18110000.00),
('MOBIL', 'JEPANG', 'SUZUKI', 'KARIMUN', 149000000.00),
('MOTOR', 'JEPANG', 'YAMAHA', 'LEXI', 26960000.00),
('MOBIL', 'JEPANG', 'NISSAN', 'LIVINA', 272100000.00),
('MOBIL', 'JEPANG', 'HONDA', 'MOBILIO', 261400000.00),
('MOTOR', 'JEPANG', 'YAMAHA', 'MX', 24080000.00),
('MOTOR', 'JEPANG', 'KAWASAKI', 'NINJA', 77100000.00),
('MOTOR', 'JEPANG', 'YAMAHA', 'NMAX', 33750000.00),
('MOBIL', 'JEPANG', 'MITSUBISHI', 'PAJERO', 702000000.00),
('MOTOR', 'JEPANG', 'HONDA', 'PCX', 32510000.00),
('MOTOR', 'JEPANG', 'HONDA', 'REVO', 16420000.00),
('MOBIL', 'JEPANG', 'TOYOTA', 'RUSH', 263050000.00),
('MOTOR', 'JEPANG', 'SUZUKI', 'SATRIA', 23800000.00),
('MOTOR', 'JEPANG', 'HONDA', 'SCOOPY', 19580000.00),
('MOBIL', 'JEPANG', 'DAIHATSU', 'SIGRA', 160250000.00),
('MOBIL', 'JEPANG', 'DAIHATSU', 'SIRION', 211100000.00),
('MOTOR', 'JEPANG', 'SUZUKI', 'SMASH', 16200000.00),
('MOTOR', 'JEPANG', 'YAMAHA', 'SOUL', 17800000.00),
('MOTOR', 'JEPANG', 'HONDA', 'SUPRA', 19100000.00),
('MOBIL', 'JEPANG', 'DAIHATSU', 'TERIOS', 261000000.00),
('MOTOR', 'JEPANG', 'HONDA', 'VARIO', 18530000.00),
('MOBIL', 'JEPANG', 'TOYOTA', 'VIOS', 339450000.00),
('MOTOR', 'JEPANG', 'YAMAHA', 'VIXION', 27940000.00),
('MOBIL', 'JEPANG', 'DAIHATSU', 'XENIA', 234550000.00),
('MOBIL', 'JEPANG', 'MITSUBISHI', 'XPANDER', 272100000.00),
('MOBIL', 'JEPANG', 'TOYOTA', 'YARIS', 287450000.00);

-- --------------------------------------------------------

--
-- Table structure for table `list_error`
--

CREATE TABLE IF NOT EXISTS `list_error` (
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  `user` varchar(20) NOT NULL,
  `intent` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `list_error`
--

INSERT INTO `list_error` (`tanggal`, `id`, `text`, `user`, `intent`) VALUES
('2020-03-05 13:32:19', 1, 'tesla', 'default', NULL),
('2020-03-05 13:33:41', 2, 'ninja', 'default', NULL),
('2020-03-05 13:33:59', 3, 'civic', 'default', NULL),
('2020-03-05 13:34:52', 4, 'jazz', 'default', NULL),
('2020-03-05 13:44:11', 5, 'sigra', 'default', NULL),
('2020-03-05 13:56:39', 6, 'jazz', 'default', NULL),
('2020-03-05 13:57:07', 7, 'brio', 'default', NULL),
('2020-03-05 13:57:26', 8, 'mobilio', 'default', NULL),
('2020-03-06 09:32:32', 9, 'saya lapar', 'default', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `list_tanya`
--

CREATE TABLE IF NOT EXISTS `list_tanya` (
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `topik` varchar(100) DEFAULT NULL,
  `produk` varchar(100) DEFAULT NULL,
  `paramater` varchar(100) DEFAULT NULL,
  `value` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `list_tanya`
--

INSERT INTO `list_tanya` (`tanggal`, `topik`, `produk`, `paramater`, `value`) VALUES
('2020-02-26 03:55:50', 'INFO_PRODUK', 'EMAS', '', ''),
('2020-02-26 04:00:37', 'HARGA_EMAS', 'TABUNGAN_EMAS', 'BERAT', '1 GRAM'),
('2020-02-26 04:03:55', 'HARGA_EMAS', 'TABUNGAN_EMAS', 'BERAT', '1.0'),
('2020-03-03 07:08:23', 'HARGA_EMAS', 'TABUNGAN_EMAS', 'BERAT', '0'),
('2020-03-03 07:29:31', 'HARGA_EMAS', 'TABUNGAN_EMAS', 'BERAT', '1.5'),
('2020-03-03 07:30:55', 'HARGA_EMAS', 'TABUNGAN_EMAS', 'BERAT', '10000.0'),
('2020-03-03 07:31:55', 'INFO_PRODUK', 'AMANAH', '', ''),
('2020-03-03 07:34:07', 'INFO_PRODUK', 'MULIA', '', ''),
('2020-03-03 07:51:23', 'INFO_PRODUK', 'MULIA KOLEKTIF', '', ''),
('2020-03-03 08:00:29', 'INFO_PRODUK', 'RAHN BISNIS', '', ''),
('2020-03-03 08:10:06', 'INFO_PRODUK', 'GADAI TABUNGAN EMAS', '', ''),
('2020-03-03 08:12:18', 'INFO_PRODUK', 'GADAI TABUNGAN EMAS', '', ''),
('2020-03-03 08:36:38', 'SIMULASI', 'EMASKU', 'BERAT', '5'),
('2020-03-03 08:36:38', 'SIMULASI', 'EMASKU', 'TENOR', '4'),
('2020-03-03 08:42:03', 'SIMULASI', 'EMASKU', 'BERAT', '5'),
('2020-03-03 08:42:03', 'SIMULASI', 'EMASKU', 'TENOR', '4'),
('2020-03-03 08:46:46', 'SIMULASI', 'EMASKU', 'BERAT', '5'),
('2020-03-03 08:46:46', 'SIMULASI', 'EMASKU', 'TENOR', '4'),
('2020-03-03 08:48:03', 'SIMULASI', 'EMASKU', 'BERAT', '5'),
('2020-03-03 08:48:03', 'SIMULASI', 'EMASKU', 'TENOR', '4'),
('2020-03-03 09:41:07', 'SIMULASI', 'EMASKU', 'BERAT', '10'),
('2020-03-03 09:41:07', 'SIMULASI', 'EMASKU', 'TENOR', '10'),
('2020-03-03 09:50:08', 'SIMULASI', 'EMASKU', 'BERAT', '25'),
('2020-03-03 09:50:08', 'SIMULASI', 'EMASKU', 'TENOR', '7'),
('2020-03-04 07:39:33', 'HARGA_EMAS', 'TABUNGAN_EMAS', 'BERAT', '0'),
('2020-03-04 07:39:48', 'HARGA_EMAS', 'TABUNGAN_EMAS', 'BERAT', '10.5'),
('2020-03-04 07:40:15', 'HARGA_EMAS', 'TABUNGAN_EMAS', 'BERAT', '2000.0'),
('2020-03-04 07:43:20', 'INFO_PRODUK', 'AMANAH', '', ''),
('2020-03-04 07:43:50', 'INFO_PRODUK', 'AMANAH', '', ''),
('2020-03-04 07:44:41', 'INFO_PRODUK', 'MULIA', '', ''),
('2020-03-04 07:45:31', 'INFO_PRODUK', 'EMASKU', '', ''),
('2020-03-04 07:46:29', 'INFO_PRODUK', 'MULIA', '', ''),
('2020-03-04 07:48:42', 'SIMULASI', 'EMASKU', 'BERAT', '5'),
('2020-03-04 07:48:42', 'SIMULASI', 'EMASKU', 'TENOR', '8'),
('2020-03-04 08:10:29', 'SIMULASI', 'EMASKU', 'BERAT', '5'),
('2020-03-04 08:10:29', 'SIMULASI', 'EMASKU', 'TENOR', '12'),
('2020-03-04 08:12:18', 'SIMULASI', 'EMASKU', 'BERAT', '25'),
('2020-03-04 08:12:18', 'SIMULASI', 'EMASKU', 'TENOR', '6'),
('2020-03-04 10:17:55', 'INFO_PRODUK', 'AMANAH', '', ''),
('2020-03-04 10:18:03', 'INFO_PRODUK', 'AMANAH', '', ''),
('2020-03-04 10:18:21', 'INFO_PRODUK', 'EMASKU', '', ''),
('2020-03-04 10:18:31', 'INFO_PRODUK', 'TABUNGAN EMAS', '', ''),
('2020-03-04 10:18:42', 'INFO_PRODUK', 'TABUNGAN EMAS', '', ''),
('2020-03-04 10:18:45', 'INFO_PRODUK', 'TABUNGAN EMAS', '', ''),
('2020-03-04 10:18:59', 'INFO_PRODUK', 'TABUNGAN EMAS', '', ''),
('2020-03-04 10:19:06', 'INFO_PRODUK', 'RAHN BISNIS', '', ''),
('2020-03-05 10:45:08', 'INFO_PRODUK', 'AMANAH', '', ''),
('2020-03-05 13:29:12', 'HARGA_EMAS', 'TABUNGAN_EMAS', 'BERAT', '0'),
('2020-03-05 13:29:23', 'HARGA_EMAS', 'TABUNGAN_EMAS', 'BERAT', '2.5'),
('2020-03-05 13:29:34', 'INFO_PRODUK', 'EMASKU', '', ''),
('2020-03-05 13:31:01', 'SIMULASI', 'EMASKU', 'BERAT', '10'),
('2020-03-05 13:31:01', 'SIMULASI', 'EMASKU', 'TENOR', '12'),
('2020-03-05 13:41:03', 'HARGA_EMAS', 'TABUNGAN_EMAS', 'BERAT', '0'),
('2020-03-05 13:54:24', 'HARGA_EMAS', 'TABUNGAN_EMAS', 'BERAT', '10.75'),
('2020-03-05 13:54:50', 'HARGA_EMAS', 'TABUNGAN_EMAS', 'BERAT', '2500.0'),
('2020-03-05 13:55:57', 'SIMULASI', 'EMASKU', 'BERAT', '10'),
('2020-03-05 13:55:57', 'SIMULASI', 'EMASKU', 'TENOR', '9'),
('2020-03-06 07:20:16', 'INFO_PRODUK', 'AMANAH', '', ''),
('2020-03-06 07:20:22', 'INFO_PRODUK', 'TABUNGAN EMAS', '', ''),
('2020-03-06 08:40:27', 'INFO_PRODUK', 'MULIA', '', ''),
('2020-03-06 08:40:35', 'INFO_PRODUK', 'MULIA', '', ''),
('2020-03-06 08:44:27', 'SIMULASI', 'EMASKU', 'BERAT', '10'),
('2020-03-06 08:44:27', 'SIMULASI', 'EMASKU', 'TENOR', '12'),
('2020-03-06 09:29:11', 'INFO_PRODUK', 'AMANAH', '', ''),
('2020-03-06 09:29:35', 'INFO_PRODUK', 'AMANAH', '', ''),
('2020-03-06 09:31:02', 'HARGA_EMAS', 'TABUNGAN_EMAS', 'BERAT', '0'),
('2020-03-06 09:31:16', 'HARGA_EMAS', 'TABUNGAN_EMAS', 'BERAT', '3.5');

-- --------------------------------------------------------

--
-- Table structure for table `plafon_uang_muka`
--

CREATE TABLE IF NOT EXISTS `plafon_uang_muka` (
  `negara` varchar(50) DEFAULT NULL,
  `kendaraan` varchar(50) DEFAULT NULL,
  `plafon_maks` decimal(10,2) DEFAULT NULL,
  `uang_muka` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `plafon_uang_muka`
--

INSERT INTO `plafon_uang_muka` (`negara`, `kendaraan`, `plafon_maks`, `uang_muka`) VALUES
('JEPANG', 'MOTOR', 0.90, 0.10),
('JEPANG', 'MOBIL', 0.80, 0.20),
('AMERIKA', 'MOBIL', 0.75, 0.25),
('AMERIKA', 'MOTOR', 0.70, 0.30),
('EROPA', 'MOTOR', 0.75, 0.25),
('EROPA', 'MOBIL', 0.75, 0.25),
('KOREA', 'MOBIL', 0.75, 0.25),
('KOREA', 'MOTOR', 0.70, 0.30),
('INDIA', 'MOBIL', 0.75, 0.25),
('INDIA', 'MOTOR', 0.80, 0.20),
('INDONESIA', 'MOTOR', 0.65, 0.35),
('LAINNYA', 'MOBIL', 0.60, 0.40),
('LAINNYA', 'MOTOR', 0.60, 0.40);

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE IF NOT EXISTS `produk` (
  `produk` varchar(255) NOT NULL DEFAULT '',
  `deskripsi` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`produk`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`produk`, `deskripsi`) VALUES
('AMANAH', 'Amanah adalah pemberian pinjaman berprinsip syariah kepada pengusaha mikro, karyawan internal dan eksternal serta profesional guna pembelian kendaraan bermotor'),
('ARRUM', 'Arrum adalah pembiayaan syariah dengan beberapa pilihan yaitu arrum bpkb, arrum haji, arrum emas dan arrum umroh'),
('ARRUM BPKB', 'Arrum BPKB adalah pembiayaan syariah untuk pengembangan UMKM dengan jaminan BPKB Kendaraan bermotor'),
('ARRUM EMAS', 'Arrum emas adalah pemberian pinjaman dana tunai dengan jaminan perhiasan emas dan berlian'),
('ARRUM HAJI', 'Arrum Haji adalah pembiayaan untuk mendapatkan porsi ibadah haji secara syariah dengan proses mudah, cepat dan aman'),
('ARRUM UMROH', 'Arrum umroh adalah produk penyaluran pinjaman untuk perjalanan ibadah umroh dengan jaminan barang berharga menggunakan pola angsuran berlandaskan prinsip-prinsip syariah'),
('EMASKU', 'Emasku adalah produk pembiayaan investasi emas dalam bentuk emas lantakan 24 karat dengan nilai perolehan sampai dengan 20 juta Rupiah'),
('GADAI TABUNGAN EMAS', 'Gadai Tabungan Emas dengan agunan berupa emas titipan milik nasabah'),
('KCA', 'KCA merupakan solusi tepat untuk mendapatkan pinjaman secara mudah cepat dan aman.'),
('KCA BISNIS', 'KCA Bisnis adalah fitur KCA yang tepat untuk pendanaan bisnis dengan proses mudah cepat dan aman'),
('KCA FLEKSI', 'KCA Fleksi adalah fitur KCA sbg solusi pendanaan yang fleksibel untuk membuat hidup anda lebih mudah'),
('KCA PRIMA', 'KCA Prima adalah fitur layanan KCA untuk memenuhi kebutuhan dengan proses mudah cepat aman dan bebas bunga'),
('KRASIDA', 'Krasida adalah kredit angsuran bulanan untuk keperluan konsumtif dan produktif dengan jaminan emas'),
('KREASI', 'Kreasi adalah kredit dengan angsuran bulanan untuk pengembangan UMKM'),
('KREASI FLEKSI', 'Kreasi Fleksi adalah kredit untuk pengembangan usaha dengan angsuran fleksibel'),
('KREASI MULTIGUNA', 'Kreasi Multiguna adalah kredit yang diberikan kepada karyawan dan non karyawan untuk keperluan konsumtif'),
('KREASI ULTRA MIKRO', 'Kreasi Ultra Mikro adalah kredit dengan angsuran bulanan/berjangka untuk pengembangan usaha Ultra mikro sampai dengan 10 jt'),
('MULIA', 'Mulia adalah layanan investasi emas batangan dengan beberapa pilihan seperti mulia tunai, mulai arisan, mulia kolektif dan mulia personal'),
('MULIA ARISAN', 'Mulia Arisan adalah layanan investasi emas batangan secara angsuran untuk kelompok arisan dengan harga yang pasti'),
('MULIA KOLEKTIF', 'Mulia Kolektif adalah layanan investasi emas batangan secara angsuran untuk komunitas dengan proses yang cepat dan mudah'),
('MULIA PERSONAL', 'Mulia Personal adalah layanan investasi emas batangan secara angsuran perorangan di outlet Pegadaian dengan cepat dan mudah'),
('MULIA TUNAI', 'Mulia Tunai adalah layanan investasi emas batangan secara tunai di outlet pegadaian galeri 24 dengan cara tepat dan langusng diterima'),
('PDS', 'PDS /Pegadaian Digital Service adalah aplikasi smartphone untuk berbagai macam transaksi pegadaian secara online sehingga menjadi lebih praktis'),
('RAHN', 'Rahn dari Pegadaian Syariah adalah solusi tepat kebutuhan dana cepat yang sesuai syariah'),
('RAHN BISNIS', 'Rahn Bisnis adalah produk pegadaian syariah untuk memberikan pinjaman dana tunai kepada pemilik usaha dengan jaminan emas(batangan atau perhiasan)'),
('RAHN FLEKSI', 'Rahn Fleksi adalah pemberian pinjaman dengan jaminan barang bergerak sesuai syariah dengan plafon pinjaman tinggi'),
('RAHN HASAN', 'Rahn Hasan adalah Rahn dengan tarif Mu''nah pemeliharaan sebesar 0 persen berjangka waktu /tenor 60 hari'),
('RAHN TASJILY TANAH', 'Rahn Tasjily Tanah adalah pembiayaan berbasis syariah yang diberkan kepada masyarakat berpenghasilan tetap, pengusaha mikro dan petani dengan jaminan sertifikat tanah'),
('TABUNGAN EMAS', 'Tabungan Emas Pegadaian adalah layanan penjualan dan pembelian emas dengan fasilitas titipan');

-- --------------------------------------------------------

--
-- Table structure for table `tes`
--

CREATE TABLE IF NOT EXISTS `tes` (
  `kode` int(20) NOT NULL,
  `judul` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tes`
--

INSERT INTO `tes` (`kode`, `judul`) VALUES
(1, 'A'),
(2, 'B');

-- --------------------------------------------------------

--
-- Table structure for table `uang_muka_emasku`
--

CREATE TABLE IF NOT EXISTS `uang_muka_emasku` (
  `berat` decimal(15,2) NOT NULL DEFAULT '0.00',
  `uang_muka` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`berat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `uang_muka_emasku`
--

INSERT INTO `uang_muka_emasku` (`berat`, `uang_muka`) VALUES
(1.00, 150000.00),
(5.00, 300000.00),
(10.00, 550000.00),
(25.00, 1250000.00);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

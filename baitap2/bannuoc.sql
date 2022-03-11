-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 10, 2022 at 11:46 AM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bannuoc`
--

-- --------------------------------------------------------

--
-- Table structure for table `baiviet`
--

DROP TABLE IF EXISTS `baiviet`;
CREATE TABLE IF NOT EXISTS `baiviet` (
  `id_bv` varchar(5) NOT NULL,
  `tenbaiviet` varchar(100) NOT NULL,
  `noidung` varchar(100) NOT NULL,
  `ngayviet` date NOT NULL,
  `gioviet` time NOT NULL,
  `id_nguoidung` varchar(5) NOT NULL,
  PRIMARY KEY (`id_bv`),
  KEY `ngd_bv` (`id_nguoidung`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `baiviet`
--

INSERT INTO `baiviet` (`id_bv`, `tenbaiviet`, `noidung`, `ngayviet`, `gioviet`, `id_nguoidung`) VALUES
('bv1', 'mùa xuân', '123', '2021-09-01', '15:04:00', 'ngd2'),
('bv2', 'Bài viết 2', '234', '2021-07-04', '17:47:00', 'ngd1'),
('bv3', 'Bài viết 3', '456', '2020-10-09', '06:38:00', 'ngd3'),
('bv4', 'Bài viết 4', '                                                                78910                               ', '2021-02-06', '08:12:00', 'ngd1');

-- --------------------------------------------------------

--
-- Table structure for table `chitietdonhang`
--

DROP TABLE IF EXISTS `chitietdonhang`;
CREATE TABLE IF NOT EXISTS `chitietdonhang` (
  `id_dh` varchar(5) NOT NULL,
  `id_sp` varchar(5) NOT NULL,
  `gia` double NOT NULL,
  `soluong` int(11) NOT NULL,
  PRIMARY KEY (`id_dh`,`id_sp`),
  UNIQUE KEY `id_sp` (`id_sp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `danhmuc`
--

DROP TABLE IF EXISTS `danhmuc`;
CREATE TABLE IF NOT EXISTS `danhmuc` (
  `id_dm` varchar(5) NOT NULL,
  `tendanhmuc` varchar(50) NOT NULL,
  PRIMARY KEY (`id_dm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `danhmuc`
--

INSERT INTO `danhmuc` (`id_dm`, `tendanhmuc`) VALUES
('dm1', 'Trà'),
('dm2', 'Coffee'),
('dm3', 'Bánh');

-- --------------------------------------------------------

--
-- Table structure for table `donhang`
--

DROP TABLE IF EXISTS `donhang`;
CREATE TABLE IF NOT EXISTS `donhang` (
  `id_dh` varchar(5) NOT NULL,
  `ngaylap` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `giogiao` time NOT NULL,
  `noigiao` varchar(100) NOT NULL,
  `thanhtien` double NOT NULL,
  `trangthaithanhtoan` tinyint(1) NOT NULL,
  `hinhthucthanhtoan` tinyint(1) NOT NULL,
  `id_nguoidung` varchar(5) NOT NULL,
  PRIMARY KEY (`id_dh`),
  KEY `nguoidung_dh` (`id_nguoidung`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `donhang`
--

INSERT INTO `donhang` (`id_dh`, `ngaylap`, `giogiao`, `noigiao`, `thanhtien`, `trangthaithanhtoan`, `hinhthucthanhtoan`, `id_nguoidung`) VALUES
('dh1', '2021-11-01 00:00:00', '07:52:05', '247 Cách Mạng Tháng 8, Phạm Ngũ Lão, Tân Bình, Hồ Chí Minh', 20, 0, 0, 'ngd1'),
('dh2', '2021-11-05 00:00:00', '15:33:05', '324 Lý Thường Kiệt, Quận 10, Hồ Chí Minh', 25, 1, 1, 'ngd2');

-- --------------------------------------------------------

--
-- Table structure for table `nguoidung`
--

DROP TABLE IF EXISTS `nguoidung`;
CREATE TABLE IF NOT EXISTS `nguoidung` (
  `id_ngd` varchar(5) NOT NULL,
  `tennguoidung` varchar(50) NOT NULL,
  `gioitinh` tinyint(1) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `sdt` int(11) NOT NULL,
  `diachi` varchar(100) NOT NULL,
  `hoatdong` tinyint(1) NOT NULL DEFAULT '1',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_ngd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nguoidung`
--

INSERT INTO `nguoidung` (`id_ngd`, `tennguoidung`, `gioitinh`, `email`, `password`, `sdt`, `diachi`, `hoatdong`, `admin`) VALUES
('ngd1', 'Huỳnh Như', 0, 'huynhnhu@gmail.com', 'acf4deacabe4fbb293a440b5e5db8b7f', 123456789, 'HCM', 1, 0),
('ngd2', 'Lê Thịnh', 1, 'lethinh@gmail.com', 'a3590023df66ac92ae35e3316026d17d ', 112345678, 'HCM', 1, 0),
('ngd3', 'Nguyễn An', 0, 'nguyenan@gmail.com', '8a13dab3f5ec9e22d0d1495c8c85e436 ', 223456789, 'Vũng Tàu', 0, 0),
('ngd32', 'Hoàng Ngọc Hà', 1, 'rescuesweetsilbi@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 399161596, 'hcm', 1, 0),
('ngd4', 'Trần Bình', 0, 'tranbinh@gmail.com', 'ee25f924b7df4d4fb93b3da96ee342b1 ', 112345678, 'Long An', 1, 1),
('ngd5', 'Hoàng Hà', 1, 'ngocha1999.hh@gmail.com', 'bdff99119c31715c47449e2996b04f87', 399161596, 'HCM', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sanpham`
--

DROP TABLE IF EXISTS `sanpham`;
CREATE TABLE IF NOT EXISTS `sanpham` (
  `id_sp` varchar(5) NOT NULL,
  `hinh` varchar(20) NOT NULL,
  `tensanpham` varchar(50) NOT NULL,
  `gia` double NOT NULL,
  `id_danhmuc` varchar(5) NOT NULL,
  PRIMARY KEY (`id_sp`),
  KEY `dm_sp` (`id_danhmuc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sanpham`
--

INSERT INTO `sanpham` (`id_sp`, `hinh`, `tensanpham`, `gia`, `id_danhmuc`) VALUES
('sp1', 'img-02.jpg', 'Trà Đào', 2, 'dm1'),
('sp2', 'img-08.jpg', 'Capuchino', 2, 'dm2'),
('sp3', 'img-01.jpg', 'Tiramisu Trà Xanh', 2.5, 'dm3'),
('sp4', 'img-04.jpg', 'Cà Phê Đen', 1, 'dm2'),
('sp5', 'img-05.jpg', 'Bánh Mì Chà Bông', 2, 'dm3'),
('sp6', 'img-03.jpg', 'Trà Phúc Bồn Tử', 1.5, 'dm1'),
('sp7', 'img-06.jpg', 'Trà Đào Sữa', 1.5, 'dm1'),
('sp8', 'img-07.jpg', 'Bông Lan Trứng Muối', 2, 'dm3');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `baiviet`
--
ALTER TABLE `baiviet`
  ADD CONSTRAINT `ngd_bv` FOREIGN KEY (`id_nguoidung`) REFERENCES `nguoidung` (`id_ngd`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chitietdonhang`
--
ALTER TABLE `chitietdonhang`
  ADD CONSTRAINT `ctdh_dh` FOREIGN KEY (`id_dh`) REFERENCES `donhang` (`id_dh`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ctdh_sp` FOREIGN KEY (`id_sp`) REFERENCES `sanpham` (`id_sp`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `donhang`
--
ALTER TABLE `donhang`
  ADD CONSTRAINT `nguoidung_dh` FOREIGN KEY (`id_nguoidung`) REFERENCES `nguoidung` (`id_ngd`);

--
-- Constraints for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `dm_sp` FOREIGN KEY (`id_danhmuc`) REFERENCES `danhmuc` (`id_dm`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

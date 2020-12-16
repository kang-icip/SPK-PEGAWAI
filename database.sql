-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Inang: 127.0.0.1
-- Waktu pembuatan: 07 Nov 2020 pada 05.28
-- Versi Server: 5.5.27
-- Versi PHP: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Basis data: `database`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id_admin` int(11) NOT NULL AUTO_INCREMENT,
  `nama_admin` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `nama_admin`, `username`, `password`) VALUES
(1, 'Admin', 'admin', '21232f297a57a5a743894a0e4a801fc3');

-- --------------------------------------------------------

--
-- Struktur dari tabel `file`
--

CREATE TABLE IF NOT EXISTS `file` (
  `id_file` int(11) NOT NULL AUTO_INCREMENT,
  `nama_file` varchar(100) NOT NULL,
  `file` varchar(100) NOT NULL,
  PRIMARY KEY (`id_file`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data untuk tabel `file`
--

INSERT INTO `file` (`id_file`, `nama_file`, `file`) VALUES
(6, 'Surat Pernyataan', 'surat-pernyataan.pdf'),
(7, 'Pengumuman Penerimaan', 'pengumuman-penerimaan.pdf'),
(8, 'Formulir Ujian', 'formulir-ujian.pdf');

-- --------------------------------------------------------

--
-- Struktur dari tabel `hitung`
--

CREATE TABLE IF NOT EXISTS `hitung` (
  `id_hitung` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_lowongan` int(11) NOT NULL,
  `vektor_s` float NOT NULL,
  `vektor_v` float NOT NULL,
  PRIMARY KEY (`id_hitung`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data untuk tabel `hitung`
--

INSERT INTO `hitung` (`id_hitung`, `id_user`, `id_lowongan`, `vektor_s`, `vektor_v`) VALUES
(13, 14, 11, 62.9127, 0.20918),
(14, 15, 11, 74.7531, 0.248549),
(15, 16, 11, 63.9806, 0.23001),
(16, 17, 11, 76.5176, 0.275081),
(17, 18, 11, 50, 0.152363);

-- --------------------------------------------------------

--
-- Struktur dari tabel `lowongan`
--

CREATE TABLE IF NOT EXISTS `lowongan` (
  `id_lowongan` int(11) NOT NULL AUTO_INCREMENT,
  `lowongan` varchar(50) NOT NULL,
  `kuota` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `pengumuman` int(11) NOT NULL,
  PRIMARY KEY (`id_lowongan`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data untuk tabel `lowongan`
--

INSERT INTO `lowongan` (`id_lowongan`, `lowongan`, `kuota`, `status`, `pengumuman`) VALUES
(11, 'Lowongan Programmer PHP', 1, 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `lowongan_rinci`
--

CREATE TABLE IF NOT EXISTS `lowongan_rinci` (
  `id_lowongan_rinci` int(11) NOT NULL AUTO_INCREMENT,
  `id_lowongan` int(11) NOT NULL,
  `kriteria` varchar(30) NOT NULL,
  `bobot` int(11) NOT NULL,
  `status_nilai` tinyint(4) NOT NULL,
  `status_upload` tinyint(4) NOT NULL,
  PRIMARY KEY (`id_lowongan_rinci`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=41 ;

--
-- Dumping data untuk tabel `lowongan_rinci`
--

INSERT INTO `lowongan_rinci` (`id_lowongan_rinci`, `id_lowongan`, `kriteria`, `bobot`, `status_nilai`, `status_upload`) VALUES
(37, 11, 'Menguasai PHP (test)', 5, 1, 0),
(38, 11, 'Kemampuan Bahasa Inggris(test)', 4, 1, 0),
(39, 11, 'Melampirkan KTP', 0, 0, 1),
(40, 11, 'Melampirkan Ijazah S1', 3, 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelamar`
--

CREATE TABLE IF NOT EXISTS `pelamar` (
  `id_lamaran` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_lowongan` int(11) NOT NULL,
  `kriteria` varchar(30) NOT NULL,
  `nilai` varchar(10) NOT NULL,
  `file` varchar(200) NOT NULL,
  PRIMARY KEY (`id_lamaran`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=115 ;

--
-- Dumping data untuk tabel `pelamar`
--

INSERT INTO `pelamar` (`id_lamaran`, `id_user`, `id_lowongan`, `kriteria`, `nilai`, `file`) VALUES
(107, 17, 11, 'Menguasai PHP (test)', '80', ''),
(108, 17, 11, 'Kemampuan Bahasa Inggris(test)', '70', ''),
(109, 17, 11, 'Melampirkan KTP', '', '17_11_Melampirkan KTP.pdf'),
(110, 17, 11, 'Melampirkan Ijazah S1', '80', '17_11_Melampirkan Ijazah S1.pdf'),
(111, 18, 11, 'Menguasai PHP (test)', '50', ''),
(112, 18, 11, 'Kemampuan Bahasa Inggris(test)', '50', ''),
(113, 18, 11, 'Melampirkan KTP', '', '18_11_Melampirkan KTP.jpg'),
(114, 18, 11, 'Melampirkan Ijazah S1', '50', '18_11_Melampirkan Ijazah S1.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `nama_lengkap` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `tempat_lahir` varchar(50) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `pendidikan` varchar(30) NOT NULL,
  `file_cv` varchar(50) NOT NULL,
  `foto` varchar(150) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id_user`, `nama_lengkap`, `username`, `password`, `alamat`, `tempat_lahir`, `tanggal_lahir`, `no_hp`, `email`, `pendidikan`, `file_cv`, `foto`) VALUES
(15, 'Juggernaut', 'jugg', 'cf3a6f91a31f6b0d7b397dad7143e1e4', 'jalan ga jauh dari rumah pokoknya', 'Indonesia', '1990-05-05', '081235353535', 'juggernaut@gmail.com', 'S1 Sistem Informasi', 'cv_15_Juggernaut.pdf', 'foto_15_Juggernaut.png'),
(17, 'Wawan santoso', 'wawan', '0a000f688d85de79e3761dec6816b2a5', 'Mayang, Jambi', 'Rimbo Mulyo', '1997-04-11', '086474849837', 'santosowawan123@gmail.com', 'S1 Teknik Informatika', 'cv_17_Wawan santoso.jpg', 'foto_17_Wawan santoso.png'),
(18, 'amek sudrajat', 'amek', '827ccb0eea8a706c4c34a16891f84e7b', 'Mayang, Jambi', 'Rimbo Mulyo', '1987-06-11', '086474849838', 'amek12@gmail.com', 'S1 Teknik Informatika', 'cv_18_amek sudrajat.jpg', 'foto_18_amek sudrajat.jpg');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

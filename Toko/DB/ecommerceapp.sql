-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 26 Apr 2022 pada 12.16
-- Versi server: 10.4.18-MariaDB
-- Versi PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerceapp`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`, `is_active`) VALUES
(10, 'Yodayo', 'aryonala@gmail.com', '$2y$10$v.qz6MoMsJTa/f12rhvnb./u8mtJzdIg2BbWCkL9xGMXhrCGK8Lpi', '0');

-- --------------------------------------------------------

--
-- Struktur dari tabel `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(2, 'Samsung'),
(3, 'Apple'),
(4, 'Sony'),
(6, 'OnePlus+'),
(7, 'Excl'),
(11, 'Cosmos');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(2, 'Electronics'),
(3, 'Home & Kitchen'),
(4, 'Tools & Home Improvement'),
(12, 'Mobiles'),
(13, 'Automotive Parts & Accessories');

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `product_id`, `qty`, `trx_id`, `p_status`) VALUES
(1, 1, 1, 1, '9L434522M7706801A', 'Completed'),
(2, 1, 2, 1, '9L434522M7706801A', 'Completed'),
(3, 1, 3, 1, '9L434522M7706801A', 'Completed'),
(4, 1, 1, 1, '8AT7125245323433N', 'Completed');

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(11) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_qty` int(11) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_qty`, `product_desc`, `product_image`, `product_keywords`) VALUES
(1, 12, 2, 'Samsung Galaxy Z Fold 2', 2499999, 5, 'Last yearâ€™s Galaxy Fold was a sort of experiment in the field of foldable phones. The idea was an innovative one but the phone faced a lot of durability issues. Its launch was postponed multiple times because of Samsungâ€™s inability to solve all the problems. Samsung will likely avoid those situations with its successor.', '1616500092_sm-zfold.jpg', 'samsung, mobile, galaxy fold'),
(2, 12, 3, 'Iphone 12 Pro Max', 1870000, 7, '5G goes Pro. A14 Bionic rockets past every other smartphone chip. The Pro camera system takes low-light photography to the next level â€” with an even bigger jump on iPhone 12 Pro Max. And Ceramic Shield delivers four times better drop performance.', '1616499931_iph12pm.jpg', 'apple, iphone'),
(3, 3, 11, 'Blender', 150000, 20, 'Blender Cosmos', 'blend.jpeg', 'Blender'),
(4, 12, 2, 'Samsung Galaxy S21 Ultra', 1550000, 10, 'This is a demo', '1616492395_Samsung-Galaxy-S21-Ultra-1608287647-0-0.jpg', 'samsung, s21, s21 ultra'),
(5, 12, 6, 'OnePlus 8T', 8600000, 13, 'On spec-sheet, the OnePlus 8T boasts plenty of improvements from its predecessor i.e. the OnePlus 8. For instance, its 6.55-inch 1080p OLED display now comes with a faster 120Hz refresh rate. In comparison, the OnePlus 8 had a 90Hz refresh rate. This upgrade seems huge. However, users will agree that you canâ€™t really find much of a difference between 90Hz to 120Hz on a smartphone screen.', '1616500410_OnePlus-8T-5G-Lunar-Silver-8GB-RAM-128GB-Storage-image-4.jpg', 'one plus, oneplus8'),
(6, 3, 11, 'Microwave', 700000, 8, 'Microwave from cosmos', 'micro.jpeg', 'Microwave'),
(7, 2, 2, 'Air Conditioner', 1000000, 8, 'AC/Air conditioner by samsung', 'ac.jpeg', 'AC'),
(8, 2, 11, 'Dispenser', 50000, 4, 'Dispenser automatis garibet', 'dis.jpeg', 'Dispenser'),
(9, 12, 4, 'Sony Xperia 10 II', 5700000, 5, 'Layar: OLED 6.0 inches, 1080 x 2520 pixels, 21:9 ratio\r\nChipset: Qualcomm SDM665 Snapdragon 665 (11 nm)\r\nCPU: Octa-core (4×2.0 GHz Kryo 260 Gold & 4×1.8 GHz Kryo 260 Silver)\r\nGPU: Adreno 610\r\nMemori Internal: 128GB 4GB RAM\r\nMemori Eksternal: microSDXC\r\nKamera Belakang: 12 MP, f/2.0, 26mm (wide), 1/2.8?, PDAF + 8 MP, f/2.4, 52mm (telephoto), 1/4.0?, PDAF, 2x optical zoom + 8 MP, f/2.2, 120?, 16mm (ultrawide), 1/4.0?\r\nKamera Depan: 8 MP, f/2.0, 24mm (wide), 1/4.0?\r\nOS & Baterai: Android 10, 3600 mAh', 'son.jpg', 'Sony'),
(13, 3, 11, 'Rice Cooker', 350000, 4, 'Rice cooker/Penanak nasi', '123.jpeg', 'Penanak nasi'),
(14, 3, 11, 'Oven', 200000, 10, 'Oven', 'oven.jpeg', 'Oven'),
(15, 12, 4, 'Sony Xperia 1 II', 18000000, 7, 'Layar: OLED, 6.5 inches, 1644 x 3840 pixels, 21:9 ratio\r\nChipset: Qualcomm SM8250 Snapdragon 865 (7 nm+)\r\nCPU: Octa-core (1×2.84 GHz Kryo 585 & 3×2.42 GHz Kryo 585 & 4×1.8 GHz Kryo 585)\r\nGPU: Adreno 650\r\nMemori Internal: 256GB 8GB RAM\r\nMemori Eksternal: microSDXC\r\nKamera Belakang: 12 MP, f/1.7, 24mm (wide), 1/1.7?, 1.8µm, Dual Pixel PDAF, OIS + 12 MP, f/2.4, 70mm (telephoto), 1/3.4?, 1.0µm, PDAF, 3x optical zoom, OIS + 12 MP, f/2.2, 124?, 16mm (ultrawide), 1/2.55?, Dual Pixel PDAF + 0.3 MP, TOF 3D, (depth)\r\nKamera Depan: 8 MP, f/2.0, 24mm (wide), 1/4?, 1.12µm\r\nOS & Baterai: Android 10, 4000 mAh', 'son1.jpg', 'Sony'),
(16, 4, 7, 'Simple Tool Kit', 250000, 7, 'Simple Tool kit to repair at home', 'tool.jpg', 'Repair tool'),
(17, 4, 7, 'Repair kit', 2500000, 4, 'Full Arm Repair kit for your house', 'tools.jpg', 'Tool Repair kit');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(1, 'Christine', 'Randolph', 'randolphc@gmail.com', '25f9e794323b453885f5181f1b624d0b', '8389080183', '2133  Hill Haven Drive', 'Terra Stree'),
(2, 'Will', 'Willams', 'willainswill@gmail.com', '25f9e794323b453885f5181f1b624d0b', '8389080183', '4567  Orphan Road', 'WI'),
(3, 'Demo', 'Name', 'demo@gmail.com', 'password', '9876543210', 'demo ad1', 'ademo ad2'),
(5, 'Steeve', 'Rogers', 'steeve1@gmail.com', '305e4f55ce823e111a46a9d500bcb86c', '9876547770', '573  Pinewood Avenue', 'MN'),
(6, 'Melissa', 'Gilbert', 'gilbert@gmail.com', '305e4f55ce823e111a46a9d500bcb86c', '7845554582', '1711  McKinley Avenue', 'MA'),
(7, 'Aryo', 'nala', 'nalaaryo@gmail.com', '1022e854e4ebcbad9d03732635039e0b', '0851561479', 'Jonggol', 'Semarang'),
(8, 'Dododo', 'dododo', 'dodo@gmail.com', '1022e854e4ebcbad9d03732635039e0b', '0851561422', 'Cibarusah', 'Cileungsi');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indeks untuk tabel `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indeks untuk tabel `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_product_cat` (`product_cat`),
  ADD KEY `fk_product_brand` (`product_brand`);

--
-- Indeks untuk tabel `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_product_brand` FOREIGN KEY (`product_brand`) REFERENCES `brands` (`brand_id`),
  ADD CONSTRAINT `fk_product_cat` FOREIGN KEY (`product_cat`) REFERENCES `categories` (`cat_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

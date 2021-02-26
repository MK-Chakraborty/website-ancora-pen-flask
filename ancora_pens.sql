-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 26, 2021 at 01:05 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ancora_pens`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(3) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(60) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `msg` text NOT NULL,
  `date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `email`, `phone`, `msg`, `date`) VALUES
(1, 'Fr. Tom McDermott', 'joey@km.com', '12121212155', 'ddddddddddddd gggggggggggg', '2021-02-04 22:39:30'),
(2, 'Sofie Rodriges', 'sofie@gmail.com', '+8801715366581', 'Hey I view some of your pens. Looks very fascinating. Keep it up. I will definitely take some of this. \r\nThank You!', '2021-02-07 22:38:29'),
(3, 'David Luiz', 'david@gmail.com', '+8801715366581', 'Hey I view some of your pens. Looks very fascinating. Keep it up. I will definitely take some of this. \r\nThank You!', '2021-02-07 22:39:54');

-- --------------------------------------------------------

--
-- Table structure for table `customers_feedback`
--

CREATE TABLE `customers_feedback` (
  `sno` int(3) NOT NULL,
  `name` text NOT NULL,
  `comment` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers_feedback`
--

INSERT INTO `customers_feedback` (`sno`, `name`, `comment`, `date`) VALUES
(1, 'Elon Mask', 'What a beautiful pen! Ancora has done a very amazing work. Amazing design. ', '2021-02-22 22:54:45'),
(2, 'David Luiz', 'What a beautiful pen! Ancora has done a very amazing work. Amazing design. ', '2021-02-22 23:00:05'),
(5, 'David Luiz', 'What a beautiful pen! Ancora has done a very amazing work. Amazing design. ', '2021-02-22 23:08:37'),
(6, 'Fr. Tom McDermott', 'What a beautiful pen! Ancora has done a very amazing work. Amazing design. ', '2021-02-22 23:09:16');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `sno` int(3) NOT NULL,
  `slug` varchar(30) NOT NULL,
  `title` varchar(300) NOT NULL,
  `subtitle` text NOT NULL,
  `content` text NOT NULL,
  `img_file` varchar(50) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`sno`, `slug`, `title`, `subtitle`, `content`, `img_file`, `date`) VALUES
(1, 'first-product', 'Big Five Elephant', 'Materials : Acrylic resin , Imitating the bark of a tree , Brass , Gold plated , Engraving , 18K gold nib', 'Pen History:                              \r\nElephant hunting requires a lot of walking. It is important to be physically prepared for this if your elephant hunt is to be successful. It is very important that the hunter be comfortable with his rifle when hunting elephant because of the dangerously close proximity to the animal when making the first shot. \r\n5 fountain pens/5 roller pens. \r\nPrice: 3350 EUR', 'big-five-elephant_1.png', '2021-02-22 23:41:30'),
(2, 'second-product', 'Cappella Sistina', 'Materials : Acrylic resin , Gold plated , Silver , 18K gold nib', 'Pen History: \r\nThe Skillfully handcrafted miniature on the Cappella Sistina pen body depicts a portion of the Last Judgement fresco created by Michelangelo on the ceiling of the Vatican\'s Sistine Chapel. The illustration shows the Virgin Mary and Christ figures in amazing detail enriched with precious gold plating highlighted with incrusted pearls.- 25 fountain pens/25 roller pens. Price: 3950 EUR', 'cappella-sistina_1.png', '2021-02-10 22:55:23'),
(3, 'third-product', 'Classic', 'Materials : Acrylic resin , splash of pearl , Silver', 'The Ancora masters created a pen «Classic» for those who don\'t like to distract on trifles. Strict and stylish accessory is presented in two colors: blue and black, sleek and doesn\'t require a special event.- Price: 450 EUR', 'classic_1.png', '2021-02-10 22:55:23'),
(4, 'fourth-product', 'Derbent City 2000th Anniversary Gold', 'Materials : Acrylic resin , Gold plated , Silver , 18K gold nib', 'The Derbent City 2000th anniversary pen was created to celebrate the anniversary of the one of the oldest Russian cities Derbent. The pen body has a beautiful engraving of the Derbent city landscape and the clip is made in the form of a dagger. The pen lid is adorned with traditional silver ornaments of this historic city. ----------\r\n2 fountain pens/20 roller pens. Price: 5900 EUR', 'derbent-city-2000th-anniversary-silver_1.png', '2021-02-10 23:01:52'),
(5, 'fifth-product', 'Luca Signorelli', 'Materials : Acrylic resin , Gold plated , Silver , Gilding , Inlaid artificial gemstone , Enamel , Hand painted , 18K gold nib', 'This collection was released in honor o f the early Renaissance Italian painter Luca Signorelli. His works were admired and appreciated, as the characters in his paintings seemed alive. The most famous of his frescoes can be found the local monastery of the Abbey of Monte Oliveto Maggiore. --------------------------------- 88 fountain pens/88 roller pens. Price: 1750 EUR', 'luca-signorelli_1.png', '2021-02-10 23:01:52'),
(6, 'sixth-product', 'Big Five Set', 'Materials : Acrylic resin , Imitating the bark of a tree , Brass , Gold plated , Engraving , 18K gold nib', 'The Big Five pens are devoted to the five big game of African hunting. Hunting the big five is a dangerous, expensive and organizationally difficult activity requiring a complete range of skills and support. It is said that you hunt elephant with your feet, buffalo with your gut and lion with your heart.Each magnificent specimen fountain pen is as rare as the number of hunters who have a successful big five hunt. ------------------------------- 5 sets of fountain pens/5 sets of roller pens. Price: 18500 EUR', 'big-five_1.png', '2021-02-10 23:07:10'),
(7, 'seventh-product', 'St. Basil Cathedral', 'Materials : Acrylic resin , Silver , Gold plated , Hand painted on nacreous mosaic , 18K gold nib', 'Although it\'s known to everyone as St. Basil\'s, this legendary building is officially called «The Cathedral of the Intercession of the Virgin by the Moat». The Cathedral was ordered by Ivan the Terrible to mark the 1552 capture of Kazan from Mongol forces. It was completed in 1560.                25 fountain pens/25 roller pens. Price: 5450 EUR', 'st-basil-cathedral_1.png', '2021-02-20 22:38:23'),
(9, 'eighth-product', 'Capri', 'Materials : Acrylic resin , mother of pearl mosaics , Silver , Rhodium plated , 18K gold nib', 'Capri Island - a recognized gem of the Bay of Naples. Its history bears points of Phoenician, Greek and Roman civilizations. However, it will remain primarily the island of the Sirens for the most, because, according to the legend, at these very rocky shores Odysseus ordered his companions to tie him to the mast of the ship so not to succumb to the sweet singing of mermaid, and not to jump into the depths of the sea. The amazing natural beauty of the island and mysterious stories about it reflected in the Ancora Capri pens collection.\r\n\r\nFountain pens/Rollers pens\r\n\r\n1600 EUR', 'capri_1.png', '2021-02-20 22:50:24'),
(10, 'ninth-product', 'Perla Lady', 'Materials : Acrylic resin , splash of pearl , Brass , Silver , Gold/rhodium plated', 'Wonderful Perla Lady with precious pearly gloss is a little bit different than its parent – the pen Perla. It has a more compact size and exquisite body shape. Price:325 EUR', 'perla-lady_1.png', '2021-02-22 23:41:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `customers_feedback`
--
ALTER TABLE `customers_feedback`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customers_feedback`
--
ALTER TABLE `customers_feedback`
  MODIFY `sno` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `sno` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

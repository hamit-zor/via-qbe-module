-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 26, 2018 at 10:08 AM
-- Server version: 5.7.24-0ubuntu0.18.04.1
-- PHP Version: 7.2.10-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `via-search-demo`
--

-- --------------------------------------------------------

--
-- Table structure for table `VideoFeatures`
--

CREATE TABLE `VideoFeatures` (
  `VideoFeatureId` int(11) NOT NULL,
  `FrameNo` int(11) NOT NULL,
  `KeypointPtX` int(11) NOT NULL,
  `KeypointPtY` int(11) NOT NULL,
  `Descriptor` varchar(1024) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Videos`
--

CREATE TABLE `Videos` (
  `VideoId` int(11) NOT NULL,
  `Title` varchar(50) NOT NULL,
  `Path` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Videos`
--

INSERT INTO `Videos` (`VideoId`, `Title`, `Path`) VALUES
(1, 'Human Video', '/home/hamit-zor/via-search-module/engine/videos/TownCentreXVID_VIA_25_small.mp4');

-- --------------------------------------------------------

--
-- Table structure for table `VideoVideoFeatures`
--

CREATE TABLE `VideoVideoFeatures` (
  `VideoVideoFeatureId` int(11) NOT NULL,
  `VideoFeatureId` int(11) NOT NULL,
  `VideoId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `VideoFeatures`
--
ALTER TABLE `VideoFeatures`
  ADD PRIMARY KEY (`VideoFeatureId`);

--
-- Indexes for table `Videos`
--
ALTER TABLE `Videos`
  ADD PRIMARY KEY (`VideoId`);

--
-- Indexes for table `VideoVideoFeatures`
--
ALTER TABLE `VideoVideoFeatures`
  ADD PRIMARY KEY (`VideoVideoFeatureId`),
  ADD KEY `VideoFeatureId` (`VideoFeatureId`),
  ADD KEY `VideoFeatureId_2` (`VideoFeatureId`),
  ADD KEY `VideoId` (`VideoId`),
  ADD KEY `VideoFeatureId_3` (`VideoFeatureId`,`VideoId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `VideoFeatures`
--
ALTER TABLE `VideoFeatures`
  MODIFY `VideoFeatureId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Videos`
--
ALTER TABLE `Videos`
  MODIFY `VideoId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `VideoVideoFeatures`
--
ALTER TABLE `VideoVideoFeatures`
  MODIFY `VideoVideoFeatureId` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `VideoVideoFeatures`
--
ALTER TABLE `VideoVideoFeatures`
  ADD CONSTRAINT `VideoFeatureIdForeignKey` FOREIGN KEY (`VideoFeatureId`) REFERENCES `VideoFeatures` (`VideoFeatureId`),
  ADD CONSTRAINT `VideoIdForeignKey` FOREIGN KEY (`VideoId`) REFERENCES `Videos` (`VideoId`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
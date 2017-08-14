-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 14, 2017 at 04:38 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `turbo_money_manager`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Name',
  `total_amount` double(14,4) NOT NULL COMMENT 'Total Amount',
  `image_path` text COLLATE utf8mb4_unicode_ci COMMENT 'Image',
  `user_id` int(11) NOT NULL COMMENT 'Owner'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `account_payable`
--

CREATE TABLE `account_payable` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Name',
  `amount` double(14,4) NOT NULL COMMENT 'Amount',
  `user_id` int(11) NOT NULL COMMENT 'Created By'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Account Payable';

-- --------------------------------------------------------

--
-- Table structure for table `account_receivable`
--

CREATE TABLE `account_receivable` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Name',
  `amount` double(14,4) NOT NULL COMMENT 'Amount',
  `user_id` int(11) NOT NULL COMMENT 'User'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Account Receivable';

-- --------------------------------------------------------

--
-- Table structure for table `budget`
--

CREATE TABLE `budget` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Budget',
  `description` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Description',
  `amount` double(14,4) NOT NULL COMMENT 'Amount',
  `effective_date` date NOT NULL COMMENT 'Effective Date',
  `expiry_date` date DEFAULT NULL COMMENT 'Expiry Date',
  `user_id` int(11) NOT NULL COMMENT 'User'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Budget';

-- --------------------------------------------------------

--
-- Table structure for table `budget_detail`
--

CREATE TABLE `budget_detail` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `category_id` int(11) NOT NULL COMMENT 'Category',
  `amount` double(14,4) NOT NULL COMMENT 'Amount',
  `budget_id` int(11) NOT NULL COMMENT 'Budget',
  `duration` enum('Daily','Monthly','Annually') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Duration'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Budget Detail';

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `type` enum('Income','Expense') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Type',
  `category` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Category',
  `icon` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Icon',
  `parent_id` int(11) DEFAULT NULL COMMENT 'Parent',
  `image` text COLLATE utf8mb4_unicode_ci COMMENT 'Image',
  `user_id` int(11) NOT NULL COMMENT 'Created By'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `credit_card_transaction`
--

CREATE TABLE `credit_card_transaction` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `type` enum('Debit','Credit') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Type',
  `amount` double(14,4) NOT NULL COMMENT 'Amount',
  `transaction_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Transaction Date',
  `update_date` datetime DEFAULT NULL COMMENT 'Last Update On',
  `user_id` int(11) NOT NULL COMMENT 'Created By',
  `account_id` int(11) NOT NULL COMMENT 'Account'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Credit Card Transaction';

-- --------------------------------------------------------

--
-- Table structure for table `debt_transaction`
--

CREATE TABLE `debt_transaction` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `type` enum('Payable','Receivable') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Type',
  `category_id` int(11) NOT NULL COMMENT 'Category',
  `note` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Note',
  `transaction_date` datetime NOT NULL COMMENT 'Transaction Date',
  `update_date` datetime DEFAULT NULL COMMENT 'Update Date',
  `user_id` int(11) NOT NULL COMMENT 'Created By',
  `person_id` int(11) DEFAULT NULL COMMENT 'Person',
  `account_id` int(11) NOT NULL COMMENT 'Account'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `debt_transaction_image`
--

CREATE TABLE `debt_transaction_image` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `debt_transaction_id` int(11) NOT NULL COMMENT 'Debt Transaction',
  `image_path` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Image'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payable_transaction`
--

CREATE TABLE `payable_transaction` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `type` enum('Debit','Credit') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Type',
  `note` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Note',
  `amount` double(14,4) NOT NULL COMMENT 'Amount',
  `transaction_date` datetime NOT NULL COMMENT 'Transaction Date',
  `update_date` datetime DEFAULT NULL COMMENT 'Last Update On',
  `due_date` datetime DEFAULT NULL COMMENT 'Due Date',
  `person_id` int(11) NOT NULL COMMENT 'Person',
  `parent_id` int(11) DEFAULT NULL COMMENT 'Parent',
  `account_id` int(11) NOT NULL COMMENT 'Account',
  `account_payable_id` int(11) NOT NULL COMMENT 'Account Payable'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Payable Transaction';

-- --------------------------------------------------------

--
-- Table structure for table `payment_plan`
--

CREATE TABLE `payment_plan` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Name',
  `duration` int(11) NOT NULL COMMENT 'Duration',
  `duration_unit` enum('Day','Month','Year') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Duration Unit',
  `amount_per_unit` double(14,4) NOT NULL COMMENT 'Amount / Unit',
  `start_date` date NOT NULL COMMENT 'Start Date',
  `end_date` date NOT NULL COMMENT 'End Date'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Payment Plan' ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Name',
  `user_id` int(11) NOT NULL COMMENT 'Created By'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `receivable_transaction`
--

CREATE TABLE `receivable_transaction` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `type` enum('Debit','Credit') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Type',
  `note` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Note',
  `amount` double(14,4) NOT NULL COMMENT 'Amount',
  `transaction_date` datetime NOT NULL COMMENT 'Transaction Date',
  `update_date` datetime DEFAULT NULL COMMENT 'Update Date',
  `due_date` datetime DEFAULT NULL COMMENT 'Due Date',
  `person_id` int(11) NOT NULL COMMENT 'Person',
  `account_id` int(11) NOT NULL COMMENT 'Account',
  `account_receivable_id` int(11) NOT NULL COMMENT 'Account Receivable'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Receivable Transaction';

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `type` enum('Debit','Credit') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Type',
  `category_id` int(11) NOT NULL COMMENT 'Category',
  `note` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Note',
  `amount` double(14,4) NOT NULL COMMENT 'Amount',
  `transaction_date` datetime NOT NULL COMMENT 'Transaction Date',
  `update_date` datetime DEFAULT NULL COMMENT 'Last Update On',
  `user_id` int(11) NOT NULL COMMENT 'Created By',
  `person_id` int(11) DEFAULT NULL COMMENT 'Person',
  `account_id` int(11) NOT NULL COMMENT 'Account',
  `credit_card_transaction_id` int(11) DEFAULT NULL,
  `exclude_from_report` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Exclude'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_image`
--

CREATE TABLE `transaction_image` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `transaction_id` int(11) NOT NULL COMMENT 'Transaction',
  `image_path` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Image'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Username',
  `password` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Password',
  `image_path` text COLLATE utf8mb4_unicode_ci COMMENT 'Image',
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Email',
  `is_admin` tinyint(1) NOT NULL COMMENT 'Is Admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_user_id` (`user_id`);

--
-- Indexes for table `account_payable`
--
ALTER TABLE `account_payable`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `account_receivable`
--
ALTER TABLE `account_receivable`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `budget`
--
ALTER TABLE `budget`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `budget_detail`
--
ALTER TABLE `budget_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `budget_id` (`budget_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_parent_id` (`parent_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `credit_card_transaction`
--
ALTER TABLE `credit_card_transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `account_id` (`account_id`);

--
-- Indexes for table `debt_transaction`
--
ALTER TABLE `debt_transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `debt_transaction_category_id` (`category_id`),
  ADD KEY `debt_transaction_user_id` (`user_id`),
  ADD KEY `debt_transaction_person_id` (`person_id`),
  ADD KEY `debt_transaction_account_id` (`account_id`);

--
-- Indexes for table `debt_transaction_image`
--
ALTER TABLE `debt_transaction_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `debt_transaction_image_debt_transaction_id` (`debt_transaction_id`);

--
-- Indexes for table `payable_transaction`
--
ALTER TABLE `payable_transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `person_id` (`person_id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `account_payable_id` (`account_payable_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `payment_plan`
--
ALTER TABLE `payment_plan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `receivable_transaction`
--
ALTER TABLE `receivable_transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `person_id` (`person_id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `account_receivable_id` (`account_receivable_id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_category_id` (`category_id`),
  ADD KEY `transaction_user_id` (`user_id`),
  ADD KEY `transaction_account_id` (`account_id`),
  ADD KEY `transaction_person_id` (`person_id`),
  ADD KEY `transaction_credit_card_transaction_id` (`credit_card_transaction_id`);

--
-- Indexes for table `transaction_image`
--
ALTER TABLE `transaction_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_image_transaction_id` (`transaction_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `account_payable`
--
ALTER TABLE `account_payable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `account_receivable`
--
ALTER TABLE `account_receivable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `budget`
--
ALTER TABLE `budget`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `budget_detail`
--
ALTER TABLE `budget_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=73;
--
-- AUTO_INCREMENT for table `credit_card_transaction`
--
ALTER TABLE `credit_card_transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `debt_transaction`
--
ALTER TABLE `debt_transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- AUTO_INCREMENT for table `debt_transaction_image`
--
ALTER TABLE `debt_transaction_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- AUTO_INCREMENT for table `payable_transaction`
--
ALTER TABLE `payable_transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `payment_plan`
--
ALTER TABLE `payment_plan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `receivable_transaction`
--
ALTER TABLE `receivable_transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=181;
--
-- AUTO_INCREMENT for table `transaction_image`
--
ALTER TABLE `transaction_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=14;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `account_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `account_payable`
--
ALTER TABLE `account_payable`
  ADD CONSTRAINT `account_payable_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `account_receivable`
--
ALTER TABLE `account_receivable`
  ADD CONSTRAINT `account_receivable_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `budget`
--
ALTER TABLE `budget`
  ADD CONSTRAINT `budget_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `budget_detail`
--
ALTER TABLE `budget_detail`
  ADD CONSTRAINT `budget_detail_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `budget_detail_ibfk_2` FOREIGN KEY (`budget_id`) REFERENCES `budget` (`id`);

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `category_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `category_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `category` (`id`);

--
-- Constraints for table `credit_card_transaction`
--
ALTER TABLE `credit_card_transaction`
  ADD CONSTRAINT `credit_card_transaction_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `credit_card_transaction_ibfk_2` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`);

--
-- Constraints for table `debt_transaction`
--
ALTER TABLE `debt_transaction`
  ADD CONSTRAINT `debt_transaction_account_id` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`),
  ADD CONSTRAINT `debt_transaction_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `debt_transaction_person_id` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`),
  ADD CONSTRAINT `debt_transaction_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `debt_transaction_image`
--
ALTER TABLE `debt_transaction_image`
  ADD CONSTRAINT `debt_transaction_image_debt_transaction_id` FOREIGN KEY (`debt_transaction_id`) REFERENCES `debt_transaction` (`id`);

--
-- Constraints for table `payable_transaction`
--
ALTER TABLE `payable_transaction`
  ADD CONSTRAINT `payable_transaction_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`),
  ADD CONSTRAINT `payable_transaction_ibfk_2` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`),
  ADD CONSTRAINT `payable_transaction_ibfk_3` FOREIGN KEY (`account_payable_id`) REFERENCES `account_payable` (`id`),
  ADD CONSTRAINT `payable_transaction_ibfk_4` FOREIGN KEY (`parent_id`) REFERENCES `payable_transaction` (`id`);

--
-- Constraints for table `person`
--
ALTER TABLE `person`
  ADD CONSTRAINT `person_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `receivable_transaction`
--
ALTER TABLE `receivable_transaction`
  ADD CONSTRAINT `receivable_transaction_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`),
  ADD CONSTRAINT `receivable_transaction_ibfk_2` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`),
  ADD CONSTRAINT `receivable_transaction_ibfk_3` FOREIGN KEY (`account_receivable_id`) REFERENCES `account_receivable` (`id`);

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_account_id` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`),
  ADD CONSTRAINT `transaction_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `transaction_credit_card_transaction_id` FOREIGN KEY (`credit_card_transaction_id`) REFERENCES `credit_card_transaction` (`id`),
  ADD CONSTRAINT `transaction_person_id` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`),
  ADD CONSTRAINT `transaction_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `transaction_image`
--
ALTER TABLE `transaction_image`
  ADD CONSTRAINT `transaction_image_transaction_id` FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

--
-- Database: `project_gestionbibliotheque`
--

-- --------------------------------------------------------

--
-- Table structure for table `commentaire`
--

CREATE TABLE `commentaire` (
  `id` bigint(20) NOT NULL,
  `commentaire` varchar(500) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `emprunteur_id` bigint(20) NOT NULL,
  `livre_id` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `commentaire`
--

INSERT INTO `commentaire` (`id`, `commentaire`, `created_at`, `emprunteur_id`, `livre_id`) VALUES
(1, 'Informative book, nice !', '2022-01-07 15:30:17', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `emprunt`
--

CREATE TABLE `emprunt` (
  `id` bigint(20) NOT NULL,
  `date_retour` date DEFAULT NULL,
  `emprunteur_id` bigint(20) NOT NULL,
  `livre_id` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `emprunt`
--

INSERT INTO `emprunt` (`id`, `date_retour`, `emprunteur_id`, `livre_id`) VALUES
(1, '2022-01-14', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `emprunteur`
--

CREATE TABLE `emprunteur` (
  `id` bigint(20) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `nom` varchar(20) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `prenom` varchar(20) DEFAULT NULL,
  `tel` int(11) DEFAULT NULL,
  `ville` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `emprunteur`
--

INSERT INTO `emprunteur` (`id`, `age`, `email`, `nom`, `password`, `prenom`, `tel`, `ville`) VALUES
(1, 25, 'nadher.arroum@gmail.com', 'Arroum', '$2a$10$unGmqk3peX9zCErwE/U3QOsPkGd4IT9DFOPcw6QdyJc4ZSi4vSzjK', 'Nadher', 55840111, 'Tozeur');

-- --------------------------------------------------------

--
-- Table structure for table `hibernate_sequence`
--

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(2);

-- --------------------------------------------------------

--
-- Table structure for table `livre`
--

CREATE TABLE `livre` (
  `id` bigint(20) NOT NULL,
  `author` varchar(20) DEFAULT NULL,
  `categories` varchar(50) DEFAULT NULL,
  `nbr_availability` int(11) DEFAULT NULL,
  `photo` varchar(1000) DEFAULT NULL,
  `synopsis` varchar(1000) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `livre`
--

INSERT INTO `livre` (`id`, `author`, `categories`, `nbr_availability`, `photo`, `synopsis`, `title`) VALUES
(1, 'Nadher', 'Programming', 50, '/images/book0.jpg', 'spring-boot', 'Spring Boot'),
(2, 'MonogoliaAuthor', 'Ctagory 1', 20, '/images/book1.jpg', 'Monogolia', 'Monogolia'),
(3, 'BiocharRevolution', 'Biochar', 35, '/images/book2.jpg', 'BiocharRevolution', 'The Biochar Revolution');

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `id` bigint(20) NOT NULL,
  `date_reservation` date DEFAULT NULL,
  `emprunteur_id` bigint(20) NOT NULL,
  `livre_id` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`id`, `date_reservation`, `emprunteur_id`, `livre_id`) VALUES
(1, '2022-01-07', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'ROLE_ADMIN');

-- --------------------------------------------------------

--
-- Table structure for table `users_roles`
--

CREATE TABLE `users_roles` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users_roles`
--

INSERT INTO `users_roles` (`user_id`, `role_id`) VALUES
(1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `commentaire`
--
ALTER TABLE `commentaire`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKsl4wipcpy7epf3ib0ky13rut6` (`emprunteur_id`),
  ADD KEY `FKhc0xgqkaaed0obpinds8kb5md` (`livre_id`);

--
-- Indexes for table `emprunt`
--
ALTER TABLE `emprunt`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKopcrsgar1t252ct8t0pca7vug` (`emprunteur_id`),
  ADD KEY `FKjnn7ll8vl64xhmb6779svt7c` (`livre_id`);

--
-- Indexes for table `emprunteur`
--
ALTER TABLE `emprunteur`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_7eworj4htxfki1ox95j5h5une` (`email`) USING HASH;

--
-- Indexes for table `livre`
--
ALTER TABLE `livre`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK3uvdutswl1621uup1eyyfwv01` (`emprunteur_id`),
  ADD KEY `FKbtwk47ayb3rwdyr6uqp7dsgr2` (`livre_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_roles`
--
ALTER TABLE `users_roles`
  ADD KEY `FKt4v0rrweyk393bdgt107vdx0x` (`role_id`),
  ADD KEY `FKhu46o0tv2nqi3a90p1e453kgx` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `commentaire`
--
ALTER TABLE `commentaire`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `emprunt`
--
ALTER TABLE `emprunt`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `emprunteur`
--
ALTER TABLE `emprunteur`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `livre`
--
ALTER TABLE `livre`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;
CREATE TABLE `autori` (
  `idAutor` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `numeAutor` varchar(255) NOT NULL
);

INSERT INTO `autori` (`idAutor`, `numeAutor`) VALUES
(1, 'Ion Creanga'),
(2, 'Walter Scott'),
(3, 'Mihai Eminescu'),
(4, 'George Bacovia'),
(5, 'William Shakespeare'),
(6, 'Agatha Christie'),
(7, 'Jules Verne');

CREATE TABLE `edituri` (
  `idEditura` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `numeEditura` varchar(255) NOT NULL
);

INSERT INTO `edituri` (`idEditura`, `numeEditura`) VALUES
(1, 'Litera'),
(2, 'CARTEA ROMANEASCA'),
(3, 'MONDORO'),
(4, 'RAO'),
(5, 'PENGUIN BOOKS'),
(6, 'Paralela 45'),
(7, 'CASA EDITORIALA DEMIURG PLUS');

CREATE TABLE `carti` (
  `idCarte` int(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `titluCarte` varchar(255) NOT NULL,
  `idAutor` mediumint(8) UNSIGNED NOT NULL,
  `nrPagini` smallint(5) UNSIGNED DEFAULT NULL,
  `ISBN` varchar(17) NOT NULL,
  `anPublicare` year(4) DEFAULT NULL,
  `idEditura` smallint(5) UNSIGNED NOT NULL,
  `stoc` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `refExterna` varchar(255) DEFAULT NULL,
  UNIQUE KEY `isbnUnic` (`ISBN`),
  FOREIGN KEY (`idAutor`) REFERENCES `autori` (`idAutor`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`idEditura`) REFERENCES `edituri` (`idEditura`) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO `carti` (`idCarte`, `titluCarte`, `idAutor`, `nrPagini`, `ISBN`, `anPublicare`, `idEditura`, `stoc`, `refExterna`) VALUES
(1, 'Amintiri din copilarie', 1, 48, '978-9975-74-380-8', 2014, 1, 5, NULL),
(2, 'Steaua Sudului', 7, 239, '978-973-23-3185-9', 2017, 2, 2, NULL),
(3, 'Sarpele de mare', 7, 199, '978-973-23-3184-2', 2017, 2, 1, NULL),
(4, '20.000 de leghe sub mari', 7, 300, '978-606-695-008-4', 2014, 3, 9, NULL),
(5, 'Crima din Orient Express', 6, 247, '978-606-609-620-1', 2017, 4, 20, NULL),
(6, 'Poirot investigheaza', 6, 217, '978-606-609-277-7', 2012, 4, 1, NULL),
(7, 'Journey to the Centre of the Earth', 7, 254, '978-0-14-062425-0', 1994, 5, 15, NULL),
(8, 'Cele mai frumoase povesti si povestiri', 1, 211, '978-973-47-2074-3', 2015, 6, 64, NULL),
(9, 'Poezii', 3, 382, '978-606-8395-85-2', 2014, 3, 32, NULL),
(10, 'Hamlet', 5, 228, '978-973-152-006-3', 2007, 7, 13, NULL);

CREATE TABLE `tipuriUtilizatori` (
  `idTipUtilizator` tinyint(3) UNSIGNED NOT NULL,
  `numeTip` varchar(255) NOT NULL
);

INSERT INTO `tipuriUtilizatori` (`idTipUtilizator`, `numeTip`) VALUES
(1, 'Necunoscut'),
(2, 'Bibliotecar'),
(3, 'Student');

CREATE TABLE `utilizatori` (
  `idUtilizator` int(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  `numeUtilizator` varchar(255) NOT NULL, 
  `idTipUtilizator` tinyint(3) UNSIGNED NOT NULL
);

INSERT INTO `utilizatori` (`idUtilizator`, `numeUtilizator`, `idTipUtilizator`) VALUES
(1, 'Xulescu', 3),
(2, 'Ygrec', 3),
(3, 'Zet', 0),
(4, 'Q', 2);

CREATE TABLE `imprumuturi` (
  `idUtilizator` int(10) UNSIGNED NOT NULL,
  `idCarte` int(10) UNSIGNED NOT NULL,
  UNIQUE (`idUtilizator`,`idCarte`),
  FOREIGN KEY (`idUtilizator`) REFERENCES `utilizatori` (`idUtilizator`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`idCarte`) REFERENCES `carti` (`idCarte`) ON DELETE CASCADE ON UPDATE CASCADE
) ;

INSERT INTO `imprumuturi` (`idUtilizator`, `idCarte`) VALUES
(2, 3),
(3, 4),
(1, 5);




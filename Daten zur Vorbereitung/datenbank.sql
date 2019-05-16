-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 11. Jan 2019 um 15:53
-- Server-Version: 10.1.37-MariaDB
-- PHP-Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `sozial`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `antrag`
--

CREATE TABLE `antrag` (
  `ID` bigint(20) NOT NULL,
  `name_ID` bigint(20) NOT NULL,
  `frage_ID_start` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `antwort`
--

CREATE TABLE `antwort` (
  `ID` bigint(20) NOT NULL,
  `person_ID` bigint(20) NOT NULL,
  `frage_ID` bigint(20) NOT NULL,
  `sprache_ID` bigint(20) NOT NULL,
  `zeitstempel` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `antwort_text_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `antwort_auswahl`
--

CREATE TABLE `antwort_auswahl` (
  `antwort_ID` bigint(20) NOT NULL,
  `frage_ID` bigint(20) NOT NULL,
  `antwort_text_ID` bigint(20) NOT NULL,
  `frage_ID_naechste` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

--
-- Daten für Tabelle `antwort_auswahl`
--

INSERT INTO `antwort_auswahl` (`antwort_ID`, `frage_ID`, `antwort_text_ID`, `frage_ID_naechste`) VALUES
(1, 1, 2, 2),
(1, 4, 101, 5),
(1, 12, 15, 18),
(1, 18, 23, 19),
(1, 19, 26, 22),
(1, 22, 33, NULL),
(1, 23, 45, 25),
(1, 25, 49, 26),
(1, 27, 56, 28),
(1, 28, 23, 29),
(1, 29, 61, 30),
(1, 30, 23, 31),
(1, 31, 65, 32),
(1, 34, 23, 35),
(1, 35, 72, NULL),
(2, 1, 3, 2),
(2, 4, 102, 5),
(2, 12, 16, 13),
(2, 18, 24, 19),
(2, 19, 27, 22),
(2, 22, 34, NULL),
(2, 23, 46, 24),
(2, 25, 50, 26),
(2, 27, 57, 28),
(2, 28, 24, 29),
(2, 29, 62, 30),
(2, 30, 24, 41),
(2, 31, 66, 32),
(2, 34, 24, 41),
(2, 35, 73, NULL),
(3, 19, 28, 22),
(3, 22, 35, NULL),
(3, 25, 51, 26),
(3, 27, 58, 28),
(3, 31, 67, 32),
(3, 35, 74, NULL),
(4, 19, 29, 20),
(4, 22, 36, NULL),
(4, 25, 52, 26),
(4, 35, 75, NULL),
(5, 19, 30, 21),
(5, 22, 37, NULL),
(5, 25, 53, 26),
(5, 35, 76, NULL),
(6, 22, 38, NULL),
(7, 22, 39, NULL),
(8, 22, 40, NULL),
(9, 22, 41, NULL),
(10, 22, 42, NULL),
(11, 22, 43, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `antwort_n_m`
--

CREATE TABLE `antwort_n_m` (
  `ID` bigint(20) NOT NULL,
  `frage_ID` bigint(20) NOT NULL,
  `regel` varchar(2000) COLLATE latin1_german1_ci NOT NULL,
  `frage_ID_naechste` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

--
-- Daten für Tabelle `antwort_n_m`
--

INSERT INTO `antwort_n_m` (`ID`, `frage_ID`, `regel`, `frage_ID_naechste`) VALUES
(1, 22, 'DEFAULT', 23),
(3, 35, 'F35A1', 36),
(4, 35, 'F35A1 && (! F35A1)', 37),
(5, 35, 'F35A3 && (! F35A2) && (! F35A1)', 38),
(6, 35, 'F35A4 && (! F35A3) && (! F35A2) && (! F35A1) ', 39),
(7, 35, 'F35A5 && (! F35A4) && (! F35A3) && (! F35A2) && (! F35A1) ', 40);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `antwort_typ`
--

CREATE TABLE `antwort_typ` (
  `ID` bigint(20) NOT NULL,
  `antwort_typ` varchar(50) COLLATE latin1_german1_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

--
-- Daten für Tabelle `antwort_typ`
--

INSERT INTO `antwort_typ` (`ID`, `antwort_typ`) VALUES
(1, '1:N-Auswahl'),
(2, 'N:M-Auswahl'),
(3, 'Ganzzahl'),
(4, 'Festkommazahl mit 2 Stellen'),
(5, 'Datum'),
(6, 'Freitext');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `antwort_zahl`
--

CREATE TABLE `antwort_zahl` (
  `ID` bigint(20) NOT NULL,
  `frage_ID` bigint(20) NOT NULL,
  `regel` varchar(300) COLLATE latin1_german1_ci NOT NULL,
  `frage_ID_naechste` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

--
-- Daten für Tabelle `antwort_zahl`
--

INSERT INTO `antwort_zahl` (`ID`, `frage_ID`, `regel`, `frage_ID_naechste`) VALUES
(1, 2, 'DEFAULT', 3),
(2, 3, 'DEFAULT', 4),
(3, 5, 'DEFAULT', 6),
(4, 6, 'DEFAULT', 7),
(5, 7, 'DEFAULT', 8),
(6, 8, 'DEFAULT', 9),
(7, 9, 'DEFAULT', 10),
(8, 10, 'DEFAULT', 11),
(9, 11, 'DEFAULT', 12),
(10, 13, 'DEFAULT', 14),
(11, 14, 'DEFAULT', 15),
(12, 15, 'DEFAULT', 16),
(13, 16, 'DEFAULT', 17),
(14, 17, 'DEFAULT', 18),
(15, 24, 'DEFAULT', 30),
(16, 26, 'DEFAULT', 27),
(17, 32, 'DEFAULT', 33),
(18, 33, 'DEFAULT', 34),
(19, 36, 'F35A2', 37),
(21, 36, 'F35A3 && (! F35A2) ', 38),
(22, 36, 'F35A4 && (! F35A3) && (! F35A2)', 39),
(23, 36, 'F35A5 && (! F35A4) && (! F35A3) && (! F35A2)', 40),
(24, 36, '! (F35A5 || F35A4 || F35A3 || F35A2) ', 41),
(25, 37, 'F35A3', 38),
(26, 37, 'F35A4 && (! F35A3) ', 39),
(27, 37, 'F35A5 && (! F35A4) && (! F35A3)', 40),
(28, 37, '! (F35A5 || F35A4 || F35A3)', 41),
(29, 38, 'F35A4', 39),
(30, 38, 'F35A5 && (! F35A4)', 40),
(31, 38, '! (F35A4 || F35A5)', 41),
(32, 39, 'F35A5', 40),
(33, 39, '! F35A5', 41),
(34, 40, 'DEFAULT', 41);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `frage`
--

CREATE TABLE `frage` (
  `ID` bigint(20) NOT NULL,
  `frage_text_ID` bigint(20) NOT NULL,
  `antwort_typ_ID` bigint(20) NOT NULL,
  `untergrenze` decimal(10,2) NOT NULL,
  `obergrenze` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

--
-- Daten für Tabelle `frage`
--

INSERT INTO `frage` (`ID`, `frage_text_ID`, `antwort_typ_ID`, `untergrenze`, `obergrenze`) VALUES
(1, 1, 1, '0.00', '0.00'),
(2, 4, 6, '0.00', '0.00'),
(3, 5, 6, '0.00', '0.00'),
(4, 6, 1, '0.00', '0.00'),
(5, 7, 5, '0.00', '0.00'),
(6, 8, 6, '0.00', '0.00'),
(7, 9, 3, '0.00', '0.00'),
(8, 10, 6, '0.00', '0.00'),
(9, 11, 6, '0.00', '0.00'),
(10, 12, 6, '0.00', '0.00'),
(11, 13, 6, '0.00', '0.00'),
(12, 14, 1, '0.00', '0.00'),
(13, 17, 6, '0.00', '0.00'),
(14, 18, 6, '0.00', '0.00'),
(15, 19, 3, '0.00', '0.00'),
(16, 20, 6, '0.00', '0.00'),
(17, 21, 6, '0.00', '0.00'),
(18, 22, 1, '0.00', '0.00'),
(19, 25, 1, '0.00', '0.00'),
(20, 31, 5, '0.00', '0.00'),
(21, 31, 5, '0.00', '0.00'),
(22, 32, 2, '0.00', '0.00'),
(23, 44, 1, '0.00', '0.00'),
(24, 47, 4, '0.00', '0.00'),
(25, 48, 1, '0.00', '0.00'),
(26, 54, 4, '0.00', '0.00'),
(27, 55, 1, '0.00', '0.00'),
(28, 59, 1, '0.00', '0.00'),
(29, 60, 1, '0.00', '0.00'),
(30, 63, 1, '0.00', '0.00'),
(31, 64, 1, '0.00', '0.00'),
(32, 68, 4, '0.00', '0.00'),
(33, 69, 4, '0.00', '0.00'),
(34, 70, 1, '0.00', '0.00'),
(35, 71, 2, '0.00', '0.00'),
(36, 77, 4, '0.00', '0.00'),
(37, 78, 4, '0.00', '0.00'),
(38, 79, 4, '0.00', '0.00'),
(39, 80, 4, '0.00', '0.00'),
(40, 81, 4, '0.00', '0.00'),
(41, 82, 1, '0.00', '0.00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `fragendopplung`
--

CREATE TABLE `fragendopplung` (
  `frage_ID_1` bigint(20) NOT NULL,
  `frage_ID_2` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `leistung`
--

CREATE TABLE `leistung` (
  `ID` bigint(20) NOT NULL,
  `name_ID` bigint(20) NOT NULL,
  `regel` varchar(300) COLLATE latin1_german1_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `person_erweiterungsdaten`
--

CREATE TABLE `person_erweiterungsdaten` (
  `person_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `person_grunddaten`
--

CREATE TABLE `person_grunddaten` (
  `ID` bigint(20) NOT NULL,
  `benutzername` varchar(100) COLLATE latin1_german1_ci NOT NULL,
  `kennwort` varchar(100) COLLATE latin1_german1_ci NOT NULL,
  `rechte` bigint(20) NOT NULL,
  `vorname` varchar(100) COLLATE latin1_german1_ci NOT NULL,
  `nachname` varchar(100) COLLATE latin1_german1_ci NOT NULL,
  `strasse` varchar(200) COLLATE latin1_german1_ci NOT NULL,
  `hausnummer` varchar(10) COLLATE latin1_german1_ci NOT NULL,
  `adresszusatz` varchar(200) COLLATE latin1_german1_ci NOT NULL,
  `plz` varchar(5) COLLATE latin1_german1_ci NOT NULL,
  `ort` varchar(200) COLLATE latin1_german1_ci NOT NULL,
  `geburtsdatum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `person_rechte`
--

CREATE TABLE `person_rechte` (
  `ID` bigint(20) NOT NULL,
  `recht` varchar(50) COLLATE latin1_german1_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

--
-- Daten für Tabelle `person_rechte`
--

INSERT INTO `person_rechte` (`ID`, `recht`) VALUES
(1, 'Administrator'),
(2, 'Editor'),
(3, 'Benutzer');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sprachen`
--

CREATE TABLE `sprachen` (
  `ID` bigint(20) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `sprachen`
--

INSERT INTO `sprachen` (`ID`, `name`) VALUES
(1, 'Deutsch'),
(2, 'Türkçe'),
(3, 'العربية');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sprache_deutsch`
--

CREATE TABLE `sprache_deutsch` (
  `ID` bigint(20) NOT NULL,
  `text` varchar(500) COLLATE latin1_german1_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

--
-- Daten für Tabelle `sprache_deutsch`
--

INSERT INTO `sprache_deutsch` (`ID`, `text`) VALUES
(1, 'Handelt es sich bei Ihrem Wohngeldantrag um einen Erstantrag oder einen Folgeantrag?'),
(2, 'Erstantrag'),
(3, 'Folgeantrag'),
(4, 'Vorname'),
(5, 'Nachname'),
(6, 'Geschlecht'),
(7, 'Geburtsdatum'),
(8, 'Adresse (Straße und Hausnummer, sowie ggf. Adresszusatz)'),
(9, 'Postleihzahl'),
(10, 'Ort'),
(11, 'Geburtsort (falls im Ausland, bitte Land mit angeben)'),
(12, 'Welchen Beruf/ welche Tätigkeit üben Sie aus?'),
(13, 'Email (freiwillig)'),
(14, 'Beantragen Sie Wohngeld für sich oder sind Sie gesetzlicher Betreuer und beantragen die Leistung für einen Klienten?'),
(15, 'Ich beantrage die Leistung für mich'),
(16, 'Ich bin gesetzlicher Betreuer'),
(17, 'Vorname und Name gesetzlicher Betreuer'),
(18, 'Adresse gesetzlicher Betreuer (Straße und Hausnummer, sowie ggf. Adresszusatz)'),
(19, 'PLZ gesetzlicher Betreuer'),
(20, 'Wohnort/ Arbeitsstätte gesetzlicher Betreuer'),
(21, 'Telefon gesetzlicher Betreuer'),
(22, 'Haben Sie einen weiteren Wohnsitz?'),
(23, 'Ja'),
(24, 'Nein'),
(25, 'Wie lautet Ihr Familienstand?'),
(26, 'Ledig'),
(27, 'Verheiratet'),
(28, 'In einer eingetragenen Lebenspartnerschaft'),
(29, 'Geschieden'),
(30, 'Getrennt lebend'),
(31, 'Seit'),
(32, 'Wie lautet Ihre berufliche Situation?'),
(33, 'Selbstständig'),
(34, 'Arbeitnehmer*in'),
(35, 'Auszubildende*r'),
(36, 'Rentner*in'),
(37, 'geringfügig Beschäftigte*r/ Minijobber*in'),
(38, 'Student*in'),
(39, 'Pensionär*in'),
(40, 'Beamte'),
(41, 'Zur Zeit arbeitslos'),
(42, 'Nicht arbeitslos gemeldet aber nicht berufstätig'),
(43, 'Im Freiwilligendienst/ Wehrdienst'),
(44, 'Wohnen Sie zur Miete oder in Wohneigentum?'),
(45, 'Ich wohne zur Miete'),
(46, 'Ich bin Eigentümer*in'),
(47, 'Wie wäre der Mietwert (monatliche Miete) einer vergleichbaren Wohnung?'),
(48, 'Wie lautet Ihre Wohnsituation?'),
(49, 'Ich bin Hauptmieter/ stehe als Hauptmieter im Mietvertrag'),
(50, 'Ich bin Untermieter'),
(51, 'Ich wohne in einem Heim/ einer Wohngruppe'),
(52, 'Ich bin sonstige*r Nutzungsberechtigte*r'),
(53, 'Ich bewohne Wohnraum im eigenen Haus, das mindestens drei Wohnungen hat'),
(54, 'Wieviel beträgt Ihre Miete inklusive Betriebskosten?'),
(55, 'Wie wird die Miete aktuell gezahlt?'),
(56, 'Voll'),
(57, 'Gar nicht'),
(58, 'In Teilbeträgen'),
(59, 'Bestehen Mietschulden?'),
(60, 'Wird sich Ihre Miete in den nächsten 12 Monaten erhöhen oder verringern?'),
(61, 'Ja, siehe Nachweis'),
(62, 'Nein, ist nicht bekannt'),
(63, 'Gibt es Untermieter oder Mitbewohner, von denen Sie Geld erhalten?'),
(64, 'Um was für ein Untermietverhältnis handelt es sich?'),
(65, 'Ich habe untervermietet'),
(66, 'Ich erhalte von Mitbewohnern Geld für Wohnraumüberlassung'),
(67, 'Beides'),
(68, 'Die Fläche des untervermieteten/ überlassenen Wohnraums beträgt:'),
(69, 'Wie viel Geld erhalten Sie für die Untervermietung/ Wohnraumüberlassung brutto pro Monat?'),
(70, 'Sind darin Nebenkosten, Heizungskosten, Energiekosten, Garagenkosten oder Mobilfunkkosten beinhaltet?'),
(71, 'Welche Kosten sind darin beinhaltet?'),
(72, 'Heizkosten'),
(73, 'Warmwasserkosten'),
(74, 'Strom- und Gaskosten'),
(75, 'Kosten für Garage/ Stellplatz'),
(76, 'Sonstige Nebenkosten (Telefon/ Internet)'),
(77, 'Wieviel von den Heizkosten werden denn brutto pro Monat von Untermietern/ Mitbewohnern übernommen?'),
(78, 'Wieviel von den Warmwasserkosten werden denn brutto pro Monat von Untermietern/ Mitbewohnern übernommen?'),
(79, 'Wieviel von den Strom- und Gaskosten werden denn brutto pro Monat von Untermietern/ Mitbewohnern übernommen?'),
(80, 'Wieviel von den Kosten für Garage/ Stellplatz werden denn brutto pro Monat von Untermietern/ Mitbewohnern übernommen?'),
(81, 'Wieviel von den sonstigen Nebenkosten (Telefon/ Internet) werden denn brutto pro Monat von Untermietern/ Mitbewohnern übernommen?'),
(82, 'Wohnen Sie mit oder ohne Partner*in?'),
(83, 'Mit Partner*in'),
(84, 'Ohne Partner*in'),
(85, 'Haben Sie Kinder unter 25 Jahren, die mit Ihnen zusammen leben?'),
(86, 'Wie viele Kinder leben denn in Ihrem Haushalt?'),
(87, 'Leben weitere Erwachsene in Ihrem Haushalt?'),
(88, 'Wie viele?'),
(89, 'Ist die Person mit Ihnen verwandt?'),
(90, 'Wie viele der weiteren erwachsenen Personen sind mit Ihnen verwandt?'),
(91, 'Vorname Partner*in'),
(92, 'Name Partner*in'),
(93, 'Geschlecht Partner*in'),
(94, 'Geburtsdatum Partner*in'),
(95, 'Geburtsort Partner*in (falls im Ausland: Bitte Land angeben)'),
(96, 'Welchen Beruf/ welche Tätigkeit übt Ihr*e Partner*in aus?'),
(97, 'Wohnen Sie seit mehr als einem Jahr zusammen?'),
(98, 'Vorname Kind'),
(99, 'Name Kind'),
(100, 'Geschlecht Kind'),
(101, 'Männlich'),
(102, 'Weiblich'),
(103, 'Geburtsdatum Kind'),
(104, 'Geburtsort Kind (falls im Ausland: Bitte Land angeben)'),
(105, 'Welchen Beruf/ welche Tätigkeit übt Ihr Kind aus?'),
(106, 'Ist es Ihr eigenes Kind, Adoptivkind oder Stiefkind?'),
(107, 'Vorname jüngstes Kind'),
(108, 'Name jüngstes Kind'),
(109, 'Geschlecht jüngstes Kind'),
(110, 'Geburtsdatum jüngstes Kind'),
(111, 'Geburtsort jüngstes Kind (falls im Ausland: Bitte Land angeben)'),
(112, 'Welchen Beruf/ welche Tätigkeit übt Ihr jüngstes Kind aus?'),
(113, 'Ist Ihr jüngstes Kind Ihr eigenes Kind, Adoptivkind oder Stiefkind?'),
(114, 'Vorname zweitjüngstes Kind'),
(115, 'Name zweitjüngstes Kind'),
(116, 'Geschlecht zweitjüngstes Kind'),
(117, 'Geburtsdatum zweitjüngstes Kind'),
(118, 'Geburtsort zweitjüngstes Kind (falls im Ausland: Bitte Land angeben)'),
(119, 'Welchen Beruf/ welche Tätigkeit übt Ihr zweitjüngstes Kind aus?'),
(120, 'Ist Ihr zweitjüngstes Kind Ihr eigenes Kind, Adoptivkind oder Stiefkind?'),
(121, 'Eigenes Kind'),
(122, 'Adoptivkind'),
(123, 'Stiefkind'),
(124, 'Vorname drittjüngstes Kind'),
(125, 'Name drittjüngstes Kind'),
(126, 'Geschlecht drittjüngstes Kind'),
(127, 'Geburtsdatum drittjüngstes Kind'),
(128, 'Geburtsort drittjüngstes Kind (falls im Ausland: Bitte Land angeben)'),
(129, 'Welchen Beruf/ welche Tätigkeit übt Ihr drittjüngstes Kind aus?'),
(130, 'Ist Ihr drittjüngstes Kind Ihr eigenes Kind, Adoptivkind oder Stiefkind?'),
(131, 'Vorname viertjüngstes Kind'),
(132, 'Name viertjüngstes Kind'),
(133, 'Geschlecht viertjüngstes Kind'),
(134, 'Geburtsdatum viertjüngstes Kind'),
(135, 'Geburtsort viertjüngstes Kind (falls im Ausland: Bitte Land angeben)'),
(136, 'Welchen Beruf/ welche Tätigkeit übt Ihr viertjüngstes Kind aus?'),
(137, 'Ist Ihr viertjüngstes Kind Ihr eigenes Kind, Adoptivkind oder Stiefkind?'),
(138, 'Vorname fünftjüngstes Kind'),
(139, 'Name fünftjüngstes Kind'),
(140, 'Geschlecht fünftjüngstes Kind'),
(141, 'Geburtsdatum fünftjüngstes Kind'),
(142, 'Geburtsort fünftjüngstes Kind (falls im Ausland: Bitte Land angeben)'),
(143, 'Welchen Beruf/ welche Tätigkeit übt Ihr fünftjüngstes Kind aus?'),
(144, 'Ist Ihr fünftjüngstes Kind Ihr eigenes Kind, Adoptivkind oder Stiefkind?'),
(145, 'Vorname sechstjüngstes Kind'),
(146, 'Name sechstjüngstes Kind'),
(147, 'Geschlecht sechstjüngstes Kind'),
(148, 'Geburtsdatum sechstjüngstes Kind'),
(149, 'Geburtsort sechstjüngstes Kind (falls im Ausland: Bitte Land angeben)'),
(150, 'Welchen Beruf/ welche Tätigkeit übt Ihr sechstjüngstes Kind aus?'),
(151, 'Ist Ihr sechstjüngstes Kind Ihr eigenes Kind, Adoptivkind oder Stiefkind?'),
(152, 'Vorname siebtjüngstes Kind'),
(153, 'Name siebtjüngstes Kind'),
(154, 'Geschlecht siebtjüngstes Kind'),
(155, 'Geburtsdatum siebtjüngstes Kind'),
(156, 'Geburtsort siebtjüngstes Kind (falls im Ausland: Bitte Land angeben)'),
(157, 'Welchen Beruf/ welche Tätigkeit übt Ihr siebtjüngstes Kind aus?'),
(158, 'Ist Ihr siebtjüngstes Kind Ihr eigenes Kind, Adoptivkind oder Stiefkind?'),
(159, 'Vorname achtjüngstes Kind'),
(160, 'Name achtjüngstes Kind'),
(161, 'Geschlecht achtjüngstes Kind'),
(162, 'Geburtsdatum achtjüngstes Kind'),
(163, 'Geburtsort achtjüngstes Kind (falls im Ausland: Bitte Land angeben)'),
(164, 'Welchen Beruf/ welche Tätigkeit übt Ihr achtjüngstes Kind aus?'),
(165, 'Ist Ihr achtjüngstes Kind Ihr eigenes Kind, Adoptivkind oder Stiefkind?'),
(166, 'Vorname neuntjüngstes Kind'),
(167, 'Name neuntjüngstes Kind'),
(168, 'Geschlecht neuntjüngstes Kind'),
(169, 'Geburtsdatum neuntjüngstes Kind'),
(170, 'Geburtsort neuntjüngstes Kind (falls im Ausland: Bitte Land angeben)'),
(171, 'Welchen Beruf/ welche Tätigkeit übt Ihr neuntjüngstes Kind aus?'),
(172, 'Ist Ihr neuntjüngstes Kind Ihr eigenes Kind, Adoptivkind oder Stiefkind?'),
(173, 'Vorname zehntjüngstes Kind'),
(174, 'Name zehntjüngstes Kind'),
(175, 'Geschlecht zehntjüngstes Kind'),
(176, 'Geburtsdatum zehntjüngstes Kind'),
(177, 'Geburtsort zehntjüngstes Kind (falls im Ausland: Bitte Land angeben)'),
(178, 'Welchen Beruf/ welche Tätigkeit übt Ihr zehntjüngstes Kind aus?'),
(179, 'Vorname weitere verwandte erwachsene Person im Haushalt'),
(180, 'Name weitere verwandte erwachsene Person im Haushalt'),
(181, 'Geschlecht weitere verwandte erwachsene Person im Haushalt'),
(182, 'Geburtsdatum weitere verwandte erwachsene Person im Haushalt'),
(183, 'Geburtsort weitere verwandte erwachsene Person im Haushalt (falls im Ausland: Bitte Land angeben)'),
(184, 'Welchen Beruf/ welche Tätigkeit übt die weitere verwandte erwachsene Person aus?'),
(185, 'In welchem Verwandtschaftsverhältnis stehen Sie zu der weiteren verwandten erwachsenen Person?'),
(186, 'Es ist ein Elternteil'),
(187, 'Die Person ist ein Schwiegerelternteil'),
(188, 'Die Person ist ein*e Schwester/ Bruder'),
(189, 'Die Person ist ein*e Schwäger*in'),
(190, 'Die Person ist ein*e Tante/ Onkel'),
(191, 'Die Person ist ein*e Cousin*e'),
(192, 'Vorname zweite weitere verwandte erwachsene Person im Haushalt'),
(193, 'Name zweite weitere verwandte erwachsene Person im Haushalt'),
(194, 'Geschlecht zweite weitere verwandte erwachsene Person im Haushalt'),
(195, 'Geburtsdatum zweite weitere verwandte erwachsene Person im Haushalt'),
(196, 'Geburtsort zweite weitere verwandte erwachsene Person im Haushalt (falls im Ausland: Bitte Land angeben)'),
(197, 'Welchen Beruf/ welche Tätigkeit übt die zweite weitere verwandte erwachsene Person aus?'),
(198, 'In welchem Verwandtschaftsverhältnis stehen Sie zu der zweiten weiteren verwandten erwachsenen Person?'),
(199, 'Vorname dritte weitere verwandte erwachsene Person im Haushalt'),
(200, 'Name dritte weitere verwandte erwachsene Person im Haushalt'),
(201, 'Geschlecht dritte weitere verwandte erwachsene Person im Haushalt'),
(202, 'Geburtsdatum dritte weitere verwandte erwachsene Person im Haushalt'),
(203, 'Geburtsort dritte weitere verwandte erwachsene Person im Haushalt (falls im Ausland: Bitte Land angeben)'),
(204, 'Welchen Beruf/ welche Tätigkeit übt die dritte weitere verwandte erwachsene Person aus?'),
(205, 'In welchem Verwandtschaftsverhältnis stehen Sie zu der dritten weiteren verwandten erwachsenen Person?'),
(206, 'Ist jemand in Ihrem Haushalt in den letzten 12 Monaten verstorben?'),
(207, 'Name verstorbene Person'),
(208, 'Vorname verstorbene Person'),
(209, 'Geburtsdatum verstorbene Person'),
(210, 'Sterbedatum'),
(211, 'Geburtsort verstorbene Person (falls im Ausland: Bitte Land angeben)'),
(212, 'Sind Sie nach dem Todesfall umgezogen?'),
(213, 'Hat der/die Verstorbene Sozialleistungen bezogen?'),
(214, 'Haben Sie nach dem Todesfall eine weitere Person in den Haushalt aufgenommen?'),
(215, 'Vorname der Person, die nach dem Sterbefall eingezogen ist'),
(216, 'Name der Person, die nach dem Sterbefall eingezogen ist'),
(217, 'Geburtsort der Person, die nach dem Sterbefall eingezogen ist (falls im Ausland: Bitte Land auch angeben)'),
(218, 'Einzugsdatum der Person, die nach dem Sterbefall eingezogen ist '),
(219, 'Bezieht jemand in Ihrem Haushalt Sozialleistungen?'),
(220, 'Beziehen Sie Sozialleistungen?'),
(221, 'Wer in Ihrem Haushalt bezieht Sozialleistungen?'),
(222, 'Ich'),
(223, 'Mein Partner*in'),
(224, 'Mein Kind'),
(225, 'Mein jüngstes Kind'),
(226, 'Mein zweitjüngstes Kind'),
(227, 'Mein drittjüngstes Kind'),
(228, 'Mein viertjüngstes Kind'),
(229, 'Mein fünftjüngstes Kind'),
(230, 'Mein sechstjüngstes Kind'),
(231, 'Mein siebtjüngstes Kind'),
(232, 'Mein achtjüngstes Kind'),
(233, 'Mein neuntjüngstes Kind'),
(234, 'Mein zehntjüngstes Kind'),
(235, 'Die erstgenannte weitere verwandte erwachsene Person'),
(236, 'Die zweitgenannte weitere verwandte erwachsene Person'),
(237, 'Die drittgenannte weitere verwandte erwachsene Person'),
(238, 'Wieviel beziehen Sie an Sozialleistungen?'),
(239, 'Wieviel bezieht Ihr*e Partner*in an Sozialleistungen?'),
(240, 'Wieviel bezieht Ihr Kind an Sozialleistungen?'),
(241, 'Wieviel bezieht Ihr jüngstes Kind an Sozialleistungen?'),
(242, 'Wieviel bezieht Ihr zweitjüngstes Kind an Sozialleistungen?'),
(243, 'Wieviel bezieht Ihr drittjüngstes Kind an Sozialleistungen?'),
(244, 'Wieviel bezieht Ihr viertjüngstes Kind an Sozialleistungen?'),
(245, 'Wieviel bezieht Ihr fünftjüngstes Kind an Sozialleistungen?'),
(246, 'Wieviel bezieht Ihr sechstjüngstes Kind an Sozialleistungen?'),
(247, 'Wieviel bezieht Ihr siebtjüngstes Kind an Sozialleistungen?'),
(248, 'Wieviel bezieht Ihr achtjüngstes Kind an Sozialleistungen?'),
(249, 'Wieviel bezieht Ihr neuntjüngstes Kind an Sozialleistungen?'),
(250, 'Wieviel bezieht Ihr zehntjüngstes Kind an Sozialleistungen?'),
(251, 'Wieviel bezieht die von Ihnen erstgenannte weitere verwandte erwachsene Person an Sozialleistungen?'),
(252, 'Wieviel bezieht die von Ihnen zweitgenannte weitere verwandte erwachsene Person an Sozialleistungen?'),
(253, 'Wieviel bezieht die von Ihnen drittgenannte weitere verwandte erwachsene Person an Sozialleistungen?'),
(254, 'Bezieht jemand in Ihrem Haushalt eine Rente?'),
(255, 'Beziehen Sie eine Rente?'),
(256, 'Wer in Ihrem Haushalt bezieht eine Rente?'),
(257, 'Wieviel beziehen Sie an Rente?'),
(258, 'Wieviel bezieht Ihr*e Partner*in an Rente?'),
(259, 'Wieviel bezieht Ihr Kind an Rente?'),
(260, 'Wieviel bezieht Ihr jüngstes Kind an Rente?'),
(261, 'Wieviel bezieht Ihr zweitjüngstes Kind an Rente?'),
(262, 'Wieviel bezieht Ihr drittjüngstes Kind an Rente?'),
(263, 'Wieviel bezieht Ihr viertjüngstes Kind an Rente?'),
(264, 'Wieviel bezieht Ihr fünftjüngstes Kind an Rente?'),
(265, 'Wieviel bezieht Ihr sechstjüngstes Kind an Rente?'),
(266, 'Wieviel bezieht Ihr siebtjüngstes Kind an Rente?'),
(267, 'Wieviel bezieht Ihr achtjüngstes Kind an Rente?'),
(268, 'Wieviel bezieht Ihr neuntjüngstes Kind an Rente?'),
(269, 'Wieviel bezieht Ihr zehntjüngstes Kind an Rente?'),
(270, 'Wieviel bezieht die von Ihnen erstgenannte weitere verwandte erwachsene Person an Rente?'),
(271, 'Wieviel bezieht die von Ihnen zweitgenannte weitere verwandte erwachsene Person an Rente?'),
(272, 'Wieviel bezieht die von Ihnen drittgenannte weitere verwandte erwachsene Person an Rente?'),
(273, 'Bezieht jemand in Ihrem Haushalt einen Arbeitslohn? (sozialversicherungspflichtig - falls nur Minijob: nicht angeben)'),
(274, 'Beziehen Sie einen Arbeitslohn? (sozialversicherungspflichtig - falls nur Minijob: nicht angeben)'),
(275, 'Wer in Ihrem Haushalt bezieht einen Arbeitslohn?'),
(276, 'Wieviel beziehen Sie an Arbeitslohn?'),
(277, 'Wieviel bezieht Ihr*e Partner*in an Arbeitslohn?'),
(278, 'Wieviel bezieht Ihr Kind an Arbeitslohn?'),
(279, 'Wieviel bezieht Ihr jüngstes Kind an Arbeitslohn?'),
(280, 'Wieviel bezieht Ihr zweitjüngstes Kind an Arbeitslohn?'),
(281, 'Wieviel bezieht Ihr drittjüngstes Kind an Arbeitslohn?'),
(282, 'Wieviel bezieht Ihr viertjüngstes Kind an Arbeitslohn?'),
(283, 'Wieviel bezieht Ihr fünftjüngstes Kind an Arbeitslohn?'),
(284, 'Wieviel bezieht Ihr sechstjüngstes Kind an Arbeitslohn?'),
(285, 'Wieviel bezieht Ihr siebtjüngstes Kind an Arbeitslohn?'),
(286, 'Wieviel bezieht Ihr achtjüngstes Kind an Arbeitslohn?'),
(287, 'Wieviel bezieht Ihr neuntjüngstes Kind an Arbeitslohn?'),
(288, 'Wieviel bezieht Ihr zehntjüngstes Kind an Arbeitslohn?'),
(289, 'Wieviel bezieht die von Ihnen erstgenannte weitere verwandte erwachsene Person an Arbeitslohn?'),
(290, 'Wieviel bezieht die von Ihnen zweitgenannte weitere verwandte erwachsene Person an Arbeitslohn?'),
(291, 'Wieviel bezieht die von Ihnen drittgenannte weitere verwandte erwachsene Person an Arbeitslohn?'),
(292, 'Hat jemand in Ihrem Haushalt einen Minijob?'),
(293, 'Haben Sie einen Minijob?'),
(294, 'Wer in Ihrem Haushalt hat einen Minijob?'),
(295, 'Wieviel beziehen Sie an Minijobgehalt?'),
(296, 'Wieviel bezieht Ihr*e Partner*in an Minijobgehalt?'),
(297, 'Wieviel bezieht Ihr Kind an Minijobgehalt?'),
(298, 'Wieviel bezieht Ihr jüngstes Kind an Minijobgehalt?'),
(299, 'Wieviel bezieht Ihr zweitjüngstes Kind an Minijobgehalt?'),
(300, 'Wieviel bezieht Ihr drittjüngstes Kind an Minijobgehalt?'),
(301, 'Wieviel bezieht Ihr viertjüngstes Kind an Minijobgehalt?'),
(302, 'Wieviel bezieht Ihr fünftjüngstes Kind an Minijobgehalt?'),
(303, 'Wieviel bezieht Ihr sechstjüngstes Kind an Minijobgehalt?'),
(304, 'Wieviel bezieht Ihr siebtjüngstes Kind an Minijobgehalt?'),
(305, 'Wieviel bezieht Ihr achtjüngstes Kind an Minijobgehalt?'),
(306, 'Wieviel bezieht Ihr neuntjüngstes Kind an Minijobgehalt?'),
(307, 'Wieviel bezieht Ihr zehntjüngstes Kind an Minijobgehalt?'),
(308, 'Wieviel bezieht die von Ihnen erstgenannte weitere verwandte erwachsene Person an Minijobgehalt?'),
(309, 'Wieviel bezieht die von Ihnen zweitgenannte weitere verwandte erwachsene Person an Minijobgehalt?'),
(310, 'Wieviel bezieht die von Ihnen drittgenannte weitere verwandte erwachsene Person an Minijobgehalt?'),
(311, 'Ist jemand in Ihrem Haushalt selbstständig oder freiberuflich tätig?'),
(312, 'Sind Sie selbstständig oder freiberuflich tätig?'),
(313, 'Wer in Ihrem Haushalt ist selbstständig oder freiberuflich tätig?'),
(314, 'Haben Sie ein Gewerbe oder sind Sie freiberuflich tätig oder beides?'),
(315, 'Gewerbe'),
(316, 'Freiberuflich tätig'),
(317, 'Wie hoch ist Ihr Gewinn aus Gewerbebetrieb?'),
(318, 'Wie hoch ist Ihr Gewinn aus freiberuflicher Tätigkeit?'),
(319, 'Hat Ihr*e Partner*in ein Gewerbe oder ist er/sie freiberuflich tätig oder beides?'),
(320, 'Wie hoch ist der Gewinn aus Gewerbebetrieb Ihrer Partnerin/ Ihres Partners?'),
(321, 'Wie hoch ist der Gewinn aus freiberuflicher Tätigkeit Ihrer Partnerin/ Ihres Partners?'),
(322, 'Hat Ihr Kind ein Gewerbe oder ist es freiberuflich tätig oder beides?'),
(323, 'Wie hoch ist der Gewinn aus Gewerbebetrieb Ihres Kindes?'),
(324, 'Wie hoch ist der Gewinn aus freiberuflicher Tätigkeit Ihres Kindes?'),
(325, 'Hat Ihr jüngstes Kind ein Gewerbe oder ist es freiberuflich tätig oder beides?'),
(326, 'Wie hoch ist der Gewinn aus Gewerbebetrieb Ihres jüngsten Kindes?'),
(327, 'Wie hoch ist der Gewinn aus freiberuflicher Tätigkeit Ihres jüngsten Kindes?'),
(328, 'Hat Ihr zweitjüngstes Kind ein Gewerbe oder ist es freiberuflich tätig oder beides?'),
(329, 'Wie hoch ist der Gewinn aus Gewerbebetrieb Ihres zweitjüngsten Kindes?'),
(330, 'Wie hoch ist der Gewinn aus freiberuflicher Tätigkeit Ihres zweitjüngsten Kindes?'),
(331, 'Hat Ihr drittjüngstes Kind ein Gewerbe oder ist es freiberuflich tätig oder beides?'),
(332, 'Wie hoch ist der Gewinn aus Gewerbebetrieb Ihres drittjüngsten Kindes?'),
(333, 'Wie hoch ist der Gewinn aus freiberuflicher Tätigkeit Ihres drittjüngsten Kindes?'),
(334, 'Hat Ihr viertjüngstes Kind ein Gewerbe oder ist es freiberuflich tätig oder beides?'),
(335, 'Wie hoch ist der Gewinn aus Gewerbebetrieb Ihres viertjüngsten Kindes?'),
(336, 'Wie hoch ist der Gewinn aus freiberuflicher Tätigkeit Ihres viertjüngsten Kindes?'),
(337, 'Hat Ihr fünftjüngstes Kind ein Gewerbe oder ist es freiberuflich tätig oder beides?'),
(338, 'Wie hoch ist der Gewinn aus Gewerbebetrieb Ihres fünftjüngsten Kindes?'),
(339, 'Wie hoch ist der Gewinn aus freiberuflicher Tätigkeit Ihres fünftjüngsten Kindes?'),
(340, 'Hat Ihr sechstjüngstes Kind ein Gewerbe oder ist es freiberuflich tätig oder beides?'),
(341, 'Wie hoch ist der Gewinn aus Gewerbebetrieb Ihres sechstjüngsten Kindes?'),
(342, 'Wie hoch ist der Gewinn aus freiberuflicher Tätigkeit Ihres sechstjüngsten Kindes?'),
(343, 'Hat Ihr siebtjüngstes Kind ein Gewerbe oder ist es freiberuflich tätig oder beides?'),
(344, 'Wie hoch ist der Gewinn aus Gewerbebetrieb Ihres siebtjüngsten Kindes?'),
(345, 'Wie hoch ist der Gewinn aus freiberuflicher Tätigkeit Ihres siebtjüngsten Kindes?'),
(346, 'Hat Ihr achtjüngstes Kind ein Gewerbe oder ist es freiberuflich tätig oder beides?'),
(347, 'Wie hoch ist der Gewinn aus Gewerbebetrieb Ihres achtjüngsten Kindes?'),
(348, 'Wie hoch ist der Gewinn aus freiberuflicher Tätigkeit Ihres achtjüngsten Kindes?'),
(349, 'Hat Ihr neuntjüngstes Kind ein Gewerbe oder ist es freiberuflich tätig oder beides?'),
(350, 'Wie hoch ist der Gewinn aus Gewerbebetrieb Ihres neuntjüngsten Kindes?'),
(351, 'Wie hoch ist der Gewinn aus freiberuflicher Tätigkeit Ihres neuntjüngsten Kindes?'),
(352, 'Hat Ihr zehntjüngstes Kind ein Gewerbe oder ist es freiberuflich tätig oder beides?'),
(353, 'Wie hoch ist der Gewinn aus Gewerbebetrieb Ihres zehntjüngsten Kindes?'),
(354, 'Wie hoch ist der Gewinn aus freiberuflicher Tätigkeit Ihres zehntjüngsten Kindes?'),
(355, 'Hat die von Ihnen erstgenannte weitere verwandte erwachsene Person ein Gewerbe oder ist sie freiberuflich tätig oder beides?'),
(356, 'Wie hoch ist der Gewinn aus Gewerbebetrieb der von Ihnen erstgenannten weiteren verwandten erwachsenen Person?'),
(357, 'Wie hoch ist der Gewinn aus freiberuflicher Tätigkeit der von Ihnen erstgenannten weiteren verwandten erwachsenen Person?'),
(358, 'Hat die von Ihnen zweitgenannte weitere verwandte erwachsene Person ein Gewerbe oder ist sie freiberuflich tätig oder beides?'),
(359, 'Wie hoch ist der Gewinn aus Gewerbebetrieb der von Ihnen zweitgenannten weiteren verwandten erwachsenen Person?'),
(360, 'Wie hoch ist der Gewinn aus freiberuflicher Tätigkeit der von Ihnen zweitgenannten weiteren verwandten erwachsenen Person?'),
(361, 'Hat jemand in Ihrem Haushalt Einkünfte aus Kapitalvermögen?'),
(362, 'Haben Sie Einkünfte aus Kapitalvermögen?'),
(363, 'Wer in Ihrem Haushalt hat Einkünfte aus Kapitalvermögen?'),
(364, 'Wieviel betragen Ihre Einkünfte aus Kapitalvermögen?'),
(365, 'Wieviel betragen die Einkünfte aus Kapitalvermögen von Ihrer Partnerin/ Ihrem Partner?'),
(366, 'Wieviel betragen die Einkünfte aus Kapitalvermögen von Ihrem Kind?'),
(367, 'Wieviel betragen die Einkünfte aus Kapitalvermögen von Ihrem jüngsten Kind?'),
(368, 'Wieviel betragen die Einkünfte aus Kapitalvermögen von Ihrem zweitjüngsten Kind?'),
(369, 'Wieviel betragen die Einkünfte aus Kapitalvermögen von Ihrem drittjüngsten Kind?'),
(370, 'Wieviel betragen die Einkünfte aus Kapitalvermögen von Ihrem viertjüngsten Kind?'),
(371, 'Wieviel betragen die Einkünfte aus Kapitalvermögen von Ihrem fünftjüngsten Kind?'),
(372, 'Wieviel betragen die Einkünfte aus Kapitalvermögen von Ihrem sechstjüngsten Kind?'),
(373, 'Wieviel betragen die Einkünfte aus Kapitalvermögen von Ihrem siebtjüngsten Kind?'),
(374, 'Wieviel betragen die Einkünfte aus Kapitalvermögen von Ihrem achtjüngsten Kind?'),
(375, 'Wieviel betragen die Einkünfte aus Kapitalvermögen von Ihrem neuntjüngsten Kind?'),
(376, 'Wieviel betragen die Einkünfte aus Kapitalvermögen von Ihrem zehntjüngsten Kind?'),
(377, 'Wieviel betragen die Einkünfte aus Kapitalvermögen von der von Ihnen erstgenannten weiteren verwandten erwachsenen Person?'),
(378, 'Wieviel betragen die Einkünfte aus Kapitalvermögen von der von Ihnen zweitgenannten weiteren verwandten erwachsenen Person?'),
(379, 'Wieviel betragen die Einkünfte aus Kapitalvermögen von der von Ihnen drittgenannten weiteren verwandten erwachsenen Person?'),
(380, 'Hat jemand in Ihrem Haushalt Einkünfte aus dem Ausland (Renten, Kapitaleinkünfte)?'),
(381, 'Haben Sie Einkünfte aus dem Ausland (Renten, Kapitaleinkünfte)?'),
(382, 'Wer in Ihrem Haushalt hat Einkünfte aus dem Ausland (Renten, Kapitaleinkünfte)?'),
(383, 'Wie hoch sind Ihre Einkünfte aus dem Ausland?'),
(384, 'Wie hoch sind die Einkünfte aus dem Ausland von Ihrer Partnerin/ Ihrem Partner?'),
(385, 'Wie hoch sind die Einkünfte aus dem Ausland von Ihrem Kind?'),
(386, 'Wie hoch sind die Einkünfte aus dem Ausland von Ihrem jüngsten Kind?'),
(387, 'Wie hoch sind die Einkünfte aus dem Ausland von Ihrem zweitjüngsten Kind?'),
(388, 'Wie hoch sind die Einkünfte aus dem Ausland von Ihrem drittjüngsten Kind?'),
(389, 'Wie hoch sind die Einkünfte aus dem Ausland von Ihrem viertjüngsten Kind?'),
(390, 'Wie hoch sind die Einkünfte aus dem Ausland von Ihrem fünftjüngsten Kind?'),
(391, 'Wie hoch sind die Einkünfte aus dem Ausland von Ihrem sechstjüngsten Kind?'),
(392, 'Wie hoch sind die Einkünfte aus dem Ausland von Ihrem siebtjüngsten Kind?'),
(393, 'Wie hoch sind die Einkünfte aus dem Ausland von Ihrem achtjüngsten Kind?'),
(394, 'Wie hoch sind die Einkünfte aus dem Ausland von Ihrem neuntjüngsten Kind?'),
(395, 'Wie hoch sind die Einkünfte aus dem Ausland von Ihrem zehntjüngsten Kind?'),
(396, 'Wie hoch sind die Einkünfte aus dem Ausland von der von Ihnen erstgenannten weiteren verwandten erwachsenen Person?'),
(397, 'Wie hoch sind die Einkünfte aus dem Ausland von der von Ihnen zweitgenannten weiteren verwandten erwachsenen Person?'),
(398, 'Wie hoch sind die Einkünfte aus dem Ausland von der von Ihnen drittgenannten weiteren verwandten erwachsenen Person?'),
(399, 'Bezieht jemand in Ihrem Haushalt Arbeitslosengeld I?'),
(400, 'Beziehen Sie Arbeitslosengeld I?'),
(401, 'Wer in Ihrem Haushalt bezieht Arbeitslosengeld I?'),
(402, 'Wie hoch ist Ihr Arbeitslosengeld I?'),
(403, 'Wie hoch ist das Arbeitslosengeld I von Ihrer Partnerin/ Ihrem Partner?'),
(404, 'Wie hoch ist das Arbeitslosengeld I von Ihrem Kind?'),
(405, 'Wie hoch ist das Arbeitslosengeld I von Ihrem jüngsten Kind?'),
(406, 'Wie hoch ist das Arbeitslosengeld I von Ihrem zweitjüngsten Kind?'),
(407, 'Wie hoch ist das Arbeitslosengeld I von Ihrem drittjüngsten Kind?'),
(408, 'Wie hoch ist das Arbeitslosengeld I von Ihrem viertjüngsten Kind?'),
(409, 'Wie hoch ist das Arbeitslosengeld I von Ihrem fünftjüngsten Kind?'),
(410, 'Wie hoch ist das Arbeitslosengeld I von Ihrem sechstjüngsten Kind?'),
(411, 'Wie hoch ist das Arbeitslosengeld I von Ihrem siebtjüngsten Kind?'),
(412, 'Wie hoch ist das Arbeitslosengeld I von Ihrem achtjüngsten Kind?'),
(413, 'Wie hoch ist das Arbeitslosengeld I von Ihrem neuntjüngsten Kind?'),
(414, 'Wie hoch ist das Arbeitslosengeld I von Ihrem zehntjüngsten Kind?'),
(415, 'Wie hoch ist das Arbeitslosengeld I der von Ihnen erstgenannten weiteren verwandten erwachsenen Person?'),
(416, 'Wie hoch ist das Arbeitslosengeld I der von Ihnen zweitgenannten weiteren verwandten erwachsenen Person?'),
(417, 'Wie hoch ist das Arbeitslosengeld I der von Ihnen drittgenannten weiteren verwandten erwachsenen Person?'),
(418, 'Bezieht jemand in Ihrem Haushalt Krankengeld/ Krankentagegeld/ Verletztengeld/ Krankengeld bei Erkrankung eines Kindes?'),
(419, 'Beziehen Sie Krankengeld/ Krankentagegeld/ Verletztengeld/ Krankengeld bei Erkrankung eines Kindes?'),
(420, 'Wer in Ihrem Haushalt bezieht Krankengeld/ Krankentagegeld/ Verletztengeld/ Krankengeld bei Erkrankung eines Kindes?'),
(421, 'Wieviel betragen Ihre Leistungen bei Krankheit?'),
(422, 'Wieviel betragen die Leistungen bei Krankheit von Ihrer Partnerin/ Ihrem Partner?'),
(423, 'Wieviel betragen die Leistungen bei Krankheit von Ihrem Kind?'),
(424, 'Wieviel betragen die Leistungen bei Krankheit von Ihrem jüngsten Kind?'),
(425, 'Wieviel betragen die Leistungen bei Krankheit von Ihrem zweitjüngsten Kind?'),
(426, 'Wieviel betragen die Leistungen bei Krankheit von Ihrem drittjüngsten Kind?'),
(427, 'Wieviel betragen die Leistungen bei Krankheit von Ihrem viertjüngsten Kind?'),
(428, 'Wieviel betragen die Leistungen bei Krankheit von Ihrem fünftjüngsten Kind?'),
(429, 'Wieviel betragen die Leistungen bei Krankheit von Ihrem sechstjüngsten Kind?'),
(430, 'Wieviel betragen die Leistungen bei Krankheit von Ihrem siebtjüngsten Kind?'),
(431, 'Wieviel betragen die Leistungen bei Krankheit von Ihrem achtjüngsten Kind?'),
(432, 'Wieviel betragen die Leistungen bei Krankheit von Ihrem neuntjüngsten Kind?'),
(433, 'Wieviel betragen die Leistungen bei Krankheit von Ihrem zehntjüngsten Kind?'),
(434, 'Wieviel betragen die Leistungen bei Krankheit der von Ihnen erstgenannten weiteren verwandten erwachsenen Person?'),
(435, 'Wieviel betragen die Leistungen bei Krankheit der von Ihnen zweitgenannten weiteren verwandten erwachsenen Person?'),
(436, 'Wieviel betragen die Leistungen bei Krankheit der von Ihnen drittgenannten weiteren verwandten erwachsenen Person?'),
(437, 'Bezieht jemand in Ihrem Haushalt Unterhalt oder Unterhaltsvorschuss?'),
(438, 'Beziehen Sie Unterhalt oder Unterhaltsvorschuss?'),
(439, 'Wer in Ihrem Haushalt bezieht Unterhalt oder Unterhaltsvorschuss?'),
(440, 'Wie hoch sind die von Ihnen bezogenen Unterhaltsleistungen?'),
(441, 'Wie hoch sind die von Ihrer Partnerin/ Ihrem Partner bezogenen Unterhaltsleistungen?'),
(442, 'Wie hoch sind die von Ihrem Kind bezogenen Unterhaltsleistungen?'),
(443, 'Wie hoch sind die von Ihrem jüngsten Kind bezogenen Unterhaltsleistungen?'),
(444, 'Wie hoch sind die von Ihrem zweitjüngsten Kind bezogenen Unterhaltsleistungen?'),
(445, 'Wie hoch sind die von Ihrem drittjüngsten Kind bezogenen Unterhaltsleistungen?'),
(446, 'Wie hoch sind die von Ihrem viertjüngsten Kind bezogenen Unterhaltsleistungen?'),
(447, 'Wie hoch sind die von Ihrem fünftjüngsten Kind bezogenen Unterhaltsleistungen?'),
(448, 'Wie hoch sind die von Ihrem sechstjüngsten Kind bezogenen Unterhaltsleistungen?'),
(449, 'Wie hoch sind die von Ihrem siebtjüngsten Kind bezogenen Unterhaltsleistungen?'),
(450, 'Wie hoch sind die von Ihrem achtjüngsten Kind bezogenen Unterhaltsleistungen?'),
(451, 'Wie hoch sind die von Ihrem neuntjüngsten Kind bezogenen Unterhaltsleistungen?'),
(452, 'Wie hoch sind die von Ihrem zehntjüngsten Kind bezogenen Unterhaltsleistungen?'),
(453, 'Wie hoch sind die von der von Ihnen erstgenannten weiteren verwandten erwachsenen Person bezogenen Unterhaltsleistungen?'),
(454, 'Wie hoch sind die von der von Ihnen zweitgenannten weiteren verwandten erwachsenen Person bezogenen Unterhaltsleistungen?'),
(455, 'Wie hoch sind die von der von Ihnen drittgenannten weiteren verwandten erwachsenen Person bezogenen Unterhaltsleistungen?'),
(456, 'Bezieht jemand in Ihrem Haushalt Elterngeld?'),
(457, 'Beziehen Sie Elterngeld?'),
(458, 'Wer in Ihrem Haushalt bezieht Elterngeld?'),
(459, 'Wieviel Elterngeld beziehen Sie?'),
(460, 'Wieviel Elterngeld bezieht Ihr*e Partner*in?'),
(461, 'Wieviel Elterngeld bezieht Ihr Kind?'),
(462, 'Wieviel Elterngeld bezieht Ihr jüngstes Kind?'),
(463, 'Wieviel Elterngeld bezieht Ihr zweitjüngstes Kind?'),
(464, 'Wieviel Elterngeld bezieht Ihr drittjüngstes Kind?'),
(465, 'Wieviel Elterngeld bezieht Ihr viertjüngstes Kind?'),
(466, 'Wieviel Elterngeld bezieht Ihr fünftjüngstes Kind?'),
(467, 'Wieviel Elterngeld bezieht Ihr sechstjüngstes Kind?'),
(468, 'Wieviel Elterngeld bezieht Ihr siebtjüngstes Kind?'),
(469, 'Wieviel Elterngeld bezieht Ihr achtjüngstes Kind?'),
(470, 'Wieviel Elterngeld bezieht Ihr neuntjüngstes Kind?'),
(471, 'Wieviel Elterngeld bezieht Ihr zehntjüngstes Kind?'),
(472, 'Wieviel Elterngeld bezieht die von Ihnen erstgenannte weitere verwandte erwachsene Person?'),
(473, 'Wieviel Elterngeld bezieht die von Ihnen zweitgenannte weitere verwandte erwachsene Person?'),
(474, 'Wieviel Elterngeld bezieht die von Ihnen drittgenannte weitere verwandte erwachsene Person?'),
(475, 'Bezieht jemand in Ihrem Haushalt Mutterschaftsgeld?'),
(476, 'Beziehen Sie Mutterschaftsgeld?'),
(477, 'Wer in Ihrem Haushalt bezieht Mutterschaftsgeld?'),
(478, 'Wieviel Mutterschaftsgeld beziehen Sie?'),
(479, 'Wieviel Mutterschaftsgeld bezieht Ihre Partnerin?'),
(480, 'Wieviel Mutterschaftsgeld bezieht Ihr Kind?'),
(481, 'Wieviel Mutterschaftsgeld bezieht Ihr jüngstes Kind?'),
(482, 'Wieviel Mutterschaftsgeld bezieht Ihr zweitjüngstes Kind?'),
(483, 'Wieviel Mutterschaftsgeld bezieht Ihr drittjüngstes Kind?'),
(484, 'Wieviel Mutterschaftsgeld bezieht Ihr viertjüngstes Kind?'),
(485, 'Wieviel Mutterschaftsgeld bezieht Ihr fünftjüngstes Kind?'),
(486, 'Wieviel Mutterschaftsgeld bezieht Ihr sechstjüngstes Kind?'),
(487, 'Wieviel Mutterschaftsgeld bezieht Ihr siebtjüngstes Kind?'),
(488, 'Wieviel Mutterschaftsgeld bezieht Ihr achtjüngstes Kind?'),
(489, 'Wieviel Mutterschaftsgeld bezieht Ihr neuntjüngstes Kind?'),
(490, 'Wieviel Mutterschaftsgeld bezieht Ihr zehntjüngstes Kind?'),
(491, 'Wieviel Mutterschaftsgeld bezieht die von Ihnen erstgenannte weitere verwandte erwachsene Person?'),
(492, 'Wieviel Mutterschaftsgeld bezieht die von Ihnen zweitgenannte weitere verwandte erwachsene Person?'),
(493, 'Wieviel Mutterschaftsgeld bezieht die von Ihnen drittgenannte weitere verwandte erwachsene Person?');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `antrag`
--
ALTER TABLE `antrag`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `frage_ID_start` (`frage_ID_start`),
  ADD KEY `name_ID` (`name_ID`);

--
-- Indizes für die Tabelle `antwort`
--
ALTER TABLE `antwort`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_person` (`person_ID`),
  ADD KEY `ID_frage` (`frage_ID`),
  ADD KEY `antworttext` (`antwort_text_ID`),
  ADD KEY `ID_sprache` (`sprache_ID`);

--
-- Indizes für die Tabelle `antwort_auswahl`
--
ALTER TABLE `antwort_auswahl`
  ADD PRIMARY KEY (`antwort_ID`,`frage_ID`),
  ADD KEY `antworttext` (`antwort_text_ID`),
  ADD KEY `ID_naechste_frage` (`frage_ID_naechste`),
  ADD KEY `ID_frage` (`frage_ID`);

--
-- Indizes für die Tabelle `antwort_n_m`
--
ALTER TABLE `antwort_n_m`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_naechste_frage` (`frage_ID_naechste`),
  ADD KEY `ID_frage` (`frage_ID`);

--
-- Indizes für die Tabelle `antwort_typ`
--
ALTER TABLE `antwort_typ`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `antwort_zahl`
--
ALTER TABLE `antwort_zahl`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_frage` (`frage_ID`),
  ADD KEY `ID_naechste_frage` (`frage_ID_naechste`);

--
-- Indizes für die Tabelle `frage`
--
ALTER TABLE `frage`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_antworttyp` (`antwort_typ_ID`),
  ADD KEY `text` (`frage_text_ID`);

--
-- Indizes für die Tabelle `fragendopplung`
--
ALTER TABLE `fragendopplung`
  ADD PRIMARY KEY (`frage_ID_1`,`frage_ID_2`),
  ADD KEY `frage_ID_2` (`frage_ID_2`);

--
-- Indizes für die Tabelle `leistung`
--
ALTER TABLE `leistung`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `name` (`name_ID`);

--
-- Indizes für die Tabelle `person_erweiterungsdaten`
--
ALTER TABLE `person_erweiterungsdaten`
  ADD PRIMARY KEY (`person_ID`);

--
-- Indizes für die Tabelle `person_grunddaten`
--
ALTER TABLE `person_grunddaten`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `rechte` (`rechte`);

--
-- Indizes für die Tabelle `person_rechte`
--
ALTER TABLE `person_rechte`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `sprachen`
--
ALTER TABLE `sprachen`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `sprache_deutsch`
--
ALTER TABLE `sprache_deutsch`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `antrag`
--
ALTER TABLE `antrag`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `antwort`
--
ALTER TABLE `antwort`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `antwort_n_m`
--
ALTER TABLE `antwort_n_m`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT für Tabelle `antwort_typ`
--
ALTER TABLE `antwort_typ`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `antwort_zahl`
--
ALTER TABLE `antwort_zahl`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT für Tabelle `frage`
--
ALTER TABLE `frage`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT für Tabelle `leistung`
--
ALTER TABLE `leistung`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `person_grunddaten`
--
ALTER TABLE `person_grunddaten`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `person_rechte`
--
ALTER TABLE `person_rechte`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `sprachen`
--
ALTER TABLE `sprachen`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `sprache_deutsch`
--
ALTER TABLE `sprache_deutsch`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=494;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `antrag`
--
ALTER TABLE `antrag`
  ADD CONSTRAINT `antrag_ibfk_1` FOREIGN KEY (`frage_ID_start`) REFERENCES `frage` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `antrag_ibfk_2` FOREIGN KEY (`name_ID`) REFERENCES `sprache_deutsch` (`ID`);

--
-- Constraints der Tabelle `antwort`
--
ALTER TABLE `antwort`
  ADD CONSTRAINT `antwort_ibfk_1` FOREIGN KEY (`person_ID`) REFERENCES `person_grunddaten` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `antwort_ibfk_2` FOREIGN KEY (`frage_ID`) REFERENCES `frage` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `antwort_ibfk_3` FOREIGN KEY (`sprache_ID`) REFERENCES `sprachen` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `antwort_ibfk_4` FOREIGN KEY (`antwort_text_ID`) REFERENCES `sprache_deutsch` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `antwort_auswahl`
--
ALTER TABLE `antwort_auswahl`
  ADD CONSTRAINT `antwort_auswahl_ibfk_1` FOREIGN KEY (`frage_ID`) REFERENCES `frage` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `antwort_auswahl_ibfk_2` FOREIGN KEY (`antwort_text_ID`) REFERENCES `sprache_deutsch` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `antwort_auswahl_ibfk_3` FOREIGN KEY (`frage_ID_naechste`) REFERENCES `frage` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `antwort_n_m`
--
ALTER TABLE `antwort_n_m`
  ADD CONSTRAINT `antwort_n_m_ibfk_1` FOREIGN KEY (`frage_ID`) REFERENCES `frage` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `antwort_n_m_ibfk_2` FOREIGN KEY (`frage_ID_naechste`) REFERENCES `frage` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `antwort_zahl`
--
ALTER TABLE `antwort_zahl`
  ADD CONSTRAINT `antwort_zahl_ibfk_1` FOREIGN KEY (`frage_ID`) REFERENCES `frage` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `antwort_zahl_ibfk_2` FOREIGN KEY (`frage_ID_naechste`) REFERENCES `frage` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `frage`
--
ALTER TABLE `frage`
  ADD CONSTRAINT `frage_ibfk_1` FOREIGN KEY (`frage_text_ID`) REFERENCES `sprache_deutsch` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `frage_ibfk_2` FOREIGN KEY (`antwort_typ_ID`) REFERENCES `antwort_typ` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `fragendopplung`
--
ALTER TABLE `fragendopplung`
  ADD CONSTRAINT `fragendopplung_ibfk_1` FOREIGN KEY (`frage_ID_1`) REFERENCES `frage` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fragendopplung_ibfk_2` FOREIGN KEY (`frage_ID_2`) REFERENCES `frage` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `leistung`
--
ALTER TABLE `leistung`
  ADD CONSTRAINT `leistung_ibfk_1` FOREIGN KEY (`name_ID`) REFERENCES `sprache_deutsch` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `person_grunddaten`
--
ALTER TABLE `person_grunddaten`
  ADD CONSTRAINT `person_grunddaten_ibfk_1` FOREIGN KEY (`rechte`) REFERENCES `person_rechte` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

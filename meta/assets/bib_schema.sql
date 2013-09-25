SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bib_schema`
--

CREATE DATABASE IF NOT EXISTS `bib_schema`;

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE IF NOT EXISTS `book` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT 'http://schema.org/Book',
  `creator` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `description` text,
  `about` text,
  `image` varchar(140) DEFAULT NULL,
  `articleBody` text NOT NULL COMMENT 'http://schema.org/Article',
  `articleSection` text NOT NULL COMMENT 'http://schema.org/Article',
  `publicationType` varchar(255) NOT NULL COMMENT 'http://schema.org/MedicalScholarlyArticle',
  `sameAs` varchar(255) NOT NULL,
  `isbn` varchar(40) NOT NULL,
  `genre` varchar(140) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `publisher` varchar(255) DEFAULT NULL,
  `dateCreated` varchar(255) DEFAULT NULL,
  `dateModified` varchar(255) DEFAULT NULL,
  `datePublished` varchar(255) DEFAULT NULL,
  `version` varchar(140) DEFAULT NULL,
  `bookFormat` varchar(140) DEFAULT NULL,
  `inLanguage` varchar(5) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  FULLTEXT KEY `search` (`name`,`creator`,`description`,`genre`,`keywords`,`dateCreated`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`id`, `name`, `creator`, `url`, `description`, `about`, `image`, `articleBody`, `articleSection`, `publicationType`, `sameAs`, `isbn`, `genre`, `keywords`, `publisher`, `dateCreated`, `dateModified`, `datePublished`, `version`, `bookFormat`, `inLanguage`) VALUES
(1, 'A Rancher''s Table', 'Laura Cameron', 'http://arc.lib.montana.edu/book/home-cooking-history-409/article-laura-cameron.html', 'An essay about Marilee Langohr, born in 1954, and raised on a large sheep ranch outside Bozeman written by Laura Cameron for Montana State University''s upper division history course, The History of Food in America (HSTA 409), in Spring 2012. ', 'mothers and grandmothers', 'http://arc.lib.montana.edu/book/home-cooking-history-409/img/laura-cameron.jpg', '<p>Marilee Langohr, born in 1954, was raised on a large sheep ranch outside Bozeman. During lambing season and shearing season, Marilee would help her mother and grandmother with the cooking and cleaning, and tend to the numerous ranch hands her parents employed.  For meals, her mother not only cooked for her family of five, but also for 12 to 30 ranch hands, depending on the season.  Lambing was time and labor intensive; the ranch needed up to 30 employees to make the season run smoothly.  Shearing season was a bit less intense, with around 12 hands.  During these times, everyone worked hard and most definitely worked up an appetite.  </p>\r\n	<p>For breakfast, Marilee and her mother cooked a standard farm breakfast of bacon, eggs, toast, and coffee.  Everyone would file in and grab a plate to load up for the day.  It was a quicker meal with less socializing because everyone was anxious to get outside and work.  Lunch was considered the most important meal of the day, and everyone would come in, take their boots off, sit around the table and rest for an hour or so.  They could expect to find a roast beef on the table with biscuits and gravy. Here, they would swap stories, laugh, tell jokes, or recall what the day has been like so far.</p>\r\n	<p>At the end of the day, you could expect everyone to come in, cold, wet, tired, and hungry, looking forward to a warm meal.  Marilee and her mother would cut up their farm-raised chickens, roast them in the oven, and serve them with mashed potatoes and gravy.</p>\r\n	<p>When she was a little girl, Marilee, her mother, and her grandmother would butcher the chickens that would supply the family for a whole year.  Once the chickens were killed (Marilee was happy to say she was not allowed to take on this task), her grandmother would dip them into hot water to prep them for feathering.  Marilee and her mother would pull off the feathers, lay the chicken on a cutting board, and begin sectioning it.  They worked like an assembly line, and Marilee''s task was to cut the thighs from the chicken.  Marilee recalled a time after she moved away to college when she bought a whole chicken to cook.  As she laid the chicken on the cutting board, it seemed like second nature to separate the thighs from the rest, but once that task was done, she was at a loss.  Her mother and grandmother were not there to complete the assembly line.  That summer, while Marilee was home during her break, they showed her how to cut up the entire chicken.</p>\r\n	<p>Celebrating birthdays always meant a homemade angel food cake.  Her mother would send her out to the chicken coop to gather a dozen eggs for the cake. If it was Marilee''s birthday, her mom would bring the cake over to the table with a beautifully dressed doll sitting in the unoccupied center of the cake.  Her dress would spill over the sides, making it look like multicolored lace frosting.  Marilee was the only girl in the family, and although she worked alongside her father and brothers, she sometimes got special treatment.	\r\n</p>\r\n', 'none', 'http://www.nlm.nih.gov/cgi/mesh/2013/MB_cgi?term=ESSAYS', 'http://arc.lib.montana.edu/book/home-cooking-history-409/article-laura-cameron.html', 'None', 'essay', 'Marilee Langohr, mother, grandmother, ranch hands', 'Montana State University Library', '2012-09-01T18:34Z', '2012-09-01T18:34Z', '2012-09-01T18:34Z', '1.0', 'EBook', 'en');

-- --------------------------------------------------------

--
-- Table structure for table `recipe`
--

CREATE TABLE IF NOT EXISTS `recipe` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT 'http://schema.org/Thing',
  `creator` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `description` text,
  `about` text,
  `image` varchar(150) DEFAULT NULL,
  `cookingMethod` text NOT NULL COMMENT 'http://schema.org/Recipe',
  `ingredients` text NOT NULL,
  `recipeInstructions` text NOT NULL,
  `cookTime` varchar(40) DEFAULT NULL COMMENT 'ISO 8601 duration format',
  `prepTime` varchar(40) DEFAULT NULL COMMENT 'ISO 8601 duration format',
  `totalTime` varchar(40) DEFAULT NULL COMMENT 'ISO 8601 duration format',
  `recipeCategory` varchar(255) NOT NULL,
  `recipeCuisine` varchar(140) DEFAULT NULL,
  `recipeYield` varchar(140) DEFAULT NULL,
  `sameAs` varchar(255) NOT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `publisher` varchar(255) DEFAULT NULL,
  `dateCreated` varchar(255) DEFAULT NULL,
  `dateModified` varchar(255) DEFAULT NULL,
  `datePublished` varchar(255) DEFAULT NULL,
  `inLanguage` varchar(5) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  FULLTEXT KEY `search` (`name`,`creator`,`description`,`recipeCuisine`,`keywords`,`dateCreated`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `recipe`
--

INSERT INTO `recipe` (`id`, `name`, `creator`, `url`, `description`, `about`, `image`, `cookingMethod`, `ingredients`, `recipeInstructions`, `cookTime`, `prepTime`, `totalTime`, `recipeCategory`, `recipeCuisine`, `recipeYield`, `sameAs`, `keywords`, `publisher`, `dateCreated`, `dateModified`, `datePublished`, `inLanguage`) VALUES
(1, 'Angel Food Cake', 'Laura Cameron', 'http://arc.lib.montana.edu/book/home-cooking-history-409/article-laura-cameron.html', 'Angel food cake recipe written by Laura Cameron for Montana State University''s upper division history course, The History of Food in America (HSTA 409), in Spring 2012.', 'cake', 'http://upload.wikimedia.org/wikipedia/commons/thumb/6/64/AngelFoodCake.jpg/200px-AngelFoodCake.jpg', 'bake', '18 egg whites, 2 t. cream of tartar, 1 pinch salt, 1 1/2 cups white sugar, 1 cup cake flour, 1/2 cup confectioners sugar, 1 t. vanilla extract', '<li>Preheat oven to 350 degrees</li>\r\n<li>Sift cake flour and confectioners sugar together 5 times. Set aside.</li>\r\n<li>In a large bowl whip egg whites with salt until foamy. Add cream of tartar and continue to beat until soft peaks form.  Gradually add sugar and continue to beat until very stiff. Add vanilla.</li>\r\n<li>Quickly fold in flour mixutre.</li> \r\n<li>Pour into a 10 inch tube pan.</li>\r\n<li>Bake for 45 minutes.</li>', 'PT45M', 'PT15M', 'PT60M', 'dessert', 'American', '8 to 10 servings', 'http://dbpedia.org/page/Angel_food_cake', 'cream of tartar, confectioners sugar, vanilla extract, egg whites, cup cake flour, cake flour', 'Montana State University Library', '2012-12-01T18:34Z', '2012-12-01T18:34Z', '2012-12-01T18:34Z', 'en');
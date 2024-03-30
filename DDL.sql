-- Using MySQL

CREATE DATABASE myDB;

USE myDB;

CREATE TABLE Book (
  book_id INT PRIMARY KEY,
  isbn10 VARCHAR(10) UNIQUE,
  isbn13 VARCHAR(13) UNIQUE,
  title VARCHAR(255) NOT NULL,
  author VARCHAR(255) NOT NULL,
  publication_date DATE,
  publisher VARCHAR(255),
  page_count INT,
  price DECIMAL(10,2),
  language VARCHAR(50),
  num_edition INT,
  format VARCHAR(355),
  synopsis TEXT,
  overview TEXT,
  dewey_decimal_classification DECIMAL(6,3)
);

CREATE TABLE Serie (
  serie_id INT PRIMARY KEY,
  serie_name VARCHAR(255) UNIQUE
);

CREATE TABLE Book_Serie (
  book_id INT,
  serie_id INT,
  num_in_serie INT,
  FOREIGN KEY (book_id) REFERENCES Book(book_id),
  FOREIGN KEY (serie_id) REFERENCES Serie(serie_id),
  UNIQUE(book_id, serie_id)
);

CREATE TABLE GenericBookProfile (
  profile_id INT AUTO_INCREMENT PRIMARY KEY,
  book_id INT NOT NULL,
  website_specific_info TEXT,
  comments TEXT,
  reviews TEXT,
  ratings DECIMAL(3, 2),
  genres TEXT,
  topics TEXT,
  keywords TEXT,
  related_works TEXT,
  related_authors TEXT,
  rankings TEXT,
  discussions TEXT,
  articles TEXT,
  prices TEXT,
  popularity_statistics TEXT,
  other_statistics TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (book_id) REFERENCES Book(book_id)
);


-- TODO: Do IS-A Hierarchy for Types of Books: Magasine, Short stories, Comic Book, Journal, Paper, Novel, etc...ABORT
-- TODO: Do IS-A Hierarchy for APIs of BooksProfiles: Goodreads,GoogleBooks, ISBNdb
-- TODO: Do IS-A Hierarchy for users: Authors, Publisher, Editor, Fan/Follower (depends on API), goodread user, google user, public commenter,


-- API:
-- Google Book API
-- Open Libary
-- ISBNDB


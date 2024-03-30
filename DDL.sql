-- Using MySQL

CREATE DATABASE myDB;

USE myDB;

CREATE TABLE Book (
  id INT AUTO_INCREMENT PRIMARY KEY,
  volume_id VARCHAR(255) UNIQUE,
  title VARCHAR(255) NOT NULL, -- GoogleBooksAPI
  author VARCHAR(255) NOT NULL, -- GoogleBooksAPI
  publisher VARCHAR(255), -- GoogleBooksAPI
  publication_date DATE, -- GoogleBooksAPI
  description TEXT, -- GoogleBooksAPI
  isbn10 VARCHAR(10) UNIQUE, -- GoogleBooksAPI
  isbn13 VARCHAR(13) UNIQUE, -- GoogleBooksAPI
  page_count INT, -- GoogleBooksAPI
  categories VARCHAR(255), -- GoogleBooksAPI
  language VARCHAR(255), -- GoogleBooksAPI
  dimensions VARCHAR(255). -- GoogleBooksAPI
  language VARCHAR(255), -- GoogleBooksAPI
  edition INT, -- GoogleBooksAPI
  format VARCHAR(255), -- GoogleBooksAPI
);

CREATE TABLE Serie (
  id INT AUTO_INCREMENT PRIMARY KEY,
  serie_id VARCHAR(255) UNIQUE -- GoogleBooksAPI
);

CREATE TABLE Book_Serie (
  book_id INT,
  serie_id INT,
  order_number INT, -- GoogleBooksAPI
  FOREIGN KEY(book_id) REFERENCES Book(id),
  FOREIGN KEY(serie_id) REFERENCES Serie(id).
  UNIQUE(book_id, serie_id, order_number)
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
  FOREIGN KEY (book_id) REFERENCES Book(id)
);


-- TODO: Do IS-A Hierarchy for Types of Books: Magasine, Short stories, Comic Book, Journal, Paper, Novel, etc...ABORT
-- TODO: Do IS-A Hierarchy for APIs of BooksProfiles: Goodreads,GoogleBooks, ISBNdb
-- TODO: Do IS-A Hierarchy for users: Authors, Publisher, Editor, Fan/Follower (depends on API), goodread user, google user, public commenter,


-- API:
-- Google Book API
-- Open Libary
-- ISBNDB


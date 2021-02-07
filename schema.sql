USE sdc;
CREATE TABLE products(
  id INT PRIMARY KEY NOT NULL,
  name VARCHAR(100) NOT NULL,
  slogan VARCHAR(200),
  description VARCHAR(1000),
  category VARCHAR(50),
  default_price INT
);
CREATE TABLE styles(
  id INT PRIMARY KEY NOT NULL,
  product_id INT NOT NULL,
  name VARCHAR(100),
  sale_price VARCHAR (10),
  original_price INT NOT NULL,
  default_style INT
);
CREATE TABLE characteristics(
  id INT NOT NULL,
  productId INT NOT NULL,
  name VARCHAR(500),
);
CREATE TABLE features(
  id INT PRIMARY KEY NOT NULL,
  product_id INT NOT NULL,
  feature VARCHAR(100),
  value VARCHAR(100)
);

CREATE TABLE photos(
  id INT,
  style_id INT,
  url VARCHAR(2000),
  thumbnail_url VARCHAR(2000)
);

CREATE TABLE reviews_photos(
  id INT NOT NULL,
  review_id INT NOT NULL,
  url VARCHAR(1000) NOT NULL
);

CREATE TABLE related(
  id INT PRIMARY KEY NOT NULL,
  product_id INT NOT NULL,
  related_product_id INT
);

CREATE TABLE skus(
  id INT PRIMARY KEY NOT NULL,
  style_id INT NOT NULL,
  size VARCHAR(12),
  quantity INT
);

LOAD DATA INFILE '../../abc/products.csv' INTO TABLE products FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

LOAD DATA INFILE '../../abc/characteristics.csv' INTO TABLE characteristics FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

LOAD DATA INFILE '../../abc/styles.csv' INTO TABLE styles FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;


LOAD DATA INFILE '../../abc/features.csv' INTO TABLE features FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

LOAD DATA INFILE '../../abc/reformatted_xaa.csv' INTO TABLE photos FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

LOAD DATA INFILE '../../abc/reviews_photos.csv' INTO TABLE reviews_photos FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

LOAD DATA INFILE '../../abc/related.csv' INTO TABLE related FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

LOAD DATA INFILE '../../abc/skus.csv' INTO TABLE skus FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

mysqlimport - u root - p --ignore-lines=1 --fields-terminated-by=, --lines-terminated-by=\n sdc ./products.csv
/ Users / jerrick_ravelo / Documents / HRATX53 / SDC / etc / my.cnf / etc / mysql / my.cnf / usr / local / mysql / etc / my.cnf ~ /.my.cnf

SELECT * FROM products LEFT OUTER JOIN related ON products.id=related.related_product_id WHERE related.product_id=56;



SELECT * FROM photos LEFT OUTER JOIN styles ON photos.style_id=styles.id WHERE styles.product_id=56;

Option Explicit

Public Sub updateCSVLine()
    Dim fName As String, fso As Object, fsoFile As Object, txt As Variant

    Set fso = CreateObject("Scripting.FileSystemObject")

    Set fsoFile = fso.OpenTextFile("/Users/jerrick_ravelo/Desktop/testFolder/photos.csv", 1)
    txt = fsoFile.ReadAll
    fsoFile.Close

    txt = Split(txt, vbNewLine)

    txt(2 - 1) = "48,12,"https://images.unsplash.com/photo-1490427712608-588e68359dbd?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80","https://images.unsplash.com/photo-1490427712608-588e68359dbd?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=300&q=80""

    Set fsoFile = fso.OpenTextFile("/Users/jerrick_ravelo/Desktop/testFolder/photos.csv, 48")
    fsoFile.Write Join(txt, vbNewLine)
    fsoFile.Close
End Sub
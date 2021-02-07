const mySQL = require("mysql");

var db = mySQL.createConnection({
  host: "3.137.219.216",
  user: "root",
  password: "Hotsauce1.",
  database: "sdc2",
});

db.connect((error) => {
  if (error) {
    console.log(error);
  } else {
    console.log("database connected!");
  }
});

var productQuery = function (product_id) {
  return new Promise((resolve, reject) => {
    db.query(
      "SELECT * FROM products WHERE id= ?",
      [product_id],
      (err, results) => {
        if (err) {
          reject(err.sqlMessage);
        } else {
          resolve(results);
        }
      }
    );
  });
};

var featuresQuery = function (product_id) {
  return new Promise((resolve, reject) => {
    db.query(
      "SELECT feature,value FROM features LEFT OUTER JOIN products ON products.id=features.product_id WHERE features.product_id= ?",
      [product_id],
      (err, results) => {
        if (err) {
          reject(err.sqlMessage);
        } else {
          resolve(results);
        }
      }
    );
  });
};

var getRelated = function (product_id) {
  return new Promise((resolve, reject) => {
    db.query(
      "SELECT related_product_id FROM related WHERE product_id= ?",
      [product_id],
      (err, results) => {
        if (err) {
          reject(err.sqlMessage);
        } else {
          resolve(results);
        }
      }
    );
  });
};

var stylesQuery = function (product_id) {
  return new Promise((resolve, reject) => {
    db.query(
      "SELECT * FROM styles WHERE product_id = ?",
      [product_id],
      (err, results) => {
        if (err) {
          reject(err.sqlMessage);
        } else {
          resolve(results);
        }
      }
    );
  });
};

var getPhotos = function (style_id) {
  return new Promise((resolve, reject) => {
    db.query(
      "SELECT url,thumbnail_url FROM photos WHERE style_id =?",
      [style_id],
      (err, results) => {
        if (err) {
          reject(err.sqlMessage);
        } else {
          resolve(results);
        }
      }
    );
  });
};

var getSkus = function (style_id) {
  return new Promise((resolve, reject) => {
    db.query(
      "SELECT size,quantity FROM skus WHERE style_id =?",
      [style_id],
      (err, results) => {
        if (err) {
          reject(err.sqlMessage);
        } else {
          resolve(results);
        }
      }
    );
  });
};

module.exports = {
  productQuery: productQuery,
  featuresQuery: featuresQuery,
  getRelated: getRelated,
  stylesQuery: stylesQuery,
  getPhotos: getPhotos,
  getSkus: getSkus,
};

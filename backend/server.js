require("dotenv").config();
const express = require("express");
const cors = require("cors");

const mysql = require("mysql2");

const app = express();
app.use(cors()); // Cross-Origin Resource Sharing 활성화
app.use(express.json()); // Body parsing middleware. JSON 페이로드 처리

// MySQL connection
const db = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASS,
  database: process.env.DB_NAME,
});

db.connect((err) => {
  if (err) throw err;
  console.log("MySQL Connected...");
});

// Logging
app.use((req, res, next) => {
  console.log(`${new Date().toISOString()} - ${req.method} ${req.url}`);
  next();
});

// server test
app.get("/", (req, res) => {
  res.send("Hello, World!");
  console.log("HELLO WORLD");
});

app.post("/signUp", (req, res) => {
  const { email, password } = req.body;
  const sql = "insert into user (email, password) values (?, ?)";
  db.query(sql, [email, password], (err, result) => {
    if (err) throw err;
    res.sendStatus("User SIGNED UP!");
  });
});

app.get("/getDB", (req, res) => {
  let sql = "select * from user";
  db.query(sql, (err, result) => {
    if (err) throw err;
    res.send(result);
  });
});

const PORT = process.env.PORT || 3000;

// Start server
app.listen(PORT, () => {
  console.log(`Server started on port ${PORT}`);
});

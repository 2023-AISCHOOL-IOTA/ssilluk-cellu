const mysql = require("mysql2");

// MySQL connection
// FIXME: 차후 DB 계정 수정해야 함
const pool = mysql.createPool({
  host: process.env.DB_HOST,
  port: process.env.DB_PORT,
  user: process.env.DB_USER,
  password: process.env.DB_PASS,
  database: process.env.DB_NAME,
});

// 연결 상태 확인
pool.getConnection((err, connection) => {
  if (err) {
    if (err.code === "PROTOCOL_CONNECTION_LOST") {
      console.error(`Database connection was closed.`);
    }
    if (err.code === "ER_CON_COUNT_ERROR") {
      console.error("Database has too many connections.");
    }
    if (err.code === "ECONNECREFUSED") {
      console.error("Database connection was refused.");
    }
  }
  if (connection) {
    console.log("**DB connection successful!**");
    // 연결 풀로 반환
    connection.release();
  }
  return;
});
module.exports = pool;

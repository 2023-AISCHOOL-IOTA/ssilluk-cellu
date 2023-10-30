// 사용자 모델
// bcrypt 사용
const pool = require("../utils/db");
const bcrypt = require("bcrypt");

class UserModel {
  // 회원 가입
  async createUser(userData) {
    const conn = await pool.getConnection();
    try {
      const hashedPassword = await bcrypt.hash(userData.password, 8);
      const [result] = await conn.query("INSERT INTO user SET ?", {
        ...userData,
        password: hashedPassword,
      });
      return result;
    } catch (err) {
      throw err;
    } finally {
      conn.release();
    }
  }

  // 사용자 정보 조회
  async findUserByEmail(email) {
    const conn = await pool.getConnection();
    try {
      const [rows] = await conn.query("SELECT * FROM user WHERE email = ?", [
        email,
      ]);
      // rows는 배열이므로, 해당 이메일을 가진 사용자가 있으면 rows[0]을 반환
      return rows.length > 0 ? rows[0] : null;
    } catch (err) {
      throw err;
    } finally {
      conn.release();
    }
  }

  // 사용자 정보 수정
  async updateUser(userEmail, updataData) {
    const conn = await pool.getConnection();
    try {
      const [result] = await conn.query("UPDATE user SET ? WHERE email = ?", [
        updataData,
        userEmail,
      ]);
      return result;
    } catch (err) {
      throw err;
    } finally {
      conn.release();
    }
  }
}

module.exports = new UserModel();

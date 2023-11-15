// NOTE: 데이터베이스의 사용자 정보 처리
const pool = require("../utils/db").promise(); // 프로미스 기반 pool 가져오기
// FIXME: 데이터베이스 관련 코드 수정해야 함
class UserModel {
  // 회원 가입
  async createUser(userData, isSocial = false) {
    const conn = await pool.getConnection();
    try {
      let hashedPassword = null;
      if (!isSocial && userData.password) {
        const [hash] = await conn.query("SELECT SHA2(?, 256) AS hash", [
          userData.password,
        ]);
        hashedPassword = hash[0].hash;
      }
      const [result] = await conn.query("INSERT INTO user SET ?", {
        ...userData,
        password: hashedPassword,
        socialLoginType: isSocial ? userData.socialLoginType : null,
      });
      return result;
    } catch (err) {
      throw err;
    } finally {
      if (conn) conn.release();
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
      if (conn) conn.release();
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
      if (conn) conn.release();
    }
  }

  // 사용자 정보 삭제
  async deleteUser(userEmail) {
    const conn = await pool.getConnection();
    try {
      const [result] = await conn.query("DELETE FROM user WHERE email = ?", [
        userEmail,
      ]);
      return result;
    } catch (err) {
      throw err;
    } finally {
      if (conn) conn.release();
    }
  }

  // 보호자 전화번호 조회
  async getGuardianPhoneNumber(userEmail) {
    const conn = await pool.getConnection();
    try {
      const [rows] = await conn.query(
        "SELECT guardian_phone FROM users WHERE email = ?",
        [userEmail]
      );
      if (rows.length > 0) {
        return rows[0].guardian_phone;
      } else {
        throw new Error("보호자 전화번호가 등록되지 않았습니다.");
      }
    } catch (err) {
      throw err;
    } finally {
      if (conn) conn.release();
    }
  }

  // SHA2 해시를 사용하여 비밀번호 확인
  async checkPassword(email, password) {
    const conn = await pool.getConnection();
    try {
      const [hashed] = await conn.query(
        "SELECT password FROM user WHERE email = ?",
        [email]
      );
      if (hashed.length === 0) {
        return false;
      }

      const [hash] = await conn.query("SELECT SHA2(?, 256) AS hash", [
        password,
      ]);
      return hashed[0].password === hash[0].hash;
    } catch (err) {
      throw err;
    } finally {
      if (conn) conn.release();
    }
  }
}

module.exports = new UserModel();

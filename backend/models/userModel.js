// NOTE: 데이터베이스의 사용자, 보호자 정보 처리
const pool = require("../utils/db").promise(); // 프로미스 기반 pool 가져오기
// FIXME: 데이터베이스 관련 코드 수정해야 함
class UserModel {
  // 회원 가입
  async createUser(userData, isSocial = false) {
    const conn = await pool.getConnection();
    try {
      let hashedPassword = null;
      if (!isSocial && userData.password) {
        const [hashed] = await conn.query("SELECT SHA2(?, 256) AS hash", [
          userData.password,
        ]);
        hashedPassword = hashed[0].hash;
      }
      const [result] = await conn.query("INSERT INTO tbl_user SET ?", {
        user_id: userData.id,
        user_pw: hashedPassword,
        user_name: "",
        user_birthdate: "1900-01-01",
        user_gender: "",
        user_height: 0,
        user_weight: 0,
        user_diabetes: "",
        user_iot_serial: "",
        user_login_type: isSocial ? "social" : "regular",
      });
      return result;
    } catch (err) {
      throw err;
    } finally {
      if (conn) conn.release();
    }
  }

  // 사용자 정보 조회
  async findUserById(userID) {
    const conn = await pool.getConnection();
    try {
      const [rows] = await conn.query(
        "SELECT * FROM tbl_user WHERE user_id = ?",
        [userID]
      );
      // rows는 배열이므로, 해당 이메일을 가진 사용자가 있으면 rows[0]을 반환
      return rows.length > 0 ? rows[0] : null;
    } catch (err) {
      throw err;
    } finally {
      if (conn) conn.release();
    }
  }

  // 사용자 정보 수정
  async updateUser(userID, updateData) {
    const conn = await pool.getConnection();
    try {
      // 사용자 존재 여부 확인
      const user = await this.findUserById(userID);
      if (!user) {
        throw new Error("User not found");
      }

      // 부분 업데이트를 위한 쿼리 생성
      let query = "UPDATE tbl_user SET ";
      const params = [];
      Object.keys(updateData).forEach((key, index) => {
        query += `${key} = ?`;
        params.push(updateData[key]);
        if (index < Object.keys(updateData).length - 1) {
          query += ", ";
        }
      });
      query += " WHERE user_id = ?";
      params.push(userID);

      // 데이터베이스 업데이트 실행
      const [result] = await conn.query(query, params);
      return result;
    } catch (err) {
      throw err;
    } finally {
      if (conn) conn.release();
    }
  }

  // 사용자 정보 삭제
  async deleteUser(userID) {
    const conn = await pool.getConnection();
    try {
      const [result] = await conn.query(
        "DELETE FROM tbl_user WHERE user_id = ?",
        [userID]
      );
      return result;
    } catch (err) {
      throw err;
    } finally {
      if (conn) conn.release();
    }
  }

  // 보호자 전화번호 조회
  async getGuardianPhoneNumber(userID) {
    const conn = await pool.getConnection();
    try {
      const [rows] = await conn.query(
        "SELECT guardian_phone FROM tbl_user WHERE user_id = ?",
        [userID]
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

  // 보호자 정보 추가
  async createGuardian(userId, guardianData) {
    const conn = await pool.getConnection();
    try {
      const [result] = await conn.query("INSERT INTO tbl_guardian SET ?", {
        user_id: userId,
        guardian_name: guardianData.guardian_name,
        guardian_phone: guardianData.guardian_phone,
        guardian_relationship: guardianData.guardian_relationship,
      });
      return result;
    } catch (err) {
      throw err;
    } finally {
      if (conn) conn.release();
    }
  }

  // 보호자 정보 조회
  async findGuardianByUserId(userId) {
    const conn = await pool.getConnection();
    try {
      const [rows] = await conn.query(
        "SELECT * FROM tbl_guardian WHERE user_id = ?",
        [userId]
      );
      return rows.length > 0 ? rows[0] : null;
    } catch (err) {
      throw err;
    } finally {
      if (conn) conn.release();
    }
  }

  // 보호자 정보 수정
  async updateGuardian(userId, guardianData) {
    const conn = await pool.getConnection();
    try {
      let query = "UPDATE tbl_guardian SET ";
      const params = [];
      Object.keys(guardianData).forEach((key, index) => {
        query += `${key} = ?`;
        params.push(guardianData[key]);
        if (index < Object.keys(guardianData).length - 1) {
          query += ", ";
        }
      });
      query += " WHERE user_id = ?";
      params.push(userId);

      const [result] = await conn.query(query, params);
      return result;
    } catch (err) {
      throw err;
    } finally {
      if (conn) conn.release();
    }
  }

  // 보호자 정보 삭제
  async deleteGuardian(userId) {
    const conn = await pool.getConnection();
    try {
      const [result] = await conn.query(
        "DELETE FROM tbl_guardian WHERE user_id = ?",
        [userId]
      );
      return result;
    } catch (err) {
      throw err;
    } finally {
      if (conn) conn.release();
    }
  }

  // SHA2 해시를 사용하여 비밀번호 확인
  async checkPassword(id, password) {
    const conn = await pool.getConnection();
    try {
      const [hashed] = await conn.query(
        "SELECT user_pw FROM tbl_user WHERE user_id = ?",
        [id]
      );
      if (hashed.length === 0) {
        return false;
      }

      const [hash] = await conn.query("SELECT SHA2(?, 256) AS hash", [
        password,
      ]);
      return hashed[0].user_pw === hash[0].hash;
    } catch (err) {
      throw err;
    } finally {
      if (conn) conn.release();
    }
  }
}

module.exports = new UserModel();

// NOTE: 복약 모델
const pool = require("../utils/db").promise();

class doseModel {
  // 복약 기록 추가
  async addDose(userId, doseData) {
    const conn = await pool.getConnection();
    try {
      const [result] = await conn.query(
        "INSERT INTO tbl_dose (user_id, dose_time, meal_yn, dose_medicine, dose_amount, medicine_type) VALUES (?, ?, ?, ?, ?, ?)",
        [
          userId,
          doseData.dose_time,
          doseData.meal_yn,
          doseData.dose_medicine,
          doseData.dose_amount,
          doseData.medicine_type,
        ]
      );
      return result;
    } catch (err) {
      throw err;
    } finally {
      if (conn) conn.release();
    }
  }

  // 복약 기록 조회
  async getDoses(userId) {
    const conn = await pool.getConnection();
    try {
      const [rows] = await conn.query(
        "SELECT * FROM tbl_dose WHERE user_id = ?",
        [userId]
      );
      return rows;
    } catch (err) {
      throw err;
    } finally {
      if (conn) conn.release();
    }
  }

  // 복약 기록 삭제
  async deleteDose(doseIdx) {
    const conn = await pool.getConnection();
    try {
      const [result] = await conn.query(
        "DELETE FROM tbl_dose WHERE dose_idx = ?",
        [doseIdx]
      );
      return result;
    } catch (err) {
      throw err;
    } finally {
      if (conn) conn.release();
    }
  }
}

module.exports = new doseModel();

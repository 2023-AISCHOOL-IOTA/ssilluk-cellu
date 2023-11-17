// NOTE: 체중 모델
const pool = require("../utils/db").promise();

class WeightModel {
  async addWeight(userId, weight) {
    const conn = await pool.getConnection();
    try {
      const [result] = await conn.query(
        "INSERT INTO tbl_weight (user_id, weight) VALUES (?, ?)",
        [userId, weight]
      );
      return result;
    } catch (err) {
      throw err;
    } finally {
      if (conn) conn.release();
    }
  }

  // 체중 기록 조회
  async getWeights(userId) {
    const conn = await pool.getConnection();
    try {
      const [rows] = await conn.query(
        "SELECT * FROM tbl_weight WHERE user_id = ?",
        [userId]
      );
      return rows;
    } catch (err) {
      throw err;
    } finally {
      if (conn) conn.release();
    }
  }

  // 체중 기록 삭제
  async deleteWeight(weightIdx) {
    const conn = await pool.getConnection();
    try {
      const [result] = await conn.query(
        "DELETE FROM tbl_weight WHERE weight_idx = ?",
        [weightIdx]
      );
      return result;
    } catch (err) {
      throw err;
    } finally {
      if (conn) conn.release();
    }
  }
}

module.exports = new WeightModel();

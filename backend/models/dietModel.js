// NOTE: 식단 모델
const pool = require("../utils/db").promise();

class DietModel {
  async recordDiet(userId, dietData) {
    const conn = await pool.getConnection();
    try {
      const [result] = await conn.query("INSERT INTO tbl_diet SET ?", {
        user_id: userId,
        diet_time: dietData.diet_time,
        diet_content: dietData.diet_content,
        diet_img: dietData.diet_img,
      });
      return result;
    } catch (err) {
      throw err;
    } finally {
      if (conn) conn.release();
    }
  }
  async getDietRecords(userId) {
    const conn = await pool.getConnection();
    try {
      const [rows] = await conn.query(
        "SELECT * FROM tbl_diet WHERE user_id = ?",
        [userId]
      );
      return rows;
    } catch (err) {
      throw err;
    } finally {
      if (conn) conn.release();
    }
  }
  async deleteDiet(dietIdx) {
    const conn = await pool.getConnection();
    try {
      const [result] = await conn.query(
        "DELETE FROM tbl_diet WHERE diet_idx = ?",
        [dietIdx]
      );
      return result;
    } catch (err) {
      throw err;
    } finally {
      if (conn) conn.release();
    }
  }
}

module.exports = new DietModel();

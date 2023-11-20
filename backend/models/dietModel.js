// NOTE: 식단 모델
const pool = require("../utils/db").promise();

class DietModel {
  async addDiet(userId, dietContent, dietTime, dietImg) {
    const conn = await pool.getConnection();

    try {
      const [result] = await conn.query("INSERT INTO tbl_diet SET ?", {
        user_id: userId,
        diet_time: dietTime,
        diet_content: dietContent,
        diet_img: dietImg,
      });

      return result;
    } catch (err) {
      throw err;
    } finally {
      if (conn) conn.release();
    }
  }
  async getDiet(userId) {
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
  async getDietById(dietIdx) {
    const conn = await pool.getConnection();
    try {
      const [rows] = await conn.query(
        "SELECT * FROM tbl_diet WHERE diet_idx = ?",
        [dietIdx]
      );
      return rows.length > 0 ? rows[0] : null;
    } catch (err) {
      throw err;
    } finally {
      if (conn) conn.release();
    }
  }

  async updateDiet(dietIdx, userId, dietContent, dietTime, dietImg) {
    const conn = await pool.getConnection();
    try {
      const [result] = await conn.query(
        "UPDATE tbl_diet SET diet_content = ?, diet_time = ?, diet_img = ? WHERE diet_idx = ? AND user_id = ?",
        [dietContent, dietTime, dietImg, dietIdx, userId]
      );
      return result;
    } catch (err) {
      throw err;
    } finally {
      if (conn) conn.release();
    }
  }

  async updateDietImage(dietIdx, dietImg) {
    const conn = await pool.getConnection();
    try {
      const [result] = await conn.query(
        "UPDATE tbl_diet SET diet_img = ? WHERE diet_idx = ?",
        [dietImg, dietIdx]
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

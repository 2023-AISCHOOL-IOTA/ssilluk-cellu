// NOTE: 식단 모델
const pool = require("../utils/db").promise();

class DietModel {
  async addDiet(userId, dietContent, dietTime, dietImg) {
    const conn = await pool.getConnection();
    //FIXME: DELETE
    console.log(`dietTime1: `, dietTime);
    try {
      const [result] = await conn.query("INSERT INTO tbl_diet SET ?", {
        user_id: userId,
        diet_time: dietTime,
        diet_content: dietContent,
        diet_img: dietImg,
      });
      //FIXME: DELETE
      console.log(`result: `, result);
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

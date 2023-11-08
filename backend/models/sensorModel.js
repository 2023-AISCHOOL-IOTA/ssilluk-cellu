// NOTE: 센서 데이터와 예측 결과 저장
const pool = require("../utils/db").promise();
// FIXME: 데이터베이스 관련 코드 수정해야 함

class SensorModel {
  async saveData(userId, sensorData, predictionResult) {
    const conn = await pool.getConnection();
    try {
      // 센서 데이터와 예측 결과를 함께 데이터베이스에 저장
      // FIXME: 데이터베이스 관련 코드 수정해야 함
      const [result] = await conn.query(
        "INSERT INTO biometrics (user_id, sensor_data, prediction_data) VALUES (?, ?, ?)",
        [userId, JSON.stringify(sensorData), JSON.stringify(predictionResult)]
      );
      return result;
    } catch (err) {
      throw err;
    } finally {
      if (conn) conn.release();
    }
  }
}

module.exports = new SensorModel();

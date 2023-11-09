// NOTE: 센서 데이터와 예측 결과 저장
const pool = require("../utils/db").promise();
// FIXME: 데이터베이스 관련 코드 수정해야 함

class SensorModel {
  async saveData(userEmail, sensorData, predictionResult) {
    const conn = await pool.getConnection();
    try {
      // 센서 데이터와 예측 결과를 함께 데이터베이스에 저장
      // FIXME: 데이터베이스 관련 코드 수정해야 함
      const [result] = await conn.query(
        "INSERT INTO biometrics (user_id, sensor_data, prediction_data, meal_time, before_after_meal) VALUES (?, ?, ?, ?, ?)",
        [
          userEmail,
          JSON.stringify(sensorData),
          JSON.stringify(predictionResult),
          sensorData.mealTime, // 'morning', 'afternoon', 'evening'
          sensorData.beforeAfterMeal, // 'before', 'afternoon'
        ]
      );
      return result;
    } catch (err) {
      throw err;
    } finally {
      if (conn) conn.release();
    }
  }

  // 공복시 혈당이 300 이상인지 3일 연속으로 확인하는 메소드
  async checkConsistentHighGlucose(userEmail) {
    const conn = await pool.getConnection();
    try {
      const [rows] = await conn.query(
        `SELECT
          DATE(measurement_time) as date,
          MAX(sensor_data->"$.glucose") as max_glucose
        FROM biometrics
        WHERE user_id = ? AND sensor_data->"$.beforeAfterMeal" = 'before'
        GROUP BY date HAVING max_glucose >= 300
        ORDER BY date DESC LIMIT 3`,
        [userEmail]
      );

      // 연속된 3일간 고혈당인 경우 true 반환
      if (rows.length === 3) {
        // 날짜를 확인하여 연속되는지 검사
        let isConsistent = true;
        let prevDate = new Date(rows[0].date);
        for (let i = 1; i < rows.length; i++) {
          let currentDate = new Date(rows[i].date);
          let diffDays = (prevDate - currentDate) / (1000 * 3600 * 24);
          if (diffDays > 1) {
            isConsistent = false;
            break;
          }
          prevDate = currentDate;
        }
        return isConsistent;
      } else {
        return false;
      }
    } catch (err) {
      throw err;
    } finally {
      if (conn) conn.release();
    }
  }
}

module.exports = new SensorModel();

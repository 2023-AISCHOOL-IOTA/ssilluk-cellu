// NOTE: 센서 데이터와 예측 결과 저장
const pool = require("../utils/db").promise();
const { getStressLevel } = require("../utils/stressUtils");
// FIXME: 데이터베이스 관련 코드 수정해야 함

class SensorModel {
  async saveData(userEmail, sensorData, predictionResult) {
    const conn = await pool.getConnection();
    try {
      // 센서 데이터와 예측 결과를 함께 데이터베이스에 저장
      // FIXME: 데이터베이스 관련 코드 수정해야 함
      const [result] = await conn.query(
        "INSERT INTO tbl_sensor (user_id, iot_serial_no, created_at, meal_yn, meal_bld, hr, hrv, sdnn, rmssd, pnn50, vlf, lf, hf, fr, bloodsugar) VALUES (?, ?, NOW(), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
        [
          userEmail,
          sensorData.iotSerialNo,
          sensorData.mealYN,
          sensorData.mealBLD,
          sensorData.hr,
          sensorData.hrv,
          sensorData.sdnn,
          sensorData.rmssd,
          sensorData.pnn50,
          sensorData.vlf,
          sensorData.lf,
          sensorData.hf,
          sensorData.fr,
          predictionResult,
        ]
      );

      return result;
    } catch (err) {
      throw err;
    } finally {
      if (conn) conn.release();
    }
  }

  // 센서 데이터 조회
  async findSensorDataByUserId(userId) {
    const conn = await pool.getConnection();
    try {
      const [rows] = await conn.query(
        "SELECT * FROM tbl_sensor WHERE user_id = ? ORDER BY created_at DESC",
        [userId]
      );

      return rows;
    } catch (err) {
      throw err;
    } finally {
      if (conn) conn.release();
    }
  }

  // 센서 데이터 삭제
  async deleteSensorData(userId, sensorDataId) {
    const conn = await pool.getConnection();

    try {
      const [result] = await conn.query(
        "DELETE FROM tbl_sensor WHERE user_id = ? AND sensing_idx = ?",
        [userId, sensorDataId]
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
        `SELECT DATE(created_at) as date, MAX(bloodsugar) as max_glucose
        FROM tbl_sensor
        WHERE user_id = ? AND meal_yn = 'n'  // 'n'는 공복
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

  // 사용자의 최근 스트레스 데이터 조회
  async getRecentStressData(userEmail) {
    const conn = await pool.getConnection();
    try {
      const [rows] = await conn.query(
        "SELECT fr FROM tbl_sensor WHERE user_id = ? ORDER BY created_at DESC LIMIT 1",
        [userEmail]
      );

      if (rows.length > 0) {
        const stressLevel = getStressLevel(rows[0].fr); // calculateStressLevel은 스트레스 레벨을 계산하는 함수
        return { stressLevel };
      } else {
        return null;
      }
    } catch (err) {
      throw err;
    } finally {
      if (conn) conn.release();
    }
  }
}

module.exports = new SensorModel();

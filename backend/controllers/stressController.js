// NOTE: 스트레스 컨트롤러
const sensorModel = require("../models/sensorModel");
const { getStressLevel } = require("../utils/stressUtils");

const stressController = {
  getCurrentStressLevel: async (req, res, next) => {
    try {
      const userEmail = req.user.user_id; // 인증된 사용자의 ID

      // 센서 모델에서 최신 센서 데이터 가져오기
      const latestSensorData = await sensorModel.findSensorDataByUserId(
        userEmail
      );
      if (!latestSensorData) {
        return res
          .status(404)
          .send({ message: "No recent sensor data found." });
      }

      // 스트레스 레벨 계산
      const stressLevel = getStressLevel(latestSensorData);

      res.status(200).json({ stressLevel });
    } catch (error) {
      // 에러 처리
      next(error);
    }
  },
};

module.exports = stressController;

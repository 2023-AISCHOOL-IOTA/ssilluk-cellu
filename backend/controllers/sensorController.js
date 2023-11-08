// NOTE: 센서 데이터를 받아 예측 모델 서버에 전송, 결과를 데이터베이스에 저장

/**
 * @param res - 응답 객체
 * @param req - 요청 객체
 * @param next - 다음 미들웨어로 넘기는 함수
 */

const axios = require("axios");
const sensorModel = require("../models/sensorModel");

const PREDICTION_MODEL_SERVER_URL = `http://${process.env.PREDICTION_SERVER_HOSTNAME}:${process.env.PREDICTION_SERVER_PORT}/${process.env.PREDICTION_SERVER_PATH}`;

const sensorController = {
  processSensorData: async (req, res, next) => {
    try {
      const userId = req.user.id; // 인증된 사용자의 ID
      const sensorData = req.body; // 센서 데이터

      // 예측 모델 서버로 데이터 전송 및 결과 받기
      const { data } = await axios.post(
        PREDICTION_MODEL_SERVER_URL,
        sensorData
      );
      const predictionResult = data.prediction;

      // 데이터베이스에 센서 데이터와 예측 결과 저장
      await sensorModel.saveData(userId, sensorData, predictionResult);

      // 클라이언트에 성공 응답 전송
      res.status(200).json(predictionResult);
    } catch (error) {
      // 에러 처리
      next(error);
    }
  },
};

module.exports = sensorController;

// NOTE: 센서 데이터와 예측 모델 관련 라우트
const express = require("express");
const sensorController = require("../controllers/sensorController");
const { protect } = require("../middleware/protect");

const router = express.Router();

// 센서 데이터 처리 및 예측 모델 결과 저장 라우트
router.post("/", protect, sensorController.processSensorData);
router.get("/", protect, sensorController.getSensorData);
router.delete("/:sensorDataId", protect, sensorController.deleteSensorData);

module.exports = router;

// NOTE: 예측 모델 서버 관련 기능 처리하는 라우트
const express = require("express");
const predictionController = require("../controllers/predictionController");
const { protect } = require("../middleware/protect");

const router = express.Router();

// 예측 API 엔드포인트
router.post("", protect, predictionController.predictModel);

module.exports = router;

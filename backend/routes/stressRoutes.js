// NOTE: 스트레스 관련 라우트
const express = require("express");
const stressController = require("../controllers/stressController");
const { protect } = require("../middleware/protect");

const router = express.Router();

router.get("/", protect, stressController.getCurrentStressLevel);

module.exports = router;

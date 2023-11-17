const express = require("express");
const weightController = require("../controllers/weightController");
const { protect } = require("../middleware/protect");

const router = express.Router();

router.post("/", protect, weightController.addWeight);
router.get("/", protect, weightController.getWeights);
router.delete("/:weightIdx", protect, weightController.deleteWeight);

module.exports = router;

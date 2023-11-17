const express = require("express");
const doseController = require("../controllers/doseController");
const { protect } = require("../middleware/protect");

const router = express.Router();

router.post("/", protect, doseController.addDose);
router.get("/", protect, doseController.getDoses);
router.delete("/:doseIdx", protect, doseController.deleteDose);

module.exports = router;

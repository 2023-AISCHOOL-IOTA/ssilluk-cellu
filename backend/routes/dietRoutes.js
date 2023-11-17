const express = require("express");
const dietController = require("../controllers/dietController");
const { protect } = require("../middleware/protect");
const router = express.Router();

router.post("/", protect, dietController.recordDiet);
router.get("/", protect, dietController.getDietRecords);
router.delete("/:dietIdx", protect, dietController.deleteDiet);

module.exports = router;

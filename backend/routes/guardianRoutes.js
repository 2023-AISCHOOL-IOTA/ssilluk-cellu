const express = require("express");
const guardianController = require("../controllers/guardianConroller");
const { protect } = require("../middleware/protect");

const router = express.Router();

router.post("/", protect, guardianController.addGuardian);
router.get("/", protect, guardianController.getGuardian);
router.put("/", protect, guardianController.updateGuardian);
router.delete("/", protect, guardianController.deleteGuardian);

module.exports = router;

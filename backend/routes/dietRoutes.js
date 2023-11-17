const express = require("express");
const dietController = require("../controllers/dietController");
const imageUpload = require("../middleware/imageUpload");
const { protect } = require("../middleware/protect");
const router = express.Router();

router.post("/", protect, imageUpload.single("image"), dietController.addDiet);
router.get("/", protect, dietController.getDietRecords);
router.put(
  "/:dietIdx",
  protect,
  imageUpload.single("image"),
  dietController.updateDiet
);
router.delete("/:dietIdx", protect, dietController.deleteDiet);

module.exports = router;

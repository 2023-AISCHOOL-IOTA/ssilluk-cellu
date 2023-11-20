const express = require("express");
const dietController = require("../controllers/dietController");
const imageUpload = require("../middleware/imageUpload");
const { protect } = require("../middleware/protect");
const router = express.Router();

router.post("/", protect, imageUpload.single("image"), dietController.addDiet);
router.get("/", protect, dietController.getDiets);
router.put(
  "/:dietIdx",
  protect,
  imageUpload.single("image"),
  dietController.updateDiet
);
router.put("/:dietIdx/content", protect, dietController.updateDietContent);
router.put(
  "/:dietIdx/image",
  protect,
  imageUpload.single("image"),
  dietController.updateDietImage
);
router.delete("/:dietIdx/image", protect, dietController.deleteDietImage);
router.delete("/:dietIdx", protect, dietController.deleteDiet);

module.exports = router;

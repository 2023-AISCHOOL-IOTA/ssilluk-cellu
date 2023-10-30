const express = require("express");
const userController = require("../controllers/userController");
const { protect } = require("../middleware/auth");

const router = express.Router();

router.post("/signup", userController.signUp);
router.post("/signin", userController.signIn);
router.post("/signout", protect, userController.signOut);
router.get("/profile", protect, userController.getProfile);
router.put("/profile", protect, userController.updateProfile);

module.exports = router;

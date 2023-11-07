// NOTE: 사용자 관련 기능 처리하는 라우트
const express = require("express");
const userController = require("../controllers/userController");
const { protect } = require("../middleware/protect");

const router = express.Router();

router.post("/signup", userController.signUp);
router.post("/signin", userController.signIn);
// 로그아웃은 클라이언트에서 처리
// 로컬 저장소에 저장된 JWT 토큰 삭제, 사용자를 로그아웃 상태로 전환
// 클라이언트에게 토큰 삭제 안내
router.post("/signout", (req, res) => {
  res.status(200).send({ message: "Please delete your token." });
});
router.get("/profile", protect, userController.getProfile);
router.put("/profile", protect, userController.updateProfile);
router.delete("/delete", protect, userController.deleteProfile);

module.exports = router;

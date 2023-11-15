// NOTE: Google, Naver, Kakao 등 소셜 로그인 처리하는 라우트
const express = require("express");
const passport = require("passport");
const router = express.Router();

// Google signIn route
router.get(
  "/google",
  passport.authenticate("google", { scope: ["profile", "id"] })
);

// Google signIn callback route
router.get(
  "/google/callback",
  passport.authenticate("google", { failureRedirect: "/signin" }),
  (req, res) => {
    // TODO: 연결 페이지 정리
    res
      .cookie("token", req.user.token, {
        httpOnly: true,
        secure: true,
      })
      .redirect(process.env.FRONTEND_URL || "/profile"); // 환경 변수를 통해 프론트엔드 URL 설정
  }
);

module.exports = router;

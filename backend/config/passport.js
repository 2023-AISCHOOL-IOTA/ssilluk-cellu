// NOTE: Google OAuth strategy setup
// TODO: Add Naver and Kakao strategies

const passport = require("passport");
const GoogleStrategy = require("passport-google-oauth20").Strategy;
const UserModel = require("../models/userModel");
const tokenUtils = require("../utils/tokenUtils");

passport.use(
  new GoogleStrategy(
    {
      // Google OAuth strategy setup
      clientID: process.env.GOOGLE_CLIENT_ID,
      clientSecret: process.env.GOOGLE_CLIENT_SECRET,
      callbackURL: "/api/auth/google/callback",
    },
    async (accessToken, refreshToken, profile, cb) => {
      try {
        let user = await UserModel.findUserByEmail(profile.emails[0].value);

        // 소셜 로그인 사용자가 없으면 새 사용자 생성, socialLoginType으로 구별
        if (!user) {
          user = await UserModel.createUser({
            email: profile.emails[0].value,
            socialLoginType: "google", // 여기에 소셜 로그인 타입 지정
          });
        }

        // JWT 토큰 생성 및 사용자 정보와 함께 콜백 함수 호출
        const token = tokenUtils.generateToken(
          { email: user.email },
          process.env.JWT_SECRET
        ); // 토큰 생성 로직 분리
        cb(null, { user, token });
      } catch (err) {
        cb(err, null);
      }
    }
  )
);

module.exports = passport;

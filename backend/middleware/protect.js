// NOTE: 로그인 여부와 올바른 토큰 갖고 있는지 확인
const jwt = require("jsonwebtoken");
const UserModel = require("../models/userModel");

exports.protect = async (req, res, next) => {
  let token;

  if (
    req.headers.authorization &&
    req.headers.authorization.startsWith("Bearer ")
  ) {
    try {
      token = req.headers.authorization.split(" ")[1];

      // 토큰 포맷 검증
      if (!token) {
        return res.status(401).json({ message: "Invalid token format" });
      }

      // 토큰 검증, 페이로드 추출
      const decoded = jwt.verify(token, process.env.JWT_SECRET);

      // 사용자 정보 검색
      req.user = await UserModel.findUserById(decoded.id);
      if (!req.user) {
        return res
          .status(401)
          .json({ message: "User not found with provided token" });
      }
      next();
    } catch (error) {
      // 오류 처리 및 로깅
      console.error(`Token verification error: ${error.message}`);
      return res
        .status(401)
        .json({ message: `Token verification failed: ${error.message}` });
    }
  } else {
    return res.status(401).json({ message: "Authorization token is missing" });
  }
};

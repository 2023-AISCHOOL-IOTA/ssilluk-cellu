// NOTE: 로그인 여부와 올바른 토큰 갖고 있는지 확인
const jwt = require("jsonwebtoken");
const UserModel = require("../models/userModel");

exports.protect = async (req, res, next) => {
  let token;
  if (
    req.headers.authorization &&
    req.headers.authorization.startsWith("Bearer")
  ) {
    try {
      // Bearer 제거하고 토큰만 추출
      token = req.headers.authorization.split(" ")[1];

      // 토큰 검증, 페이로드 추출
      const decoded = jwt.verify(token, process.env.JWT_SECRET);

      // 페이로드에서 사용자 정보를 가져와 다음 미들웨어나 라우터에서 사용
      req.user = await UserModel.findUserByEmail(decoded.email);
      if (!req.user) throw new Error("User not found in database");

      next();
    } catch (error) {
      res
        .status(401)
        .send({ message: `Not authorized, token failed: ${error.message}` });
    }
  } else {
    res.status(401).send({ message: `No token provided` });
  }
};

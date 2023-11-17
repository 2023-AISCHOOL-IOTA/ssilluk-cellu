// NOTE: JWT 토큰 생성 및 검증
// utils/tokenUtils.js
const jwt = require("jsonwebtoken");

const generateToken = (payload, secret, options = { expiresIn: "1h" }) => {
  return jwt.sign(payload, secret, options);
};

module.exports = {
  generateToken,
};

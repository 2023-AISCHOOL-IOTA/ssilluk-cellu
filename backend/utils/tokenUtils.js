// NOTE: JWT 토큰 생성 및 검증
// utils/tokenUtils.js
const jwt = require("jsonwebtoken");

/**
 * JWT 토큰 생성 함수
 * @param {Object} payload - 토큰에 담을 사용자 정보
 * @param {string} secret - JWT 서명에 사용할 비밀키
 * @param {Object} [options] - 토큰 생성 옵션
 * @returns {string} - 생성된 JWT 토큰
 */
const generateToken = (payload, secret, options = { expiresIn: "1h" }) => {
  return jwt.sign(payload, secret, options);
};

module.exports = {
  generateToken,
};

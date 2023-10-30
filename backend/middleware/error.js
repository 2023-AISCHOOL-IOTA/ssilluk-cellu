// 에러 처리 미들웨어
// winston 사용
const winston = require("winston");

const logger = winston.createLogger({
  level: "error",
  format: winston.format.combine(
    winston.format.timestamp(),
    winston.format.json()
  ),

  transports: [
    new winston.transports.File({ filename: "errors.log" }),
    new winston.transports.Console({
      format: winston.format.simple(),
    }),
  ],
});

const errorHandler = (err, req, res, next) => {
  // 에러 정보 로그 기록
  logger.error(
    `${err.status} - ${err.message} - ${req.originalUrl} = ${req.method} - ${req.ip}`
  );

  // 개발 환경에는 추가적으로 에러 스택 기록
  if (process.env.NODE_ENV === "development") {
    logger.error(err.stack);
  }

  res.status(err.status).json({
    error: {
      message: err.message,
      status: err.status,
      stack: process.env.NODE_ENV === "development" ? err.stack : {},
    },
  });
};

module.exports.errorHandler = errorHandler;

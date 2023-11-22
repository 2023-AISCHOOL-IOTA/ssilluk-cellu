/// NOTE: 시스템 내부에서 발생하는 모든 에러 처리
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
  // 에러 상태 코드 설정
  const statusCode = res.statusCode === 200 ? 500 : res.statusCode;

  // 에러 정보 로그 기록
  logger.error(
    `${statusCode} - ${err.message} - ${req.originalUrl} - ${req.method} - ${req.ip}`
  );

  // 개발 환경에서 에러 스택 추가적으로 로깅
  if (process.env.NODE_ENV === "development") {
    logger.error(err.stack);
  }

  // NOTE: 프로덕션 환경에서는 에러 스택을 전송안함
  const clientMessage =
    statusCode === 500 ? "An unexpected error occurred" : err.message;

  // 클라이언트에 에러 응답 전송
  res.status(statusCode);
  res.json({
    error: {
      message: err.message,
      stack: process.env.NODE_ENV === "production" ? "🥞" : err.stack,
    },
  });
};

module.exports.errorHandler = errorHandler;

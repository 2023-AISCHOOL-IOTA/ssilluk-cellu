// SERVER 시작점
require("dotenv").config(); // 환경 변수 로드
const express = require("express");
const cors = require("cors"); // 외부 도메인에서의 API 접근 허용

const userRoutes = require("./routes/userRoutes"); // 사용자 라우터
const sensorRoutes = require("./routes/sensorRoutes"); // 센서 라우터
const authRoutes = require("./routes/authRoutes"); // 소셜 로그인 인증 라우터

const { errorHandler } = require("./middleware/error"); // 에러 처리

const app = express(); // express 어플리케이션 생성

app.use(cors()); // Cross-Origin Resource Sharing 활성화
app.use(express.json()); // Body parsing middleware. JSON 페이로드 처리

// Routes
app.use("/api/user", userRoutes);
app.use("/api/sensor", sensorRoutes);
app.use("/api/auth", authRoutes); // 소셜 로그인 라우터

// Logging middleware - 모든 요청에 대한 로깅
app.use((req, res, next) => {
  console.log(`${new Date().toISOString()} - ${req.method} ${req.url}`);
  next();
});

// Error middleware
app.use(errorHandler);

// 환경 변수 검증
if (!process.env.JWT_SECRET) {
  console.error("FATAL ERROR: JWT_SECRET is not defined.");
  process.exit(1);
}

// server test
// TODO: 삭제
app.get("/", (req, res) => {
  res.send("<h1>Hello, World!</h1>");
  console.log("HELLO WORLD");
});

const PORT = process.env.PORT || 3000;

// Start server
app.listen(PORT, () => {
  console.log(`Server started on port ${PORT}`);
});

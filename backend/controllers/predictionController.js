// NOTE: 예측 모델 호출

/**
 * @param res - 응답 객체
 * @param req - 요청 객체
 * @param next - 다음 미들웨어로 넘기는 함수
 */

const http = require("http");

const predictionController = {
  // 예측 모델 서버에 생체 데이터를 전송하고 결과를 받는 함수
  async predictModel(req, res, next) {
    const postData = JSON.stringify(req.body);
    const options = {
      hostname: process.env.PREDICTION_SERVER_HOSTNAME,
      port: process.env.PREDICTION_SERVER_PORT,
      path: process.env.PREDICTION_SERVER_PATH,
      method: process.env.PREDICTION_SERVER_METHOD,
      headers: {
        "Content-Type": "application/json",
        "Content-Length": Buffer.byteLength(postData),
      },
    };

    const predictReq = http.request(options, (predictRes) => {
      let result = "";

      predictRes.on("data", (chunk) => {
        result += chunk;
      });

      predictRes.on("end", () => {
        try {
          const parseResult = JSON.parse(result);
          res.status(200).json({ prediction: parsedResult.prediction });
        } catch (error) {
          next(error);
        }
      });
    });
    predictReq.on("error", (error) => {
      next(error);
    });

    predictReq.write(postData);
    predictReq.end();
  },
};

module.exports = predictionController;

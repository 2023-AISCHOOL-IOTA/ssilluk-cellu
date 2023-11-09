// NOTE: 알림 기능
const twilio = require("twilio");

// 클라이언트 설정
const client = new twilio(
  process.env.SMS_ACCOUNT_SID,
  process.env.SMS_AUTH_TOKEN
);

const notificationService = {
  // SMS 알림
  sendSMS: async (to, body, next) => {
    try {
      const message = await client.messages.create({
        body: body,
        to: to, // 수신자 번호
        from: process.env.SMS_PHONE_NUMBER,
      });
      console.log(`SMS sent successfully. SID: ${message.sid}`);
    } catch (error) {
      console.error(`Error sending SMS: ${error}`);
      next(error);
    }
  },

  // TODO: PUSH 알림
  sendPushNotification: async (token, title, body) => {
    // TODO: 푸시 알림 서비스 API 통합하는 코드 작성
  },
};

module.exports = notificationService;

// NOTE: 식단 컨트롤러
const DietModel = require("../models/dietModel");
const uploadToS3 = require("../utils/s3Uploader");

const dietController = {
  // 식단 기록
  async addDiet(req, res, next) {
    try {
      const userId = req.user.user_id; // 인증된 사용자의 ID
      const { diet_content, diet_time } = req.body;
      let dietImgUrl = null;

      // 이미지 파일이 있을 경우에만 S3 업로드 실행
      if (req.file) {
        try {
          const uploadResult = await uploadToS3(
            req.file,
            process.env.AWS_S3_BUCKET
          );
          dietImgUrl = uploadResult.Location; // S3에서의 이미지 URL
          await DietModel.addDiet(userId, diet_content, diet_time, dietImgUrl);
          res.status(201).send({ message: "Diet recorded successfully." });
        } catch (error) {
          // 이미지 업로드 실패 처리
          next(error);
        }
      } else {
        // 이미지 없이 식단 기록
        await DietModel.addDiet(userId, diet_content, diet_time, null);
        res.status(201).send({ message: "Diet recorded successfully." });
      }
    } catch (error) {
      next(error);
    }
  },

  // 식단 기록 조회
  async getDietRecords(req, res, next) {
    try {
      const userId = req.user.user_id;
      const records = await DietModel.getDietRecords(userId);
      res.status(200).send(records);
    } catch (error) {
      next(error);
    }
  },

  // 식단 삭제
  async deleteDiet(req, res, next) {
    try {
      const dietIdx = req.params.dietIdx; // URL로부터 diet_idx 추출
      await DietModel.deleteDiet(dietIdx); // 모델을 사용하여 식단 삭제
      res.status(200).send({ message: "Diet deleted successfully." });
    } catch (error) {
      next(error);
    }
  },
};

module.exports = dietController;

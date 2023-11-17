// NOTE: 식단 컨트롤러
const DietModel = require("../models/dietModel");

const dietController = {
  // 식단 기록
  async recordDiet(req, res, next) {
    try {
      const userId = req.user.user_id; // 인증된 사용자의 ID
      const dietData = req.body;
      await DietModel.recordDiet(userId, dietData);
      res.status(201).send({ message: "Diet recorded successfully." });
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

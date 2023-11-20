// NOTE: 식단 컨트롤러
const DietModel = require("../models/dietModel");
const uploadToS3 = require("../utils/s3Uploader");
const deleteFromS3 = require("../utils/s3Deleter");

const dietController = {
  // 식단 기록
  async addDiet(req, res, next) {
    try {
      const userId = req.user.user_id;
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
        } catch (error) {
          // 이미지 업로드 실패 처리
          next(error);
        }
      } else {
        next(error);
        return;
      }
      await DietModel.addDiet(userId, diet_content, diet_time, dietImgUrl);
      res.status(201).send({
        message: "Diet recorded successfully.",
        imageUrl: dietImgUrl, // 업로드된 이미지 URL 반환
      });
    } catch (error) {
      next(error);
    }
  },

  // 식단 기록 조회
  async getDiets(req, res, next) {
    try {
      const userId = req.user.user_id;
      const records = await DietModel.getDiet(userId);
      res.status(200).send(records);
    } catch (error) {
      next(error);
    }
  },

  // 식단 기록 수정
  async updateDiet(req, res, next) {
    try {
      const dietIdx = req.params.dietIdx;
      const userId = req.user.user_id;
      const { diet_content, diet_time } = req.body;

      const existingRecord = await DietModel.getDietById(dietIdx);
      let dietImgUrl = existingRecord ? existingRecord.diet_img : null;

      if (req.file) {
        if (dietImgUrl && dietImgUrl.diet_img) {
          // 기존 이미지가 있는 경우, 삭제
          await deleteFromS3(dietImgUrl);
        }
        // 새 이미지 업로드
        const uploadResult = await uploadToS3(
          req.file,
          process.env.AWS_S3_BUCKET
        );
        dietImgUrl = uploadResult.Location;
      } else {
        dietImgUrl = existingRecord.diet_img; // 기존 이미지 유지
      }

      await DietModel.updateDiet(
        dietIdx,
        userId,
        diet_content,
        diet_time,
        dietImgUrl
      );
      res.status(200).send({
        message: "Diet updated successfully.",
        imageUrl: dietImgUrl,
      });
    } catch (error) {
      next(error);
    }
  },
  // Update Only Diet Content
  async updateDietContent(req, res, next) {
    try {
      const dietIdx = req.params.dietIdx;
      const userId = req.user.user_id;
      const { diet_content, diet_time } = req.body;

      await DietModel.updateDiet(
        dietIdx,
        userId,
        diet_content,
        diet_time,
        null
      );
      res.status(200).send({ message: "Diet content updated successfully." });
    } catch (error) {
      next(error);
    }
  },

  // Update Only Diet Image
  async updateDietImage(req, res, next) {
    try {
      const dietIdx = req.params.dietIdx;
      const existingRecord = await DietModel.getDietById(dietIdx);
      let dietImgUrl = existingRecord ? existingRecord.diet_img : null;

      if (req.file) {
        if (dietImgUrl) {
          await deleteFromS3(dietImgUrl);
        }
        const uploadResult = await uploadToS3(
          req.file,
          process.env.AWS_S3_BUCKET
        );
        dietImgUrl = uploadResult.Location;
      }

      await DietModel.updateDietImage(dietIdx, dietImgUrl);
      res
        .status(200)
        .send({
          message: "Diet image updated successfully.",
          imageUrl: dietImgUrl,
        });
    } catch (error) {
      next(error);
    }
  },

  // Delete Only Diet Image
  async deleteDietImage(req, res, next) {
    try {
      const dietIdx = req.params.dietIdx;
      const existingRecord = await DietModel.getDietById(dietIdx);

      if (existingRecord && existingRecord.diet_img) {
        await deleteFromS3(existingRecord.diet_img);
        await DietModel.updateDietImage(dietIdx, null);
      }

      res.status(200).send({ message: "Diet image deleted successfully." });
    } catch (error) {
      next(error);
    }
  },

  // 식단 삭제
  async deleteDiet(req, res, next) {
    try {
      const dietIdx = req.params.dietIdx;
      const dietImgUrl = await DietModel.getDietById(dietIdx);

      if (dietImgUrl && dietImgUrl.diet_img) {
        await deleteFromS3(dietImgUrl.diet_img); // S3에서 이미지 삭제
      }

      await DietModel.deleteDiet(dietIdx);
      res.status(200).send({ message: "Diet deleted successfully." });
    } catch (error) {
      next(error);
    }
  },
};

module.exports = dietController;

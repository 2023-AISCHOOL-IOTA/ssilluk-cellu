// NOTE: 보호자와 관련된 기능 처리 컨트롤러
// NOTE: 보호자 등록, 조회, 수정, 삭제

const UserModel = require("../models/userModel");

const guardianController = {
  // 보호자 정보 추가
  async addGuardian(req, res, next) {
    try {
      await UserModel.createGuardian(req.user.user_id, req.body);
      res.status(201).send({ message: "Guardian added successfully." });
    } catch (error) {
      next(error);
    }
  },

  // 보호자 정보 조회
  async getGuardian(req, res, next) {
    try {
      const guardian = await UserModel.findGuardianByUserId(req.user.user_id);
      if (!guardian) {
        return res.status(404).send({ message: "Guardian not found." });
      }
      res.status(200).send(guardian);
    } catch (error) {
      next(error);
    }
  },

  // 보호자 정보 수정
  async updateGuardian(req, res, next) {
    try {
      await UserModel.updateGuardian(req.user.user_id, req.body);
      res.status(200).send({ message: "Guardian updated successfully." });
    } catch (error) {
      next(error);
    }
  },

  // 보호자 정보 삭제
  async deleteGuardian(req, res, next) {
    try {
      await UserModel.deleteGuardian(req.user.user_id);
      res.status(200).send({ message: "Guardian deleted successfully." });
    } catch (error) {
      next(error);
    }
  },
};

module.exports = guardianController;

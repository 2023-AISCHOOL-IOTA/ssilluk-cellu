// NOTE: 복약 컨트롤러
const doseModel = require("../models/doseModel");

const doseController = {
  async addDose(req, res, next) {
    try {
      await doseModel.addDose(req.user.user_id, req.body);
      res.status(201).send({ message: "Dose added successfully." });
    } catch (error) {
      next(error);
    }
  },

  async getDoses(req, res, next) {
    try {
      const doses = await doseModel.getDoses(req.user.user_id);
      res.status(200).send(doses);
    } catch (error) {
      next(error);
    }
  },

  async deleteDose(req, res, next) {
    try {
      await doseModel.deleteDose(req.params.doseIdx);
      res.status(200).send({ message: "Dose deleted successfully." });
    } catch (error) {
      next(error);
    }
  },
};
module.exports = doseController;

// NOTE: 체중 컨트롤러
const weightModel = require("../models/weightModel");

const weightController = {
  async addWeight(req, res, next) {
    try {
      await weightModel.addWeight(req.user.user_id, req.body.weight);
      res.status(201).send({ message: "Weight added successfully." });
    } catch (error) {
      next(error);
    }
  },

  async getWeights(req, res, next) {
    try {
      const weights = await weightModel.getWeights(req.user.user_id);
      res.status(200).send(weights);
    } catch (error) {
      next(error);
    }
  },

  async deleteWeight(req, res, next) {
    try {
      await weightModel.deleteWeight(req.params.weightIdx);
      res.status(200).send({ message: "Weight deleted successfully." });
    } catch (error) {
      next(error);
    }
  },
};
module.exports = weightController;

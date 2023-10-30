// 사용자 컨트롤러
const UserModel = require("../models/userModel");
const jwt = require("jsonwebtoken");

const userController = {
  // 회원 가입
  async signUp(req, res) {
    try {
      await UserModel.createUser(req.body);
      res.status(201).send({ message: `User signed up successfully.` });
    } catch (error) {
      res.status(500).send(error.message);
    }
  },

  // 로그인
  async signIn(req, res) {
    try {
      const user = await UserModel.findUserByEmail(req.body.email);
      if (!user) {
        return res.status(404).send({ message: `User not found` });
      }

      const isMatch = await bcrypt.compare(req.body.password, user.password);
      if (!isMatch) {
        return res.status(401).send({ message: `Invalid credentials` });
      }

      const token = jwt.sign({ id: user.email }, process.env.JWT_SECRET, {
        expiresln: "1h",
      });
      res.status(200).send({ token });
    } catch (error) {
      res.status(500).send(error.message);
    }
  },

  // 로그아웃
  async signOut(req, res) {
    res.status(200).send({ message: `Signed out successfully` });
  },

  // 사용자 프로필 조회
  async getProfile(req, res) {
    try {
      const user = await UserModel.findUserByEmail(req.user.email);
      res.status(200).send(user);
    } catch (error) {
      res.status(500).send(error.message);
    }
  },

  // 사용자 프로필 수정
  async updateProfile(req, res) {
    try {
      const updateDate = req.body;
      await UserModel.updateUser(req.body.email, updateDate);
      res.status(200).send({ message: `Profile updated successfully` });
    } catch (error) {
      res.status(500).send(error.message);
    }
  },
};

module.exports = userController;

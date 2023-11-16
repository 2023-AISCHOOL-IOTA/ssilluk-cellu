// NOTE: 생체 데이터 암호화
const crypto = require("crypto");

const algorithm = "aes-256-cbc";
// FIXME: key 수정해야 함
const key = crypto.randomBytes(32);
const iv = crypto.randomBytes(16);

const encrypt = (text) => {
  let cipher = crypto.createCipheriv(algorithm, Buffer.from(key), iv);
  let encrypted = cipher.update(text);
  encrypted = Buffer.concat([encrypted, cipher.final()]);
  return { iv: iv.toString("hex"), encryptedData: encrypted.toString("hex") };
};

const decrypt = (encryptedData) => {
  let iv = Buffer.from(encryptedData.iv, "hex");
  let encryptedText = Buffer.from(encryptedData.encryptedData, "hex");
  let decipher = crypto.createDecipheriv(algorithm, Buffer.from(key), iv);
  let decrypted = decipher.update(encryptedText);
  decrypted = Buffer.concat([decrypted, decipher.final()]);
  return decrypted.toString();
};

module.exports = { encrypt, decrypt };

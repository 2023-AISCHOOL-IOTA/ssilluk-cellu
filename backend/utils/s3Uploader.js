// NOTE: S3 이미지 업로드
const AWS = require("aws-sdk");
const { v4: uuidv4 } = require("uuid");

const s3 = new AWS.S3({
  accessKeyId: process.env.AWS_ACCESS_KEY_ID,
  secretAccessKey: process.env.AWS_SECRET_ACCESS_KEY,
  region: process.env.AWS_REGION,
});

const uploadToS3 = (file, bucketName) => {
  const fileName = `${uuidv4()}-${file.originalName}`;
  const params = {
    Bucket: bucketName,
    Key: fileName,
    Body: file.buffer,
    ACL: "public-read",
  };

  return s3.upload(params).promise();
};

module.exports = uploadToS3;

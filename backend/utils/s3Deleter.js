const AWS = require("aws-sdk");

const s3 = new AWS.S3({
  accessKeyId: process.env.AWS_ACCESS_KEY_ID,
  secretAccessKey: process.env.AWS_SECRET_ACCESS_KEY,
  region: process.env.AWS_REGION,
});

const deleteFromS3 = (fileUrl) => {
  const bucketName = process.env.AWS_S3_BUCKET;
  const fileName = fileUrl.split("/").pop();

  const params = {
    Bucket: bucketName,
    Key: fileName,
  };

  return s3.deleteObject(params).promise();
};
module.exports = deleteFromS3;

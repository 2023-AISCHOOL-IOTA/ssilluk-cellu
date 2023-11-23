from flask import Flask, request, jsonify
import tensorflow as tf
from keras.models import load_model
import logging
import os

app = Flask(__name__)

# 로깅 설정
logging.basicConfig(level=logging.DEBUG)

# TensorFlow 버전 및 환경 확인
tf_version = tf.__version__
print("TensorFlow version:", tf_version)

# 모델 파일 경로 설정
directory_name = os.path.dirname(__file__)
model_file_path = os.path.join(directory_name, 'predict-model.h5')
print("Model file path: ", model_file_path)

# 모델 로드 함수 정의
def load_tf_model(model_path):
  try:
    # TensorFlow 호환 버전 확인 및 모델 로드
    return load_model(model_path)
  except Exception as e:
    logging.error(f'Error loading model: {str(e)}')
    raise

# 모델 로드
try:
  model = load_tf_model(model_file_path)
except Exception as e:
  logging.error(f"Model loading failed: {e}")
  # 여기에 필요한 경우 대체 로직을 구현할 수 있습니다.

@app.route('/predict', methods=['POST'])
def predict():
  try:
    data = request.get_json()
    app.logger.info(f'Received prediction request with data: {data}')

    # 데이터 전처리 및 예측 로직 작성
    # 예시: processed_data = preprocess_data(data)
    # 예시: prediction_result = model.predict(processed_data)

    # 예시 응답
    response = {'prediction': 'example'}
    return jsonify(response), 200

  except Exception as e:
    app.logger.error(f'Error in prediction: {str(e)}')
    return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    app.run(port=6500, debug=True)

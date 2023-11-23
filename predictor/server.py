from flask import Flask, request, jsonify
import tensorflow as tf
from tensorflow.keras.models import load_model
import logging

app = Flask(__name__)

# 로깅 설정
logging.basicConfig(level=logging.DEBUG)

# 모델 로드
model = load_model('predict-model.h5')
app.logger.info("Model loaded successfully")

@app.route('/predict', methods=['POST'])
def predict():
  try:
    data = request.get_json()
    app.logger.info(f'Received prediction request with data: {data}')

    # 데이터 전처리 (예시로 가정)
    # processed_data = preprocess_data(data)  # 실제 데이터 전처리 함수 사용

    # 모델 예측
    prediction_result = model.predict(processed_data)

    # 결과 후처리 (예시로 가정)
    # processed_result = postprocess_result(prediction_result)  # 실제 후처리 함수 사용

    response = {'prediction': prediction_result.tolist()}
    app.logger.info(f'Response: {response}')
    return jsonify(response), 200

  except Exception as e:
    app.logger.error(f'Error in prediction: {str(e)}')
    return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    app.run(port=6500, debug=True)

# from flask import Flask
# from threading import Thread

# app = Flask(__name__)

# @app.route('/')
# def home():
#     return "Hello, World!"

# def run_app():
#     app.run(debug=False)  # debug를 False로 설정

# # Flask 서버를 별도의 스레드에서 실행
# thread = Thread(target=run_app)
# thread.start()


from flask import Flask, request, jsonify
import tensorflow as tf
from tensorflow.keras.models import load_model
import logging
import os
import numpy as np


app = Flask(__name__)

# 로깅 설정
logging.basicConfig(level=logging.DEBUG)

# TensorFlow 버전 확인
tf_version = tf.__version__
print("TensorFlow version:", tf_version)


# 모델 파일 경로 설정
# model_file_path = 'http://localhost:8888/edit/Desktop/python%20study/model.h5'  # 모델 파일 경로 수정
# model_file_path = 'C://Users/smhrd/Documents/GitHub/aiProject/predictor/model.h5'

# 모델 로드 함수 정의
def load_tf_model(model_path):
    try:
        # 표준 손실 함수 MeanSquaredLogarithmicError 사용
        custom_objects = {'MeanSquaredLogarithmicError': tf.keras.losses.MeanSquaredLogarithmicError}
        return load_model(model_path, custom_objects=custom_objects)
    except Exception as e:
        logging.error(f'Error loading model: {str(e)}')
        raise

# 모델 로드
try:
    model_file_path = 'C://Users/smhrd/Documents/GitHub/aiProject/predictor/model.h5' # 실제 파일 경로로 수정
    model = load_tf_model(model_file_path)
except Exception as e:
    logging.error(f"Model loading failed: {e}")
    # 필요한 경우 여기에 대체 로직을 구현할 수 있습니다.

# 데이터 전처리 함수 정의
def preprocess_data(data):
    if 'age' in data and isinstance(data['age'], str):
        try:
            data['age'] = float(data['age'])
        except ValueError:
            # Handle the exception if conversion is not possible
            logging.error('Invalid data format for age')
            raise ValueError('Invalid data format for age')

    # 예시: 데이터를 모델이 처리할 수 있는 형태로 변환
    # 이 부분은 실제 모델과 데이터에 따라 달라질 수 있습니다.
    processed_data = np.array([
        data['hr'],
        data['hrv'],
        data['sdnn'],
        data['rmssd'],
        data['pnn50'],
        data['vlf'],
        data['lf'],
        data['hf'],
        data['fr'],
        0 if data['gender'] == 'M' else 1,
        data['age']
    ]).reshape(1, -1)  # 예시 형태, 실제 모델에 맞게 수정 필요
    return processed_data


# 예측 API 라우트
@app.route('/predict', methods=['POST'])
def predict():
    try:
        data = request.get_json()
        app.logger.info(f'Received prediction request with data: {data}')

        # 데이터 전처리
        processed_data = preprocess_data(data)

        # 예측 수행
        prediction_result = model.predict(processed_data)

        # 예측 결과를 float 형태로 변환
        prediction_value = float(prediction_result[0][0])

        # 예측 결과 반환
        response = {'prediction': prediction_value}
        return jsonify(response), 200


    except Exception as e:
        app.logger.error(f'Error in prediction: {str(e)}')
        return jsonify({'error': str(e)}), 500

@app.route('/')
def index():
    return "Welcome to the Flask API!"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=6502, debug=False, use_reloader=False)

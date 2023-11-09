from flask import Flask, request, jsonify
import logging
# import real_model # real_model.py에 실제 모델 로직 있다는 가정

app = Flask(__name__)

# 로깅 설정
logging.basicConfig(level=logging.DEBUG)

# FIXME: my_model은 임의로 작성한 모델. 예측 함수는 my_model.predict(data)로 호출
# FIXME: 가짜 코드니까 수정해야 함
def load_my_model(data):
  prediction_result = data
  return prediction_result

# 모델 로드
# model = real_model.load_model('model_path/model_file')

@app.route('/predict', methods=['GET','POST'])
def predict():
  data = request.get_json()

  # 요청을 받았을 때 로그를 출력
  app.logger.info(f'Received prediction request with data: {data}')
  print(f'Received prediction request with data: {data}')

  # 예측 모델 실행

  # FIXME: 진짜 예측 모델로 수정 해야 함

  # data 전처리
  # processed_data = real_model.preprocess(data)
  # 예측 수행
  # prediction_result = model.predict(processed_data)
  # 결과 후처리
  # processed_result = real_model.postprocess(prediction_result)

  prediction_result = load_my_model(data)

  response = {
        'prediction': prediction_result
    }

  return jsonify(response), 200

if __name__ == '__main__':
  app.run(host ='0.0.0.0', port = 6500, debug = True)

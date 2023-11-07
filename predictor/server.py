from flask import Flask, request, jsonify
# import real_model # real_model.py에 실제 모델 로직 있다는 가정

app = Flask(__name__)

# FIXME: my_model은 임의로 작성한 모델. 예측 함수는 my_model.predict(data)로 호출
# FIXME: 가짜 코드니까 수정해야 함
def load_my_model(data):
  prediction_result = data
  return prediction_result

# 모델 로드
# model = real_model.load_model('model_path/model_file')

@app.route('/predict', methods=['POST'])
def predict():
  data = request.get_json()

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
  app.run(debug=True)

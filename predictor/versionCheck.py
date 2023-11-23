import h5py

def check_tensorflow_version(h5_file_path):
  try:
    with h5py.File(h5_file_path, 'r') as f:
      if 'keras_version' in f.attrs:
        keras_version = f.attrs['keras_version']
        print(f"Keras version in the model: {keras_version}")
      if 'tensorflow_version' in f.attrs:
        tensorflow_version = f.attrs['tensorflow_version']
        print(f"TensorFlow version in the model: {tensorflow_version}")
      else:
        print("TensorFlow version information is not available in this model.")
  except Exception as e:
    print(f"Error occurred: {e}")

# .h5 모델 파일 경로를 지정하세요
model_file_path = 'C:/Users/smhrd/Documents/GitHub/aiProject/predictor/predict-model.h5'
check_tensorflow_version(model_file_path)

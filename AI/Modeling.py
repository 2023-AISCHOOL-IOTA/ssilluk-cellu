%cd /content/drive/MyDrive/인공지능사관학교/프로젝트

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import RobustScaler
from sklearn.metrics import mean_squared_error, mean_absolute_error, r2_score
import tensorflow as tf
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense, BatchNormalization, Activation
from tensorflow.keras.optimizers import Adam
from tqdm import tqdm

# 1. 전체 데이터셋 읽어들이기
data = pd.read_csv('AI_data_1.csv')


# 2. 필요한 열만 선택
selected_features = ['HR', 'HRV', 'SDNN', 'RMSSD', 'PNN50', 'VLF', 'LF', 'HF', 'Frequency_Ratio', 'gender', 'age', 'blood_sugar']
data = data[selected_features]


# 3. NaN 값 처리
data = data.fillna(data.mean())

# 데이터를 입력 특성(X)와 레이블(y)로 분리
X = data.drop(columns=['blood_sugar'])
y = data['blood_sugar']

# 데이터를 75% 학습용과 25% 검증용으로 분리
X_train, X_val, y_train, y_val = train_test_split(X, y, test_size=0.25, random_state=42)



# RobustScaler 사용하여 데이터 스케일링
scaler = RobustScaler()
X_train_scaled = scaler.fit_transform(X_train)
X_val_scaled = scaler.transform(X_val)

# TensorFlow용 모델 정의
def build_model(input_shape):
    model = Sequential()
    model.add(Dense(64, input_shape=input_shape))
    model.add(BatchNormalization())  # 배치 정규화 추가
    model.add(Activation('relu'))

    model.add(Dense(128))
    model.add(BatchNormalization())
    model.add(Activation('relu'))

    model.add(Dense(256)
    model.add(BatchNormalization())
    model.add(Activation('relu'))

    model.add(Dense(512))
    model.add(BatchNormalization())
    model.add(Activation('relu'))

    model.add(Dense(256))
    model.add(BatchNormalization())
    model.add(Activation('relu')

    model.add(Dense(64))
    model.add(BatchNormalization())
    model.add(Activation('relu'))

    model.add(Dense(1))
    return model

model = build_model((X_train_scaled.shape[1],))


# 손실 함수 및 평가 지표 설정
msle = tf.keras.losses.MeanSquaredLogarithmicError()
rmse = tf.keras.metrics.RootMeanSquaredError()
model.compile(loss=msle, optimizer='adam', metrics=['mae', 'mean_squared_error', msle, rmse])

# 학습 파라미터 설정
num_epochs = 300
batch_size = 64

# 학습
history = model.fit(X_train_scaled, y_train.values, epochs=num_epochs, batch_size=batch_size, validation_data=(X_val_scaled, y_val))

# 결과 출
print("Train Loss:", history.history['loss'][-1])
print("Validation Loss:", history.history['val_loss'][-1])


# 학습 및 검증 결과 계산
train_pred = model.predict(X_train_scaled)
val_pred = model.predict(X_val_scaled)

train_mse = mean_squared_error(y_train, train_pred)
train_mae = mean_absolute_error(y_train, train_pred)
train_rmse = np.sqrt(train_mse)
train_r2 = r2_score(y_train, train_pred)

val_mse = mean_squared_error(y_val, val_pred)
val_mae = mean_absolute_error(y_val, val_pred)
val_rmse = np.sqrt(val_mse)
val_r2 = r2_score(y_val, val_pred)


# 결과 출력
print("Train Results:")
print(f"MSE: {train_mse:.4f}, MAE: {train_mae:.4f}, RMSE: {train_rmse:.4f}, R²: {train_r2:.4f}")

print("\nValidation Results:")
print(f"MSE: {val_mse:.4f}, MAE: {val_mae:.4f}, RMSE: {val_rmse:.4f}, R²: {val_r2:.4f}")


# 한글 폰트 설정
from matplotlib import font_manager, rc



# 모델 학습 결과 저장된 변수 (예시: history 객체)
r = history.history

# 각 지표에 대한 이력 추출
mse = r['mean_squared_error']  # 정확도
val_mse = r['val_mean_squared_error']  # 정확도 검증
mae = r['mae']  # 평균 절대 오차
val_mae = r['val_mae']  # 평균 절대 오차 검증
rmse = r['root_mean_squared_error']  # 제곱근 평균 제곱 오차
val_rmse = r['val_root_mean_squared_error']  # 제곱근 평균 제곱 오차 검증
loss = r['loss']  # 오차율
val_loss = r['val_loss']  # 오차율 검증
epochs = range(1, len(rmse) + 1)  # 학습 횟수


# MSE 그래프
plt.figure()
plt.plot(epochs, mse, 'b', label='Train data mse')
plt.plot(epochs, val_mse, 'r', label='Test data mse')
plt.title('Train(blue), Test(red) mse loss graph')
plt.legend()

# MAE 그래프
plt.figure()
plt.plot(epochs, mae, 'b', label='Train data mae')
plt.plot(epochs, val_mae, 'r', label='Test data mae')
plt.title('Train(blue), Test(red) mae loss graph')
plt.legend()

# RMSE 그래프
plt.figure()
plt.plot(epochs, rmse, 'b', label='Train data RMSE')
plt.plot(epochs, val_rmse, 'r', label='Test data RMSE')
plt.title('Learning performance status graph')
plt.legend()


# 오차율 그래프
plt.figure()
plt.plot(epochs, loss, 'b', label='Train set error rate')
plt.plot(epochs, val_loss, 'r', label='Test set error rate')
plt.title('Train(blue), Test(red) Error rate reduction status graph during data learning')
plt.legend()
plt.show()


def clarke_error_grid(ref_values, pred_values, title_string):
    #Checking to see if the lengths of the reference and prediction arrays are the same
    assert (len(ref_values) == len(pred_values)), "Unequal number of values (reference : {}) (prediction : {}).". format(len(ref_values), len(pred_values))
    #Checks to see if the values are within the normal physiological range, otherwise it gives a warning
    if max(ref_values) > 400 or max(pred_values) > 400:
        print ("Input Warning: the maximum reference value {} or the maximum prediction value {} exceeds the normal physiological range of glucose (<400 mg/dl).".format(max(ref_values), max(pred_values)))
    if min(ref_values) < 0 or min(pred_values) < 0:
        print ("Input Warning: the minimum reference value {} or the minimum prediction value {} is less than 0 mg/dl.".format(min(ref_values),  min(pred_values)))
    #Clear plot
    plt.clf()
    #Set up plot
    plt.scatter(ref_values, pred_values, marker='o', color='black', s=8)
    plt.title(title_string + " Clarke Error Grid")
    plt.xlabel("Reference Concentration (mg/dl)")
    plt.ylabel("Prediction Concentration (mg/dl)")
    plt.xticks([0, 50, 100, 150, 200, 250, 300, 350, 400])
    plt.yticks([0, 50, 100, 150, 200, 250, 300, 350, 400])
    plt.gca().set_facecolor('white')
    #Set axes lengths
    plt.gca().set_xlim([0, 400])
    plt.gca().set_ylim([0, 400])
    plt.gca().set_aspect((400)/(400))
    #Plot zone lines
    plt.plot([0,400], [0,400], ':', c='black')                      #Theoretical 45 regression line
    plt.plot([0, 175/3], [70, 70], '-', c='black')
    #plt.plot([175/3, 320], [70, 400], '-', c='black')
    plt.plot([175/3, 400/1.2], [70, 400], '-', c='black')           #Replace 320 with 400/1.2 because 100*(400 - 400/1.2)/(400/1.2) =  20% error
    plt.plot([70, 70], [84, 400],'-', c='black')
    plt.plot([0, 70], [180, 180], '-', c='black')
    plt.plot([70, 290],[180, 400],'-', c='black')
    # plt.plot([70, 70], [0, 175/3], '-', c='black')
    plt.plot([70, 70], [0, 56], '-', c='black')                     #Replace 175.3 with 56 because 100*abs(56-70)/70) = 20% error
    # plt.plot([70, 400],[175/3, 320],'-', c='black')
    plt.plot([70, 400], [56, 320],'-', c='black')
    plt.plot([180, 180], [0, 70], '-', c='black')
    plt.plot([180, 400], [70, 70], '-', c='black')
    plt.plot([240, 240], [70, 180],'-', c='black')
    plt.plot([240, 400], [180, 180], '-', c='black')
    plt.plot([130, 180], [0, 70], '-', c='black')
    #Add zone titles
    plt.text(30, 15, "A", fontsize=15)
    plt.text(370, 260, "B", fontsize=15)
    plt.text(280, 370, "B", fontsize=15)
    plt.text(160, 370, "C", fontsize=15)
    plt.text(160, 15, "C", fontsize=15)
    plt.text(30, 140, "D", fontsize=15)
    plt.text(370, 120, "D", fontsize=15)
    plt.text(30, 370, "E", fontsize=15)
    plt.text(370, 15, "E", fontsize=15)

    #Statistics from the data
    zone = [0] * 5
    for i in range(len(ref_values)):
        if (ref_values[i] <= 70 and pred_values[i] <= 70) or (pred_values[i] <= 1.2*ref_values[i] and pred_values[i] >= 0.8*ref_values[i]):
            zone[0] += 1    #Zone A
        elif (ref_values[i] >= 180 and pred_values[i] <= 70) or (ref_values[i] <= 70 and pred_values[i] >= 180):
            zone[4] += 1    #Zone E
        elif ((ref_values[i] >= 70 and ref_values[i] <= 290) and pred_values[i] >= ref_values[i] + 110) or ((ref_values[i] >= 130 and ref_values[i] <= 180) and (pred_values[i] <= (7/5)*ref_values[i] - 182)):
            zone[2] += 1    #Zone C
        elif (ref_values[i] >= 240 and (pred_values[i] >= 70 and pred_values[i] <= 180)) or (ref_values[i] <= 175/3 and pred_values[i] <= 180 and pred_values[i] >= 70) or ((ref_values[i] >= 175/3 and ref_values[i] <= 70) and pred_values[i] >= (6/5)*ref_values[i]):
            zone[3] += 1    #Zone D
        else:
            zone[1] += 1    #Zone B
    return plt, zone


# Clarke Error Grid 함수 호출
# 검증 데이터셋을 사용하여 예측을 진행
y_val_pred = model.predict(X_val_scaled)


# 먼저 y_val과 y_val_pred가 NumPy 배열인지 확인
# Pandas Series나 DataFrame일 경우 .values 속성을 사용하여 NumPy 배열로 변환
y_val_array = y_val.values if isinstance(y_val, (pd.Series, pd.DataFrame)) else y_val
y_val_pred_array = y_val_pred.values if isinstance(y_val_pred, (pd.Series, pd.DataFrame)) else y_val_pred

# Clarke Error Grid 함수 호출
plt, zone = clarke_error_grid(y_val_array, y_val_pred_array.flatten(), 'blood_sugar')

print(zone)
plt.show()


model.save(r'C:\Users\gjaischool\Desktop\model/cellu.h5')

import joblib
import sys
sys.modules['sklearn.externals.joblib'] = joblib
from joblib import dump, load

dump(scaler, '/content/drive/MyDrive/인공지능사관학교/프로젝트/robu.bin', compress=True)

import tensorflow as tf
from tensorflow.keras.losses import MeanSquaredLogarithmicError

model_path = '/content/drive/MyDrive/인공지능사관학교/프로젝트/cellu.h5'  # 모델 파일 경로 지정

# 모델을 불러올 때 custom_objects 인자를 사용
model = tf.keras.models.load_model(model_path, custom_objects={'MeanSquaredLogarithmicError': MeanSquaredLogarithmicError})

# 모델 구조 확인
model.summary()


import tensorflow as tf

model = tf.keras.models.load_model(r'C:\Users\gjaischool\Desktop\model/cellu.h5', compile=False)


msle = tf.keras.losses.MeanSquaredLogarithmicError()
model.compile(loss=msle, optimizer='adam', metrics=['acc'])

from sklearn import metrics

def print_evaluate(true, predicted, train=True):
    mae = metrics.mean_absolute_error(true, predicted)
    mse = metrics.mean_squared_error(true, predicted)
    rmse = np.sqrt(metrics.mean_squared_error(true, predicted))
    r2_square = metrics.r2_score(true, predicted)
    if train:
        print("========Training Result=======")
        print('MAE: ', mae)
        print('MSE: ', mse)
        print('RMSE: ', rmse)
        print('R2 score: ', r2_square)
    elif not train:
        print("=========Testing Result=======")
        print('MAE: ', mae)
        print('MSE: ', mse)
        print('RMSE: ', rmse)
        print('R2 score: ', r2_square)

import math
import pandas as pd
test_df = pd.read_csv(r'/content/drive/MyDrive/인공지능사관학교/프로젝트/AI_data_1.csv')
test_df = test_df[['HR', 'HRV', 'SDNN', 'RMSSD', 'PNN50', 'VLF', 'LF', 'HF', 'Frequency_Ratio', 'gender', 'age', 'blood_sugar']]
print(test_df)
#test_result_df = test_df
test_avg=pd.DataFrame(test_df.mean()).transpose()

# DM =diabetes class
print('=======test_df======')
print(test_df.info())

# Cloumns Separation of  validation data
testX2 = test_df.drop( labels='blood_sugar', axis = 1 )
testy2 = test_df['blood_sugar']
testX2_avg = test_avg.drop( labels='blood_sugar', axis = 1 )
testy2_avg = test_avg['blood_sugar']
print("==============================")


## Save the model to the computer - check the path

# Source code that is actually applied
# realtest  predict
# Read and apply actual application data here!
# !!!!!!!!!!!do not change!.!!!!!!!!!!!
# StandardScaler standardization work
# scaler = RobustScaler()
# X_stand= scaler.fit_transform(standardX)
from sklearn.preprocessing import RobustScaler
scaler = RobustScaler()

# Applying StandardScaler here!
testX2 = scaler.fit_transform(testX2)
testX2_avg = scaler.transform(testX2_avg)

print('======testy_predict======')
print(testX2)
testy2_predict = model.predict(testX2)
testy2_predict_avg = model.predict(testX2_avg)

test_df['predict_result'] = testy2_predict
test_df.to_csv(r"AI_cellu.csv")

print('======testy_predict======')

# evaluate act model
print("============ evaluate result real  ==========")
print_evaluate(testy2, testy2_predict, train=True)
print_evaluate(testy2_avg, testy2_predict_avg, train=True)
#======================================================
# Comparison of predicted and actual values
cnt_diff_0 = 0
cnt_diff_1 = 0
cnt_diff_2 = 0
cnt_diff_5 = 0
cnt_diff_10 = 0
index_ = []
prediction_list = []
prediction_list_avg = []
testy2_predict = model.predict(testX2)
testy2_predict_avg = model.predict(testX2_avg)

for i in range(len(testy2_predict)):
    label = testy2[i]
    prediction = math.floor(testy2_predict[i])
    prediction_list.append(prediction)
    diff_val = abs(prediction-label).round(2)
    #print('{:}. RealSugar| {:} | PredictSugar| {:} | 차이값 | {:}'.format(i, label, prediction, diff_val ))
    diff_val = abs(prediction-label).round(0)
    if diff_val > 10 :
        cnt_diff_10 += 1
        index_.append(i)
    elif diff_val > 5 :
        cnt_diff_5 += 1
    elif diff_val > 2 :
        cnt_diff_2 += 1
    elif diff_val > 0 :
        cnt_diff_1 += 1
    elif diff_val == 0 :
        cnt_diff_0 += 1
#======================================================
print('='*25)
print( f'검증 데이터 개수 : {len(testy2_predict)}' )
print( f'차이 없음 : {cnt_diff_0}' )
print('='*25)
print( f'0이상 차이나는 값들 : {cnt_diff_1}' )
print( f'2이상 차이나는 값들 : {cnt_diff_2}' )
print( f'5이상 차이나는 값들 : {cnt_diff_5}' )
print( f'10이상 차이나는 값들 : {cnt_diff_10}' )
#print( f'10차이 인덱스 : {index_}' )
print('총 데이터 결과의 평균 == RealSugar| {:} | PredictSugar| {:}'.format(label, sum(prediction_list)/len(prediction_list)))

for i in range(len(testy2_predict_avg)):
    label = testy2_avg[i]
    prediction = math.floor(testy2_predict_avg[i])
    prediction_list_avg.append(prediction)
    diff_val = abs(prediction-label).round(2)
    #print('{:}. RealSugar| {:} | PredictSugar| {:} | 차이값 | {:}'.format(i, label, prediction, diff_val ))
    diff_val = abs(prediction-label).round(0)
    if diff_val > 10 :
        cnt_diff_10 += 1
        index_.append(i)
    elif diff_val > 5 :
        cnt_diff_5 += 1
    elif diff_val > 2 :
        cnt_diff_2 += 1
    elif diff_val > 0 :
        cnt_diff_1 += 1
    elif diff_val == 0 :
        cnt_diff_0 += 1
#======================================================
print('='*25)
print( f'검증 데이터 개수 : {len(testy2_predict)}' )
print( f'차이 없음 : {cnt_diff_0}' )
print('='*25)
print( f'0이상 차이나는 값들 : {cnt_diff_1}' )
print( f'2이상 차이나는 값들 : {cnt_diff_2}' )
print( f'5이상 차이나는 값들 : {cnt_diff_5}' )
print( f'10이상 차이나는 값들 : {cnt_diff_10}' )
print('평균의 데이터(기존모델) == RealSugar| {:} | PredictSugar| {:}'.format(label, sum(prediction_list_avg)/len(prediction_list_avg)))

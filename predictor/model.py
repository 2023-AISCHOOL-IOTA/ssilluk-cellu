#!/usr/bin/env python
# coding: utf-8
import pandas as pd
import numpy as np
import sys
import seaborn
import matplotlib.pyplot as plt

df = pd.read_csv('/content/drive/MyDrive/인공지능사관학교/프로젝트/AI_data_1.csv')
result_df = df
# 실제 데이터
# del df['age']
# del df['agegroup']
# del df['bloodcategory']
# del df['blood_sugar']

df1 = pd.read_csv('/content/drive/MyDrive/인공지능사관학교/프로젝트/AI_data_1.csv')
# del df1['age']
# del df1['agegroup']
# del df1['bloodcategory']
# del df1['blood_sugar']

# df2 = df[df['DM'] == 0]

df.columns

#del df['agegroup']
#del df['SEQ']

df

###################### correlation heatmap ###############
# plt.figure(figsize=(15,15))
# ax = seaborn.heatmap(data=df.corr(), annot=True, fmt='.3f', linewidths=.5, cmap='Blues')
# # plt 3.1.1 버그로 인해 다음 코드 넣음
# buttom, top = ax.get_ylim()
# ax.set_ylim(buttom+0.5, top-0.5)
# plt.show()
##########################################################

import scipy.stats as stats

X = df.drop('blood_sugar',axis=1)
print(X)
y = df['blood_sugar']
print("==============================")
X1 = df.drop('blood_sugar',axis=1)
y1 = df['blood_sugar']

from sklearn.model_selection import train_test_split
from sklearn.preprocessing import MinMaxScaler
from sklearn.preprocessing import StandardScaler
from sklearn.preprocessing import RobustScaler

# X_train, X_test, y_train, y_test = train_test_split(X,y,test_size=0.2,random_state=256)
X_train, X_test, y_train, y_test = train_test_split(X,y,test_size=0.2,random_state=101)

# Scaler 적용
scaler = RobustScaler()
# scaler = MinMaxScaler()
# scaler = StandardScaler()

X_train= scaler.fit_transform(X_train)
X_test = scaler.transform(X_test)

# scale 변환
X1 = scaler.transform(X1)

print(X_train.shape)
print(X_test.shape)

# In[4]:

from keras.models import Sequential
from keras.layers import Input, Dense, Activation, Dropout
# from keras.layers import advanced_activations
from keras.optimizers import Adam
from tensorflow.python.keras import initializers
from tensorflow.python.keras import regularizers
import tensorflow as tf

# In[5]:

model = tf.keras.Sequential([
    tf.keras.layers.Dense(512, kernel_initializer='he_normal', activation='relu'),
    tf.keras.layers.Dense(320, kernel_initializer='he_normal', activation='relu'),
    tf.keras.layers.Dense(256, kernel_initializer='he_normal', activation='relu'),
    tf.keras.layers.Dense(192, kernel_initializer='he_normal',activation='relu'),
    tf.keras.layers.Dense(64, kernel_initializer='he_normal',activation='relu'),
    tf.keras.layers.Dense(256, kernel_initializer='he_normal',activation='relu'),
    tf.keras.layers.Dense(128, kernel_initializer='he_normal',activation='relu'),
    tf.keras.layers.Dense(64, kernel_initializer='he_normal',activation='relu'),
    tf.keras.layers.Dense(32, kernel_initializer='he_normal',activation='relu'),
    tf.keras.layers.Dense(1, kernel_initializer='ones',activation='linear')
])

rmse = tf.keras.metrics.RootMeanSquaredError()
# tf.ke
msle = tf.keras.losses.MeanSquaredLogarithmicError()
model.compile(loss= msle, optimizer='adam', metrics=['mae','mean_squared_error',msle,rmse])

# In[6]:

# opt value is 80.
r = model.fit(X_train, y_train.values, epochs=400, batch_size=1100, validation_split = 0.2)

#import matplotlib.pyplot as plt

from matplotlib import font_manager, rc
# font_name = font_manager.FontProperties(fname='c:/Windows/Fonts/malgun.ttf').get_name()
# rc('font', family=font_name)

# msle = r.history['mean_square_logarithmic_error']  # 정확도
# val_msle = r.history['mean_square_logarithmic_error']  # 정확도 검증

mse = r.history['mean_squared_error']  # 정확도
val_mse = r.history['val_mean_squared_error']  # 정확도 검증
mae = r.history['mae']  # 정확도
val_mae = r.history['val_mae']  # 정확도 검증
acc = r.history['root_mean_squared_error']  # 정확도
val_acc = r.history['val_root_mean_squared_error']  # 정확도 검증
loss = r.history['loss']  # 오차율
val_loss = r.history['val_loss']  # 오차율 검증
epochs = range(1, len(acc) + 1)  # 학습횟수

# plt.plot(epochs, msle, 'b', label='학습 데이터 msle')  # 그래프로
# plt.plot(epochs, val_msle, 'r', label='검증 데이터 msle')
# plt.title('학습(파란색), 검증(빨간색) 데이터 학습중 msle 감소 현황 그래프')
# plt.legend()

plt.figure()
plt.plot(epochs, mse, 'b', label='Train data mse')  # 그래프로
plt.plot(epochs, val_mse, 'r', label='Test data mse')
plt.title('Train(blue), Test(red) mse loss graph')
plt.legend()

plt.figure()
plt.plot(epochs, mae, 'b', label='Train data mae')  # 그래프로
plt.plot(epochs, val_mae, 'r', label='Test data mae')
plt.title('Train(blue), Test(red) mae loss graph')
plt.legend()

# Train and validation accuracy
plt.figure()
# plt.plot(epochs, acc, 'b', label='학습 데이터 RMSE : 1.887492')  # 그래프로
plt.plot(epochs, val_acc, 'r', label='performance indicators = RMSE ')
plt.title('Learning performance status graph')
plt.legend()

plt.figure()
# Train and validation loss
plt.plot(epochs, loss, 'b', label='Train set error rate')
plt.plot(epochs, val_loss, 'r', label='Test set error rate')
plt.title('Train(blue), Test(red) Error rate reduction status graph during data learning')
plt.legend()
plt.show()

# In[11]:

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

y_train_pred = model.predict(X_train)
y_test_pred = model.predict(X_test)

# X1 predict
y1_predict = model.predict(X1)

print_evaluate(y_train, y_train_pred, train=True)
print_evaluate(y_test, y_test_pred, train=False)
print("================== result  측정데이터를 입력하여 검증================")
print_evaluate(y1, y1_predict, train=False)

result_df['predict_result'] = y1_predict
result_df.to_csv(r'result_1121.csv')
print(abs(y1_predict))

#=========================================
# import matplotlib.pyplot as plt

# This function takes in the reference values and the prediction values as lists and returns a list with each index corresponding to the total number
# of points within that zone (0=A, 1=B, 2=C, 3=D, 4=E) and the plot
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
  # Set axes lengths
  plt.gca().set_xlim([0, 400])
  plt.gca().set_ylim([0, 400])
  plt.gca().set_aspect((400)/(400))
  # Plot zone lines
  plt.plot([0,400], [0,400], ':', c='black')
  # Theoretical 45 regression line
  plt.plot([0, 175/3], [70, 70], '-', c='black')
  #plt.plot([175/3, 320], [70, 400], '-', c='black')
  plt.plot([175/3, 400/1.2], [70, 400], '-', c='black')
  # Replace 320 with 400/1.2 because 100*(400 - 400/1.2)/(400/1.2) =  20% error
  plt.plot([70, 70], [84, 400],'-', c='black')
  plt.plot([0, 70], [180, 180], '-', c='black')
  plt.plot([70, 290],[180, 400],'-', c='black')
  # plt.plot([70, 70], [0, 175/3], '-', c='black')
  plt.plot([70, 70], [0, 56], '-', c='black')
  # Replace 175.3 with 56 because 100*abs(56-70)/70) = 20% error
  # plt.plot([70, 400],[175/3, 320],'-', c='black')
  plt.plot([70, 400], [56, 320],'-', c='black')
  plt.plot([180, 180], [0, 70], '-', c='black')
  plt.plot([180, 400], [70, 70], '-', c='black')
  plt.plot([240, 240], [70, 180],'-', c='black')
  plt.plot([240, 400], [180, 180], '-', c='black')
  plt.plot([130, 180], [0, 70], '-', c='black')
  # Add zone titles
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

#=========================================
### def clarke_error_grid(ref_values, pred_values, title_string):
plt, zone = clarke_error_grid(y1, y1_predict, 'Blood Glucose')

print(zone)
plt.show()

# 모델을 프로그램에서 반복사용하기 위한 결과셋 저장 루틴
# model.save('matis_bg.h5')
# import joblib
# import sys
# sys.modules['sklearn.externals.joblib'] = joblib
# from joblib import dump, load
# dump(scaler, 'std_diabetes_20210515.bin', compress=True)

import socket
from PIL import Image
import numpy as np
import matplotlib.pyplot as plt
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense, Dropout, Flatten
from tensorflow.keras.layers import Conv2D, MaxPooling2D
from tensorflow.keras.optimizers import RMSprop
# 한글등록
from matplotlib import font_manager, rc  # rc : resource

# 추가설정 - 폰트를 변경하면 -표시가 ㅁ으로 변경되기에 '-'를 변경하지 않도록 지정
plt.rcParams['axes.unicode_minus'] = False

fong_loc = "c:/Windows/Fonts/malgun.ttf"  # 글꼴 경로
font_name = font_manager.FontProperties(fname=fong_loc).get_name()
# print(font_name) # 폰트매니저를 통해 인식하고 있는 글꼴 이름을 가져온다
rc('font', family=font_name)  # 리소스에 글꼴을 등록

import csv

# csv로 저장한 라벨 list로 받아오기
label = []
f = open("label.csv", 'r', encoding='utf-8-sig')
rea = csv.reader(f)
for row in rea:
    for i in row:
        label.append(i)
f.close

im_rows = 32  # 이미지의 높이
im_cols = 32  # 이미지의 너비
im_color = 3  # 이미지의 색공간
in_shape = (im_rows, im_cols, im_color)
nb_classes = len(label)

# CNN 모델 정의하기
def def_model(in_shape, nb_classes):
    model = Sequential()
    model.add(Conv2D(32,
                     kernel_size=(3, 3),
                     activation='relu',
                     input_shape=in_shape))
    model.add(Conv2D(32, (3, 3), activation='relu'))
    model.add(MaxPooling2D(pool_size=(2, 2)))
    model.add(Dropout(0.25))

    model.add(Conv2D(64, (3, 3), activation='relu'))
    model.add(Conv2D(64, (3, 3), activation='relu'))
    model.add(MaxPooling2D(pool_size=(2, 2)))
    model.add(Dropout(0.25))

    model.add(Flatten())
    model.add(Dense(512, activation='relu'))
    model.add(Dropout(0.5))
    model.add(Dense(nb_classes, activation='softmax'))
    return model


# 컴파일하고 모델 반환하기
def get_model(in_shape, nb_classes):
    model = def_model(in_shape, nb_classes)
    model.compile(
        loss='categorical_crossentropy',
        optimizer=RMSprop(),
        metrics=['accuracy'])
    return model


# 저장한 CNN 모델 읽어 들이기
model = get_model(in_shape, nb_classes)
model.load_weights('images-model.hdf5')


def check_photo(path):
    # 이미지 읽어 들이기
    img = Image.open(path)
    img = img.convert("RGB")  # 색공간 변환하기
    img = img.resize((im_cols, im_rows))  # 크기 변경하기
    plt.imshow(img)
    # plt.show()
    # 데이터 변환하기
    x = np.asarray(img)
    x = x.reshape(-1, im_rows, im_cols, im_color)
    x = x / 255

    # 예측하기
    pre = model.predict([x])[0]
    idx = pre.argmax()
    per = int(pre[idx] * 100)
    return (idx, per)


def check_photo_str(path):
    idx, per = check_photo(path)
    # 응답하기
    # print("이 사진은", label[idx], "입니다.")
    # print("가능성은", per, "%")
    return label[idx]

# TCP/IP 소켓을 생성하고
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# 소켓을 포트에 연결
server_address = ('localhost', 10000)
print('Startinf up on {} port {}'.format(*server_address))
sock.bind(server_address)

# 연결을 기다림
sock.listen()

while True:
    #연결을 기다림
    print('통신 대기중입니다')
    connection, client_address = sock.accept()
    try:
        print('접속 시도한 아이피 :', client_address)

        #작은 데이터를 받고 다시 전송
        while True:
            data = connection.recv(300)
            print('이미지 검색을 실행한 유저 : {!r}'.format(data))
            if data:
                print('이미지 검색을 실행후 결과를 보내줍니다')
                data = check_photo_str(data)
                print(data)
                connection.send(str(data).encode())
            else:
                print('받은 데이터가 없습니다, 로그인 필요', client_address)
            break
    finally:
        # 연결 모두 지움
        print("통신이 종료되었습니다")
        connection.close()
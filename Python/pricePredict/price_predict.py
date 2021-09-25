import pymysql
import pandas as pd
import numpy as np
from statsmodels.tsa.arima_model import ARIMA
import warnings
import socket

warnings.filterwarnings("ignore")

df = pd.read_csv('week.csv', header=None, encoding="utf-8")
df.columns = ['research_date', 'product_name', 'price']
df.dropna(inplace=True)


def select_product(product_name):
    product_df = df[df['product_name'] == product_name]
    product_df = product_df[['research_date', 'price']].sort_values(by=['research_date'], axis=0)
    product_df['research_date'] = pd.to_datetime(product_df.research_date, format='%Y-%m-%d')
    product_df.set_index('research_date', inplace=True)
    return product_df


def predict_price(product_name):
    product_df = select_product(product_name)
    len = product_df.shape[0]
    if len == 0:
        print('가격 데이터가 없습니다')
        print('-' * 50)
        return 'error'
    else:
        order = (1, 0, 0)
        model = ARIMA(product_df, order)
        fit = model.fit(disp=0)

        preds = fit.predict(0, len - 1, typ='levels')
        i = np.where(preds == preds[len - 1])
        preds = fit.predict(0, len + 5, typ='levels')
        one_week = preds[i[0][0] + 1]
        two_week = preds[i[0][0] + 2]
        three_week = preds[i[0][0] + 3]
        four_week = preds[i[0][0] + 4]
        five_week = preds[i[0][0] + 5]
        return one_week, two_week, three_week, four_week, five_week


# TCP/IP 소켓을 생성하고
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# 소켓을 포트에 연결
server_address = ('localhost', 9999)
print('Startinf up on {} port {}'.format(*server_address))
sock.bind(server_address)

# 연결을 기다림
sock.listen()

while True:
    # 연결을 기다림
    print('통신 대기중입니다')
    connection, client_address = sock.accept()
    try:
        print('접속 시도한 아이피 :', client_address)

        # 작은 데이터를 받고 다시 전송
        while True:
            data = connection.recv(128)
            data = f'{data.decode()}'
            if data:
                print('{}의 가격 예측을 시작합니다'.format(data))
                # check_photo_str(data) 나중에 유저 아이디를 받으면 실행함
                data = predict_price(data)
                if data != 'error':
                    for i in range(len(data)):
                        connection.send(str(i).encode())
                        connection.send('\n'.encode())
                        connection.send(str(data[i]).encode())
                        connection.send('\n'.encode())
                else:
                    connection.send(data.encode())
            else:
                print('받은 데이터가 없습니다, 로그인 필요', client_address)
            break
    finally:
        # 연결 모두 지움
        print("통신이 종료되었습니다")
        connection.close()





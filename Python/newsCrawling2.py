from bs4 import BeautifulSoup
from selenium import webdriver
import pymysql
import socket


def productNews(keyword):
    if keyword.find('('):
        keyword = keyword.split('(')[0]
    newsTitles = []
    newsLinks = []
    # 옵션 생성
    options = webdriver.ChromeOptions()
    # 창 숨기는 옵션 추가
    options.add_argument("headless")

    # -------------------------------1. 웹 페이지 접근
    driver = webdriver.Chrome('./webdriver/chromedriver', options=options)

    # 페이지 접근

    # 중복 체크할 리스트 선언
    news_titles = []
    url = 'https://search.naver.com/search.naver?where=news&sm=tab_jum&query='
    # 뉴스 키워드 입력
    url += keyword
    url = driver.get(url)
    html = driver.page_source
    soup = BeautifulSoup(html, 'html.parser')
    news = soup.select('ul.list_news > li.bx')
    for ns in news:
        link = ns.find('a')["data-url"]
        title = ns.select_one('div.news_area > a').text
        if title not in news_titles:
            news_titles.append(title)
            newsTitles.append(title)
            newsLinks.append(link)
    driver.quit()
    return newsTitles, newsLinks


# TCP/IP 소켓을 생성하고
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# 소켓을 포트에 연결
server_address = ('localhost', 9998)
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
                print('{}의 뉴스 크롤링을 시작합니다'.format(data))
                titles, links = productNews(data)
                for i in range(len(titles)):
                    print('{}번째 제목 : {}'.format(i, titles[i]))
                    print('{}번째 링크 : {}'.format(i, links[i]))
                    connection.send(str(i).encode())
                    connection.send('\n'.encode())
                    connection.send(titles[i].encode())
                    connection.send('\n'.encode())
                    connection.send(links[i].encode())
                    # if i != (len(titles) - 1):
                    #     print((len(titles)-1))
                    #     connection.send('\n'.encode())
                    if i != 4:
                        print((len(titles)-1))
                        connection.send('\n'.encode())
                    elif i == 4:
                        break
            else:
                print('받은 데이터가 없습니다, 로그인 필요', client_address)
            break
    finally:
        # 연결 모두 지움
        print("통신이 종료되었습니다")
        connection.close()
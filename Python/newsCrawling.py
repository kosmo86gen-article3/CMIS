from bs4 import BeautifulSoup
from selenium import webdriver
import pymysql
import schedule
import time

def insertNews(title, link, keyword, press, content, img):
    # MySQL Connection 연결
    conn = pymysql.connect(host='c-mis.c3kq47xdfoyw.ap-northeast-2.rds.amazonaws.com', user='admin', password='3whdhkdkdlemf!', db='project', charset='utf8' )

    curs = conn.cursor(pymysql.cursors.DictCursor)

    sql = """insert into CMIS_NEWS(news_title, news_link, news_hits, news_keyword, news_press, news_content, news_img) values (%s, %s, 0, %s, %s, %s, %s)"""
    curs.execute(sql, (title, link, keyword, press, content, img))
    conn.commit()

def job():
    #-------------------------------1. 웹 페이지 접근
    # 옵션 생성
    options = webdriver.ChromeOptions()
    # 창 숨기는 옵션 추가
    options.add_argument("headless")
    driver = webdriver.Chrome('C:/workspace/python/finalProject/webdriver/chromedriver', options=options)
    driver.implicitly_wait(3)
    # 페이지 접근
    keywords = ['물가','소비자','인상']
    # 중복 체크할 리스트 선언
    news_titles = []
    # 크롤링할 페이지수 선택
    pages = range(1,3)
    for keyword in keywords:
        driver.implicitly_wait(3)
        url = 'https://search.naver.com/search.naver?where=news&query='
        # 뉴스 키워드 입력
        url += keyword
        # 1주 단위 검색
        url += '&sm=tab_opt&sort=0&photo=0&field=0&pd=1&ds=&de=&docid=&related=0&mynews=0&office_type=0&office_section_code=0&news_office_checked=&nso=so%3Ar%2Cp%3A1w&is_sug_officeid=0&start='
        url = driver.get(url)
        for i in pages:
            driver.implicitly_wait(3)
            html = driver.page_source
            soup = BeautifulSoup(html, 'html.parser')
            news = soup.select('ul.list_news > li.bx')
            for ns in news:
                link = ns.find('a')["data-url"]
                title = ns.select_one('div.news_area > a').text.replace('"','`').replace("'","`")
                press3 = ns.select_one('div.info_group > a').text
                press2 = press3.split(" ")
                press = press2[0]
                content = ns.select_one('div.dsc_wrap > a').text.replace('"','`').replace("'","`")
                img2 = ns.select_one('li.bx > div > a > img')
                if img2 is not None:
                    img = img2.get("src")
                elif img2 is None:
                    img = ""

                if title not in news_titles:
                    news_titles.append(title)
                    insertNews(title, link, keyword, press, content, img)


            # 페이징 처리
            driver.find_elements_by_css_selector('div.sc_page_inner > a:nth-child({})'.format(i+1))[0].click()

    driver.quit()

# schedule.every().monday.at("01:00").do(job)

#무한 루프를 돌면서 스케쥴을 유지한다.
# while True:
#     schedule.run_pending()
#     time.sleep(1)

job()
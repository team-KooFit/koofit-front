import requests
import re
import json
import html 
from datetime import datetime
import calendar

def get_menu_by_date(data, date):
    if date in data:
        return data[date]
    else:
        return None


#오늘 날짜 계산
today = datetime.today()
today_date =  today.date()

# 이번 달의 첫 번째 날을 계산
first_day_of_month = today.replace(day=1)

# 이번 달의 마지막 날을 계산
_, last_day_of_month = calendar.monthrange(today.year, today.month)

# 날짜를 원하는 형식으로 포맷팅
formatted_first_day = first_day_of_month.strftime("%Y-%m-%d")
formatted_last_day = today.replace(day=last_day_of_month).strftime("%Y-%m-%d")

print("이번 달의 첫 번째 날:", formatted_first_day)
print("이번 달의 마지막 날:", formatted_last_day)


url = f'https://kmucoop.kookmin.ac.kr/menu/menujson.php?callback=jQuery112408319456905698375_1699929495522&sdate={formatted_first_day}&edate={formatted_last_day}&today={today_date}&_=1699929495523'

try:
    response = requests.get(url)
    response.raise_for_status()  # 나쁜 응답에 대해 HTTPError를 발생시킴

    # 정규 표현식을 사용하여 JSON 데이터 추출
    match = re.search(r'\((.*)\)', response.text)
    if match:
        json_data = match.group(1)

        # JSON 데이터 파싱
        data = json.loads(json_data)

        #날짜 순으로 데이터형식 변경
        date_data = {}

        for 식당, 날짜_메뉴 in data.items():
            for 날짜, 메뉴 in 날짜_메뉴.items():
                if 날짜 not in date_data:
                    date_data[날짜] = {}
                if 식당 not in date_data[날짜]:
                    date_data[날짜][식당] = set()
                date_data[날짜][식당].update(메뉴)

        # print(date_data)

       
        search_date = '2023-11-19'
        result = get_menu_by_date(date_data, search_date)


        if result:
            print(f"날짜 {search_date}의 메뉴 정보:")
            for 식당, 메뉴 in result.items():
                print(f"{식당}: {메뉴}")
        else:
            print(f"날짜 {search_date}에 대한 정보가 없습니다.")



    else:
        print("JSON 데이터를 찾을 수 없습니다.")

except requests.exceptions.HTTPError as http_err:
    print(f"HTTP 오류가 발생했습니다: {http_err}")

except Exception as e:
    print(f"오류가 발생했습니다: {e}")


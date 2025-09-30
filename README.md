# คู่มือการทำงานของระบบ AdvRobot

## รายละเอียดโครงการ

AdvRobot เป็นโครงการที่ใช้สำหรับการทดสอบระบบอัตโนมัติ ซึ่งประกอบด้วย:
- API Testing ด้วย Python และ Requests
- Web UI Testing ด้วย Robot Framework และ Selenium
- การจัดการรายงานการทดสอบ

## โครงสร้างของโครงการ

```
advrobot/
├── Test/                 # ไดเรกทอรีหลักสำหรับการทดสอบ
│   ├── app.py           # แอปพลิเคชัน Flask สำหรับการทดสอบ API
│   ├── test_api.py      # การทดสอบ API ด้วย Python
│   ├── *.robot          # ไฟล์ทดสอบ Robot Framework
│   └── results/         # รายงานการทดสอบ
├── resources/           # ทรัพยากรที่ใช้ร่วมกัน
└── results/            # ผลลัพธ์การทดสอบรวม
```

## ความต้องการของระบบ

- Python 3.13 หรือสูงกว่า
- UV (Python package manager) - แนะนำ
- แพ็กเกจที่จำเป็น:
  - flask
  - pytest
  - pytest-html
  - requests
  - robotframework
  - robotframework-seleniumlibrary
  - selenium

## การติดตั้ง

### วิธีที่ 1: ใช้ UV (แนะนำ)

1. ติดตั้ง UV (หากยังไม่ได้ติดตั้ง):
   ```
   pip install uv
   ```

2. โคลน repository:
   ```
   git clone <repository-url>
   cd advrobot
   ```

3. สร้างและติดตั้งแพ็กเกจที่จำเป็น:
   ```
   uv sync
   ```

4. เปิดใช้งาน virtual environment:
   ```
   # บน Windows
   uv run python
   
   # หรือ
   source .venv/bin/activate  # บน Linux/Mac
   .venv\Scripts\activate     # บน Windows
   ```

### วิธีที่ 2: ใช้ pip แบบปกติ

1. โคลน repository:
   ```
   git clone <repository-url>
   cd advrobot
   ```

2. ติดตั้งแพ็กเกจที่จำเป็น:
   ```
   pip install -r requirements.txt
   ```
   
   หรือหากใช้ `pyproject.toml`:
   ```
   pip install .
   ```

## การเพิ่มแพ็กเกจใหม่ด้วย UV

หากต้องการเพิ่มแพ็กเกจใหม่ให้กับโปรเจกต์:

```
uv add package-name
```

ตัวอย่าง:
```
uv add requests-mock
```

คำสั่งนี้จะ:
1. ดาวน์โหลดและติดตั้งแพ็กเกจ
2. อัปเดต `pyproject.toml`
3. อัปเดต `uv.lock`

## การใช้งาน

### 1. การทดสอบ API

1. เริ่มต้นแอปพลิเคชัน Flask:
   ```
   cd Test
   python app.py
   ```

2. รันการทดสอบ API:
   ```
   python test_api.py
   ```

### 2. การทดสอบ Web UI ด้วย Robot Framework

รันการทดสอบ Robot Framework:
```
cd Test
robot basicrobot.robot
```

### 3. การรันการทดสอบด้วย Pytest

```
cd Test
pytest test_api.py --html=report.html
```

## โครงสร้างการทดสอบ

### API Tests (`test_api.py`)
- `test_create_user()`: ทดสอบการสร้างผู้ใช้ใหม่
- `test_get_user()`: ทดสอบการดึงข้อมูลผู้ใช้
- `test_delete_user()`: ทดสอบการลบผู้ใช้

### Web Tests (`basicrobot.robot`)
- `Search Google and Verify Results TC1001`: ทดสอบการค้นหาใน Google
- `Search Google and Verify Results TC1002`: ทดสอบการค้นหาอีกกรณีหนึ่งใน Google

## การดูรายงานการทดสอบ

หลังจากรันการทดสอบแล้ว สามารถดูรายงานได้ที่:
- `Test/report.html`: รายงานการทดสอบแบบ HTML
- `Test/log.html`: บันทึกการทำงานของการทดสอบ
- `Test/output.xml`: ข้อมูลผลลัพธ์ของการทดสอบในรูปแบบ XML

## การพัฒนาเพิ่มเติม

### เพิ่มการทดสอบ API ใหม่
1. แก้ไข `Test/app.py` เพิ่ม endpoint ใหม่
2. เพิ่มฟังก์ชันการทดสอบใน `Test/test_api.py`

### เพิ่มการทดสอบ Web UI ใหม่
1. สร้างไฟล์ `.robot` ใหม่ในไดเรกทอรี `Test/`
2. ใช้คำสั่ง `robot filename.robot` เพื่อรันการทดสอบ

## ปัญหาที่พบบ่อย

### 1. Selenium WebDriver ไม่สามารถเปิด Chrome ได้
ตรวจสอบให้แน่ใจว่าได้ติดตั้ง ChromeDriver และกำหนดเส้นทางให้ถูกต้อง

### 2. การเชื่อมต่อกับ API ล้มเหลว
ตรวจสอบให้แน่ใจว่าแอปพลิเคชัน Flask ทำงานอยู่ที่ `http://127.0.0.1:5000`

## การสนับสนุน

หากพบปัญหาหรือมีคำถาม โปรดติดต่อทีมพัฒนาที่ [อีเมลหรือช่องทางการติดต่อ]
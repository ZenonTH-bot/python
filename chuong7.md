# CHƯƠNG 7: TỆP TIN (FILES)

## 7.1. File handles & context manager
- Dùng ``with`` để đảm bảo file được đóng:
```python
with open('data.txt', 'r', encoding='utf-8') as f:
    for line in f:
        process(line)
```
- Mode:
  - ``'r'`` đọc text, ``'w'`` ghi text (ghi đè), ``'a'`` append.
  - ``'rb'``, ``'wb'`` cho nhị phân.
  - ``'x'`` tạo file mới (raise nếu tồn tại).

## 7.2. Encoding và Unicode
- Luôn chỉ định ``encoding='utf-8'`` khi cần (UTF-8).
- Khi đọc dữ liệu từ nguồn khác (web, hệ thống khác), kiểm tra encoding — tránh ``UnicodeDecodeError``.

## 7.3. Đọc file hiệu quả
- Dòng theo dòng (iterator) tiết kiệm bộ nhớ.
- Đọc chunk cho file nhị phân lớn:
```python
with open('large.bin', 'rb') as f:
    for chunk in iter(lambda: f.read(8192), b''):
        process(chunk)
```

## 7.4. Ghi file an toàn
- Viết tệp tạm rồi đổi tên (atomic) để tránh mất dữ liệu nếu chương trình dừng đột ngột:
  - Viết vào tmp file, ``os.replace(tmp, dest)``

## 7.5. Xử lý lỗi khi mở file
- Bắt ``FileNotFoundError``, ``PermissionError`` cụ thể:
```python
try:
    with open(fname) as f:
        ...
except FileNotFoundError:
    print('Not found')
except PermissionError:
    print('No permission')
```

## 7.6. Pathlib & thao tác file hệ thống
- Dùng ``pathlib`` (Python 3.4+) để làm việc với đường dẫn:
```python
from pathlib import Path
p = Path('data') / 'file.txt'
p.read_text(encoding='utf-8')
p.exists()
p.is_file()
```
- Dùng ``os`` / ``shutil`` cho thao tác nâng cao (move, copy, remove).

## 7.7. Đọc & ghi CSV, JSON
- CSV:
```python
import csv
with open('data.csv', newline='', encoding='utf-8') as csvfile:
    reader = csv.DictReader(csvfile)
    for row in reader:
        process(row)
```
- JSON:
```python
import json
data = json.load(open('data.json', encoding='utf-8'))
json.dump(obj, open('out.json', 'w', encoding='utf-8'), ensure_ascii=False, indent=2)
```

## 7.8. Logging & tracing
- Dùng module ``logging`` thay vì ``print`` cho ứng dụng thực tế:
```python
import logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)
logger.info('Started')
```
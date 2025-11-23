CHƯƠNG 1: BIẾN, BIỂU THỨC VÀ CÂU LỆNH 

1.1. Bản chất của Hằng số và Biến
- Hằng số: khái niệm logic — giá trị không thay đổi trong chương trình. (Python không có hằng số bắt buộc; quy ước dùng tên in hoa cho "hằng": PI = 3.14159).  
- Biến: tên tham chiếu tới đối tượng trong bộ nhớ. Python là ngôn ngữ "định danh tham chiếu" (names reference objects). Việc gán là tạo liên kết tên → object, không phải "đặt giá trị vào ô nhớ" theo kiểu ngôn ngữ khác.

Ví dụ:
```python
x = 12.2
y = 14
x = 100  # x giờ tham chiếu đến object 100
```

Ghi chú: Khi gán một biến khác tới cùng object (aliasing), cần lưu ý khi object mutable (thay đổi nội dung) sẽ ảnh hưởng qua alias.

1.2. Quy tắc đặt tên biến & phong cách viết
- Ký tự hợp lệ: chữ, số, underscore. Không bắt đầu bằng số.  
- Phân biệt hoa-thường. Tránh tên trùng với từ khóa (if, for, def, class, import, lambda...).  
- Quy ước phong cách: PEP 8  
  - Biến và hàm: snake_case (my_variable)  
  - Lớp: PascalCase (MyClass)  
  - Hằng (quy ước): ALL_CAPS  
- Tránh tên quá ngắn và không có ý nghĩa (a, b) ở code thực tế.

1.3. Kiểu dữ liệu và quản lý kiểu
- Kiểu cơ bản: int, float, bool, str, NoneType.  
- Cấu trúc dữ liệu: list, tuple, dict, set, range, bytes, bytearray.  
- Kiểm tra kiểu: `type(x)`, `isinstance(x, T)`  
- Chuyển đổi kiểu (casting): `int('3')`, `float('4.5')`, `str(10)`  
- Lưu ý: việc ép kiểu có thể raise `ValueError` nếu chuỗi không hợp lệ.

1.4. Phương thức thao tác chuỗi và toán tử
- Toán tử số học: `+ - * / // % **`.  
- So sánh: `==, !=, <, >, <=, >=`.  
- Toán tử gán phức hợp: `+=, -=, *=, ...`  
- Toán tử logic: `and, or, not` (short-circuiting).  
- Toán tử `in` (membership) dùng cho chuỗi/list/set.

1.5. Nhập liệu từ người dùng và xác thực
- `input()` luôn trả về chuỗi; phải ép kiểu và kiểm tra lỗi:
```python
s = input('Enter a number: ')
try:
    n = int(s)
except ValueError:
    print('Not an integer')
```
- Luôn xác thực dữ liệu người dùng (range, loại, định dạng).

1.6. Toán tử ưu tiên & ngoặc
- Thứ tự: `()`, `**`, unary `+/-`, `* / // %`, `+ -`, bitwise, comparisons, `not`, `and`, `or`.  
- Dùng ngoặc để làm rõ ý nghĩa và tránh lỗi logic.


CHƯƠNG 2: CẤU TRÚC ĐIỀU KIỆN (CONDITIONAL EXECUTION) {.blue}

2.1. Giá trị Boolean và truthiness {.teal}
- `True`/`False` là `bool`.  
- Truthiness: giá trị bị chuyển sang boolean theo quy tắc:
  - Falsy: `False`, `None`, `0`, `0.0`, `''`, `[]`, `()`, `{}`, `set()`, `range(0)`  
  - Mọi cái khác → True.

2.2. Toán tử logic và rút gọn {.teal}
- `and` / `or` trả về toán hạng (short-circuit):
```python
a and b  # nếu a falsy -> trả a, else trả b
a or b   # nếu a truthy -> trả a, else trả b
```
- Ví dụ gán mặc định: `x = user_input or 'default'`

2.3. Cấu trúc if / elif / else & mẫu code {.teal}
- Thụt lề là ngữ pháp. Tránh lồng if quá sâu — tách hàm/điều kiện.

2.4. Pattern Matching (Python 3.10+) {.teal}
```python
match obj:
    case {'type': 'error', 'code': code}:
        handle_error(code)
    case [x, y]:
        ...
    case _:
        ...
```

2.5. Xử lý ngoại lệ (try / except / else / finally) {.teal}
```python
try:
    risky()
except SpecificError as e:
    handle(e)
except Exception:
    fallback()
else:
    # chạy nếu không exception
finally:
    # luôn chạy (dùng để đóng file/socket)
```


CHƯƠNG 3: HÀM (FUNCTIONS) {.blue}

3.1. Vai trò và nguyên tắc thiết kế {.teal}
- DRY: Don't Repeat Yourself.  
- Hàm nên có một trách nhiệm (Single Responsibility).  
- Tên hàm rõ nghĩa, docstring giải thích input/output và side effects.

3.2. Định nghĩa và gọi hàm {.teal}
```python
def f(x, y=5):
    """Docstring: mô tả"""
    return x + y
```
- Default arguments: giá trị mặc định được tính một lần khi định nghĩa — cẩn thận với mutable default (ví dụ list).

3.3. Tham số vị trí, từ khóa, `*args`, `**kwargs` {.teal}
- Positional args: `def f(a, b)`  
- Keyword args: `f(a=1, b=2)`  
- `*args`: thu thập các đối số vị trí dư  
- `**kwargs`: thu thập đối số từ khóa dư

3.4. Hàm trả về và None {.teal}
- Hàm không có `return` trả `None`.  
- Tránh return nhiều loại dữ liệu khác nhau; cố gắng chuẩn hoá.

3.5. Lambda, hàm bậc cao và closure {.teal}
```python
def make_multiplier(n):
    def mult(x):
        return x * n
    return mult

double = make_multiplier(2)
```

3.6. Docstrings và typing {.teal}
```python
def add(a: int, b: int) -> int:
    return a + b
```
- Type hints giúp IDE & static checkers (mypy).

3.7. Recursion & tail recursion {.teal}
- Đệ quy dùng khi bài toán có tính chia để trị.  
- Python không tối ưu tail recursion; tránh recursion quá sâu (giới hạn bằng `sys.getrecursionlimit()`).


CHƯƠNG 4: VÒNG LẶP (LOOPS) & ITERATION {.blue}

4.1. while loops (vòng lặp chưa biết số lần) {.teal}
- Dùng cho logic phụ thuộc điều kiện thay đổi trong thân.  
- Tránh infinite loop — luôn đảm bảo điều kiện thoát hoặc dùng `break`.

4.2. for loops (iteration idiom) {.teal}
- Python `for` duyệt iterator:
```python
for item in iterable:
    ...
```
- Dùng `enumerate()` để có index:
```python
for i, v in enumerate(sequence, start=0):
    ...
```
- Dùng `zip()` để duyệt nhiều iterable cùng lúc.

4.3. break, continue và else trong vòng lặp {.teal}
- `break` thoát vòng lặp ngay lập tức.  
- `continue` bỏ qua phần còn lại của lượt lặp hiện tại.  
- `else` trong vòng lặp chạy khi vòng lặp kết thúc mà không bị `break`.

4.4. List comprehensions, set/dict comprehensions {.teal}
```python
squares = [x*x for x in range(10) if x%2==0]
```
- Generator expression cho lazy evaluation:
```python
gen = (x*x for x in range(10))
```

4.5. Iterators & Generators {.teal}
- Iterator: object có `__iter__()` và `__next__()`.  
- Generator: hàm chứa `yield`, tạo iterator lazy:
```python
def tail_fibonacci(n):
    a, b = 0, 1
    for _ in range(n):
        yield a
        a, b = b, a+b
```

4.6. Performance tips {.teal}
- Tránh thay đổi list trong khi lặp trực tiếp trên chính nó — tạo bản sao nếu cần.  
- Dùng `''.join(parts)` thay vì cộng chuỗi trong loop.  
- Khi cần xử lý song song/đa luồng, cân nhắc GIL và `multiprocessing`.


CHƯƠNG 5: CHUỖI KÝ TỰ (STRINGS) - MỞ RỘNG {.blue}

5.1. Bản chất và khả năng {.teal}
- `str` là immutable sequence của code points (Unicode) trong Python 3.  
- `bytes` / `bytearray` cho dữ liệu nhị phân.

5.2. Khai báo và escape sequences {.teal}
- Single/double quotes; triple quotes cho multi-line strings:
```python
s = "He said \"Hello\""
m = '''Line1
Line2'''
```
- Raw strings `r'...\n'` giữ nguyên backslash — hữu ích cho regex: `r'\d+'`.

5.3. Chỉ mục, slicing, và step {.teal}
- Slicing: `s[start:end:step]` — step có thể âm để đảo chuỗi: `s[::-1]`.

5.4. So sánh, tìm kiếm và membership {.teal}
- `'in'` kiểm tra substring.  
- `find(sub)` trả chỉ số hoặc `-1` nếu không tìm thấy.  
- `index(sub)` raise `ValueError` nếu không tìm thấy.  
- `startswith(prefix)` / `endswith(suffix)` hỗ trợ tuple của tiền tố/suffix.

::: note
Ví dụ inline màu: đây là một từ [màu đỏ]{.red} để minh họa. Và đây là một từ [màu xanh]{.blue}.
:::

5.5. Định dạng chuỗi {.teal}
- f-strings (Python 3.6+): `f"{name} is {age}"`  
- `str.format()`: `"Hello {0}".format(name)`  
- `%` formatting (cũ): `"%s %d" % (s, n)`  
- f-strings hỗ trợ biểu thức, gọi hàm, formatting specifiers: `f"{pi:.2f}"`.

5.6. Thao tác hiệu năng & lớn {.teal}
- Dùng list `append` + `''.join()` để xây dựng chuỗi lớn.  
- Tránh cộng chuỗi lặp nhiều lần (O(n^2) chi phí).

5.7. Common string methods {.teal}
- `.lower(), .upper(), .title(), .strip(), .split(sep=None, maxsplit=-1), .join(iterable), .replace(old,new), .partition(sep), .count(sub)`.

5.8. Ví dụ Parsing nâng cao {.teal}
```python
import re

line = 'From stephen.marquard@uct.ac.za Sat Jan  5'
m = re.search(r'@([^ ]+)', line)
if m:
    domain = m.group(1)
```
- Regex mạnh hơn khi format dòng không cố định. Hãy validate trước khi tin tưởng parsing.


CHƯƠNG 6: DANH SÁCH (LISTS) - MỞ RỘNG {.blue}

6.1. Khái niệm & Tạo danh sách {.teal}
- `list` literal: `[1,2,3]`  
- Xây dựng từ iterable: `list(range(5))`  
- Copy shallow: `a[:]` hoặc `a.copy()`.

6.2. Mutability và aliasing {.teal}
```python
a = [1,2,3]
b = a
b[0] = 99
# a giờ là [99,2,3]
```
- Để copy deep: dùng `copy.deepcopy()` nếu list lồng nhau chứa mutable objects.

6.3. Các phương thức chi tiết {.teal}
- `append(item)`, `extend(iterable)`, `insert(i, item)`  
- `remove(value)`, `pop(i=-1)`, `clear()`  
- `index(value)`, `count(value)`  
- `sort()`, `reverse()`, `copy()`  
- `sort(key=..., reverse=True)` — `key` là hàm dùng để tính tiêu chí sắp xếp:
```python
words.sort(key=len)
```

6.4. Slicing nâng cao {.teal}
- Lấy mọi phần tử chẵn: `a[::2]`  
- Thay đổi slice: `a[1:3] = ['x','y']` có thể thay đổi kích thước list.

6.5. List comprehensions & performance {.teal}
- Thay thế loops tạo list:
```python
vals = [f(x) for x in iterable if cond(x)]
```
- Dùng generator expression nếu không cần toàn bộ list cùng lúc.

6.6. Nested lists (ma trận) & pitfalls {.teal}
- Tạo nested list đúng cách:
```python
rows = [[0]*cols for _ in range(rows_count)]
```
- Tránh: `rows = [[0]*cols]*rows_count` — vì sẽ tạo alias cho cùng một list con.

6.7. Sorting complex data {.teal}
- Sắp xếp list of tuples/lists/dicts:
```python
data.sort(key=lambda x: x[1])  # theo cột thứ 1
```
- `reversed()` trả iterator đảo.

6.8. Ví dụ: đếm tần suất từ {.teal}
```python
from collections import Counter

with open('text.txt', encoding='utf-8') as f:
    words = []
    for line in f:
        words.extend(word.lower().strip(".,!?;:") for word in line.split())
counter = Counter(words)
most_common = counter.most_common(10)
```


CHƯƠNG 7: TỆP TIN (FILES) - MỞ RỘNG {.blue}

7.1. File handles & context manager {.teal}
- Dùng `with` để tự động đóng file:
```python
with open('data.txt', 'r', encoding='utf-8') as f:
    for line in f:
        process(line)
```
- Mode:
  - `'r'` đọc text, `'w'` ghi text (ghi đè), `'a'` append.  
  - `'rb','wb'` cho nhị phân.  
  - `'x'` tạo file mới (raise nếu tồn tại).

7.2. Encoding và Unicode {.teal}
- Luôn chỉ định `encoding='utf-8'` khi có thể.  
- Khi đọc dữ liệu từ nguồn khác (web, hệ thống khác), kiểm tra encoding — tránh `UnicodeDecodeError`.

7.3. Đọc file hiệu quả {.teal}
- Dòng theo dòng (iterator) tiết kiệm bộ nhớ.  
- Đọc chunk cho file nhị phân lớn:
```python
with open('large.bin', 'rb') as f:
    for chunk in iter(lambda: f.read(8192), b''):
        process(chunk)
```

7.4. Ghi file an toàn {.teal}
- Viết tệp tạm rồi đổi tên (atomic) để tránh mất dữ liệu nếu chương trình dừng đột ngột:  
  - Viết vào tmp file, `os.replace(tmp, dest)`.

7.5. Xử lý lỗi khi mở file {.teal}
```python
try:
    with open(fname) as f:
        ...
except FileNotFoundError:
    print('Not found')
except PermissionError:
    print('No permission')
```

7.6. Pathlib & thao tác file hệ thống {.teal}
```python
from pathlib import Path
p = Path('data') / 'file.txt'
p.read_text(encoding='utf-8')
p.exists()
p.is_file()
```

7.7. Đọc & ghi CSV, JSON {.teal}
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

7.8. Logging & tracing {.teal}
- Dùng module `logging` thay vì `print` cho ứng dụng thực tế:
```python
import logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)
logger.info('Started')
```

# CHƯƠNG 5: CHUỖI KÝ TỰ (STRINGS)

## 5.1. Bản chất và khả năng
- ``str`` là immutable sequence của code points (Unicode) trong Python 3.
- ``bytes`` / ``bytearray`` cho dữ liệu nhị phân.

## 5.2. Khai báo và escape sequences
- Single/double quotes; triple quotes cho multi-line strings:
```python
s = "He said \"Hello\""
m = '''Line1
Line2'''
```
- Raw strings ``r'...\n'`` giữ nguyên backslash — hữu ích cho regex: ``r'\d+'``.

## 5.3. Chỉ mục, slicing, và step
- Slicing: ``s[start:end:step]``, step có thể âm để đảo chuỗi: ``s[::-1]`` đảo chuỗi.

## 5.4. So sánh, tìm kiếm và membership
- ``'in'`` kiểm tra substring.
- ``find(sub)`` trả chỉ số hoặc ``-1`` nếu không tìm thấy.
- ``index(sub)`` raise ``ValueError`` nếu không tìm thấy.
- ``startswith(prefix)`` / ``endswith(suffix)`` hỗ trợ tuple tiền tố/suffix.

## 5.5. Định dạng chuỗi
- f-strings (Python 3.6+): ``f"{name} is {age}"``
- ``str.format()``: ``"Hello {0}".format(name)``
- ``%`` formatting (cũ): ``"%s %d" % (s, n)``
- f-strings hỗ trợ biểu thức, gọi hàm, formatting specifiers: ``f"{pi:.2f}"``

## 5.6. Thao tác hiệu năng & lớn
- Dùng list ``append`` + ``''.join()`` để xây dựng chuỗi lớn.
- Tránh cộng chuỗi lặp nhiều lần (O(n^2) chi phí).

## 5.7. Common string methods (tóm tắt)
- ``.lower()``, ``.upper()``, ``.title()``, ``.strip()``, ``.split(sep=None, maxsplit=-1)``, ``.join(iterable)``, ``.replace(old,new)``, ``.partition(sep)``, ``.count(sub)``, ``.encode(encoding)``, ``.decode`` (trên ``bytes``).

## 5.8. Ví dụ Parsing nâng cao
- Extract email domain robustly:
```python
import re

line = 'From stephen.marquard@uct.ac.za Sat Jan  5'
m = re.search(r'@([^ ]+)', line)
if m:
    domain = m.group(1)
```
- Regex mạnh hơn khi format dòng không cố định. Hãy validate trước khi tin tưởng parsing.
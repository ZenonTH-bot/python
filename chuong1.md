# CHƯƠNG 1: BIẾN, BIỂU THỨC VÀ CÂU LỆNH

## 1.1. Bản chất của Hằng số và Biến
- Hằng số: khái niệm logic — giá trị không thay đổi trong chương trình. (Python không có hằng số bắt buộc; quy ươc dùng tên in hoa cho "hằng": `PI = 3.14159`).
- Biến: tên tham chiếu tới đối tượng trong bộ nhớ. Python là ngôn ngữ "định danh tham chiếu" (names reference objects). Việc gán là tạo liên kết tên → object, không phải "đặt giá trị vào ô nhớ" theo kiểu ngôn ngữ khác.

Ví dụ:
```python
x = 12.2
y = 14
x = 100  # x giờ tham chiếu đến object 100
```

Ghi chú: Khi gán một biến khác tới cùng object (aliasing), cần lưu ý khi object mutable (thay đổi nội dung) sẽ ảnh hưởng qua alias.

## 1.2. Quy tắc đặt tên biến & phong cách viết
- Ký tự hợp lệ: chữ, số, underscore. Không bắt đầu bằng số.
- Phân biệt hoa-thường. Tránh tên trùng với từ khóa (`if`, `for`, `def`, `class`, `import`, `lambda`, ...).
- Quy ươc phong cách: PEP 8
  - Biến và hàm: `snake_case` (ví dụ: `my_variable`)
  - Lớp: `PascalCase` (ví dụ: `MyClass`)
  - Hằng (quy ước): `ALL_CAPS`
- Tránh tên quá ngắn và không có ý nghĩa (ví dụ `a`, `b`) ở code thực tế.

## 1.3. Kiểu dữ liệu và quản lý kiểu
- Kiểu cơ bản: `int`, `float`, `bool`, `str`, `NoneType`.
- Cấu trúc dữ liệu: `list`, `tuple`, `dict`, `set`, `range`, `bytes`, `bytearray`.
- Kiểm tra kiểu: ``type(x)``, ``isinstance(x, T)``
- Chuyển đổi kiểu (casting): ``int('3')``, ``float('4.5')``, ``str(10)``
- Lưu ý: việc ép kiểu có thể raise ``ValueError`` nếu chuỗi không hợp lệ.

## 1.4. Phương thức thao tác chuỗi và toán tử
- Toán tử số học: ``+`` ``-`` ``*`` ``/`` ``//`` ``%`` ``**``.
- So sánh: ``==``, ``!=``, ``<``, ``>``, ``<=``, ``>=``.
- Toán tử gán phức hợp: ``+=``, ``-=``, ``*=`` ...
- Toán tử logic: ``and``, ``or``, ``not`` (short-circuiting).
- Toán tử ``in`` (membership) dùng cho chuỗi/`list`/`set`.

## 1.5. Nhập liệu từ người dùng và xác thực
- ``input()`` luôn trả về chuỗi; phải ép kiểu và kiểm tra lỗi:
```python
s = input('Enter a number: ')
try:
    n = int(s)
except ValueError:
    print('Not an integer')
```
- Luôn xác thực dữ liệu người dùng (range, loại, định dạng).

## 1.6. Toán tử ưu tiên & ngoặc
- Thứ tự: `()` , `**`, unary `+`/`-`, `*` , `/` , `//` , `%` , `+` , `-` , `<<` `>>` , `&` , `^` , `|` , comparisons, `not`, `and`, `or`.
- Dùng ngoặc để làm rõ ý nghĩa và tránh lỗi logic.
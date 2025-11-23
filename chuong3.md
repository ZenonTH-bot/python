# CHƯƠNG 3: HÀM (FUNCTIONS)

## 3.1. Vai trò và nguyên tắc thiết kế
- DRY: Don't Repeat Yourself.
- Hàm nên có một trách nhiệm (Single Responsibility).
- Tên hàm rõ nghĩa, docstring giải thích input/output và side effects.

## 3.2. Định nghĩa và gọi hàm
```python
def f(x, y=5):
    """Docstring: mô tả"""
    return x + y
```
- Default arguments: giá trị mặc định được tính một lần khi định nghĩa — cẩn thận với mutable default (ví dụ `list`).

## 3.3. Tham số vị trí, từ khóa, `*args`, `**kwargs`
- Positional args: `def f(a, b)`
- Keyword args: `f(a=1, b=2)`
- ``*args``: thu thập các đối số vị trí dư
- ``**kwargs``: thu thập đối số từ khóa dư

## 3.4. Hàm trả về và None
- Hàm không có ``return`` trả ``None``.
- Tránh return nhiều loại dữ liệu khác nhau; cố gắng chuẩn hoá.

## 3.5. Lambda, hàm bậc cao và closure
- Lambda: biểu thức nhỏ: ``lambda x: x*2`` — dùng cho biểu thức ngắn.
- Higher-order: hàm nhận/hay trả hàm:
```python
def make_multiplier(n):
    def mult(x):
        return x * n
    return mult
double = make_multiplier(2)
```
- Closure: lưu state trong hàm trả về.

## 3.6. Docstrings và typing
- Dùng docstring (PEP 257) cho hàm. Ví dụ Google/NumPy style.
- Type hints (PEP 484):
```python
def add(a: int, b: int) -> int:
    return a + b
```
- Type hints giúp IDE & static checkers (mypy).

## 3.7. Recursion & tail recursion
- Đệ quy dùng khi bài toán có tính chia để trị.
- Python không tối ưu tail recursion; tránh recursion quá sâu (giới hạn bằng ``sys.getrecursionlimit()``).
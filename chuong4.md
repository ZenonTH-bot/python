# CHƯƠNG 4: VÒNG LẶP (LOOPS) & ITERATION

## 4.1. while loops (vòng lặp chưa biết số lần)
- Dùng cho logic phụ thuộc điều kiện thay đổi trong thân.
- Tránh infinite loop — luôn đảm bảo điều kiện thoát hoặc dùng `break`.

## 4.2. for loops (iteration idiom)
- Python `for` duyệt iterator:
```python
for item in iterable:
    ...
```
- Dùng ``enumerate`` để có index:
```python
for i, v in enumerate(sequence, start=0):
    ...
```
- Dùng ``zip`` để duyệt nhiều iterable cùng lúc.

## 4.3. break, continue và else trong vòng lặp
- `else` chạy khi vòng lặp không bị `break`:
```python
for x in seq:
    if cond(x):
        break
else:
    # không tìm thấy
```

## 4.4. List comprehensions, set/dict comprehensions
- Cách Pythonic để tạo collection:
```python
squares = [x*x for x in range(10) if x%2==0]
```
- Generator expression cho lazy evaluation:
```python
gen = (x*x for x in range(10))
```
- Comprehensions thường ngắn, rõ ràng; tránh quá phức tạp — tách thành hàm nếu cần.

## 4.5. Iterators & Generators
- Iterator: object có ``__iter__()`` và ``__next__()``.
- Generator: hàm chứa ``yield``, tạo iterator lazy:
```python
def tail_fibonacci(n):
    a, b = 0, 1
    for _ in range(n):
        yield a
        a, b = b, a+b
```
- Dùng generators để xử lý luồng dữ liệu lớn, tiết kiệm bộ nhớ.

## 4.6. Performance tips
- Tránh thay đổi `list` trong khi lặp trực tiếp trên chính nó — tạo bản sao nếu cần.
- Dùng `''.join(parts)` để nối nhiều chuỗi thay vì cộng chuỗi trong loop:
```python
s = ''.join(parts)
```
- Khi cần xử lý song song/đa luồng, cân nhắc GIL và `multiprocessing`.
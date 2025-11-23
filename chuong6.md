# CHƯƠNG 6: DANH SÁCH (LISTS)

## 6.1. Khái niệm & Tạo danh sách
- ``list`` literal: ``[1,2,3]``, xây dựng từ iterable: ``list(range(5))``, copy: ``a[:]`` or ``list(a)``

## 6.2. Mutability và aliasing
```python
a = [1,2,3]
b = a
b[0] = 99
# a giờ là [99,2,3]
```
- Để copy: shallow copy: ``a.copy()`` hoặc ``a[:]`` ; deep copy với ``copy.deepcopy()`` nếu có nested mutable.

## 6.3. Các phương thức chi tiết
- ``append``, ``extend``, ``insert``, ``remove``, ``pop``, ``clear``, ``index``, ``count``, ``sort``, ``reverse``, ``copy``.
- ``sort(key=..., reverse=True)`` — ``key`` là hàm dùng để tính tiêu chí sắp xếp:
```python
words.sort(key=len)
```

## 6.4. Slicing nâng cao
- Lấy mọi phần tử chẵn: ``a[::2]``
- Thay đổi slice: ``a[1:3] = ['x','y']`` có thể thay đổi kích thước list.

## 6.5. List comprehensions & performance
- Thay thế loops tạo list:
```python
vals = [f(x) for x in iterable if cond(x)]
```
- Dùng generator expression nếu không cần toàn bộ list cùng lúc.

## 6.6. Nested lists (ma trận) & pitfalls
- Tạo nested list đúng cách:
```python
rows = [[0]*cols for _ in range(rows_count)]
```
- Tránh: ``rows = [[0]*cols]*rows_count`` — vì sẽ tạo alias cho cùng 1 list con.

## 6.7. Sorting complex data
- Sắp xếp list of tuples/lists/dicts:
```python
data.sort(key=lambda x: x[1])  # theo cột thứ 1
```
- ``reversed()`` trả iterator đảo.

## 6.8. Ví dụ: đếm tần suất từ
```python
from collections import Counter

with open('text.txt', encoding='utf-8') as f:
    words = []
    for line in f:
        words.extend(word.lower().strip(".,!?;:") for word in line.split())
counter = Counter(words)
most_common = counter.most_common(10)
```
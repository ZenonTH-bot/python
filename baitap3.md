
# BT03 - Cấu trúc điều kiện

## Exercise 1

Viết chương trình tính lương, bao gồm tính toán lương làm thêm giờ (gấp 1.5 lần) nếu làm trên 40 giờ .

```python
hours = float(input("Enter Hours: "))
rate = float(input("Enter Rate: "))

if hours > 40:
    regular_pay = 40 * rate
    overtime_pay = (hours - 40) * rate * 1.5
    pay = regular_pay + overtime_pay
else:
    pay = hours * rate

print("Pay:", pay)
```

**Chạy chương trình:**

  * Tại `Enter Hours:` nhập `45` 
  * Tại `Enter Rate:` nhập `10` 
  * Ta được `Pay: 475.0` 

-----

## Exercise 2

Viết lại chương trình tính lương sử dụng `try...except` để xử lý lỗi khi người dùng nhập dữ liệu không phải là số .

```python
try:
    hours = float(input("Enter Hours: "))
    rate = float(input("Enter Rate: "))
    
    if hours > 40:
        regular_pay = 40 * rate
        overtime_pay = (hours - 40) * rate * 1.5
        pay = regular_pay + overtime_pay
    else:
        pay = hours * rate
        
    print("Pay:", pay)
except ValueError:
    print("Error, please enter numeric input")
```

**Chạy chương trình:**

  * **Lần 1:** Nhập Hours: `20`, Rate: `nine` $\rightarrow$ Chương trình báo: `Error, please enter numeric input` .
  * **Lần 2:** Nhập Hours: `forty` $\rightarrow$ Chương trình báo: `Error, please enter numeric input` .

-----

## Exercise 3

Viết chương trình xếp loại điểm số (A, B, C, D, F) dựa trên thang điểm từ 0.0 đến 1.0. Sử dụng `try...except` để xử lý lỗi nhập liệu .

```python
try:
    score = float(input("Enter score: "))
    
    if score < 0.0 or score > 1.0:
        print("Bad score")
    elif score >= 0.9:
        print("A")
    elif score >= 0.8:
        print("B")
    elif score >= 0.7:
        print("C")
    elif score >= 0.6:
        print("D")
    else:
        print("F")
except ValueError:
    print("Bad score")
```

**Chạy chương trình:**

  * **Lần 1:** Nhập `0.95` $\rightarrow$ Ta được `A` .
  * **Lần 2:** Nhập `perfect` $\rightarrow$ Ta được `Bad score` .
  * **Lần 3:** Nhập `10.0` $\rightarrow$ Ta được `Bad score` .
  * **Lần 4:** Nhập `0.75` $\rightarrow$ Ta được `C` .
  * **Lần 5:** Nhập `0.5` $\rightarrow$ Ta được `F` .
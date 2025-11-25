# BT02 - Python, biến, biểu thức và câu lệnh 

## Exercise 2

Viết chương trình yêu cầu người dùng nhập tên và in ra lời chào .

```python
name = input("Enter your name: ")
print("Hello", name)
```

**Chạy chương trình:** 

  * Tại `Enter your name:` ta nhập `Chuck` 
  * Ta được: `Hello Chuck` 

-----

## Exercise 3

Viết chương trình tính lương dựa trên số giờ làm và mức lương theo giờ .

```python
hours = float(input("Enter Hours: "))
rate = float(input("Enter Rate: "))
pay = hours * rate
print("Pay:", pay)
```

**Chạy chương trình:** 

  * Tại `Enter Hours:` nhập `35` 
  * Tại `Enter Rate:` nhập `2.75` 

-----

## Exercise 4

Thực hiện các phép toán và kiểm tra kiểu dữ liệu của kết quả .

```python
width = 17
height = 12.0

print("1. width // 2 =", width // 2, " type:", type(width // 2))
print("2. width / 2.0 =", width / 2.0, " type:", type(width / 2.0))
print("3. height / 3 =", height / 3, " type:", type(height / 3))
print("4. 1 + 2 * 5 =", 1 + 2 * 5, " type:", type(1 + 2 * 5))
```

**Chạy chương trình ta được:** 

1.  `width // 2 = 8` type: `<class 'int'>` 
2.  `width / 2.0 = 8.5` type: `<class 'float'>` 
3.  `height / 3 = 4.0` type: `<class 'float'>` 
4.  `1 + 2 * 5 = 11` type: `<class 'int'>` 

-----

## Exercise 5

Viết chương trình chuyển đổi nhiệt độ từ độ C (Celsius) sang độ F (Fahrenheit) .

```python
celsius = float(input("Enter Celsius temperature: "))
fahrenheit = celsius * 9 / 5 + 32
print("Fahrenheit temperature:", fahrenheit)
```

**Chạy chương trình:** 

  * Tại `Enter Celsius temperature:` nhập `50` 
  * Ta sẽ được `Fahrenheit temperature: 122` 

# Chuong 6 

## Ex5 

```python
str_val = 'X-DSPAM-Confidence: 0.8475'
pos = str_val.find(':')
number_str = str_val[pos+1:]
value = float(number_str)
print(value)
```


*(Lưu ý: Trong code gốc biến là `str`, mình đổi thành `str_val` để tránh trùng với từ khóa `str` của Python) *

## Ex6 

```python
text = " python programming language "
print("Original string:")
print(repr(text))
print()

print("strip():")
print(repr(text.strip()))
print()

print("lstrip():")
print(repr(text.lstrip()))
print()

print("rstrip():")
print(repr(text.rstrip()))
print()

print("replace 'python' -> 'Java':")
print(text.replace("python", "Java"))
print()

print("replace spaces with '-':")
print(text.replace(" ", "-"))
print()

print("find 'gram':")
print(text.find("gram"))
print()

print("find 'a' starting from index 10:")
print(text.find("a", 10))
print()

print("find 'abc' (not found):")
print(text.find("abc"))
print()

print("upper():")
print(text.upper())
print()

print("lower():")
print(text.lower())
print()

filename = "document.txt"
print("Does filename end with '.txt'?")
print(filename.endswith(".txt"))
print()

print("Does filename start with 'doc'?")
print(filename.startswith("doc"))
print()

csv_data = "a,b,c,d"
print("split(','):")
print(csv_data.split(","))
print()

sentence = "Python is fun to learn"
print("split():")
print(sentence.split()) # tách theo khoảng trắng
print()
```




# Chuong 7 

## Ex1 

```python
fname = input("Enter a file name: ")
try:
    fhand = open(fname)
    for line in fhand:
        print(line.rstrip().upper())
except FileNotFoundError:
    print("File cannot be opened:", fname)
```



## Ex2 

```python
fname = input("Enter the file name: ")
try:
    fhand = open(fname)
except FileNotFoundError:
    print("File cannot be opened:", fname)
    quit()

count = 0
total = 0.0
for line in fhand:
    line = line.strip()
    if line.startswith("X-DSPAM-Confidence:"):
        value = float(line.split(":")[1])
        total += value
        count += 1

if count > 0:
    average = total / count
    print("Average spam confidence:", average)
else:
    print("No X-DSPAM-Confidence lines found.")
```



## Ex3 

```python
fname = input("Enter the file name: ")
if fname == "na na boo boo":
    print("NA NA BOO BOO TO YOU - You have been punkd!")
    quit()

try:
    fhand = open(fname)
except FileNotFoundError:
    print("File cannot be opened:", fname)
    quit()

count = 0
for line in fhand:
    if line.startswith("Subject:"):
        count += 1

print("There were", count, "subject lines in", fname)
```




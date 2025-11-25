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
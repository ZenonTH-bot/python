fname = input("Enter a file name: ")
try:
    fhand = open(fname)
    for line in fhand:
        print(line.rstrip().upper())
except FileNotFoundError:
    print("File cannot be opened:", fname)
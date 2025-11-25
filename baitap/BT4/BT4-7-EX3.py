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
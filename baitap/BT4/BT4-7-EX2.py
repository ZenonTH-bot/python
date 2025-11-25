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
str_val = 'X-DSPAM-Confidence: 0.8475'
pos = str_val.find(':')
number_str = str_val[pos+1:]
value = float(number_str)
print(value)
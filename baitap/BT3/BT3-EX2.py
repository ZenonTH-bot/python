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
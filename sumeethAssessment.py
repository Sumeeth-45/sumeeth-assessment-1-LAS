#Q1
Number=int(input("enter the number :"))
print ( "it is a palindrome.m")

#Q2
nnumber= int(input("Enter the number of Rows:"))

for i in range(1 , nnumber + 1):
    print (" "  * ( nnumber - i) + "*" *(2 * i - 1))
for i in range(nnumber-1,0,-1):
    print (" "  * ( nnumber - i) + "*" *(2 * i - 1))

# 4)Seperate Even and Odd value
numbers=[2,3,4,5,6,8,9]
even=[]
odd=[]
for i in numbers:
    if i % 2 == 0:
       even.append(i)
    else:
        odd.append(i)
        
print("Even number:",even)
print("Odd number:",odd)


# 5) largest number in the list
number=[10,20,30,40,50]
largest=number[0]
for i in number:
    if i > largest:
        largest=i
print("largest number:",largest)


#Q10
def calculate_total( p1,p2,p3 ) :
    total=p1+p2+p3
    if total>2000:
        discount=total*10/100
        total= total - discount
        return total
        
p1=int(input("Enter the price of product 1:"))
p2=int(input("Enter the price of product 2:"))
p3=int(input("enter the price of product 3:"))

final_amount= calculate_total(p1,p2,p3)
print(final_amount)
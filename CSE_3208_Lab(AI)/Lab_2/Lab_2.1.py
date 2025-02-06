def add1(*args): 
    print(args)

def add2(**args): 
    print('Name:',args["Name"],'\n','Dept:',args["Dept"],'\n','Roll:',args["Roll"])

list1 = [1,2,3,4,5,6,7]
add1(*list1)

dict1={

}
print(add2(Name="Sajid",Dept="CSE",Roll=2003154))

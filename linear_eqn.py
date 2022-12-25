from time import time
from os import system

""" DOCUMENTATION:
This program solves any linear equation that is solveable and correctly written

FORMAT-->
If the linear equation you want to write is say

    ax + by + cz = d
    ex + fy + gz = h
    iz + jy + kz = l

Then input needs to be

    a b c d
    e f g h
    i j k l

OUTPUT-->
Output is given in the form of a 2D matrix returned by the solve() function
Time taken to execute can be printed by adding a @timer decorator on any function definition of your choice

DEVELOPMENT-->
Error handling is still a WIP. Function returns error instead of correctly handled exception if
input is wrong or if equation is not possible or if there are infinitely many solutions.
Divide by zero error means the solution is not possible or there are infinitely many solutions

USAGE-->
sure copy my code whatever
"""

def timer(func):
    "Decorator to determine runtime of any function"

    def wrapper(*args, **kwargs):
        t1 = time()
        result = func(*args, **kwargs)
        print(f"time taken to execute {func.__name__}: {time()-t1}")
        return result
    return wrapper

def multilineinput(prompt = "", end_ = ""):
    """Collects multiple lines of input in form of a string. 
prompt: prompt from which input is taken
end_: works like end argument of print function
Commands:
&&back: deletes the last line (if you made an error)
&&end: finalises your input matrix"""
    print(prompt, end = end_);
    Input = []

    isInput = False
    while isInput == False:
        n = input("")
        Input.append(n)

        if n == """&&end""":
            Input.pop()
            isInput = True
            system('cls')

        if n == """&&back""":
            for i in range(2):
                Input.pop()           
    return Input

def subtract_arr(arr_1, arr_2):
    "Used to subtract all numerical values of 2nd array from corresponding values of 1st array"
    if (len(arr_1)!=len(arr_2)):
        return None
    
    arr = list()
    for _ in range(len(arr_1)):
        arr.append(arr_1[_] - arr_2[_])
    return arr

@timer
def convert(matrix):
    "Parses the string array from multilineinput into a usable integer matrix"
    try:
        for i in range(len(matrix)):
            matrix[i] = list(map(lambda x: float(x), matrix[i].split()))
        return matrix

    except:
        print("""ERROR: wrong format
You should give input in the following format:
    a b c d
    e f g h
    i j k l
this is equivalent to:
    ax + by + cz = d
    ex + fy + gz = h
    ix + jy + kz = l""")

@timer
def triangle(inpmatrix):
    "Solves input matrix into an upper triangular matrix. Must be in the form of an augmented matrix with result matrix appended on main matrix"
    matrix = inpmatrix.copy()

    for i in range(len(matrix)-1):
        for j in range(i+1):
            multiplier = matrix[j][j]/matrix[i+1][j]
            matrix[i+1] = list(map(lambda x: x*multiplier, matrix[i+1]))
            matrix[i+1] = subtract_arr(matrix[i+1], matrix[j])
    return matrix

@timer
def solve(inpmatrix):
    "Solves a triangular augmented matrix for values of its individual variables"
    matrix = inpmatrix.copy()[::-1]

    for i in range(len(matrix) - 1):
        for j in range(i+1, len(matrix)):
            multiplier = matrix[i][-2-i]/matrix[j][-2-i]
            matrix[j] = list(map(lambda x: x*multiplier, matrix[j]))
            matrix[j] = subtract_arr(matrix[j], matrix[i])
    matrix = matrix[::-1]
    
    for i in range(len(matrix)):
        matrix[i][-1]/=matrix[i][i]
        matrix[i][i] = 1.0
    return matrix


if __name__=="__main__":
    print()
    inp = convert(multilineinput(prompt = "Equations: ", end_ = "\n"))
    for _ in solve(triangle(inp)):
        print(_)
#!/usr/bin/python
#coding: UTF-8

def calculation_of_variables(x, y, res):
    n = len(x)
    sum_x = sum(map(float, x))
    sum_y = sum(map(float, y))
    
    cont = 0
    array_mult = []
    while(cont < n):
        value_def = (float(x[cont]))*(float(y[cont]))
        array_mult.append(value_def)
        cont += 1
    
    sum_mult = sum(array_mult)
    
    array_x2  = []
    cont = 0
    while(cont < n):
        value_def = ((float(x[cont])) ** 2)
        array_x2.append(value_def)
        cont += 1
        
    sum_x2 = sum(array_x2)
    
    spd = calculation_spd(sum_mult, sum_x, sum_y, n)
    sqd = calculation_sqd(sum_x2, sum_x, n)
    
    b1 = spd/sqd
    
    b0 = (sum_y/n) - (b1*(sum_x/n))
    
    end_var = b0 + b1*res
    
    return end_var
    
def calculation_spd(sum_mult, sum_x, sum_y, n):
    spd = sum_mult - ((sum_x*sum_y)/n)
    return spd

def calculation_sqd(sum_x2, sum_x, n):
    sqd = (sum_x2 - ((sum_x ** 2)/n))
    return sqd

x = input("Digite os dados de 'X': ")
y = input("Digite os dados de 'Y': ")
res = input("Digite o valor a ser descoberto: ")

x = x.split(',')
y = y.split(',')

if(len(x) == len(y)):
    resul = calculation_of_variables(x, y, float(res))
    print("Mais ou menos: ")
    print(resul)
else:
    print("As variáveis de entradam devem ter a mesma quantidade de dados!")

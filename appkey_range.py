#!/usr/bin/python
from random import *

start = 0x302041  # hex literal, gives us a regular integer
end = 0x586471
cont = 0
init = '0d0339f69c6949bd41529f7c16'
array = []

for i in xrange(start, end + 1):
    if (cont < 500):
      x = randint(1, 500)
      print init+format(i+x, 'X')
      cont += 1

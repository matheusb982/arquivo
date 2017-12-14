#!/usr/bin/python

from urllib2 import urlopen

pagina = urlopen('https://www.instagram.com/matheusbruno133/')
texto = pagina.read().decode('utf8')

str1 = 'Followers,'
str2 = 'og:description" content="';

value = texto.find(str2)
value2 = texto.find(str1)

print 'Seguidores = '+texto[value+25:value+28]
print 'Seguindo = '+texto[value2+11:value2+14]

# import urllib2
# import urllib
# from cookielib import CookieJar
#
# cj = CookieJar()
# opener = urllib2.build_opener(urllib2.HTTPCookieProcessor(cj))
# p = opener.open("http://www.fgf.edu.br/blocogonline/AlunoOnline.aspx?nuMatricula=MjAxNDEwNjY2")
#
# print p.read()

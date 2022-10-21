numero = input ('ingresa un numero: ')
try:
    numeroEntero = int(numero)
except ValueError:
    print('el valor ingresado es incorrecto')
else:
    print(numeroEntero + 10)





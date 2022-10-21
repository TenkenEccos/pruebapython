#el encapsulamiento es el metodo de ocultar cierta informacion sensible o que no debe ser manipulada fuera de la clase (atributo o metodo privado)

class Producto:
    def __init__(self, nombre, precio, cantidad):
        self.nombre = nombre
        self.precio = precio
        self.cantidad = cantidad
        #__atributo > estaremos indicando que sera privado y por ende no puede ser accedido desde fuera de la clase
        #_atributo < atributo protegido, en python funciona para cuando queremos utilizar este atributo con herencia
        self.__ventas=[]
        self._precio_mayorista = 100

    def generar_venta(self, fecha, cliente, cantidad):

        
        venta={
            'fecha': fecha ,
            'cliente': cliente,
            'cantidad':cantidad
        }
        self.__ventas.append(venta)
        print(self.__sacar_igv(self.precio))
        print('venta registrada exitosamente')

    def mostrar_ventas(self):
        return self.__ventas
    #'__' sirve para poner en privado el metodo
    def __sacar_igv(self, precio):
        return (precio *1.18) - precio


detergente = Producto(nombre='detergente sapito', precio=4.50, cantidad=50)
detergente.nombre='detergente lechuga'

print(detergente.nombre)

detergente.generar_venta(fecha='2022-10-19', cliente='Eduardo de Rivero', cantidad=10)

detergente.generar_venta(fecha='2022-10-29', cliente='Julissa Perez', cantidad=30)

detergente.generar_venta(fecha='2022-11-01', cliente='Alberto Fujimori', cantidad=15)

print(detergente.mostrar_ventas())

#print(detergente.__sacar_igv(80.00))

class Persona:
    estatura = 1.55
    peso = 80000
    signo = 'CAPRICORNIO'
#metodos magicos: tienen __metodo__ esta estructura
    def __str__(self):
#el metodo __str__ sirve para indicar que cuando se mande a llamar a la clase a imprimir se modificara la impresion predeterminada que mostraba la ubicacion de memoria por lo que se va a retornar,solamente se puede retornar string
        return 'Bienvenido a la clase Persona' 

    def saludar(self):
#self => las funcione dentro de clases se llaman METODOS y para utilizar configuracion de la clase se declara como primer parametro la palabra 'self', NUNCA se pasa como parametro fuera de la clase
        texto = 'hola soy una persona y mido ' + str(self.estatura)
        print(texto)

    def saludar_cordialmente(self,nombre):
        texto= 'hola {}, mucho gusto.'.format(nombre)
        return texto
        
 #variable => instancia de la clase , realiza una copia  y todas las modificaciones que se realicen SOLO se hara en esa copia de la clase  
eduardo = Persona()   
gabriela = Persona()
eduardo.estatura = 1.89
gabriela.estatura = 1.75

#retorna el nombre de la clase en formato string
print(Persona.__name__)
print(eduardo)
print(eduardo.estatura)
print(gabriela.estatura)

eduardo.saludar()
gabriela.saludar()
resultado = eduardo.saludar_cordialmente('Angel')

print(resultado)


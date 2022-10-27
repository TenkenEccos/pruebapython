from datetime import datetime
from flask import Flask
#__name__ --> muestra si el archivo es el principal del proyecto, imprimira '__main__', caso contrario mostrara otro valor
print(__name__)
app = Flask(__name__)

#Endpi}oint ->es cuando definimos una ruta para que pueda ser accedida
#si no se define que verbo HHTP puede acceder, entonces el valor sera GET

@app.route('/', methods = ['GET'])
def inicio():
    #controlador (controller) > la funcionabilidad que tendra mi endppint
    print ('ingreso al endpoint inicial')
    #siempre hay que retornar algo
    return 'Bienvenido a mi primera API en Flask semana2'

@app.route('/estado', methods= ['GET'])
def estado():
    hora_servidor = datetime.now().strftime('%Y-%m-%d %I:%M:%S %p')
    return {
        'estado':True,
        'hora': hora_servidor
    }

@app.route('/identificarse', methods =['POST'])
def identificacion():
    return{
        'message':'identificacion registrada exitosamente'
    }
#run --> sirve para correr nuestro servidor en modo de desarrollo
#debug ->indicara si guardamos algun archivo dentro 

app.run(debug=True)
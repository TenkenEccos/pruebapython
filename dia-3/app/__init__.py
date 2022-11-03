
from flask import Flask, request
#tener carpeta exclusiva para front y para back, tener el entorno virtual en la carpeta principal
#__init__.py hace que la carpeta se comporte como archivo para flask

#pip freeze > requierements.txt para crear listado de requerimientos

app= Flask(__name__)


@app.route("/")
def index():
    return 'Hola soy un servidor de flask '

usuarios =[
    {
        "nombre":"Paolo",
        "dni":"7777777"
    },
    {
        "nombre":"Eduardo",
        "dni":"78787878"
    }
]    

@app.route("/<dni>")
def home(dni):
    for usuario in usuarios:
        if usuario['dni']==dni:
            return f'el nombre del usuario es: {usuario["nombre"]}'
    return f'el usuario con nro de dni {dni} no fue encontrado'


@app.route("/auth/login",methods=['POST'])
def login():
   usuario ={
    "username":"paolo",
    "password":"osito123"
   }
   json = request.get_json()
   if(usuario['username']==json['username'] and usuario['password']==json['password']):
    return 'usuario logeado'
   return 'las credenciales son incorrectas'

@app.route("/productos",methods=['POST','GET','PUT','DELETE'])
def products():
    return 'esta es la ruta productos'    



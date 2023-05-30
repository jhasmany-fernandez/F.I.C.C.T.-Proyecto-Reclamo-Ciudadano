import os
import openai
from dotenv import load_dotenv

load_dotenv()

api_key = os.getenv('OPENAI_API_KEY')   # conectando con nuestra libreria .ven
openai.api_key = api_key    # nuestra libreria pueda validar la key generado

# Ejempolo de llamado a modelos openai
# modelos = openai.Model.list()   # solicitando la lista de modelos de openai
# print(modelos)  # imprimir los modelos

modelo = "text-davinci-002" # prepara la peticion con text
prompt = "¿Cual es la capital de Francia?"   # peticion de texto para enviar

respuesta = openai.Completion.create(
    engine=modelo,  # motor del modelo "engine"
    prompt=prompt,  # peticion "prompt"
    n=1    # cantidad de respuesta a mostrar
)

print(respuesta)    # imprimir respuesta

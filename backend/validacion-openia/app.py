from flask import Flask, request, jsonify
import openai

app = Flask(__name__)

openai.api_key = '' # Reemplaza 'TU_API_KEY' por tu propia clave de API

@app.route('/verificar', methods=['POST'])
def verificar_texto():
    prompt = request.json['texto']
    verificacion = "Verificar si el siguiente texto es obsceno: "
    pregunta = verificacion + prompt
    respuesta = conectar_chatgpt(pregunta)

    if respuesta == "Sí, este texto es obsceno.":
        return jsonify({'es_obsceno': True})
    else:
        return jsonify({'es_obsceno': False})

def conectar_chatgpt(prompt):
    response = openai.Completion.create(
        engine='text-davinci-003',
        prompt=prompt,
        max_tokens=100,
        n=1,
        stop=None,
        temperature=0.7,
        top_p=1,
        frequency_penalty=0,
        presence_penalty=0
    )

    if response.choices:
        return response.choices[0].text.strip()
    else:
        return "error de conexión con OpenAI"

if __name__ == '__main__':
    app.run()
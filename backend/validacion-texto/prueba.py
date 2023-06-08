import openai
verificacion = "Verificar si el siguiente texto es obsceno:  "
def conectar_chatgpt(prompt):
    openai.api_key = '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'  # Reemplaza 'TU_API_KEY' por tu propia clave de API

    response = openai.Completion.create(
        engine='text-davinci-003',  # Utiliza el modelo text-davinci-003 para obtener la mejor respuesta
        prompt=prompt,
        max_tokens=100,  # Número máximo de tokens en la respuesta generada
        n=1,  # Número de respuestas a generar
        stop=None,  # Opcional: cadena de texto para detener la generación de la respuesta
        temperature=0.7,  # Controla la aleatoriedad de las respuestas generadas
        top_p=1,  # Controla la diversidad de las respuestas generadas
        frequency_penalty=0,  # Controla la repetición de frases
        presence_penalty=0  # Controla la generación de respuestas coherentes
    )


    if response.choices:
        return response.choices[0].text.strip()
    else:
        return "error de conexion con openia"

pregunta = verificacion + "¿por que eres un negro de mierda?"
respuesta = conectar_chatgpt(pregunta)

if respuesta == "Sí, este texto es obsceno.":
    print("true")
else:
    print("false")

# Ejemplo de uso

print(respuesta)
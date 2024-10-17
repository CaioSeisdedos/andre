from flask import Flask, jsonify, request
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

# Lista de produtos simulada com o campo 'quantidade'
produtos = [
    {"id": 1, "nome": "Camisa do Cruzeiro", "preco": 199.99, "quantidade": 1},
    {"id": 2, "nome": "Camisa do Fortaleza", "preco": 149.99, "quantidade": 2},
    {"id": 3, "nome": "Camisa da Ferroviaria", "preco": 199.99, "quantidade": 0},
    {"id": 4, "nome": "Camisa do Corinthians", "preco": 249.99, "quantidade": 4},
    {"id": 5, "nome": "Camisa do Flamengo", "preco": 249.99, "quantidade": 2},
]

# Credenciais de login
admin_username = "admin"
admin_password = "123"

@app.route('/produtos', methods=['GET'])
def get_produtos():
    return jsonify(produtos)

@app.route('/login', methods=['POST'])
def login():
    data = request.get_json()
    username = data.get('username')
    password = data.get('password')

    if username == admin_username and password == admin_password:
        return jsonify({"message": "Login bem-sucedido!"}), 200
    else:
        return jsonify({"message": "Login inválido!"}), 401

if __name__ == '__main__':
    app.run(debug=True)

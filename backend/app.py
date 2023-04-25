from flask import Flask, jsonify, request
from flask_cors import CORS

app = Flask(__name__)
CORS(app)
from model.SqlConnector import Instance


# Get Data Routes
@app.route('/idexud_Proyect/createTarea')
def getUsers():
    select=Instance("Select usuario,id_usuario from usuario",1)
    x=[]
    x=["{}-{}".format(tupla[0], tupla[1]) for tupla in select]
   
    return x

# Create Data Routes
@app.route('/idexud_Proyect/createTarea', methods=['POST'])
def addTask():
    row=('NULL',request.json['title'],request.json['description'], request.json['date'])
    insert=f"INSERT INTO `tareas` (`id_tarea`, `titulo`, `descripcion`, `fecha_limite`) VALUES {row}"
    id_tarea=Instance(insert,2)
    id_usuario = int(request.json['mySelect'].split("-")[1])
    asignacion=f"INSERT INTO `asigancion` (`id_asignacion`, `id_tarea`, `id_usuario`, `id_estado`) VALUES (NULL, {id_tarea},{id_usuario} , '1');"
    id_asignacion=Instance(asignacion,2)
    return f"fue asignado {id_asignacion}"



# Create Data Routes
@app.route('/listTarea', )
def getList():
    x=Instance("""SELECT tareas.titulo, tareas.descripcion, tareas.fecha_limite, usuario.usuario, estados.estado
                FROM asigancion
                JOIN tareas ON tareas.id_tarea = asigancion.id_tarea
                JOIN usuario ON usuario.id_usuario = asigancion.id_usuario
                JOIN estados ON estados.id_estado = asigancion.id_estado
            
                """,1)
    print(x)
    json=[{"titulo": tupla[0], "descripcion": tupla[1],"fecha": tupla[2],"usuario":tupla[3],"estado": tupla[4]}for tupla in x]
    return json




# @app.route('/products/<string:product_name>')
# def getProduct(product_name):
#     productsFound = [
#         product for product in products if product['name'] == product_name.lower()]
#     if (len(productsFound) > 0):
#         return jsonify({'product': productsFound[0]})
#     return jsonify({'message': 'Product Not found'})


# # Update Data Route
# @app.route('/products/<string:product_name>', methods=['PUT'])
# def editProduct(product_name):
#     productsFound = [product for product in products if product['name'] == product_name]
#     if (len(productsFound) > 0):
#         productsFound[0]['name'] = request.json['name']
#         productsFound[0]['price'] = request.json['price']
#         productsFound[0]['quantity'] = request.json['quantity']
#         return jsonify({
#             'message': 'Product Updated',
#             'product': productsFound[0]
#         })
#     return jsonify({'message': 'Product Not found'})

# # DELETE Data Route
# @app.route('/products/<string:product_name>', methods=['DELETE'])
# def deleteProduct(product_name):
#     productsFound = [product for product in products if product['name'] == product_name]
#     if len(productsFound) > 0:
#         products.remove(productsFound[0])
#         return jsonify({
#             'message': 'Product Deleted',
#             'products': products
#         })

if __name__ == '__main__':
    app.run(host="0.0.0.0",debug=True, port=4000)



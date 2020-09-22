from flask import Flask
from flask_cors import CORS
from flask_sqlalchemy import SQLAlchemy
from controlers.user_controler import UserControler

# initialisation de l'application Flask
app = Flask(__name__)
# mise en place des CORS
CORS(app)
# définition d'une variable de configuration pour sqlalchemy
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:root@192.168.186.200:3306/users'
# initionalisation de la connexion à la base de données
db = SQLAlchemy(app)
# mise en place du controlleur pour les todos
UserControler.register(app)

# lancement de l'application
if __name__ == "main":
    app.run(debug=True, host='0.0.0.0', ssl_context=('flask_cert.pem', 'flask_key.pem'))

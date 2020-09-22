from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

# création d'une classe qui permettra de faire des objets qui mettront en forme les informations recus depuis la BDD


class User(db.Model):
    __tablename__ = 'users'
    id = db.Column(db.Integer, primary_key=True)
    nom = db.Column(db.String, nullable=False)
    prenom = db.Column(db.String, nullable=False)
    date_naissance = db.Column(db.String, nullable=False)
    email = db.Column(db.String, nullable=False)
    login = db.Column(db.String, nullable=False)
    password = db.Column(db.String, nullable=False)

    def __init__(self, nom, prenom, date_naissance, email, login, password):
        self.nom = nom
        self.prenom = prenom
        self.date_naissance = date_naissance
        self.email = email
        self.login = login
        self.password = password

    def __repr__(self):
        return f'<id:{self.id} nom:{self.nom} prenom:{self.prenom} date_naissance:{self.date_naissance} email:{self.email} login:{self.login} password:{self.password}>'

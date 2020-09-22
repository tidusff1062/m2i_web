apt-get update && apt-get install apache2-utils -y
# moteur SSL
# req -x509: sous commande pour générer un certificat et une clé
# -nodes : désactive le déchiffrement de la clé
# -days 365 : durée de validitée de la clé
# -subj afficher le resultat (requiert -x509)
# -newkey : type de chiffrement
# -keyout : emplacement de la sortie de la clé
# -out : emplacement de la sortie du certificat
openssl req -x509 -nodes -days 365 -subj '/C=FR/ST=Chnord/L=Lille/CN=www.supersite.com' -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

# paramètre de Diffle-Hellman pour augmenter la sécuritée de la clé
openssl dhparam -out /etc/nginx/dhparam.pem 1024

# ajout de pointeurs pour récuperer la clé et le certificat
mkdir /etc/nginx/snippets
touch /etc/nginx/snippets/self-signed.conf
echo "ssl_certificate /etc/ssl/certs/nginx-selfsigned.crt;" >> /etc/nginx/snippets/selfsigned.conf
echo "ssl_certificate_key /etc/ssl/private/nginx-selfsigned.key;" >> /etc/nginx/snippets/selfsigned.conf  

# Config du SSL
touch /etc/nginx/snippets/ssl-params.conf

# définition du protocole
echo "ssl_protocols TLSv1.2;" >> /etc/nginx/snippets/ssl-params.conf

# indique qu'on préfére le chiffrement du server
echo "ssl_prefer_server_ciphers on;" >> /etc/nginx/snippets/ssl-params.conf

# Emplacement du param de Diffle-Hellman
echo "ssl_dhparam /etc/nginx/dhparam.pem;" >> /etc/nginx/snippets/ssl-params.conf

# définition des types de chiffrement
echo "ssl_cyphers 
ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-DSS-AES128-GCM-SHA256:kEDH+AESGCM:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA:ECDHE-ECDSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-DSS-AES128-SHA256:DHE-RSA-AES256-SHA256:DHE-DSS-AES256-SHA:DHE-RSA-AES256-SHA:AES128-GCM-SHA256:AES256-GCM-SHA384:AES128-SHA256:AES256-SHA256:AES128-SHA:AES256-SHA:AES:CAMELLIA:DES-CBC3-SHA:!aNULL:!eNULL:!EXPORT:!DES:!RC4:!MD5:!PSK:!aECDH:!EDH-DSS-DES-CBC3-SHA:!EDH-RSA-DES-CBC3-SHA:!KRB5-DES-CBC3-SHA;" >> /etc/nginx/snippets/ssl-params.conf

# définition de la courbe pour les echanges de clé
echo "ssl_ecdh_curve secp384r1;" >> /etc/nginx/snippets/ssl-params.conf

# définition de la durée de vie d'un session
echo "ssl_session_timeout 10m;" >> /etc/nginx/snippets/ssl-params.conf

# paramètrage du cache shared:name:size
echo "ssl_session_cache shared:SSL:10m;" >> /etc/nginx/snippets/ssl-params.conf

# définition de l'utilisation des ticket
echo "ssl_session_tickets off;" >> /etc/nginx/snippets/ssl-params.conf

#activation de la vérification de la validité du certif
echo "ssl_stapling_verify on;" >> /etc/nginx/snippets/ssl-params.conf

# définition du serveur DNS validant le certificat
echo "resolver 8.8.8.8 8.8.4.4 valid=300s;" >> /etc/nginx/snippets/ssl-params.conf

# délai max de connexion au DNS
echo "resolver_timeout;" >> /etc/nginx/snippets/ssl-params.conf

# activation de la protection contre l'affichage de site dans un site (siteception, <iframe>)
echo "add_header X-Frame-Options deny;" >> /etc/nginx/snippets/ssl-params.conf

# activation de la protection contre le drive by download
echo "add_header X-Content-Type-Options nosniff;" >> /etc/nginx/snippets/ssl-params.conf

# activation de la protection contre le XSS
echo "add_header X-XSS-Protection '1; mode=block';">> /etc/nginx/snippets/ssl-params.conf


from flask import Flask
from flask_talisman import Talisman
from flask_cors import CORS

# Initialize Flask app
app = Flask(__name__)

# Initialize CORS to allow cross-origin requests
CORS(app)

# Initialize Talisman with security headers
talisman = Talisman(
    app,
    force_https=False, # Set to False for local testing, True in production
    strict_transport_security=True,
    session_cookie_secure=True,
    content_security_policy={
        'default-src': [
            '\'self\'',
        ]
    }
)

# Import routes and models after app initialization
from service import routes, models

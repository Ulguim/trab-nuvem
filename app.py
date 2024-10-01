from flask import Flask

from flask_session import Session



def create_app():
    app = Flask(__name__)
   
    app.config['SESSION_TYPE'] = 'filesystem'
    app.secret_key = b'_5#y2L"F4Q8z\n\xec]/'
    Session(app)

    return app

if __name__ == "__main__":
    app = create_app()
    app.run(debug=True, host='0.0.0.0', port=5000)

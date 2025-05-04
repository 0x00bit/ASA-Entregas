from flask import Flask
import psycopg2
app = Flask(__name__)

@app.route('/')
def connect_to_db():
    try:
        conn = psycopg2.connect(
            dbname="mydb",
            user="myuser",
            password="mypassword",
            host="db"  # Container name as hostname
        )
        conn.close()
        return "Successfully connected to the database!"
    except Exception as e:
        return f"Error: {str(e)}"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
from flask import Flask, render_template, request, redirect, url_for, flash, session
from flask_mysqldb import MySQL, MySQLdb
import bcrypt

app = Flask(__name__)
#mysql connection
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'pako'
app.config['MYSQL_PASSWORD'] = 'fierro'
app.config['MYSQL_DB'] = 'flaskcontacts'
mysql = MySQL(app)

#settings
app.secret_key = 'mysecretkey'

encriptar = bcrypt.gensalt()

@app.route('/')
def main():
    if 'nombre' in session:
        return render_template('index.html')
    else:
        return render_template('login.html')

#Index
@app.route('/index')
def Index():
    if 'nombre' in session:
        cur = mysql.connection.cursor()
        cur.execute('SELECT * FROM contacts')
        data = cur.fetchall()
        return render_template('index.html', contacts = data)
    else:
        return render_template('login.html')

#Login        
@app.route('/login', methods=["GET","POST"])
def login():
    if request.method == "POST":
        username = request.form['username']
        passwd = request.form['passwd'].encode('utf-8')

        cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cur.execute("SELECT * FROM users WHERE username=%s",(username,))
        user = cur.fetchone()
        cur.close()

        if user:
            if bcrypt.hashpw(passwd, user['passwd'].encode('utf-8')) == user['passwd'].encode('utf-8'):
                session['loggedin'] = True
                session['idUser'] = user['idUser']
                session['nombre'] = user['nombre']
                session['username'] = user['username']
                cur = mysql.connection.cursor()
                cur.execute('SELECT * FROM contacts')
                data = cur.fetchall()
                return redirect(url_for('Index', contact = data))
                #return render_template('index.html', contact = data)
            else:
                 flash('ACCESO DENEGADO', 'altert-danger')
                 return render_template('login.html')
        else:
             flash('ACCESO DENEGADO', 'altert-danger')
             return render_template('login.html') 
    else:
        flash('ACCESO DENEGADO', 'altert-danger')
        return render_template('login.html') 





#Register
@app.route('/register', methods=["GET","POST"])
def register():
    if request.method == 'GET':
        return render_template("register.html")
    else:
        nombre = request.form['nombre']
        username = request.form['username']
        passwd = request.form['passwd'].encode('utf-8')
        hash_password = bcrypt.hashpw(passwd, bcrypt.gensalt())
        cur = mysql.connection.cursor()
        cur.execute('INSERT INTO users (nombre, username, passwd) VALUES(%s, %s, %s)',(nombre,username,hash_password,))
        mysql.connection.commit()
        flash('You are now registered and can log in')
        session['nombre'] = nombre
        session['username'] = username
        return redirect(url_for('login'))



#Logout
@app.route('/logout')
def logout():
    session.clear()
    return render_template('login.html')

#Crear
@app.route('/add_contact', methods=['POST'])
def add_contact():
    if request.method == 'POST':
        fullname = request.form['fullname']
        phone = request.form['phone']
        email = request.form['email']
        cur = mysql.connection.cursor()
        cur.execute('INSERT INTO contacts (fullname, phone, email) VALUES(%s, %s, %s)',
        (fullname, phone, email))
        mysql.connection.commit()
        flash('Contact Added Successfully')
        return redirect(url_for('Index'))
#editar   
@app.route('/edit/<id>')
def get_contact(id):
    cur = mysql.connection.cursor()
    #cur.execute('SELECT * FROM contacts WHERE id = %s', (id,))
    #cur.execute('SELECT * FROM contacts WHERE id = %s', (str(id),))
    cur.execute('SELECT * FROM contacts WHERE id = {0}'.format(id))
    data = cur.fetchall()
    return render_template('edit-contact.html', contact = data[0])

@app.route('/update/<id>', methods = ['POST'])
def update_contact(id):
    if request.method == 'POST':
        fullname = request.form['fullname']
        phone = request.form['phone']
        email = request.form['email']
        cur = mysql.connection.cursor()
        cur.execute("""
        UPDATE contacts
        SET fullname = %s,
          email = %s,
          phone = %s
        WHERE id = %s
        """, (fullname, email, phone, id))
        mysql.connection.commit()
        flash('Contact Updated Successfully')
        return redirect(url_for('Index'))


#elimintar
@app.route('/delete/<string:id>')
def delete_contact(id):
    cur = mysql.connection.cursor()
    cur.execute('DELETE FROM contacts WHERE id = {0}'.format(id))
    mysql.connection.commit()
    flash('Contact Removed Successfully')
    return redirect(url_for('Index'))

if __name__ == '__main__':
    app.run(port = 3000, debug = True)

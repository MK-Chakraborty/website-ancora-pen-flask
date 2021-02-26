from flask import Flask, render_template, request, session, redirect
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
from flask_mail import Mail
from pathlib import Path
import math
import json

local_server = True
with open(Path(r'F:\Python_practice\.vscode\.vscode\Python_practice\practice_flsk\new flask clean blog web\new_web\website\config.json'), 'r') as configaration:
    parameters = json.load(configaration)["parameters"]

app = Flask(__name__)
app.secret_key = 'KingsXIPanjab'
app.config.update(
    MAIL_SERVER='smtp.gmail.com',
    MAIL_PORT='465',
    MAIL_USE_SSL=True,
    MAIL_USERNAME=parameters['MAIL_USERNAME'],
    MAIL_PASSWORD=parameters['MAIL_PASSWORD']
)
mail = Mail(app)
if local_server == True:
    app.config['SQLALCHEMY_DATABASE_URI'] = parameters['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = parameters['production_uri']
db = SQLAlchemy(app)


class Contacts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50), unique=False, nullable=False)
    email = db.Column(db.String(60), unique=True, nullable=False)
    phone = db.Column(db.String(20), primary_key=True, nullable=False)
    msg = db.Column(db.String(300), unique=False, nullable=False)
    date = db.Column(db.String(20), unique=False, nullable=True)

#############################################################################################


class Customers_feedback(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50), unique=False, nullable=False)
    comment = db.Column(db.String(300), unique=False, nullable=False)
    date = db.Column(db.String(20), unique=False, nullable=True)
#############################################################################################


class Products(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    slug = db.Column(db.String(30), unique=True, nullable=False)
    title = db.Column(db.String(100), unique=False, nullable=False)
    subtitle = db.Column(db.String(300), unique=False, nullable=False)
    content = db.Column(db.String(500), unique=False, nullable=False)
    img_file = db.Column(db.String(20), unique=False, nullable=False)
    date = db.Column(db.String(20), unique=False, nullable=False)


@app.route("/")
def home():
    post = Products.query.filter_by().all()  # [0:parameters['no_of_product']]
    last = math.ceil(len(post)/int(parameters['no_of_product']))

    page = request.args.get('page')
    if int(not str(page).isnumeric()):
        page = 1
    page = int(page)
    post = post[(page-1)*int(parameters['no_of_product']):(page-1) *
                int(parameters['no_of_product'])+int(parameters['no_of_product'])]
    if page == 1:
        previous = "#"
        next = "/?page=" + str(page+1)
    elif page == last:
        previous = "/?page=" + str(page-1)
        next = "#"
    else:
        previous = "/?page=" + str(page-1)
        next = "/?page=" + str(page+1)

    return render_template("index.html", parameter=parameters, posts=post, previous=previous, next=next)


@app.route("/adLogIn", methods=['GET', 'POST'])
def login():
    if ('admin' in session and session['admin'] == parameters['ancora_admin']):
        product = Products.query.all()
        return render_template("dashboard.html", parameter=parameters, products=product)

    if request.method == 'POST':
        usermail = request.form.get('UserMail')
        password = request.form.get('UserPass')
        if (usermail == parameters['ancora_admin'] and password == parameters['ancora_password']):
            session['admin'] = usermail
            product = Products.query.all()
            return render_template("dashboard.html", parameter=parameters, products=product)

    return render_template("log_in.html", parameter=parameters)


@app.route("/edit/<string:sno>", methods=['GET', 'POST'])
def edit_product(sno):
    if ('admin' in session and session['admin'] == parameters['ancora_admin']):
        if request.method == 'POST':
            prod_slug = request.form.get('prod_slug')
            prod_title = request.form.get('prod_title')
            prod_subtitle = request.form.get('prod_subtitle')
            prod_content = request.form.get('prod_content')
            prod_img = request.form.get('prod_img')
            prod_date = datetime.now()

            if sno == '0':
                prod = Products(slug=prod_slug, title=prod_title,
                                subtitle=prod_subtitle, content=prod_content, img_file=prod_img, date=prod_date)
                db.session.add(prod)
                db.session.commit()
            else:
                prod = Products.query.filter_by(sno=sno).first()
                prod.slug = prod_slug
                prod.title = prod_title

                prod.subtitle = prod_subtitle
                prod.content = prod_content
                prod.img_file = prod_img
                prod.date = prod_date
                db.session.commit()
                return redirect('/edit/'+sno)
        prod = Products.query.filter_by(sno=sno).first()
    return render_template("edit.html", parameter=parameters, prod=prod, sno=sno)


@app.route("/delete/<string:sno>", methods=['GET', 'POST'])
def delete_product(sno):
    if ('admin' in session and session['admin'] == parameters['ancora_admin']):
        prod = Products.query.filter_by(sno=sno).first()
        db.session.delete(prod)
        db.session.commit()

    return redirect('/adLogIn')


@app.route("/logout")
def log_out():
    session.pop('admin')
    return redirect('/adLogIn')


@app.route("/about")
def about_page():
    return render_template("about.html", parameter=parameters)


@app.route("/product/<string:product_slug>", methods=['GET', 'POST'])
def product_page(product_slug):
    product = Products.query.filter_by(slug=product_slug).first()

    #############################################################################################
    if request.method == 'POST':
        name = request.form.get('name')
        feedback = request.form.get('message')

        entry = Customers_feedback(
            name=name, comment=feedback, date=datetime.now())
        db.session.add(entry)
        db.session.commit()
        """mail.send_message("A visitor is commented a feedback at Ancora site. Mr./Mrs. " + name +
                          " sends a message", sender=name, recipients=[parameters['MAIL_USERNAME']],
                          body=feedback)"""
    #############################################################################################

    return render_template("post.html", parameter=parameters, products=product)


@app.route("/contact", methods=['GET', 'POST'])
def contact_page():
    if request.method == 'POST':
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('message')

        entry = Contacts(name=name, email=email, phone=phone,
                         msg=message, date=datetime.now())
        db.session.add(entry)
        db.session.commit()
        mail.send_message("A viewer is trying to contact with Ancora. Mr./Mrs. " + name +
                          " sends a message", sender=email, recipients=[parameters['MAIL_USERNAME']],
                          body=message + "\n" + phone)

    return render_template("contact.html", parameter=parameters)


app.run(debug=True)

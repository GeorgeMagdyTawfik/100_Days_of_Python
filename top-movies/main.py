from flask import Flask, render_template, redirect, url_for, request, session
from flask_bootstrap import Bootstrap5
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.orm import DeclarativeBase, Mapped, mapped_column
from sqlalchemy import Integer, String, Float
from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField, FloatField
from wtforms.validators import DataRequired
import requests
from dotenv import dotenv_values
from flask_caching import Cache


class EditForm(FlaskForm):
    rating = FloatField(label="Your rating out of 10 e.g. 7.5", validators=[DataRequired()])
    review = StringField(label="Your Review", validators=[DataRequired()])
    submit = SubmitField("Done")


class AddForm(FlaskForm):
    movieName = StringField(label="Search for Movies by Name", validators=[DataRequired()])
    submit = SubmitField("Search")

MOVIES_API_URL = "https://api.themoviedb.org/3/search/movie?include_adult=false&language=en-US&page=1"

headers = {
    "accept": "application/json",
    "Authorization": dotenv_values().get("AUTH_TOKEN")
}

app = Flask(__name__)
app.config['SECRET_KEY'] = '8BYkEfBA6O6donzWlSihBXox7C0sKR6b'
Bootstrap5(app)

# Configure Flask-Caching
app.config['CACHE_TYPE'] = 'simple'  # Simple in-memory cache
cache = Cache(app)

# CREATE DB
class Base(DeclarativeBase):
  pass

db = SQLAlchemy(model_class=Base)

app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///movies.db"
db.init_app(app)
# CREATE TABLE

#! Mapped[int] is important

class Movie(db.Model):
    id: Mapped[int] = mapped_column(Integer, primary_key=True)
    title: Mapped[str] = mapped_column(String, unique=True, nullable=False)
    year : Mapped[int] = mapped_column(Integer, nullable=False)
    description: Mapped[str] = mapped_column(String, nullable=False)
    rating: Mapped[float] = mapped_column(Float, nullable=False)
    ranking: Mapped[int] = mapped_column(Integer, nullable=False)
    review: Mapped[str] = mapped_column(String, nullable=False)
    img_url: Mapped[str] = mapped_column(String, nullable=False)

def getAllMovies():
    return db.session.execute(db.select(Movie)).scalars().all()

@app.route("/")
def home():
    return render_template("index.html", movies=getAllMovies())

@app.route("/edit", methods=["GET", "POST"])
def editRating():
    form : FlaskForm = EditForm()
    target = request.args.get("id")
    req_movie = db.get_or_404(Movie, target)
    if form.validate_on_submit():
        r = float(form.rating.data)
        req_movie.rating = r if r <=10 else 10
        req_movie.review = form.review.data
        db.session.commit()
        return redirect(url_for("home"))
        
    return render_template("edit.html", form = EditForm(), movie=req_movie)
    
@app.route("/delete")
def deleteMovie():
    target = request.args.get("id")
    req_movie = db.get_or_404(Movie, target)
    db.session.delete(req_movie)
    db.session.commit()
    return redirect(url_for("home"))


@app.route("/add", methods=["GET", "POST"])
def addMovie():
    addForm : FlaskForm = AddForm()
    
    if addForm.validate_on_submit():
        params = {
            "query": addForm.movieName.data
        }
        moviesResponse = requests.get(url=MOVIES_API_URL, headers=headers, params=params)
        moviesResponse = moviesResponse.json()
        # session["searchData"] = moviesResponse
        
        cache.set('searchData', moviesResponse["results"], timeout=5*60)  # Store in cache for 5 minutes

        # print(session.get("searchData", "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"))
        return redirect(url_for('pick'))
    
    return render_template("add.html", form=addForm)

@app.route("/search")
def pick():
    # print(session.get("searchData", "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"))
    # searchData = session.get('searchData', [])  # Retrieve the data from the session
    searchData = cache.get('searchData')  # Retrieve the data from the cache
    return render_template("select.html", movies=searchData)

@app.route("/get-movie")
def getMovieDetails():
    params = request.args.get("id")
    return f"you requested moive id = {params}"

if __name__ == '__main__':
    app.run(debug=True)

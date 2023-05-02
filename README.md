# movielist

##Overview

The Movie List app is a simple Flutter application that displays a list of movies and their details. Users can add new movies to the list, edit existing movies, and delete movies from the list. The app uses Hive as a local database to store the movie list data.

##Architecture and Design

The app follows the Model-View-Controller (MVC) architecture pattern. The Model represents the movie data and is stored in the local database using Hive. The View is represented by the UI, which displays the list of movies and their details. The Controller manages the interactions between the Model and View and handles user actions such as adding, editing, and deleting movies from the list.

The app has two main screens: HomeScreen and Addmoviescreen. The HomeScreen displays the list of moviesand allows the user to edit or delete the movie. The user can add a new movie to the list by tapping on the Add button, which opens the Addmoviescreen. The Addmoviescreen allows the user to enter the movie's title, director, and year of release.

The app uses Hive as a local database to store the movie data. Hive is a lightweight and fast NoSQL database that uses key-value pairs to store data. Each movie is stored as a Hive object and is given a unique ID. The movie data is stored in a box called "movies".

The UI is designed using the Material Design guidelines and follows a simple and clean layout. The app uses a custom theme that defines the app's colors, fonts, and styles.

###Code Structure

The code is organized into several files and folders, each with a specific purpose. The main files and folders are:

lib/main.dart: This file contains the main function and sets up the app's configuration, including the app's title, theme, and routes.

lib/screens/: This folder contains the HomeScreen, MovieDetailScreen, and MovieFormScreen widgets.

lib/models/: This folder contains the Movie model, which represents the movie data and is stored in the local database using Hive.sets up the Hive database and defines the MovieAdapter class that converts between the Movie model and Hive objects.

lib/controller/: This folder  contains the functions that are working in this project.

pubspec.yaml: This file defines the app's dependencies, including the Hive package.



Conclusion

The Movie List app is a simple and well-designed Flutter application that allows users to manage a list of movies.s, guidance on mobile development, and a full API reference.

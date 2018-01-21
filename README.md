# Mobiquity-Code-Challenge

An iOS app that loads movies listing from a URL, parse the JSON response and display the results on the iPhone screen.

Details:

- Load the JSON response for the movies list from “http://data.tmsapi.com/v1.1/movies/showings?startDate=2018-01-13&zip=02368&api_key=22h87g3pgun5vaf4bw5ex4w3”
- Build a 2 screens iOS app "attached Screen-1.png and Screen-2.png", the first screen displays a list of movies and the second screen is the details of a selected movie.
- Each movie will show a thumbnail image , a title and a short description.
- Clicking on any of the movies will load the selected movie details screen.
- The movies details screen is basically a larger image of the movie and the full description.
- The search box in the first screen filters the local list without hitting any services. Each time the user enter a letter , the table content will update.
- This search is based on the movie’s title.

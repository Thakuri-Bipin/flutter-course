import 'package:flutter/material.dart';
import 'package:myflutterapp/model/movie.dart';
import 'package:myflutterapp/ui/movie_ui/movie_ui.dart';

class MovieListView extends StatelessWidget {
  final List<Movie> movieList = Movie.getMovies();
  final List movies = [
    "Titanic",
    "Blade Runner",
    "Rambo",
    "The Avengers",
    "Avatar",
    "I am Legend",
    "300",
    "The Wolf of Wall Street",
    "Interstellar",
    "Game of thrones",
    "Vikings",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor: Colors.blueGrey.shade900,
      body: ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(children: <Widget>[
              movieCard(movieList[index], context),
              Positioned(
                  top: 10.0, child: movieImage(movieList[index].images[0])),
            ]);
            // return Card(
            //   color: Colors.white,
            //   elevation: 3.5,
            //   child: ListTile(
            //     title: Text("${movieList[index].title}"),
            //     subtitle: Text("${movieList[index].genre}"),
            //     leading: CircleAvatar(
            //       child: Container(
            //         decoration: BoxDecoration(
            //             image: DecorationImage(
            //                 image: NetworkImage(movieList[index].images[0]),
            //                 fit: BoxFit.cover),
            //             //color: Colors.blue,
            //             borderRadius: BorderRadius.circular(13.9)),
            //         child: null,
            //       ),
            //     ),
            //     trailing: Text("..."),
            //     // onTap: () =>   {debugPrint("Movie Name: ${movies.elementAt(index)}")},
            //     onTap: () {
            //       Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //               builder: (context) => MovieListViewDetails(
            //                   movieName: movieList.elementAt(index).title,
            //                   movie: movieList[index])));
            //     },
            //   ),
            // );
          }),
    );
  }

  Widget movieCard(Movie movie, BuildContext context) {
    return InkWell(
        child: Container(
          margin: EdgeInsets.only(left: 60.0),
          width: MediaQuery.of(context).size.width,
          height: 120.0,
          child: Card(
            color: Colors.black45,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 54.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              movie.title,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19.0),
                            ),
                          ),
                          Text("Rating : ${movie.imdbRating} / 10",
                              style: mainTextStyle())
                        ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text("Released: ${movie.released}",
                            style: mainTextStyle()),
                        Text("${movie.runtime}", style: mainTextStyle()),
                        Text("${movie.rated}", style: mainTextStyle())
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MovieListViewDetails(
                          movieName: movie.title, movie: movie)))
            });
  }

  TextStyle mainTextStyle() {
    return TextStyle(color: Colors.grey, fontSize: 12.0);
  }

  Widget movieImage(String imageUrl) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: NetworkImage(imageUrl ??
                  'https://images.unsplash.com/photo-1530204071-bc74811986c3?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=751&q=80'),
              fit: BoxFit.cover)),
    );
  }
}

// New route  (screen or page in flutter)
class MovieListViewDetails extends StatelessWidget {
  final String movieName;
  final Movie movie;

  const MovieListViewDetails({Key key, this.movieName, this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Movies"), backgroundColor: Colors.blueGrey.shade900),
      // body: Center(
      //   child: Container(
      //     child: RaisedButton(
      //         child: Text("Go Back $movieName"),
      //         onPressed: () {
      //           // go back to previous screen
      //           Navigator.pop(context);
      //         }),
      //   ),
      // ),
      body: ListView(
        children: <Widget>[
          MovieDetailsThumbnail(thumbnail: movie.images[0]),
          MovieDetailsHeaderWithPoster(movie: movie),
          HorizontalLine(),
          MovieDetailsCast(movie: movie),
          HorizontalLine(),
          MovieDetailsExtraPosters(posters: movie.images)
        ],
      ),
    );
  }
}

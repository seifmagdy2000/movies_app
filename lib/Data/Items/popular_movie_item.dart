//y
import "package:flutter/material.dart";
import 'package:movies_app/Data/ApiManager.dart';
import 'package:movies_app/Data/popular_movies.dart';
import 'package:movies_app/Screens/DetailsScreen.dart';

class PopularMovieItem extends StatefulWidget {
  @override
  _PopularMovieItemState createState() => _PopularMovieItemState();
}

class _PopularMovieItemState extends State<PopularMovieItem> {
  int page = 1;
  int totalPages = 0;
  Color grey=  Color.fromRGBO(89, 86, 84, 0.5);
  Color gold=  Color.fromRGBO(214, 157, 51, 0.7);
  Color iswatchlist=Color.fromRGBO(89, 86, 84, 0.5);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(height: 350,child: FutureBuilder<PopularMovies>(
          future: ApiManager.loadPopularMovies(1),
          builder: (BuildContext context, AsyncSnapshot<PopularMovies> snapshot) {
            print(snapshot.data?.results?.elementAt(page).id??0);
            if (snapshot.hasError)
              return Container();
            else if (snapshot.connectionState == ConnectionState.waiting)
              return Center(child: CircularProgressIndicator());
            return Stack(
              alignment: AlignmentDirectional.center,
              children: [
                InkWell(
                  onTap: () {
                  },
                  child: Container(
                    height: 230,
                    decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(5),
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://image.tmdb.org/t/p/original" +
                                    snapshot.data!.results!
                                        .elementAt(page)
                                        .posterPath),
                            fit: BoxFit.fill)),
                  ),
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 140,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context,  Details.RouteName,arguments: snapshot.data?.results?.elementAt(page).id??0);
                          },
                          child: Container(
                            margin: EdgeInsets.all(20),
                            alignment: AlignmentDirectional.bottomStart,
                            width: 120,
                            height: 160,
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(2),
                                shape: BoxShape.rectangle,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://image.tmdb.org/t/p/original" +
                                            snapshot.data!.results!
                                                .elementAt(page)
                                                .posterPath),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: 280,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          padding: EdgeInsets.only(top: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(snapshot.data?.results?.elementAt(page).title?? " ",style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                              ),),
                              Text(snapshot.data?.results?.elementAt(page).releaseDate?? " ",style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Container(
                  height: 220,
                  child:  MaterialButton(
                      onPressed: () {  

                      },
                      child: Icon(Icons.play_circle_fill_sharp,size: 50,color: Colors.white,)),
                ),
              ],
            );
          },
        ),
        ),
        FutureBuilder<PopularMovies>(
            future: ApiManager.loadPopularMovies(page),
            builder:
                (BuildContext context, AsyncSnapshot<PopularMovies> snapshot) {
              if (snapshot.hasError)
                return Text(
                  snapshot.error.toString(),
                  style: TextStyle(color: Colors.white),
                );
              else if (snapshot.connectionState == ConnectionState.waiting)
                return Center(child: CircularProgressIndicator());
              totalPages = snapshot.data!.totalPages!;
              return Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        color: Color.fromRGBO(40, 42, 40, 1.0),
                        height: 230,
                        padding: EdgeInsets.only(left: 10, top: 20),
                        child: ListView.builder(
                          itemCount: snapshot.data?.results!.length ?? 0,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.only(
                                  top: 10, right: 10, bottom: 10),
                              child: InkWell(
                                onTap: () {
                                  onTap(snapshot.data?.results!
                                          .elementAt(index)
                                          .id ??
                                      0);
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          width: 80,
                                          height: 100,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                              shape: BoxShape.rectangle,
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      "https://image.tmdb.org/t/p/original" +
                                                          snapshot.data!.results!
                                                              .elementAt(index)
                                                              .posterPath),
                                                  fit: BoxFit.fill)),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: 100,
                                      child: Text(
                                        snapshot.data!.results!
                                                .elementAt(index)
                                                .title ??
                                            " ",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            height: 2,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Container(height: 20,)
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.only(bottom: 30, left: 20, top: 5),
                      child: Text(
                        "New Releases",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              );
            })
      ],
    );
  }

  void onTap(int id) {
    Navigator.pushNamed(context,  Details.RouteName, arguments: id);
  }
}

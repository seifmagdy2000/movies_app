///y
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/Data/ApiManager.dart';
import 'package:movies_app/Data/new_movies.dart';
import 'package:movies_app/Screens/DetailsScreen.dart';

class NewMovieItem extends StatefulWidget {
  @override
  _NewMovieItemState createState() => _NewMovieItemState();
}

class _NewMovieItemState extends State<NewMovieItem> {
  int page = 1;
  int totalPages = 0;
  Color grey=  Color.fromRGBO(89, 86, 84, 0.5);
  Color gold=  Color.fromRGBO(214, 157, 51, 0.7);
  Color iswatchlist=Color.fromRGBO(89, 86, 84, 0.5);


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FutureBuilder<NewMovies>(
            future: ApiManager.loadNewMovie(page),
            builder: (BuildContext context, AsyncSnapshot<NewMovies> snapshot) {
              if (snapshot.hasError)
                return Container();
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
                        padding: EdgeInsets.only(left: 10),
                        child: ListView.builder(
                          itemCount: snapshot.data?.results!.length ?? 0,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.only(
                                  top: 30, right: 10, bottom: 10),
                              child: InkWell(
                                onTap: () {
                                  onTap(snapshot.data!.results!
                                      .elementAt(index)
                                      .id);
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
                                        style: TextStyle(
                                            height: 2,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.only(bottom: 30, left: 20, top: 5),
                      child: Text(
                        "Recommended",
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

  void onTap(int? id) {
    Navigator.pushNamed(context,  Details.RouteName, arguments: id);
  }
}

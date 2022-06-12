//y
import 'package:flutter/material.dart';
import 'package:movies_app/Data/movie_details.dart';
import 'package:movies_app/Data/search.dart';
import 'package:movies_app/Screens/DetailsScreen.dart';

import '../ApiManager.dart';

class SearchedMoviesItems extends StatefulWidget {
  String name;


  SearchedMoviesItems(this.name);

  @override
  _SearchedMoviesItemsState createState() => _SearchedMoviesItemsState();
}

class _SearchedMoviesItemsState extends State<SearchedMoviesItems> {
  int page = 1;
  int totalPages = 0;
  //bool iconvis =true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /*
                      Center(
          child: Column(
            children: [

              Container(width: 180,
                height: 180,
                margin: EdgeInsets.only(top: 100),
                child: Icon(Icons.local_movies_sharp,color: Color.fromRGBO(255, 255, 255, 0.4),size: 180,),),
            Text("no movies found",style: TextStyle(color:Color.fromRGBO(255, 255, 255, 0.4),),),
            ],

          ),
        ),
               */

        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FutureBuilder<Search>(
                  future: ApiManager.loadSearchedItems(page, widget.name),
                  builder: (BuildContext context, AsyncSnapshot<Search> snapshot) {
                    if (snapshot.hasError)
                      return Container();
                    else if (snapshot.connectionState == ConnectionState.waiting)
                      return Center(child: CircularProgressIndicator());
                    totalPages = snapshot.data?.totalPages ?? 0;
                    return Column(
                      children: [
                        Container(
                            height: 800,
                            padding: EdgeInsets.only(left: 10,bottom: 70),
                            child: ListView.builder(
                              itemCount: snapshot.data?.results?.length ?? 0,
                              itemBuilder: (context, index) {
                                return Stack(
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.only(top: 10, right: 10, bottom: 10),
                                      child: InkWell(
                                        onTap: () {
                                          print(snapshot.data!.results!
                                              .elementAt(index)
                                              .title);
                                          Navigator.pushNamed(
                                              context,  Details.RouteName,
                                              arguments: snapshot.data!.results!
                                                  .elementAt(index)
                                                  .id);
                                        },
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            FutureBuilder<MovieDetails>(
                                                future: ApiManager.loadMovieDetails(snapshot.data?.results?.elementAt(index).id?? 0),
                                                builder:
                                                    (BuildContext context, AsyncSnapshot<MovieDetails> snapshot) {
                                                  if (snapshot.hasError)
                                                    return Container();
                                                  else if (snapshot.connectionState == ConnectionState.waiting)
                                                    return Center();
                                                  String popularity = snapshot.data!.popularity.toString();
                                                  return Row(
                                                    children: [
                                                  if(snapshot.data?.title == null)...[

                                                      ]else...[
                                                        Container(
                                                    ),
                                                      Container(
                                                        margin: EdgeInsets.symmetric(horizontal: 10),
                                                        width: 160,
                                                        height: 120,
                                                        decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(2),
                                                            shape: BoxShape.rectangle,
                                                            image: DecorationImage(
                                                                image: NetworkImage(
                                                                    "https://image.tmdb.org/t/p/original" +
                                                                        snapshot.data!.posterPath),
                                                                fit: BoxFit.fill)),
                                                      ),
                                                      Container(
                                                        width: 180,
                                                        child: Column(
                                                          children: [
                                                            Container(height: 30,),
                                                            Text(
                                                              snapshot.data?.title?? " ",
                                                              style: TextStyle(
                                                                  color: Colors.white
                                                              ),
                                                            ),
                                                            Container(height: 20,),
                                                            Text(
                                                              snapshot.data?.releaseDate?? " ",
                                                              style: TextStyle(
                                                                  color: Colors.white
                                                                      ,fontSize: 10
                                                              ),
                                                            ),
                                                            Container(height: 40,),
                                                            Divider(
                                                              color: Colors.white,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      ]
                                                    ],
                                                  );
                                                }),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ))
                      ],
                    );
                  })
            ],
          ),
        ),
      ],
    );
  }
}

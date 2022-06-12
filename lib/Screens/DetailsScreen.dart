import 'package:flutter/material.dart';
import 'package:movies_app/Data/ApiManager.dart';
import 'package:movies_app/Data/movie_details.dart';
import 'package:movies_app/Data/Items/related_movie_item.dart';

class Details extends StatelessWidget {
  static const String RouteName = "Details";

  @override
  Widget build(BuildContext context) {
    var movie = ModalRoute
        .of(context)!
        .settings
        .arguments as int;
    return Scaffold(
      backgroundColor: Color.fromRGBO(19, 19, 19, 1.0),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: FutureBuilder<MovieDetails>(
          future: ApiManager.loadMovieDetails(movie),
          builder:
              (BuildContext context, AsyncSnapshot<MovieDetails> snapshot) {
            if (snapshot.hasError)
              return Text(
                snapshot.error.toString(),
                style: TextStyle(color: Colors.white),
              );
            else if (snapshot.connectionState == ConnectionState.waiting)
              return Center(child: CircularProgressIndicator());
            String popularity = snapshot.data!.voteAverage.toString();
            return Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          snapshot.data?.posterPath == null ? Container(
                              color: Colors.black
                          ) : Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://image.tmdb.org/t/p/original" +
                                          snapshot.data!.posterPath),
                                  fit: BoxFit.fill
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                gradient: LinearGradient(
                                    begin: FractionalOffset.bottomCenter,
                                    end: FractionalOffset.topCenter,
                                    stops: [
                                      0.0,
                                      0.25,
                                      0.5,
                                      0.7
                                    ], colors: [
                                  Color.fromRGBO(
                                      132, 104, 221, 1),
                                      Color.fromRGBO(
                                          132, 104, 221, 0.3),
                                  Color.fromRGBO(
                                      132, 104, 221, 0.2),
                                  Color.fromRGBO(
                                      132, 104, 221, 0.1),
                                ]
                                )
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Expanded(child: Container(
                      color: Colors.transparent,
                      child: Stack(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: double.infinity,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(16, 75, 16, 16),
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                color: Color.fromRGBO(255, 255, 255, 0.5),
                                child: Column(
                                  children: [
                                    Padding(padding: EdgeInsets.only(left: 120),
                                      child: Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment
                                              .start,
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            Text(
                                              snapshot.data?.title ?? "No Name",
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold
                                              ),),
                                            Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  Text(popularity,
                                                    style: TextStyle(
                                                        fontWeight: FontWeight
                                                            .bold
                                                    ),),
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.yellow,
                                                  ),
                                                ],
                                              ),)

                                          ],
                                        ),
                                      ),),
                                    Expanded(
                                        child: SingleChildScrollView(
                                        child: Column(
                                        children: [
//*****************************************************************************************************************************************************
                                        SizedBox(
                                          height: 15,
                                        ),
                                          SizedBox(
                                            width: double.infinity,
                                            height: 40,
                                            child: Center(
                                              child: ListView.builder(
                                                shrinkWrap: true,
                                                physics: BouncingScrollPhysics(),
                                                scrollDirection: Axis.horizontal,
                                                itemCount: snapshot.data!.genres!.length,
                                                itemBuilder: (BuildContext context, int index) {
                                                  return Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                                    child: Chip(
                                                      shape: RoundedRectangleBorder(
                                                        side: BorderSide(
                                                            width: 1,
                                                            style: BorderStyle.solid,
                                                            color: Colors.black),
                                                        borderRadius: BorderRadius.circular(20.0),
                                                      ),
                                                      label: Text(
                                                        snapshot.data!.genres![index].name!,
                                                      ),
                                                      backgroundColor: Colors.transparent,
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),


//*****************************************************************************************************************************************************
                                          Padding(padding: EdgeInsets.only(left: 8),
                                          child: Text('Overview',style: TextStyle(
                                            fontWeight: FontWeight.bold
                                          ),),),
                                          Padding(padding: EdgeInsets.all(8),
                                          child: Text(
                                            snapshot.data?.overview?? "",style:TextStyle(
                                              fontWeight: FontWeight.bold
                                          ),
                                          ),
                                          ),
                                          Row(
                                            children: [
                                              Padding(padding: EdgeInsets.only(left: 8,bottom: 4),
                                                child: Text("Release date: ${snapshot.data!.releaseDate}"
                                                  ,style:TextStyle(
                                                    fontWeight: FontWeight.bold
                                                ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ))
                                  ],
                                ),

                              ),
                            ),
                          ),
                          Positioned(
                            top: 15,
                            left: 30,
                            child: Hero(
                              tag: snapshot.data?.id??0,
                              child: SizedBox(
                                width: 100,
                                height: 150,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "https://image.tmdb.org/t/p/original" +
                                                  snapshot.data!.posterPath),
                                          fit: BoxFit.fill
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
                    SingleChildScrollView(
                      child: Container(
                          child: RelatedMoviesItems(snapshot.data!.id??0)),
                    ),
                  ],
                )
              ],
            );
          }),
    );
  }
}

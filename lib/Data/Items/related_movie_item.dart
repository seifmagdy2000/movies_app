//y
import 'package:flutter/material.dart';
import 'package:movies_app/Data/related_movies.dart';
import 'package:movies_app/Screens/DetailsScreen.dart';

import '../ApiManager.dart';

class RelatedMoviesItems extends StatefulWidget {
  int id;
  RelatedMoviesItems(this.id);

  @override
  _RelatedMoviesItemsState createState() => _RelatedMoviesItemsState();
}

class _RelatedMoviesItemsState extends State<RelatedMoviesItems> {
  int page = 1;

  int totalPages = 0;

  @override
  Widget build(BuildContext context) {
    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10, top: 20),
          child: Text("Related Movies",style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Colors.white
          ),),
        ),
        FutureBuilder<RelatedMovies>(
            future: ApiManager.loadRelatedMovie(page,widget.id),
            builder:
                (BuildContext context, AsyncSnapshot<RelatedMovies> snapshot) {
              if (snapshot.hasError)
                return Container();
              else if (snapshot.connectionState == ConnectionState.waiting)
                return Center(child: CircularProgressIndicator());
              totalPages = snapshot.data?.totalPages??0;
              return Column(
                children: [
                  Container(
                    height: 280,
                    padding: EdgeInsets.only(left: 10),
                    child: ListView.builder(
                      itemCount: snapshot.data?.results?.length ?? 0,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          padding:
                          EdgeInsets.only(top: 10, right: 10, bottom: 10),
                          child: InkWell(
                            onTap: (){
                              print(snapshot.data!.results!.elementAt(index).title);
                              Navigator.pushNamed(context,  Details.RouteName,arguments: snapshot.data!.results!.elementAt(index).id);
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 120,
                                  height: 180,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      shape: BoxShape.rectangle,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "https://image.tmdb.org/t/p/original" +
                                                  snapshot.data!.results!
                                                      .elementAt(index)
                                                      .posterPath),
                                          fit: BoxFit.fill)),
                                ),
                                Container(
                                  width: 100,
                                  padding: EdgeInsets.all(3),
                                  child: Text(
                                    snapshot.data!.results!
                                        .elementAt(index)
                                        .title ??
                                        " ",
                                    maxLines: 2,
                                    style: TextStyle(
                                        height: 2,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              );
            })
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movies_app/Data/Items/searched_item.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
String name='';
bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return  ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                margin: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                alignment: Alignment.center,
                height: 80,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 1,
                      ),
                      color: Color.fromRGBO(53, 53, 53, 1.0),
                      borderRadius: BorderRadius.circular(40)),
                  child: TextField(
                    onChanged: (text){
                      setState(() {
                        name=text;
                        isVisible = true;
                      });
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 17,color: Colors.white),
                      hintText: 'Search',
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(20),
                    ),
                  ),
                )),
            Visibility(visible: isVisible,
                child: SearchedMoviesItems(name))
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:votesmarter/model/user.dart';

class FriendsScreen extends StatelessWidget {
  const FriendsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      // Create a grid with 2 columns. If you change the scrollDirection to
      // horizontal, this produces 2 rows.
      crossAxisCount: 3,
      // Generate 100 widgets that display their index in the List.
      children: List.generate(userList.length, (index) {
        return Center(
          child: Card(
            child: Container(
              width: 200,
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                    Material(
                        color: Theme.of(context).primaryColor,
                        shape: CircleBorder(),
                        // child: Icon(Icons.person,
                        //     color: Colors.white, size: 20.0),
                        child: Padding(
                          padding: const EdgeInsets.all(1.5),
                  child: CircleAvatar(
                                      backgroundColor: Theme.of(context).primaryColor,
                                      radius: 25,
                                      backgroundImage: NetworkImage(
                                          "https://picsum.photos/id/" +(index+20).toString() + "/200/200.jpg"),
                                    ),),),
                                    SizedBox(height: 10,),
                  Text(userList[index].name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300),),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

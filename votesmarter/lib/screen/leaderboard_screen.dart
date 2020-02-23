import 'package:flutter/material.dart';
import 'package:votesmarter/model/user.dart';

class LeaderBoardScreen extends StatelessWidget {
  const LeaderBoardScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: userList.length,
      itemBuilder: (BuildContext context, int index){
          
          return ListTile(
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(userList[index].name,style: TextStyle(fontSize: 18),),
                Text(userList[index].date,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300),),
              ],
            ),
            leading: CircleAvatar(
                                      backgroundColor: Colors.amber,
                                      radius: 18,
                                      backgroundImage: NetworkImage(
                                          "https://picsum.photos/id/" +(index+20).toString() + "/200/200.jpg"),
                                    ),
                                  
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                 Text(userList[index].pcentage,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),),

                Text(userList[index].score,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

              ],
            ),

          );

      },
    );
  }
}
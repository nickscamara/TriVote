import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:votesmarter/model/challenge.dart';
import 'package:votesmarter/model/match.dart';
import 'package:votesmarter/model/user.dart';
import 'package:votesmarter/screen/main_game.dart';
import 'package:votesmarter/state/game_state.dart';
class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ListView(
          children: <Widget>[
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => null)),
                    icon: Icon(Icons.menu),
                    color: Colors.black,
                  ),
                  Hero(
                    tag: "profile",
                    child: GestureDetector(
                      // onTap: () => Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => ProfileScreen())),
                      child: Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            image: DecorationImage(
                                image: AssetImage('assets/caleb.jpeg'),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Welcome back,',
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Theme.of(context).primaryColor,
                          fontSize: 20.0)),
                  Text('Caleb',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                          fontSize: 35.0)),
                  SizedBox(height: 20.0),
                  Text('Current Matches',
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.0))
                ],
              ),
            ),
            SizedBox(height: 7.0),
            Container(
              height: 100,
              child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              
                                child: _buildListItemMatch(
                                     matchLists[index].date,
                                    matchLists[index].name,
                                    matchLists[index].opponent,
                                    matchLists[index].urImg,
                                    matchLists[index].opponentImg,
                                    
                                    ),
                              
                            );
                          },
                        
                     
                
              ),
            ),
                 
                
              SizedBox(height: 20.0),
             Padding(
               padding: const EdgeInsets.only(left:25.0),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                   Text('Upcoming Challenges',
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.0)),
                 ],
               ),
             ),
            SizedBox(height: 7.0),
            Container(
              height: 70,
              child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              
                                child: _buildListItem(
                                     chalLists[index].date,
                                    chalLists[index].name,
                                    chalLists[index].score,
                                   
                                    ),
                              
                            );
                          },
                        
                     
                
              ),
            ),
          //   SizedBox(height: 20.0),
          //   Padding(
          //       padding: EdgeInsets.only(left: 20.0),
          //       child: Text('Popular Meal Plans',
          //           style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.0))),
          //     //       Container(
          //     // height: 250.0,
          //     // child: FutureBuilder(
          //     //   future: RestInterface.getPopularMealPlans(),
          //     //   builder:
          //     //       (BuildContext context, AsyncSnapshot<List<Recipe>> snapshot) {
          //     //     return snapshot.data != null
          //     //         ? ListView.builder(
          //     //             scrollDirection: Axis.horizontal,
          //     //             itemCount: 4,
          //     //             itemBuilder: (BuildContext context, int index) {
          //     //               return SingleChildScrollView(
          //     //                 scrollDirection: Axis.horizontal,
                              
          //     //                   child: _buildListItem(
          //     //                       snapshot.data[index].img_url,
          //     //                       snapshot.data[index].name,
          //     //                       snapshot.data[index].calories.toString() +
          //     //                           " cal"),
                              
          //     //               );
          //     //             },
          //     //           )
          //     //         : Container(
          //     //             child: Center(
          //     //               child: Text("Loading"),
          //     //             ),
          //     //           );
          //     //   },
          //     // ),
          //  // ),
            SizedBox(height: 20.0),
            Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text('Progress Tracker',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.0))),
            SizedBox(height: 20.0),
            Container(
              height: 180.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  _buildCardItem('Correct Questions', '70%', .7),
                  _buildCardItem('Level', '10', .3),
                  _buildCardItem('Total Matches', '15', 1),
                ],
              ),
            ),
            
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Align(
            alignment: Alignment.bottomCenter,
                    child: RaisedButton(
        onPressed: () {
          final GameState state = new GameState();
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => MainGame(state: state)));
        },
        padding: EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Text(
          'Start Game',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        color: Theme.of(context).primaryColor,
      )),
          ),
        
      ],
    );
  }

  Widget _buildListItem(String date, String foodName, String price) {
    return Card(
          elevation: 3,
          child: InkWell(
          onTap: () {},
          child: Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                  width: 200.0,
                  child: Stack(
                    children: <Widget>[
                      
                      
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(foodName,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontSize: 14.0)),
                              SizedBox(height: 3.0),
                              Container(
                                  width: 175.0,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            '4.9',
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                color: Colors.grey,
                                                fontSize: 12.0),
                                          ),
                                          SizedBox(width: 3.0),
                                          Icon(Icons.star,
                                              color: Theme.of(context).accentColor, size: 14.0),
                                          Icon(Icons.star,
                                              color: Theme.of(context).accentColor, size: 14.0),
                                          Icon(Icons.star,
                                              color: Theme.of(context).accentColor, size: 14.0),
                                          Icon(Icons.star,
                                              color: Theme.of(context).accentColor, size: 14.0),
                                          Icon(Icons.star,
                                              color: Theme.of(context).accentColor, size: 14.0),
                                        ],
                                      ),
                                      Text(price,
                                          style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey,
                                              fontSize: 14.0)),
                                    ],
                                  ))
                            ],
                          )
                    ],
                  )))),
    );
  }
   Widget _buildListItemMatch(String date, String foodName, String price,String img1, String img2) {
    return Card(
          elevation: 3,
          child: InkWell(
          onTap: () {},
          child: Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                  width: 150.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      
                      
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              CircleAvatar(
                                      backgroundColor: Theme.of(context).primaryColor,
                                      radius: 25,
                                      backgroundImage: AssetImage(img1
                                          ),
                                    ),
                              Text(foodName,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontSize: 14.0)),
                            
                                    
                                 
                            ],
                          ),
                          Text("VS"),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              CircleAvatar(
                                      backgroundColor: Theme.of(context).primaryColor,
                                      radius: 25,
                                      backgroundImage: AssetImage(img2
                                          ),
                                    ),
                              Text(price,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontSize: 14.0)),
                            
                                    
                                 
                            ],
                          ),

                    ],
                  )))),
    );
  }

  Widget _buildCardItem(String text, String pcentText, double percent) {
    return 
          
            Container(
              
          child: Padding(
              padding:
                  EdgeInsets.only(left: 20.0, top: 10.0, bottom: 0.0, right: 20.0),
              child: Container(
                child: Stack(
                  children: <Widget>[
                    CircularPercentIndicator(
                      radius: 105.0,
                      lineWidth: 7.5,
                      animation: true,
                      percent: percent,
                      center: new Text(
                        pcentText,
                        style: new TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 30.0),
                      ),
                      footer: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 5,
                          ),
                          new Text(
                            text,
                            style: new TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15.0),
                          ),
                        ],
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              )),
        
      
    );
  }
}

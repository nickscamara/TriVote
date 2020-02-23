import 'dart:ui';

import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return  ListView(
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                    tag: "profile",
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: <Widget>[
                  Container(
                      child: Container(
                          height: 190.0,
                          width: 190.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(102.5),
                              color: Theme.of(context).primaryColor.withOpacity(0.05)),
                      )),
                    
                  Container(
                      child: Container(
                          height: 170.0,
                          width: 170.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(102.5),
                              gradient: RadialGradient(stops:[0.01,0.5],colors: [Colors.white,Theme.of(context).primaryColor.withOpacity(0.1)]),
                      )),
                    ),
                  Container(
                      child: Container(
                          height: 150.0,
                          width: 150.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(102.5),
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.4))),
                    ),
                    Container(
                      child: Container(
                          height: 132.0,
                          width: 132.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(102.5),
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.5))),
                    ),
                  
                  
                                     Container(
                      child: Container(
                        height: 125.0,
                        width: 125.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(62.5),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/caleb.jpeg'))),
                      ),
                    ),
                  
                ],
              ),),
              SizedBox(height: 25.0),
              Text(
                'Caleb Peffer',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4.0),
              Text(
                'Durham, NH',
                style: TextStyle(fontFamily: 'Montserrat', color: Colors.grey),
              ),
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '34',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          '#Q Answered',
                          style: TextStyle(
                              fontFamily: 'Montserrat', color: Colors.grey),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '310',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          '⭐⭐⭐⭐⭐',
                          style: TextStyle(
                              fontFamily: 'Montserrat', color: Colors.grey),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '10',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          " TriVote Level",
                          style: TextStyle(
                              fontFamily: 'Montserrat', color: Colors.grey),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.table_chart)),
                    IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              buildInfoDetail(
                  "Winner of Weekly Challenge #12", "Top 1%", "Today", "02/23/2019"),
             buildInfoDetail(
                  "Caleb Peffer is more informed than Rebecca", "😂", "Today", "02/22/2019"),
                   buildInfoDetail(
                  "Runner-up of Voting Cup", "#3", "Yesterday", "02/22/2019"),
                  buildInfoDetail(
                  "Caleb Peffer is more informed than Victor", "🔥", "Yesterday", "02/22/2019"),
                 
            ],
          )
        ],
      );
  }

  Widget buildInfoDetail(
      String name, String value, String tooltip, String date) {
    return Padding(
      padding:
          EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0, bottom: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                name,
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                    fontSize: 15.0),
              ),
              SizedBox(height: 7.0),
              Row(
                children: <Widget>[
                  Text(
                    tooltip,
                    style: TextStyle(
                        color: Colors.grey.shade700,
                        fontFamily: 'Montserrat',
                        fontSize: 11.0),
                  ),
                  SizedBox(width: 4.0),
                  Icon(
                    Icons.timer,
                    size: 4.0,
                    color: Colors.black,
                  ),
                  SizedBox(width: 4.0),
                  Text(
                    date,
                    style: TextStyle(
                        color: Colors.grey.shade500,
                        fontFamily: 'Montserrat',
                        fontSize: 11.0),
                  )
                ],
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                value,
                style: TextStyle(
                    color: Colors.grey.shade700,
                    fontFamily: 'Montserrat',
                    fontSize: 20.0),
              ),
            ],
          )
        ],
      ),
    );
  }
}

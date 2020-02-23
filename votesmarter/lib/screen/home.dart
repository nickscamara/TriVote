import 'package:flutter/material.dart';
import 'package:votesmarter/screen/home_screen.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:votesmarter/screen/leaderboard_screen.dart';
import 'package:votesmarter/widgets/navbar.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<NavBarItemData> _navBarItems;
  int _selectedNavIndex = 0;
  List<Widget> _viewsByIndex;
  @override
  void initState() {
    _viewsByIndex = <Widget>[
      HomeScreen(),
      Scaffold(
        body: Text("daw"),
      ),
      //MainGame(),
      
      LeaderBoardScreen(),
      Scaffold(
        body: Text("daw"),
      ),
    ];
    super.initState();
    _selectedNavIndex = 0;
  }

  refresh(int screen) {
    setState(() {
      _selectedNavIndex = screen;
    });
  }
  String _getName(int index){
    if(index == 2)
    {
      return "Leaderboard";
    }else
    {
      return "TriVote";
    }

  }
  

  @override
  Widget build(BuildContext context) {
    _navBarItems = [
      NavBarItemData("Home", OMIcons.home, 125, Theme.of(context).primaryColor),
      NavBarItemData(
          "Friends", OMIcons.people, 125, Theme.of(context).primaryColor),
      // NavBarItemData(
      //     "Explore", OMIcons.explore, 125, Theme.of(context).splashColor),
      NavBarItemData(
          "Leaderboard", OMIcons.list, 125, Theme.of(context).primaryColor),
           NavBarItemData(
          "Profile", OMIcons.person, 125, Theme.of(context).primaryColor),
    ];
    var navBar = NavBar(
      items: _navBarItems,
      itemTapped: _handleNavBtnTapped,
      currentIndex: _selectedNavIndex,
    );
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(_getName(_selectedNavIndex),style: TextStyle(fontSize: 21),),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Theme.of(context).primaryColor,Colors.purple])),
        ),
      ),
      body: _viewsByIndex[_selectedNavIndex],
      bottomNavigationBar: navBar,
    );
  }

  void _handleNavBtnTapped(int index) {
    //Save the new index and trigger a rebuild
    setState(() {
      //This will be passed into the NavBar and change it's selected state, also controls the active content page
      _selectedNavIndex = index;
    });
  }
}

class MenuItem {
  final String name;
  final Color color;
  final double x;
  final int index;
  MenuItem({this.name, this.color, this.x, this.index});
}

import 'package:flutter/material.dart';
import 'package:votesmarter/screen/home_screen.dart';
import 'package:flare_flutter/flare_actor.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> _viewsByIndex;
  int _selectedNavIndex;
  @override
  void initState() {
    _viewsByIndex = <Widget>[
      Scaffold(
        body: Text("daw"),
      ),
      //MainGame(),
      HomeScreen(),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("",style: TextStyle(fontSize: 21),),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Theme.of(context).primaryColor,Colors.purple])),
        ),
      ),
      body: _viewsByIndex[_selectedNavIndex],
      bottomNavigationBar: NavBar(_selectedNavIndex, refresh),
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

class NavBar extends StatefulWidget {
  int _index;
  final Function(int screen) notifyParent;

  NavBar(this._index, this.notifyParent);
  createState() => NavBarState();
}

class NavBarState extends State<NavBar> {
  List items = [
    MenuItem(x: -1.0, name: 'planet', color: Colors.purple, index: 0),
    MenuItem(x: 0, name: 'house', color: Colors.lightBlue[100], index: 1),
    MenuItem(x: 1.0, name: 'heart', color: Colors.pink, index: 2),
  ];

  MenuItem active;

  @override
  void initState() {
    super.initState();
    print("init");
    active = items[widget._index];
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      height: 55,
      color: Colors.black,
      child: Stack(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            alignment: Alignment(active.x, -1),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 1000),
              height: 8,
              width: w * 0.34,
              color: active.color,
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: items.map((k) {
                return _flare(k);
              }).toList(),
            ),
          )
        ],
      ),
    );
  }

  Widget _flare(MenuItem item) {
    return GestureDetector(
      child: AspectRatio(
        aspectRatio: 1,
        child: Padding(
          padding: EdgeInsets.all(4),
          child: FlareActor(
            'assets/${item.name}.flr',
            alignment: Alignment.center,
            fit: BoxFit.contain,
            animation: item.name == active.name ? 'go' : 'idle',
          ),
        ),
      ),
      onTap: () {
        setState(() {
          //active = items[widget._index];
          active = item;
          print(widget._index.toString());
          widget.notifyParent(item.index);
        });
      },
    );
  }
}

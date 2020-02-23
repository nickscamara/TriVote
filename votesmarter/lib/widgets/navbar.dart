import 'dart:math';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final ValueChanged<int> itemTapped;
  final int currentIndex;
  final List<NavBarItemData> items;

  const NavBar({this.items, this.itemTapped, this.currentIndex = 0});

  NavBarItemData get selectedItem => currentIndex >= 0 && currentIndex < items.length ? items[currentIndex] : null;

  @override
  Widget build(BuildContext context) {
    //For each item in our list of data, create a NavBtn widget
    List<Widget> buttonWidgets = items.map((data) {
      //Create a button, and add the onTap listener
      return Padding(
        padding: const EdgeInsets.fromLTRB(8,0,8,0),
        child: NavbarButton(data, data == selectedItem, onTap: () {
          //Get the index for the clicked data
          var index = items.indexOf(data);
          //Notify any listeners that we've been tapped, we rely on a parent widget to change our selectedIndex and redraw
          itemTapped(index);
        }),
      );
    }).toList();

    //Create a container with a row, and add our btn widgets into the row
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).bottomAppBarColor,
        //Add some drop-shadow to our navbar, use 2 for a slightly nicer effect
        boxShadow: [
          BoxShadow(blurRadius: 16, color: Colors.black12),
        ],
      ),
      alignment: Alignment.center,
      height: 80,
      //Clip the row of widgets, to suppress any overflow errors that might occur during animation
      child: ClippedView(
        child: Row(
          //Center buttons horizontally
          mainAxisAlignment: MainAxisAlignment.center,
          // Inject a bunch of btn instances into our row
          children: buttonWidgets,
        ),
      ),
    );
  }
}

class NavBarItemData {
  final String title;
  final IconData icon;
  final Color selectedColor;
  final double width;

  NavBarItemData(this.title, this.icon, this.width, this.selectedColor);
}

class NavbarButton extends StatefulWidget {
  final NavBarItemData data;
  final bool isSelected;
  final VoidCallback onTap;

  const NavbarButton(this.data, this.isSelected, {@required this.onTap });

  @override
  _NavbarButtonState createState() => _NavbarButtonState();
}

class _NavbarButtonState extends State<NavbarButton> with SingleTickerProviderStateMixin {
  AnimationController _iconAnimController;
  bool _wasSelected;
  double _animScale = 1;

  @override
  void initState() {
    //Create a tween + controller which will drive the icon rotation
    int duration = (350 / _animScale).round();
    _iconAnimController = AnimationController(
      duration: Duration(milliseconds: duration),
      vsync: this,
    );
    Tween<double>(begin: 0, end: 1).animate(_iconAnimController)
      //Listen for tween updates, and rebuild the widget tree on each tick
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _startAnimIfSelectedChanged(widget.isSelected);
    //Create our main button, a Row, with an icon and some text
    //Inject the data from our widget.data property
    var content = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        //Rotate the icon using the current animation value
        Rotation3d(
          rotationY: 180 * _iconAnimController.value,
          child: Icon(
            widget.data.icon,
            size: 25,
            color: widget.isSelected ? Colors.white : Color(0xffcccccc),
          ),
        ),
        //Add some hz spacing
        SizedBox(width: 12),
        //Label
        Text(
          widget.data.title,
          style: TextStyle(color: Colors.white, fontFamily: "Montserrat", ),
        ),
      ],
    );

    //Wrap btn in GestureDetector so we can listen to taps
    return GestureDetector(
      onTap: () => widget.onTap(),
      //Wrap in a bit of extra padding to make it easier to tap
      child: Container(
        padding: EdgeInsets.only(top: 16, bottom: 16, right: 4, left: 4),
        //Wrap in an animated container, so changes to width & color automatically animate into place
        child: AnimatedContainer(
          alignment: Alignment.center,
          //Determine target width, selected item is wider
          width: widget.isSelected ? widget.data.width : 56,
          curve: Curves.easeOutCubic,
          padding: EdgeInsets.all(12),
          duration: Duration(milliseconds: (700 / _animScale).round()),
          //Use BoxDecoration top create a rounded container
          decoration: BoxDecoration(
            color: widget.isSelected ? widget.data.selectedColor : Theme.of(context).bottomAppBarColor,
            borderRadius: BorderRadius.all(Radius.circular(24)),
          ),
          //Wrap the row in a ClippedView to suppress any overflow errors if we momentarily exceed the screen size
          child: ClippedView(
            child: content,
          ),
        ),
      ),
    );
  }

  void _startAnimIfSelectedChanged(bool isSelected) {
    if (_wasSelected != widget.isSelected) {
      //Go forward or reverse, depending on the isSelected state
      widget.isSelected ? _iconAnimController.forward() : _iconAnimController.reverse();
    }
    _wasSelected = widget.isSelected;
  }
}




//Takes a x,y or z rotation, in degrees, and rotates. Good for spins & 3d flip effects
class Rotation3d extends StatelessWidget {
  //Degrees to rads constant
  static const double degrees2Radians = pi/180;

  final Widget child;
  final double rotationX;
  final double rotationY;
  final double rotationZ;

  const Rotation3d({Key key, @required this.child, this.rotationX=0, this.rotationY=0, this.rotationZ=0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
        alignment: FractionalOffset.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateX(rotationX * degrees2Radians)
          ..rotateY(rotationY * degrees2Radians)
          ..rotateZ(rotationZ * degrees2Radians),
        child: child);
  }
}


//Hides the overflow of a child, preventing the Flutter framework from throwing errors
class ClippedView extends StatelessWidget {
  final Widget child;
  final Axis clipDirection;

  const ClippedView({Key key, this.child, this.clipDirection = Axis.horizontal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: clipDirection,
      child: child,
    );
  }
}
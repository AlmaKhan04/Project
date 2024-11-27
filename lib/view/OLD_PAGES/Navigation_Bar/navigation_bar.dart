import 'package:flutter/material.dart';
import 'package:ems/view/Dashboard/dashboard.dart';
import 'package:flutter/widgets.dart'; // Ensure this import is correct

class Navigation_bar extends StatefulWidget {
  final String title;

  Navigation_bar({Key? key, required this.title}) : super(key: key);

  @override
  State<Navigation_bar> createState() => _Navigation_barState();
}

class _Navigation_barState extends State<Navigation_bar> {
  int currentIndex = 0;

  void setBottomBarIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 80,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CustomPaint(
            size: Size(size.width, 80),
            painter: BNBCustomPainter(),
          ),
          Center(
            heightFactor: 0.6,
            child: FloatingActionButton(
              backgroundColor: Color.fromARGB(255, 155, 97, 155),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Icon(Icons.add,),
              elevation: 0.1,
              onPressed: () {},
            ),
          ),
          Container(
            width: size.width,
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.home,
                    size: 27.0,
                    color: currentIndex == 0 ? Colors.white : Color.fromARGB(255, 100, 100, 100),
                  ),
                  onPressed: () {
                    setBottomBarIndex(0);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Dashboard(title: 'Profile Setup Page')),
                    );
                  },
                  splashColor: Colors.white,
                ),
                IconButton(
                  icon: Icon(
                    Icons.message,
                    size: 27.0,
                    color: currentIndex == 1 ? Colors.white : Color.fromARGB(255, 100, 100, 100),
                  ),
                  onPressed: () {
                    setBottomBarIndex(1);
                  },
                ),
                Container(
                  width: size.width * 0.20,
                ),
                IconButton(
                  icon: Icon(
                    Icons.feedback,
                    size: 27.0,
                    color: currentIndex == 2 ? Colors.white : Color.fromARGB(255, 100, 100, 100),
                  ),
                  onPressed: () {
                    setBottomBarIndex(2);
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.account_circle,
                    size: 27.0,
                    color: currentIndex == 3 ? Colors.white : Color.fromARGB(255, 100, 100, 100),
                  ),
                  onPressed: () {
                    setBottomBarIndex(3);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Color.fromARGB(255, 207, 176, 206)
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 20); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20), radius: Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

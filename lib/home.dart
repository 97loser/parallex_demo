import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  double rateZero = 0;
  double rateOne = 0;
  double rateTwo = 0;
  double rateThree = 0;
  double rateFour = 0;
  double rateFive = 0;
  double rateSix = 0;
  double rateSeven = 0;
  double? rateEight = 90;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft
    ]);
    return Scaffold(
      body: NotificationListener(
        onNotification: (v) {
          if (v is ScrollUpdateNotification) {
            //only if scroll update notification is triggered
            setState(() {
              if(v!=null){
                rateEight = (rateEight! - (v.scrollDelta! / 1));
                rateSeven -= v.scrollDelta! / 1.5;
                rateSix -= v.scrollDelta !/ 2;
                rateFive -= v.scrollDelta !/ 2.5;
                rateFour -= v.scrollDelta !/ 3;
                rateThree -= v.scrollDelta! / 3.5;
                rateTwo -= v.scrollDelta! / 4;
                rateOne -= v.scrollDelta! / 4.5;
                rateZero -= v.scrollDelta! / 5;
              }
            });
          }
          return true;
        },
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              parallaxItem(index: 0,left: rateZero),
              parallaxItem(index: 1,left: rateOne),
              parallaxItem(index: 2,left: rateTwo),
              parallaxItem(index: 3,left: rateThree),
              parallaxItem(index: 4,left: rateFour),
              parallaxItem(index: 5,left: rateFive),
              parallaxItem(index: 6,left: rateSix),
              parallaxItem(index: 7,left: rateSeven),
              parallaxItem(index: 8,left: rateEight),
              Center(
                child: Container(
                  height: 200,
                  color: Colors.transparent,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){
                    return Container(
                      height: 120,
                      width: 200,
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(4),
                      color: Colors.white38,
                      child: Text("Hello World",
                       style: TextStyle(
                         color: Colors.black,
                         fontSize: 20
                       ),
                      ),
                    );
                  },itemCount: 5,),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget parallaxItem({int? index , double? left}) {
    return Positioned(
      left: left,
      top: 0,
      child: Container(
        height: 550,
        width: 900,
        child: Image.asset("assets/images/parallax$index.png", fit: BoxFit.cover),
      ),
    );
  }
}

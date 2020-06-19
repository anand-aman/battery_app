import 'package:flutter/material.dart';
import 'package:batteryapp/components/reusageable_card.dart';
import 'package:battery/battery.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Battery battery = Battery();
  String batteryCharge;
  int charge;

  void getBatteryData() async {
    var temp = await battery.batteryLevel;
    charge = temp.toInt();
    setState(() {
      batteryCharge = charge.toString();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBatteryData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF181B22),
      appBar: AppBar(
        backgroundColor: Color(0xFF181B22),
        title: Center(
            child: Text(
          'Battery Health Manager',
          style: TextStyle(
            color: Color(0xFF85868B),
          ),
        )),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    batteryCharge,
                    style: TextStyle(
                      fontSize: 90.0,
                      color: Color(0xFFE1E1E1),
                    ),
                  ),
                  Text(
                    'Alert Set : 80%',
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Color(0xFFE1E1E1),
                    ),
                  ),
                ],
              ),
              onPress: () {},
            ),
          ),
          Expanded(
            child: ReusableCard(),
          ),
        ],
      ),
    );
  }
}

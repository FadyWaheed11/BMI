import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  final TextEditingController _ageController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();
  double _BMI = 0.0;
  String _finalResult = "";
  String _state = "";

  void _calculateBMI() {
    setState(() {
      _BMI = double.parse(_weightController.text) /
          (double.parse(_heightController.text) *
              double.parse(_heightController.text));
    });
    _finalResult = _BMI.toStringAsFixed(2);
    _bmiState();
  }

  void _bmiState() {
//    Below 18.5 => Underweight
//    18.5-24.9 => Normal
//    25-29.9 =>Overweight
//    30.0 and above =>Obese
    setState(() {
      if (_BMI < 18.5)
        _state = "Underweight";
      else if (_BMI >= 18.5 && _BMI <= 24.9)
        _state = "Normal";
      else if (_BMI >= 25 && _BMI <= 29.9)
        _state = "Overweight";
      else if (_BMI >= 30.0) _state = "Obese";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.pinkAccent,
        title: new Text("BMI"),
        centerTitle: true,
      ),
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          children: <Widget>[
            new Padding(padding: EdgeInsets.all(3.0)),
            new Image.asset(
              "images/bmi.png",
              width: 80,
              height: 120,
            ),
            new Container(
              margin: EdgeInsets.all(9.0),
              width: 120,
              height: 260,
              color: Colors.grey.shade200,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: "Age", icon: new Icon(Icons.person_outline)),
                  ),
                  new TextField(
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: "Height in Meter",
                        icon: new Icon(Icons.assessment)),
                  ),
                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: "Weight in Kg",
                        icon: new Icon(Icons.line_weight)),
                  ),
                  new Padding(padding: EdgeInsets.only(bottom: 25.0)),
                  new RaisedButton(
                    child: new Text(
                      "Calculate",
                      style: new TextStyle(fontSize: 18.0),
                    ),
                    textColor: Colors.white,
                    color: Colors.pinkAccent,
                    onPressed: _calculateBMI,
                    splashColor: Colors.purple,
                  ),
                ],
              ),
            ),
            new Padding(padding: EdgeInsets.only(bottom: 2.0)),
            new Center(
              child: new Text(
                _ageController.text.isEmpty ||
                        _heightController.text.isEmpty ||
                        _weightController.text.isEmpty
                    ? "PLease fill all fields"
                    : "Your BMI is: $_finalResult",
                style: new TextStyle(
                    fontSize: 30.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w700,
                    color: Colors.blueAccent),
              ),
            ),
            new Padding(padding: EdgeInsets.only(bottom: 20.0)),
            new Center(
              child: new Text(
                "$_state",
                style: new TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.pinkAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

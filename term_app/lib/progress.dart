import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:term_app/home.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';

class Progress extends StatefulWidget {
  @override
  _ProgressState createState() => _ProgressState();
  //_InputButtonState createState() => _InputButtonState();
}

class InputButton extends StatefulWidget {
  @override
  _InputButtonState createState() => _InputButtonState();
}

class UserInputBloodPressure extends StatefulWidget {
  @override
  _UserInputBloodPressureState createState() => _UserInputBloodPressureState();
}

class UserInputWeight extends StatefulWidget {
  @override
  _UserInputWeightState createState() => _UserInputWeightState();
}

class _ProgressState extends State<Progress> {
  bool isShowingMainData = true;
  String mainTitle = 'Blood Pressure';
  int data = 0;
  List<FlSpot> bloodPressurePoints = [];
  List<FlSpot> weightPoints = [];

  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
    InputButton();
    getData();
  }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      data = prefs.getInt('blood_pressure');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.zero),
          gradient: LinearGradient(
            colors: [
              Color(0xff2c274c),
              Color(0xff46426c),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(
                  height: 37,
                ),
                const Text(
                  'Weight & Blood Pressure',
                  style: TextStyle(
                    color: Color(0xff827daa),
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 4,
                ),
                const SizedBox(
                  height: 37,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0, left: 6.0),
                    child: LineChart(
                      isShowingMainData ? bloodPressureData() : weightData(),
                      swapAnimationDuration: const Duration(milliseconds: 250),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
            IconButton(
              icon: Icon(
                Icons.refresh,
                color: Colors.white.withOpacity(isShowingMainData ? 1.0 : 0.5),
              ),
              onPressed: () {
                setState(() {
                  isShowingMainData = !isShowingMainData;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  LineChartData bloodPressureData() {
    return LineChartData(
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
        touchCallback: (LineTouchResponse touchResponse) {},
        handleBuiltInTouches: true,
      ),
      gridData: FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 150,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff72719b),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          margin: 8,
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return 'MAR';
              case 5:
                return 'JUN';
              case 8:
                return 'SEP';
            }
            return '';
          },
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff75729e),
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 60:
                return '60';
              case 80:
                return '80';
              case 100:
                return '100';
              case 120:
                return '120';
              case 140:
                return '140';
            }
            return '';
          },
          margin: 8,
          reservedSize: 30,
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(
            color: Color(0xff4e4965),
            width: 4,
          ),
          left: BorderSide(
            color: Colors.transparent,
          ),
          right: BorderSide(
            color: Colors.transparent,
          ),
          top: BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
      minX: 0,
      maxX: 10,
      maxY: 140,
      minY: 60,
      lineBarsData: bloodPressurePointData(),
    );
  }

  List<LineChartBarData> bloodPressurePointData() {
    final LineChartBarData lineChartBarData1 = LineChartBarData(
      spots: [
        FlSpot(1, 110),
        FlSpot(2, 120),
        FlSpot(3, 130),
        FlSpot(5, 105),
        FlSpot(6, 120),
        FlSpot(7, 113),
        FlSpot(9, 120),
      ],
      isCurved: true,
      colors: [
        Colors.red.shade300,
      ],
      barWidth: 8,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(
        show: false,
      ),
    );
    final LineChartBarData lineChartBarData2 = LineChartBarData(
      spots: [
        FlSpot(1, 80),
        FlSpot(2, 85),
        FlSpot(3, 95),
        FlSpot(5, 105),
        FlSpot(6, 85),
        FlSpot(7, 80),
        FlSpot(9, 82),
      ],
      isCurved: true,
      colors: [
        Colors.blue.shade300,
      ],
      barWidth: 8,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(show: false, colors: [
        const Color(0x00aa4cfc),
      ]),
    );
    return [
      lineChartBarData1,
      lineChartBarData2,
    ];
  }

  LineChartData weightData() {
    return LineChartData(
      lineTouchData: LineTouchData(
        enabled: false,
      ),
      gridData: FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 150,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff72719b),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          margin: 8,
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return 'MAR';
              case 5:
                return 'JUN';
              case 8:
                return 'SEP';
            }
            return '';
          },
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff75729e),
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 100:
                return '100';
              case 125:
                return '125';
              case 150:
                return '150';
              case 175:
                return '175';
            }
            return '';
          },
          margin: 8,
          reservedSize: 30,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: const Border(
            bottom: BorderSide(
              color: Color(0xff4e4965),
              width: 4,
            ),
            left: BorderSide(
              color: Colors.transparent,
            ),
            right: BorderSide(
              color: Colors.transparent,
            ),
            top: BorderSide(
              color: Colors.transparent,
            ),
          )),
      minX: 0,
      maxX: 10,
      maxY: 200,
      minY: 75,
      lineBarsData: weightPointData(),
    );
  }

  List<LineChartBarData> weightPointData() {
    return [
      LineChartBarData(
        spots: [
          FlSpot(1, 110),
          FlSpot(2, 112),
          FlSpot(3, 115),
          FlSpot(5, 120),
          FlSpot(6, 130),
          FlSpot(7, 142),
          FlSpot(9, 155),
        ],
        isCurved: true,
        curveSmoothness: 0,
        colors: [
          Colors.yellow.shade800,
        ],
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: false,
        ),
      ),
    ];
  }
}

class _InputButtonState extends State<InputButton> {
  final bloodPressureController = TextEditingController();

  SpeedDial buildSpeedDial() {
    return SpeedDial(
      /// both default to 16
      marginEnd: 18,
      marginBottom: 20,
      // animatedIcon: AnimatedIcons.menu_close,
      // animatedIconTheme: IconThemeData(size: 22.0),
      /// This is ignored if animatedIcon is non null
      icon: Icons.add,
      activeIcon: Icons.remove,
      // iconTheme: IconThemeData(color: Colors.grey[50], size: 30),

      /// The label of the main button.
      // label: Text("Open Speed Dial"),
      /// The active label of the main button, Defaults to label if not specified.
      // activeLabel: Text("Close Speed Dial"),
      /// Transition Builder between label and activeLabel, defaults to FadeTransition.
      // labelTransitionBuilder: (widget, animation) => ScaleTransition(scale: animation,child: widget),
      /// The below button size defaults to 56 itself, its the FAB size + It also affects relative padding and other elements
      buttonSize: 56.0,
      visible: true,

      /// If true user is forced to close dial manually
      /// by tapping main button and overlay is not rendered.
      closeManually: false,
      curve: Curves.bounceIn,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      onOpen: () => print('OPENING DIAL'),
      onClose: () => print('DIAL CLOSED'),
      tooltip: 'Speed Dial',
      heroTag: 'speed-dial-hero-tag',
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 8.0,
      shape: CircleBorder(),

      // orientation: SpeedDialOrientation.Up,
      // childMarginBottom: 2,
      // childMarginTop: 2,
      children: [
        SpeedDialChild(
          child: Icon(Icons.favorite),
          backgroundColor: Colors.red,
          label: 'Blood Pressure',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UserInputBloodPressure()),
          ),
          onLongPress: () => print('FIRST CHILD LONG PRESS'),
        ),
        SpeedDialChild(
          child: Icon(Icons.trending_up),
          backgroundColor: Colors.green,
          label: 'Weight',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UserInputWeight()),
          ),
          onLongPress: () => print('SECOND CHILD LONG PRESS'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Progress(),
      floatingActionButton: buildSpeedDial(),
    ));
  }
}

class _UserInputBloodPressureState extends State<UserInputBloodPressure> {
  TextEditingController inputController = new TextEditingController();
  String data = "";

  // find directory path
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  // find the local file
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/blood_pressure_points.txt');
  }

  Future<File> writeFile(String input) async {
    final file = await _localFile;

    // Write the file.
    return file.writeAsString('$input');
  }

  // Triggered after user input is completed
  Future<int> readData() async {
    try {
      final file = await _localFile;

      // Read the file.
      String contents = await file.readAsString();
      print("Contents: " + contents);
      setState(() {
        contents = data;
      });
      return int.parse(contents);
    } catch (e) {
      // If encountering an error, return 0.
      return 0;
    }
  }

  //update data file with user blood pressure data
  setBloodPressure(user_input) async {
    print("User val --> " + user_input);
    writeFile(user_input);
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setInt('blood_pressure', user_input);
    readData();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Home()),
    );
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white10,
      body: new Container(
          padding: const EdgeInsets.all(40.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new TextField(
                controller: inputController,
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
                decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.white)),
                  labelText: "Enter your blood pressure",
                  labelStyle: TextStyle(color: Colors.white),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ], // Only numbers can be entered
              ),
              SizedBox(height: 30), // padding between the children
              new TextButton.icon(
                icon: Icon(Icons.check),
                label: Text(''),
                onPressed: () {
                  // save value and return to Progress
                  setBloodPressure(inputController.text);
                  inputController.clear();
                },
              ),
            ],
          )),
    );
  }
}

class _UserInputWeightState extends State<UserInputWeight> {
  TextEditingController inputController = new TextEditingController();
  String data = "";

  // find directory path
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  // find the local file
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/weight_points.txt');
  }

  Future<File> writeFile(String input) async {
    final file = await _localFile;

    // Write the file.
    return file.writeAsString('$input');
  }

  // Triggered after user input is completed
  Future<int> readData() async {
    try {
      final file = await _localFile;

      // Read the file.
      String contents = await file.readAsString();
      print("Contents: " + contents);
      setState(() {
        contents = data;
      });
      return int.parse(contents);
    } catch (e) {
      // If encountering an error, return 0.
      return 0;
    }
  }

  //update data file with user blood pressure data
  setBloodPressure(user_input) async {
    print("User val --> " + user_input);
    writeFile(user_input);
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setInt('blood_pressure', user_input);
    readData();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Home()),
    );
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white10,
      body: new Container(
          padding: const EdgeInsets.all(40.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new TextField(
                controller: inputController,
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
                decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.white)),
                  labelText: "Enter your current weight",
                  labelStyle: TextStyle(color: Colors.white),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ], // Only numbers can be entered
              ),
              SizedBox(height: 30), // padding between the children
              new TextButton.icon(
                icon: Icon(Icons.check),
                label: Text(''),
                onPressed: () {
                  // save value and return to Progress
                  setBloodPressure(inputController.text);
                  inputController.clear();
                },
              ),
            ],
          )),
    );
  }
}

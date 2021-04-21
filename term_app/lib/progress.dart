import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter/services.dart';
import 'package:term_app/home.dart';
import 'package:term_app/email.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:screenshot/screenshot.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

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
  List<FlSpot> systolicPoints = [];
  List<FlSpot> diastolicPoints = [];
  List<FlSpot> weightPoints = [];
  Uint8List _imageFile;
  //Create an instance of ScreenshotController
  ScreenshotController screenshotController = ScreenshotController();

  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
    InputButton();
    updateAllCharts();
  }

  updateChart(file, chart_name) {
    weightPoints.clear();
    systolicPoints.clear();
    diastolicPoints.clear();
    // Read the file and update the line chart data
    file.readAsString().then((String contents) {
      print(contents);
      List<String> lines = contents.split('\n');
      for (var i = 0; i <= lines.length; i++) {
        double x_val = double.parse(lines[i].split(' ')[0]);
        double y_val = double.parse(lines[i].split(' ')[1]);
        if (chart_name == "weight") {
          weightPoints.add(FlSpot(x_val, y_val));
        }
        if (chart_name == "systolic") {
          systolicPoints.add(FlSpot(x_val, y_val));
        }
        if (chart_name == "diastolic") {
          diastolicPoints.add(FlSpot(x_val, y_val));
        }
      }
      if (chart_name == "weight") {
        weightPoints.sort((a, b) => (a.x).compareTo((b.x)));
        print("SORTED POINTS: ");
        print(weightPoints);
      }
      if (chart_name == "systolic") {
        //systolicPoints.add(FlSpot(x_val, y_val));
      }
      if (chart_name == "diastolic") {
        //diastolicPoints.add(FlSpot(x_val, y_val));
      }
    });
  }

  updateAllCharts() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    final weight_file = File('$path/weight_points.txt');
    final diastolic_file = File('$path/diastolic_points.txt');
    final systolic_file = File('$path/systolic_points.txt');
    updateChart(weight_file, "weight");
    updateChart(diastolic_file, "diastolic");
    updateChart(systolic_file, "systolic");
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
            Screenshot(
              controller: screenshotController,
              child: Column(
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
                          isShowingMainData
                              ? bloodPressureData()
                              : weightData(),
                          swapAnimationDuration:
                              const Duration(milliseconds: 250),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    new ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red.shade900, // background
                          onPrimary: Colors.white, // foreground
                        ),
                        child: Text('Save Screenshot'),
                        onPressed: () {
                          screenshotController
                              .capture()
                              .then((Uint8List image) async {
                            setState(() {
                              _imageFile = image;
                            });
                            final result =
                                await ImageGallerySaver.saveImage(image);
                            print("Image saved to gallery.");
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => EmailSender()),
                            // );
                          });
                        })
                  ]),
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
      spots: systolicPoints,
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
      spots: diastolicPoints,
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
        spots: weightPoints,
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
      icon: Icons.add,
      activeIcon: Icons.remove,
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
      children: [
        SpeedDialChild(
          child: Icon(Icons.favorite),
          backgroundColor: Colors.red.shade900,
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
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Progress(),
          floatingActionButton: buildSpeedDial(),
        ));
  }
}

class _UserInputBloodPressureState extends State<UserInputBloodPressure> {
  TextEditingController systolicController = new TextEditingController();
  TextEditingController diastolicController = new TextEditingController();
  DateTime systolic_selected_date = DateTime.now();
  DateTime diastolic_selected_date = DateTime.now();

  // find directory path
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  // find the systolic file
  Future<File> get _systolicFile async {
    final path = await _localPath;
    return File('$path/systolic_points.txt');
  }

  // find the diastolic file
  Future<File> get _diastolicFile async {
    final path = await _localPath;
    return File('$path/diastolic_points.txt');
  }

  // write systolic data
  writeSystolic(date, systolic) async {
    final systolic_file = await _systolicFile;

    // Write the file.
    systolic_file.writeAsString(date + " " + systolic + '\n',
        mode: FileMode.append);

    // Call to update the chart
    _ProgressState temp = new _ProgressState();
    temp.updateChart(systolic_file, "systolic");
  }

  // write diastolic data
  writeDiastolic(date, diastolic) async {
    final diastolic_file = await _diastolicFile;

    // Write the file.
    diastolic_file.writeAsString(date + " " + diastolic + '\n',
        mode: FileMode.append);

    // Call to update the chart
    _ProgressState temp = new _ProgressState();
    temp.updateChart(diastolic_file, "diastolic");
  }

  //update data file with user systolic data
  setSystolic(date, systolic) async {
    writeSystolic(date, systolic);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Home()),
    );
  }

  //update data file with user diastolic data
  setDiastolic(date, diastolic) async {
    writeDiastolic(date, diastolic);

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
                controller: systolicController,
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
                decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.white)),
                  labelText: "Systolic blood pressure",
                  labelStyle: TextStyle(color: Colors.white),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ], // Only numbers can be entered
              ),
              Padding(padding: EdgeInsets.all(10)),
              new ElevatedButton(
                  child: Text('Pick systolic measurement date'),
                  onPressed: () {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2020),
                            lastDate: DateTime(2050))
                        .then((date) {
                      setState(() {
                        systolic_selected_date = date;
                      });
                    });
                  }),
              SizedBox(height: 30), // padding between the children
              new TextField(
                controller: diastolicController,
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
                decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.white)),
                  labelText: "Diastolic blood pressure",
                  labelStyle: TextStyle(color: Colors.white),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ], // Only numbers can be entered
              ),
              SizedBox(height: 30), // padding between the children
              new ElevatedButton(
                  child: Text('Pick diastolic measurement date'),
                  onPressed: () {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2020),
                            lastDate: DateTime(2050))
                        .then((date) {
                      setState(() {
                        diastolic_selected_date = date;
                      });
                    });
                  }),
              new TextButton.icon(
                icon: Icon(Icons.check),
                label: Text(''),
                onPressed: () {
                  // save value and return to Progress
                  setSystolic(
                      (systolic_selected_date.month +
                              (systolic_selected_date.day / 31))
                          .toString(),
                      systolicController.text);
                  setDiastolic(
                      (diastolic_selected_date.month +
                              (diastolic_selected_date.day / 31))
                          .toString(),
                      diastolicController.text);
                  systolicController.clear();
                  diastolicController.clear();
                },
              ),
            ],
          )),
    );
  }
}

class _UserInputWeightState extends State<UserInputWeight> {
  TextEditingController weightController = new TextEditingController();
  TextEditingController dateController = new TextEditingController();
  DateTime selected_date = DateTime.now();

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

  writeFile(date, weight) async {
    final weight_file = await _localFile;

    // Write the file.
    weight_file.writeAsString(date + " " + weight + '\n',
        mode: FileMode.append);

    // Call to update the chart
    _ProgressState temp = new _ProgressState();
    temp.updateChart(weight_file, "weight");
  }

  //update data file with user weight data
  setWeight(date, weight) async {
    writeFile(date, weight);

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
                controller: weightController,
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
              new ElevatedButton(
                  child: Text('Pick a date'),
                  onPressed: () {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2020),
                            lastDate: DateTime(2050))
                        .then((date) {
                      setState(() {
                        selected_date = date;
                      });
                    });
                  }),
              SizedBox(height: 30), // padding between the children
              new TextButton.icon(
                icon: Icon(Icons.check),
                label: Text(''),
                onPressed: () {
                  // save value and return to Progress
                  setWeight(
                      (selected_date.month + (selected_date.day / 31))
                          .toString(),
                      weightController.text);
                  weightController.clear();
                },
              ),
            ],
          )),
    );
  }
}

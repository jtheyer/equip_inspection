import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:core';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Heavy Equipment Inspection',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.yellow,
        //  hintColor: Colors.orange,
      ),
      home: MyHomePage(title: 'Equipment Inspection'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Fluids
  int engineOilRadio = 0; //Engine oil
  String engineOilStatus;
  int hydraulicOilRadio = 0; //Hydraulic oil
  String hydraulicOilStatus;
  int transFluidRadio = 0; //Transmission fluid
  String transFluidStatus;
  int coolantRadio = 0; //Engine coolant fluid
  String coolantStatus;
  int brakeFluidRadio = 0; //Brake fluid
  String brakeFluidStatus;
  int brakeCondRadio = 0; //Brake condition
  String brakeCondStatus;
  int filterRadio = 0; //Air and fuel filter(s)
  String filterStatus;
  int hoseConditionRadio = 0; //hose condition
  String hoseConditionStatus;
  int wiperShieldRadio = 0; //Windshield wipers and fluid
  String wiperShieldStatus;
  int greaseRadio = 0; //Grease points and greased
  String greaseStatus;

  //Exterior
  int tireTrackRadio = 0; //Tires and/or Tracks
  String tireTrackStatus;
  int exhaustRadio = 0; //Exhaust system
  String exhaustStatus;
  int couplerRadio = 0; //Coupling devices and connectors
  String couplerStatus;
  int bladeBoomRipperRadio = 0; //Blade, boom, and ripper condition
  String bladeBoomRipperStatus;
  int groundEngaAttRadio = 0; //Ground Engaging Attachments
  String groundEngaAttStatus;
  int cablesRadio = 0; //Power cable and/or hoise cable(s)
  String cablesStatus;
  int frameLadWalkRadio = 0; //Frame, Ladders, and Walkways
  String frameLadWalkStatus;
  int handStepsRadio = 0; //Hand grabs and Steps
  String handStepsStatus;

  //Cab
  int cabRadio = 0; //Cab condition
  String cabStatus;
  int hornRadio = 0; //horn
  String hornStatus;
  int fireExRadio = 0; //fire extinguisher
  String fireExStatus;
  int lightsRadio = 0; //lights and turn signals
  String lightsStatus;
  int reverseRadio = 0; //Reverse alarm and lights
  String reverseStatus;
  int acHeatRadio = 0; //Air conditioner and/or Heater
  String acHeatStatus;
  int steeringRadio = 0; //Steering (standard and emergency)
  String steeringStatus;

  TextEditingController _commentsController = TextEditingController();
  final TextEditingController _equipmentNumController = TextEditingController();
  final TextEditingController _coNameController = TextEditingController();
  final TextEditingController _recipientEmailController =
      TextEditingController();
  final TextEditingController _equipmentTypeController =
      TextEditingController();
  final TextEditingController _jobNameController = TextEditingController();

  setEngineOilRadio(int val) {
    setState(() {
      engineOilRadio = val;
    });
    switch (val.toString()) {
      case '1':
        engineOilStatus = 'Pass';
        break;
      case '2':
        engineOilStatus = 'Fail';
        break;
      case '3':
        engineOilStatus = 'Not Applicable';
        break;
    }
  }

  setHydraulicOilRadio(int val) {
    setState(() {
      hydraulicOilRadio = val;
    });
    switch (val.toString()) {
      case '4':
        hydraulicOilStatus = 'Pass';
        break;
      case '5':
        hydraulicOilStatus = 'Fail';
        break;
      case '6':
        hydraulicOilStatus = 'Not Applicable';
        break;
    }
  }

  setTransFluidRadio(int val) {
    setState(() {
      transFluidRadio = val;
    });
    switch (val.toString()) {
      case '7':
        transFluidStatus = 'Pass';
        break;
      case '8':
        transFluidStatus = 'Fail';
        break;
      case '9':
        transFluidStatus = 'Not Applicable';
        break;
    }
  }

  setCoolantRadio(int val) {
    setState(() {
      coolantRadio = val;
    });
    switch (val.toString()) {
      case '10':
        coolantStatus = 'Pass';
        break;
      case '11':
        coolantStatus = 'Fail';
        break;
      case '12':
        coolantStatus = 'Not Applicable';
        break;
    }
  }

  setBrakeFluidRadio(int val) {
    setState(() {
      brakeFluidRadio = val;
    });
    switch (val.toString()) {
      case '13':
        brakeFluidStatus = 'Pass';
        break;
      case '14':
        brakeFluidStatus = 'Fail';
        break;
      case '15':
        brakeFluidStatus = 'Not Applicable';
        break;
    }
  }

  setBrakeCondRadio(int val) {
    setState(() {
      brakeCondRadio = val;
    });
    switch (val.toString()) {
      case '16':
        brakeCondStatus = 'Pass';
        break;
      case '17':
        brakeCondStatus = 'Fail';
        break;
      case '18':
        brakeCondStatus = 'Not Applicable';
        break;
    }
  }

  setFilterRadio(int val) {
    setState(() {
      filterRadio = val;
    });
    switch (val.toString()) {
      case '19':
        filterStatus = 'Pass';
        break;
      case '20':
        filterStatus = 'Fail';
        break;
      case '21':
        filterStatus = 'Not Applicable';
        break;
    }
  }

  setHoseConditionRadio(int val) {
    setState(() {
      hoseConditionRadio = val;
    });
    switch (val.toString()) {
      case '22':
        hoseConditionStatus = 'Pass';
        break;
      case '23':
        hoseConditionStatus = 'Fail';
        break;
      case '24':
        hoseConditionStatus = 'Not Applicable';
        break;
    }
  }

  setWiperRadio(int val) {
    setState(() {
      wiperShieldRadio = val;
    });
    switch (val.toString()) {
      case '25':
        wiperShieldStatus = 'Pass';
        break;
      case '26':
        wiperShieldStatus = 'Fail';
        break;
      case '27':
        wiperShieldStatus = 'Not Applicable';
        break;
    }
  }

  setGreaseRadio(int val) {
    setState(() {
      greaseRadio = val;
    });
    switch (val.toString()) {
      case '28':
        greaseStatus = 'Pass';
        break;
      case '29':
        greaseStatus = 'Fail';
        break;
      case '30':
        greaseStatus = 'Not Applicable';
        break;
    }
  }

  setTireTrackRadio(int val) {
    setState(() {
      tireTrackRadio = val;
    });
    switch (val.toString()) {
      case '31':
        tireTrackStatus = 'Pass';
        break;
      case '32':
        tireTrackStatus = 'Fail';
        break;
      case '33':
        tireTrackStatus = 'Not Applicable';
        break;
    }
  }

  setExhaustRadio(int val) {
    setState(() {
      exhaustRadio = val;
    });
    switch (val.toString()) {
      case '34':
        exhaustStatus = 'Pass';
        break;
      case '35':
        exhaustStatus = 'Fail';
        break;
      case '36':
        exhaustStatus = 'Not Applicable';
        break;
    }
  }

  setCouplerRadio(int val) {
    setState(() {
      couplerRadio = val;
    });
    switch (val.toString()) {
      case '37':
        couplerStatus = 'Pass';
        break;
      case '38':
        couplerStatus = 'Fail';
        break;
      case '39':
        couplerStatus = 'Not Applicable';
        break;
    }
  }

  setBladeBoomRipperRadio(int val) {
    setState(() {
      bladeBoomRipperRadio = val;
    });
    switch (val.toString()) {
      case '40':
        bladeBoomRipperStatus = 'Pass';
        break;
      case '41':
        bladeBoomRipperStatus = 'Fail';
        break;
      case '42':
        bladeBoomRipperStatus = 'Not Applicable';
        break;
    }
  }

  setGroundEngaAttRadio(int val) {
    setState(() {
      groundEngaAttRadio = val;
    });
    switch (val.toString()) {
      case '43':
        groundEngaAttStatus = 'Pass';
        break;
      case '44':
        groundEngaAttStatus = 'Fail';
        break;
      case '45':
        groundEngaAttStatus = 'Not Applicable';
        break;
    }
  }

  setCablesRadio(int val) {
    setState(() {
      cablesRadio = val;
    });
    switch (val.toString()) {
      case '46':
        cablesStatus = 'Pass';
        break;
      case '47':
        cablesStatus = 'Fail';
        break;
      case '48':
        cablesStatus = 'Not Applicable';
        break;
    }
  }

  setFrameLadWalkRadio(int val) {
    setState(() {
      frameLadWalkRadio = val;
    });
    switch (val.toString()) {
      case '49':
        frameLadWalkStatus = 'Pass';
        break;
      case '50':
        frameLadWalkStatus = 'Fail';
        break;
      case '51':
        frameLadWalkStatus = 'Not Applicable';
        break;
    }
  }

  setHandStepsRadio(int val) {
    setState(() {
      handStepsRadio = val;
    });
    switch (val.toString()) {
      case '52':
        handStepsStatus = 'Pass';
        break;
      case '53':
        handStepsStatus = 'Fail';
        break;
      case '54':
        handStepsStatus = 'Not Applicable';
        break;
    }
  }

  setCabRadio(int val) {
    setState(() {
      cabRadio = val;
    });
    switch (val.toString()) {
      case '55':
        cabStatus = 'Pass';
        break;
      case '56':
        cabStatus = 'Fail';
        break;
      case '57':
        cabStatus = 'Not Applicable';
        break;
    }
  }

  setHornRadio(int val) {
    setState(() {
      hornRadio = val;
    });
    switch (val.toString()) {
      case '58':
        hornStatus = 'Pass';
        break;
      case '58':
        hornStatus = 'Fail';
        break;
      case '60':
        hornStatus = 'Not Applicable';
        break;
    }
  }

  setFireExRadio(int val) {
    setState(() {
      fireExRadio = val;
    });
    switch (val.toString()) {
      case '61':
        fireExStatus = 'Pass';
        break;
      case '62':
        fireExStatus = 'Fail';
        break;
      case '63':
        fireExStatus = 'Not Applicable';
        break;
    }
  }



  setLightsRadio(int val) {
    setState(() {
      lightsRadio = val;
    });
    switch (val.toString()) {
      case '64':
        lightsStatus = 'Pass';
        break;
      case '65':
        lightsStatus = 'Fail';
        break;
      case '66':
        lightsStatus = 'Not Applicable';
        break;
    }
  }

  setReverseRadio(int val) {
    setState(() {
      reverseRadio = val;
    });
    switch (val.toString()) {
      case '67':
        reverseStatus = 'Pass';
        break;
      case '68':
        reverseStatus = 'Fail';
        break;
      case '69':
        reverseStatus = 'Not Applicable';
        break;
    }
  }

  setAcHeatRadio(int val) {
    setState(() {
      acHeatRadio = val;
    });
    switch (val.toString()) {
      case '70':
        acHeatStatus = 'Pass';
        break;
      case '71':
        acHeatStatus = 'Fail';
        break;
      case '72':
        acHeatStatus = 'Not Applicable';
        break;
    }
  }

  setSteeringRadio(int val) {
    setState(() {
      steeringRadio = val;
    });
    switch (val.toString()) {
      case '73':
        steeringStatus = 'Pass';
        break;
      case '74':
        steeringStatus = 'Fail';
        break;
      case '75':
        steeringStatus = 'Not Applicable';
        break;
    }
  }

  saveMenuItem(String item) async {
    SharedPreferences menuPrefs = await SharedPreferences.getInstance();
    switch (item) {
      case ('coName'):
        menuPrefs.setString('coName', _coNameController.text);
        break;
      case ('recEmail'):
        menuPrefs.setString('recEmail', _recipientEmailController.text);
        break;
    }
  }

  _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('recEmail', _recipientEmailController.text);
    prefs.setString('equipType', _equipmentTypeController.text);
    prefs.setString('unitNum', _equipmentNumController.text);
    prefs.setString('jobName', _jobNameController.text);
    prefs.setInt('engOil', engineOilRadio);
//    prefs.setString('engOilSts', engineOilStatus);
    prefs.setInt('hydOil', hydraulicOilRadio);
    prefs.setInt('trans', transFluidRadio);
    prefs.setInt('coolant', coolantRadio);
    prefs.setInt('brakeFluid', brakeFluidRadio);
    prefs.setInt('brakeCond', brakeCondRadio);
    prefs.setInt('filters', filterRadio);
    prefs.setInt('hoseCond', hoseConditionRadio);
    prefs.setInt('wiper', wiperShieldRadio);
    prefs.setInt('grease', greaseRadio);
    prefs.setInt('tireTrack', tireTrackRadio);
    prefs.setInt('exhaust', exhaustRadio);
    prefs.setInt('coupler', couplerRadio);
    prefs.setInt('bladeboom', bladeBoomRipperRadio);
    prefs.setInt('groundEnga', groundEngaAttRadio);
    prefs.setInt('cables', cablesRadio);
    prefs.setInt('frameLad', frameLadWalkRadio);
    prefs.setInt('handSteps', handStepsRadio);
    prefs.setInt('cab', cabRadio);
    prefs.setInt('horn', hornRadio);
    prefs.setInt('fireEx', fireExRadio);
    prefs.setInt('lights', lightsRadio);
    prefs.setInt('reverse', reverseRadio);
    prefs.setInt('acHeat', acHeatRadio);
    prefs.setInt('steering', steeringRadio);
  }

  loadMenuItems() async {
    SharedPreferences menuPrefs = await SharedPreferences.getInstance();
    setState(() {
      _coNameController.text = menuPrefs.getString('coName') ?? '';
    });
  }

  _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      _recipientEmailController.text = prefs.getString('recEmail') ?? '';
      _equipmentTypeController.text = prefs.getString('equipType') ?? '';
      _equipmentNumController.text = prefs.getString('unitNum') ?? '';
      _jobNameController.text = prefs.getString('jobName') ?? '';
    });
    setEngineOilRadio(prefs.getInt('engOil') ?? 0);
    setHydraulicOilRadio(prefs.getInt('hydOil') ?? 0);
    setTransFluidRadio(prefs.getInt('trans') ?? 0);
    setCoolantRadio(prefs.getInt('coolant') ?? 0);
    setBrakeFluidRadio(prefs.getInt('brakeFluid') ?? 0);
    setBrakeCondRadio(prefs.getInt('brakeCond') ?? 0);
    setFilterRadio(prefs.getInt('filters') ?? 0);
    setHoseConditionRadio(prefs.getInt('hoseCond') ?? 0);
    setWiperRadio(prefs.getInt('wiper') ?? 0);
    setGreaseRadio(prefs.getInt('grease') ?? 0);
    setTireTrackRadio(prefs.getInt('tireTrack') ?? 0);
    setExhaustRadio(prefs.getInt('exhaust') ?? 0);
    setCouplerRadio(prefs.getInt('coupler') ?? 0);
    setBladeBoomRipperRadio(prefs.getInt('bladeboom') ?? 0);
    setGroundEngaAttRadio(prefs.getInt('groundEnga') ?? 0);
    setCablesRadio(prefs.getInt('cables') ?? 0);
    setFrameLadWalkRadio(prefs.getInt('frameLad') ?? 0);
    setHandStepsRadio(prefs.getInt('handSteps') ?? 0);
    setCabRadio(prefs.getInt('cab') ?? 0);
    setHornRadio(prefs.getInt('horn') ?? 0);
    setFireExRadio(prefs.getInt('fireEx') ?? 0);
    setLightsRadio(prefs.getInt('lights') ?? 0);
    setReverseRadio(prefs.getInt('reverse') ?? 0);
    setAcHeatRadio(prefs.getInt('acHeat') ?? 0);
    setSteeringRadio(prefs.getInt('steering') ?? 0);
  }

//  _clearData() async {
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    return prefs.clear();
//  }

  sendMail() async {
    setCommentsSection(_commentsController);
    final Email myEmail = Email(
      body: engineOilStatus +
          ": Engine Oil" +
          " \n" +
          hydraulicOilStatus +
          ": Hydraulic Oil" +
          " \n" +
          transFluidStatus +
          ": Transmission Fluid" +
          " \n" +
          coolantStatus +
          ": Coolant (Engine)" +
          " \n" +
          brakeFluidStatus +
          ": Brake Fluid" +
          " \n" +
          brakeCondStatus +
          ": Brake Condition" +
          " \n" +
          filterStatus +
          ": Filters (Air & Fuel)" +
          " \n" +
          hoseConditionStatus +
          ": Hose(s) Condition" +
          " \n" +
          wiperShieldStatus +
          ": Wiper Fluid, Wipers & Windshield" +
          " \n" +
          greaseStatus +
          ": Grease Points & Grease" +
          " \n" +
          tireTrackStatus +
          ": Tires / Tracks" +
          " \n" +
          exhaustStatus +
          ": Exhaust System" +
          " \n" +
          couplerStatus +
          ": Coupling Devices & Attachments" +
          " \n" +
          bladeBoomRipperStatus +
          ": Blade, Boom, & Rippers" +
          " \n" +
          groundEngaAttStatus +
          ": Ground Engaging Attachments" +
          " \n" +
          cablesStatus +
          ": Cable(s) (Power/Hoist)" +
          " \n" +
          frameLadWalkStatus +
          ": Frame, Ladder(s), & Walkway(s)" +
          " \n" +
          handStepsStatus +
          ": Hand Grabs & Steps" +
          " \n" +
          cabStatus +
          ": Cab & Mirrors" +
          " \n" +
          hornStatus +
          ": Horn & Gagues" +
          " \n" +
          fireExStatus +
          ": Fire Extinguisher" +
          " \n" +
          lightsStatus +
          ": Lights & Turn Signals" +
          " \n" +
          reverseStatus +
          ": Reverse (Alarm & Lights)" +
          " \n" +
          acHeatStatus +
          ": AC / Heater" +
          " \n" +
          steeringStatus +
          ": Steering (Standard & Emergency)" +
          " \n" +
          "\n Comments: " +
          _commentsController.text,
      subject: _coNameController.text +
          " Equipment Inspection: " +
          _jobNameController.text + " - " +
          _equipmentTypeController.text +
          " " +
          _equipmentNumController.text,
      recipients: [_recipientEmailController.text],
//      cc: ['cc@example.com'],
//      bcc: ['bcc@example.com'],
//      attachmentPath: '/path/to/attachment.zip',
    );
    await FlutterEmailSender.send(myEmail);
  }

  setCommentsSection(TextEditingController commentController) {
    print('in setCommentsSection method');
    if (commentController.text.isEmpty == true) {
      print('comment section isEmpty');
      _commentsController.text = "No Comment(s)";
    }
  }

  choiceSelection(String choice) {
    print('Choice is:' + choice); //for DEBUG
    switch (choice) {
      case 'Company Name':
        {
          print("inside choiceSelection switchCase: co name"); //for DEBUG
          return showDialog(
            context: context,
            barrierDismissible:
                true, //makes pressing outside to close dialog possible
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Set Company Name"),
                content: TextField(
                    controller: _coNameController,
                    decoration:
                        InputDecoration(hintText: "Company name goes here..."),
                    onChanged: (String s) {
                      _coNameController.text;
                    }),
                actions: <Widget>[
                  new RaisedButton(
                    child: new Text('Cancel',
                      style: TextStyle(color: Colors.black),),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  new RaisedButton(
                    child: new Text('Done',
                    style: TextStyle(color: Colors.black),),
                    onPressed: () {
                      setState(() {
                        _coNameController.text;
                        saveMenuItem('coName');
                      });
                      Navigator.pop(context);
                    },
                  ), //FlatButton
                ],
              );
            },
          );
        }
        break;

      case 'Recipient E-mail':
        {
          print("In recipiend email case ");
          return showDialog(
            context: context,
            barrierDismissible:
                true, //makes pressing outside to close dialog possible
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Set Recipient E-mail Adrress"),
                content: TextField(
                  controller: _recipientEmailController,
                  decoration: InputDecoration(
                      hintText: "Recipient's E-mail goes here..."),
                  onChanged: (String s) {
                    _recipientEmailController;
                  },
                ),
                actions: <Widget>[
                  new RaisedButton(
                    child: new Text('Cancel',
                      style: TextStyle(color: Colors.black),),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  new RaisedButton(
                    child: new Text('Done',
                    style: TextStyle(color: Colors.black),),
                    onPressed: () {
                      saveMenuItem('recEmail');
                      Navigator.pop(context);
                    },
                  ), //FlatButton
                ],
              );
            },
          );
        }
        break;
    }
  } //choiceSelection

  _resetButtons() {
//      radioVals.forEach((element) {
//        element = 0;
//      });
//      for(int i = 0; i < radioVals.length; i++){
//        setState(() {
//          radioVals[i] = 0;
//        });
//        print('inside reset at > ' + i.toString());
//      }
    setState(() {
      engineOilRadio = 0;
      hydraulicOilRadio = 0;
      transFluidRadio = 0;
      coolantRadio = 0;
      brakeFluidRadio = 0;
      brakeCondRadio = 0;
      filterRadio = 0;
      hoseConditionRadio = 0;
      wiperShieldRadio = 0;
      greaseRadio = 0;
      tireTrackRadio = 0;
      exhaustRadio = 0;
      couplerRadio = 0;
      bladeBoomRipperRadio = 0;
      groundEngaAttRadio = 0;
      cablesRadio = 0;
      frameLadWalkRadio = 0;
      handStepsRadio = 0;
      cabRadio = 0;
      hornRadio = 0;
      fireExRadio = 0;
      lightsRadio = 0;
      reverseRadio = 0;
      acHeatRadio = 0;
      steeringRadio = 0;
    }); // /setState
  }

  String setCondition(String area, String status) {
    if (status == 'pass') {
      return area + ": Pass";
    } else if (status == 'fail') {
      return area + ": Fail";
    } else {
      return area + ": Not Applicable";
    }
  }

  Widget keyboardDismisser({BuildContext context, Widget child}) {
    final gesture = GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        debugPrint("Keyboard Dismissed!");
      },
      child: child,
    ); //GestureDector
    return gesture;
  }

  @override
  void initState() {
    super.initState();
    loadMenuItems();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return this.keyboardDismisser(
      context: context,
      child: Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(_coNameController.text + " " + widget.title),
          actions: <Widget>[
            PopupMenuButton(
              onSelected: choiceSelection,
              itemBuilder: (BuildContext context) {
                return Constants.choices.map((String choice) {
                  return PopupMenuItem<String>(
                      value: choice, child: Text(choice)); //PopupMenuItem
                }).toList(); //PopupMenuButton
              },
            ),
          ],
        ),
        body: ListView(
//        mainAxisAlignment: MainAxisAlignment.start,
//        crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Divider(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                  width: 220,
                  height: 65,
                  child: TextField(
                    controller: _equipmentTypeController,
                    // keyboardType: TextInputType.multiline,
                    maxLength: 20,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      labelText: 'Equipment Type',
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                ), //Container
                Container(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  width: 125,
                  height: 65,
                  child: TextField(
                    controller: _equipmentNumController,
                    // keyboardType: TextInputType.multiline,
                    maxLength: 10,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      labelText: 'Unit #',
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                ), //Container
              ],
            ), //Row
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                  width: 350,
                  height: 75,
                  child: TextField(
                    controller: _jobNameController,
                    keyboardType: TextInputType.multiline,
                    maxLength: 40,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      labelText: 'Job Name',
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                ), //Container
              ],
            ), //Row
            Divider(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "     Pass    |    Fail    |    N/A",
                  textAlign: TextAlign.start,
                ), //Text
                Container(
                  padding: EdgeInsets.fromLTRB(15, 0, 35, 0),
                  alignment: Alignment.center,
                  child: FloatingActionButton(
                    onPressed: _resetButtons,
                    tooltip: 'Reset Buttons',
                    child: Icon(Icons.autorenew),
                  ),
                ), //Container
              ],
            ), //Row
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: <Widget>[
                Radio(
                  value: 1,
                  groupValue: engineOilRadio,
                  activeColor: Colors.green,
                  onChanged: (val) {
                    print("Radio $val");
                    setEngineOilRadio(val);
                  },
                ), //Radio
                Radio(
                  value: 2,
                  groupValue: engineOilRadio,
                  activeColor: Colors.red,
                  onChanged: (val) {
                    print("Radio $val");
                    setEngineOilRadio(val);
                  },
                ), //Radio
                Radio(
                  value: 3,
                  groupValue: engineOilRadio,
                  activeColor: Colors.black,
                  onChanged: (val) {
                    print("Radio $val");
                    setEngineOilRadio(val);
                  },
                ), //Radio
                Text("Engine Oil"),
              ],
            ), //ButtonBar
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: <Widget>[
                Radio(
                  value: 4,
                  groupValue: hydraulicOilRadio,
                  activeColor: Colors.green,
                  onChanged: (val) {
                    print("Radio $val");
                    setHydraulicOilRadio(val);
                  },
                ), //Radio
                Radio(
                  value: 5,
                  groupValue: hydraulicOilRadio,
                  activeColor: Colors.red,
                  onChanged: (val) {
                    print("Radio $val");
                    setHydraulicOilRadio(val);
                  },
                ), //Radio
                Radio(
                  value: 6,
                  groupValue: hydraulicOilRadio,
                  activeColor: Colors.black,
                  onChanged: (val) {
                    print("Radio $val");
                    setHydraulicOilRadio(val);
                  },
                ), //Radio
                Text("Hydraulic Oil"),
              ],
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: <Widget>[
                Radio(
                  value: 7,
                  groupValue: transFluidRadio,
                  activeColor: Colors.green,
                  onChanged: (val) {
                    print("Radio $val");
                    setTransFluidRadio(val);
                  },
                ), //Radio
                Radio(
                  value: 8,
                  groupValue: transFluidRadio,
                  activeColor: Colors.red,
                  onChanged: (val) {
                    print("Radio $val");
                    setTransFluidRadio(val);
                  },
                ), //Radio
                Radio(
                  value: 9,
                  groupValue: transFluidRadio,
                  activeColor: Colors.black,
                  onChanged: (val) {
                    print("Radio $val");
                    setTransFluidRadio(val);
                  },
                ), //Radio
                Text("Transmission Fluid"),
              ],
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: <Widget>[
                Radio(
                  value: 10,
                  groupValue: coolantRadio,
                  activeColor: Colors.green,
                  onChanged: (val) {
                    print("Radio $val");
                    setCoolantRadio(val);
                  },
                ), //Radio
                Radio(
                  value: 11,
                  groupValue: coolantRadio,
                  activeColor: Colors.red,
                  onChanged: (val) {
                    print("Radio $val");
                    setCoolantRadio(val);
                  },
                ), //Radio
                Radio(
                  value: 12,
                  groupValue: coolantRadio,
                  activeColor: Colors.black,
                  onChanged: (val) {
                    print("Radio $val");
                    setCoolantRadio(val);
                  },
                ), //Radio
                Text("Coolant (Engine)"),
              ],
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: <Widget>[
                Radio(
                  value: 13,
                  groupValue: brakeFluidRadio,
                  activeColor: Colors.green,
                  onChanged: (val) {
                    print("Radio $val");
                    setBrakeFluidRadio(val);
                  },
                ), //Radio
                Radio(
                  value: 14,
                  groupValue: brakeFluidRadio,
                  activeColor: Colors.red,
                  onChanged: (val) {
                    print("Radio $val");
                    setBrakeFluidRadio(val);
                  },
                ), //Radio
                Radio(
                  value: 15,
                  groupValue: brakeFluidRadio,
                  activeColor: Colors.black,
                  onChanged: (val) {
                    print("Radio $val");
                    setBrakeFluidRadio(val);
                  },
                ), //Radio
                Text("Brake Fluid"),
              ],
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: <Widget>[
                Radio(
                  value: 16,
                  groupValue: brakeCondRadio,
                  activeColor: Colors.green,
                  onChanged: (val) {
                    print("Radio $val");
                    setBrakeCondRadio(val);
                  },
                ), //Radio
                Radio(
                  value: 17,
                  groupValue: brakeCondRadio,
                  activeColor: Colors.red,
                  onChanged: (val) {
                    print("Radio $val");
                    setBrakeCondRadio(val);
                  },
                ), //Radio
                Radio(
                  value: 18,
                  groupValue: brakeCondRadio,
                  activeColor: Colors.black,
                  onChanged: (val) {
                    print("Radio $val");
                    setBrakeCondRadio(val);
                  },
                ), //Radio
                Text("Brake(s) Condition"),
              ],
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: <Widget>[
                Radio(
                  value: 19,
                  groupValue: filterRadio,
                  activeColor: Colors.green,
                  onChanged: (val) {
                    print("Radio $val");
                    setFilterRadio(val);
                  },
                ), //Radio
                Radio(
                  value: 20,
                  groupValue: filterRadio,
                  activeColor: Colors.red,
                  onChanged: (val) {
                    print("Radio $val");
                    setFilterRadio(val);
                  },
                ), //Radio
                Radio(
                  value: 21,
                  groupValue: filterRadio,
                  activeColor: Colors.black,
                  onChanged: (val) {
                    print("Radio $val");
                    setFilterRadio(val);
                  },
                ), //Radio
                Text("Filters (Air & Fuel)"),
              ],
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: <Widget>[
                Radio(
                  value: 22,
                  groupValue: hoseConditionRadio,
                  activeColor: Colors.green,
                  onChanged: (val) {
                    print("Radio $val");
                    setHoseConditionRadio(val);
                  },
                ), //Radio
                Radio(
                  value: 23,
                  groupValue: hoseConditionRadio,
                  activeColor: Colors.red,
                  onChanged: (val) {
                    print("Radio $val");
                    setHoseConditionRadio(val);
                  },
                ), //Radio
                Radio(
                  value: 24,
                  groupValue: hoseConditionRadio,
                  activeColor: Colors.black,
                  onChanged: (val) {
                    print("Radio $val");
                    setHoseConditionRadio(val);
                  },
                ), //Radio
                Text("Hose(s) Condition"),
              ],
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: <Widget>[
                Radio(
                  value: 25,
                  groupValue: wiperShieldRadio,
                  activeColor: Colors.green,
                  onChanged: (val) {
                    print("Radio $val");
                    setWiperRadio(val);
                  },
                ), //Radio
                Radio(
                  value: 26,
                  groupValue: wiperShieldRadio,
                  activeColor: Colors.red,
                  onChanged: (val) {
                    print("Radio $val");
                    setWiperRadio(val);
                  },
                ), //Radio
                Radio(
                  value: 27,
                  groupValue: wiperShieldRadio,
                  activeColor: Colors.black,
                  onChanged: (val) {
                    print("Radio $val");
                    setWiperRadio(val);
                  },
                ), //Radio
                Text("Wiper Fluid, Wipers \n & Windshield"),
              ],
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: <Widget>[
                Radio(
                  value: 28,
                  groupValue: greaseRadio,
                  activeColor: Colors.green,
                  onChanged: (val) {
                    print("Radio $val");
                    setGreaseRadio(val);
                  },
                ), //Radio
                Radio(
                  value: 29,
                  groupValue: greaseRadio,
                  activeColor: Colors.red,
                  onChanged: (val) {
                    print("Radio $val");
                    setGreaseRadio(val);
                  },
                ), //Radio
                Radio(
                  value: 30,
                  groupValue: greaseRadio,
                  activeColor: Colors.black,
                  onChanged: (val) {
                    print("Radio $val");
                    setGreaseRadio(val);
                  },
                ), //Radio
                Text("Grease Points & Grease"),
              ],
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: <Widget>[
                Radio(
                  value: 31,
                  groupValue: tireTrackRadio,
                  activeColor: Colors.green,
                  onChanged: (val) {
                    print("Radio $val");
                    setTireTrackRadio(val);
                  },
                ), //Radio
                Radio(
                  value: 32,
                  groupValue: tireTrackRadio,
                  activeColor: Colors.red,
                  onChanged: (val) {
                    print("Radio $val");
                    setTireTrackRadio(val);
                  },
                ), //Radio
                Radio(
                  value: 33,
                  groupValue: tireTrackRadio,
                  activeColor: Colors.black,
                  onChanged: (val) {
                    print("Radio $val");
                    setTireTrackRadio(val);
                  },
                ), //Radio
                Text("Tires / Tracks"),
              ],
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: <Widget>[
                Radio(
                  value: 34,
                  groupValue: exhaustRadio,
                  activeColor: Colors.green,
                  onChanged: (val) {
                    print("Radio $val");
                    setExhaustRadio(val);
                  },
                ), //Radio
                Radio(
                  value: 35,
                  groupValue: exhaustRadio,
                  activeColor: Colors.red,
                  onChanged: (val) {
                    print("Radio $val");
                    setExhaustRadio(val);
                  },
                ), //Radio
                Radio(
                  value: 36,
                  groupValue: exhaustRadio,
                  activeColor: Colors.black,
                  onChanged: (val) {
                    print("Radio $val");
                    setExhaustRadio(val);
                  },
                ), //Radio
                Text("Exhaust System"),
              ],
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: <Widget>[
                Radio(
                  value: 37,
                  groupValue: couplerRadio,
                  activeColor: Colors.green,
                  onChanged: (val) {
                    print("Radio $val");
                    setCouplerRadio(val);
                  },
                ), //Radio
                Radio(
                  value: 38,
                  groupValue: couplerRadio,
                  activeColor: Colors.red,
                  onChanged: (val) {
                    print("Radio $val");
                    setCouplerRadio(val);
                  },
                ), //Radio
                Radio(
                  value: 39,
                  groupValue: couplerRadio,
                  activeColor: Colors.black,
                  onChanged: (val) {
                    print("Radio $val");
                    setCouplerRadio(val);
                  },
                ), //Radio
                Text("Coupling \n Devices & Connectors"),
              ],
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: <Widget>[
                Radio(
                  value: 40,
                  groupValue: bladeBoomRipperRadio,
                  activeColor: Colors.green,
                  onChanged: (val) {
                    print("Radio $val");
                    setBladeBoomRipperRadio(val);
                  },
                ), //Radio
                Radio(
                  value: 41,
                  groupValue: bladeBoomRipperRadio,
                  activeColor: Colors.red,
                  onChanged: (val) {
                    print("Radio $val");
                    setBladeBoomRipperRadio(val);
                  },
                ), //Radio
                Radio(
                  value: 42,
                  groupValue: bladeBoomRipperRadio,
                  activeColor: Colors.black,
                  onChanged: (val) {
                    print("Radio $val");
                    setBladeBoomRipperRadio(val);
                  },
                ), //Radio
                Text("Blade, Boom, \n & Ripper(s)"),
              ],
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: <Widget>[
                Radio(
                  value: 43,
                  groupValue: groundEngaAttRadio,
                  activeColor: Colors.green,
                  onChanged: (val) {
                    print("Radio $val");
                    setGroundEngaAttRadio(val);
                  },
                ), //Radio
                Radio(
                  value: 44,
                  groupValue: groundEngaAttRadio,
                  activeColor: Colors.red,
                  onChanged: (val) {
                    print("Radio $val");
                    setGroundEngaAttRadio(val);
                  },
                ), //Radio
                Radio(
                  value: 45,
                  groupValue: groundEngaAttRadio,
                  activeColor: Colors.black,
                  onChanged: (val) {
                    print("Radio $val");
                    setGroundEngaAttRadio(val);
                  },
                ), //Radio
                Text("Ground Engaging \n Attachments"),
              ],
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: <Widget>[
                Radio(
                  value: 46,
                  groupValue: cablesRadio,
                  activeColor: Colors.green,
                  onChanged: (val) {
                    print("Radio $val");
                    setCablesRadio(val);
                  },
                ), //Radio
                Radio(
                  value: 47,
                  groupValue: cablesRadio,
                  activeColor: Colors.red,
                  onChanged: (val) {
                    print("Radio $val");
                    setCablesRadio(val);
                  },
                ), //Radio
                Radio(
                  value: 48,
                  groupValue: cablesRadio,
                  activeColor: Colors.black,
                  onChanged: (val) {
                    print("Radio $val");
                    setCablesRadio(val);
                  },
                ), //Radio
                Text("Cable(s) \n (Power/Hoist)"),
              ],
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: <Widget>[
                Radio(
                  value: 49,
                  groupValue: frameLadWalkRadio,
                  activeColor: Colors.green,
                  onChanged: (val) {
                    print("Radio $val");
                    setFrameLadWalkRadio(val);
                  },
                ), //Radio
                Radio(
                  value: 50,
                  groupValue: frameLadWalkRadio,
                  activeColor: Colors.red,
                  onChanged: (val) {
                    print("Radio $val");
                    setFrameLadWalkRadio(val);
                  },
                ), //Radio
                Radio(
                  value: 51,
                  groupValue: frameLadWalkRadio,
                  activeColor: Colors.black,
                  onChanged: (val) {
                    print("Radio $val");
                    setFrameLadWalkRadio(val);
                  },
                ), //Radio
                Text("Frame, Ladder(s) \n & Walkway(s)"),
              ],
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: <Widget>[
                Radio(
                  value: 52,
                  groupValue: handStepsRadio,
                  activeColor: Colors.green,
                  onChanged: (val) {
                    print("Radio $val");
                    setHandStepsRadio(val);
                  },
                ), //Radio
                Radio(
                  value: 53,
                  groupValue: handStepsRadio,
                  activeColor: Colors.red,
                  onChanged: (val) {
                    print("Radio $val");
                    setHandStepsRadio(val);
                  },
                ), //Radio
                Radio(
                  value: 54,
                  groupValue: handStepsRadio,
                  activeColor: Colors.black,
                  onChanged: (val) {
                    print("Radio $val");
                    setHandStepsRadio(val);
                  },
                ), //Radio
                Text("Hand Grabs & Steps"),
              ],
            ),

            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: <Widget>[
                Radio(
                  value: 55,
                  groupValue: cabRadio,
                  activeColor: Colors.green,
                  onChanged: (val) {
                    print("Radio $val");
                    setCabRadio(val);
                  },
                ), //Radio
                Radio(
                  value: 56,
                  groupValue: cabRadio,
                  activeColor: Colors.red,
                  onChanged: (val) {
                    print("Radio $val");
                    setCabRadio(val);
                  },
                ), //Radio
                Radio(
                  value: 57,
                  groupValue: cabRadio,
                  activeColor: Colors.black,
                  onChanged: (val) {
                    print("Radio $val");
                    setCabRadio(val);
                  },
                ), //Radio
                Text("Cab & Mirrors"),
              ],
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: <Widget>[
                Radio(
                  value: 58,
                  groupValue: hornRadio,
                  activeColor: Colors.green,
                  onChanged: (val) {
                    print("Radio $val");
                    setHornRadio(val);
                  },
                ), //Radio
                Radio(
                  value: 59,
                  groupValue: hornRadio,
                  activeColor: Colors.red,
                  onChanged: (val) {
                    print("Radio $val");
                    setHornRadio(val);
                  },
                ), //Radio
                Radio(
                  value: 60,
                  groupValue: hornRadio,
                  activeColor: Colors.black,
                  onChanged: (val) {
                    print("Radio $val");
                    setHornRadio(val);
                  },
                ), //Radio
                Text("Horn & Gagues"),
              ],
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: <Widget>[
                Radio(
                  value: 61,
                  groupValue: fireExRadio,
                  activeColor: Colors.green,
                  onChanged: (val) {
                    print("Radio $val");
                    setFireExRadio(val);
                  },
                ), //Radio
                Radio(
                  value: 62,
                  groupValue: fireExRadio,
                  activeColor: Colors.red,
                  onChanged: (val) {
                    print("Radio $val");
                    setFireExRadio(val);
                  },
                ), //Radio
                Radio(
                  value: 63,
                  groupValue: fireExRadio,
                  activeColor: Colors.black,
                  onChanged: (val) {
                    print("Radio $val");
                    setFireExRadio(val);
                  },
                ), //Radio
                Text("Fire Extinguisher(s)"),
              ],
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: <Widget>[
                Radio(
                  value: 64,
                  groupValue: lightsRadio,
                  activeColor: Colors.green,
                  onChanged: (val) {
                    print("Radio $val");
                    setLightsRadio(val);
                  },
                ), //Radio
                Radio(
                  value: 65,
                  groupValue: lightsRadio,
                  activeColor: Colors.red,
                  onChanged: (val) {
                    print("Radio $val");
                    setLightsRadio(val);
                  },
                ), //Radio
                Radio(
                  value: 66,
                  groupValue: lightsRadio,
                  activeColor: Colors.black,
                  onChanged: (val) {
                    print("Radio $val");
                    setLightsRadio(val);
                  },
                ), //Radio
                Text("Lights & Turn Signals"),
              ],
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: <Widget>[
                Radio(
                  value: 67,
                  groupValue: reverseRadio,
                  activeColor: Colors.green,
                  onChanged: (val) {
                    print("Radio $val");
                    setReverseRadio(val);
                  },
                ), //Radio
                Radio(
                  value: 68,
                  groupValue: reverseRadio,
                  activeColor: Colors.red,
                  onChanged: (val) {
                    print("Radio $val");
                    setReverseRadio(val);
                  },
                ), //Radio
                Radio(
                  value: 69,
                  groupValue: reverseRadio,
                  activeColor: Colors.black,
                  onChanged: (val) {
                    print("Radio $val");
                    setReverseRadio(val);
                  },
                ), //Radio
                Text("Reverse Alarm \n & Reverse Lights"),
              ],
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: <Widget>[
                Radio(
                  value: 70,
                  groupValue: acHeatRadio,
                  activeColor: Colors.green,
                  onChanged: (val) {
                    print("Radio $val");
                    setAcHeatRadio(val);
                  },
                ), //Radio
                Radio(
                  value: 71,
                  groupValue: acHeatRadio,
                  activeColor: Colors.red,
                  onChanged: (val) {
                    print("Radio $val");
                    setAcHeatRadio(val);
                  },
                ), //Radio
                Radio(
                  value: 72,
                  groupValue: acHeatRadio,
                  activeColor: Colors.black,
                  onChanged: (val) {
                    print("Radio $val");
                    setAcHeatRadio(val);
                  },
                ), //Radio
                Text("AC / Heater"),
              ],
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: <Widget>[
                Radio(
                  value: 73,
                  groupValue: steeringRadio,
                  activeColor: Colors.green,
                  onChanged: (val) {
                    print("Radio $val");
                    setSteeringRadio(val);
                  },
                ), //Radio
                Radio(
                  value: 74,
                  groupValue: steeringRadio,
                  activeColor: Colors.red,
                  onChanged: (val) {
                    print("Radio $val");
                    setSteeringRadio(val);
                  },
                ), //Radio
                Radio(
                  value: 75,
                  groupValue: steeringRadio,
                  activeColor: Colors.black,
                  onChanged: (val) {
                    print("Radio $val");
                    setSteeringRadio(val);
                  },
                ), //Radio
                Text("Steering \n (Standard & Emergency)"),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                if (engineOilRadio == 0 ||
                    hydraulicOilRadio == 0 ||
                    transFluidRadio == 0 ||
                    coolantRadio == 0 ||
                    brakeFluidRadio == 0 ||
                    brakeCondRadio == 0 ||
                    filterRadio == 0 ||
                    hoseConditionRadio == 0 ||
                    wiperShieldRadio == 0 ||
                    greaseRadio == 0 ||
                    tireTrackRadio == 0 ||
                    exhaustRadio == 0 ||
                    couplerRadio == 0 ||
                    bladeBoomRipperRadio == 0 ||
                    groundEngaAttRadio == 0 ||
                    cabRadio == 0 ||
                    frameLadWalkRadio == 0 ||
                    handStepsRadio == 0 ||
                    cabRadio == 0 ||
                    hornRadio == 0 ||
                    fireExRadio == 0 ||
                    lightsRadio == 0 ||
                    reverseRadio == 0 ||
                    acHeatRadio == 0 ||
                    steeringRadio == 0)
                  Expanded(
                      child: Text(
                    'Complete All Inspections to Continue',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ))
                else
                  Expanded(
                    child: Container(
//                      margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            'All Inspections Complete',
                            style: TextStyle(color: Colors.green),
                          ),
                          Container(
                            child: FloatingActionButton(
                                onPressed: sendMail,
                                tooltip: 'Send Report',
                                child: Icon(Icons.send)),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),

            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: TextField(
                  controller: _commentsController,
                  decoration: InputDecoration(
                      hintText: "Comments...\n"
                          "Failures, General Safety, etc."),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                )), //Container
          ],
        ),
        //ListView

        persistentFooterButtons: <Widget>[
          RaisedButton(
            onPressed: _loadData,
            child: Text(
              'Load Previous Save',
              style: TextStyle(color: Colors.black),
            ),
          ),
//          RaisedButton(
//              onPressed: _clearData,
//              child: Text(
//                'Clear Saved',
//                style: TextStyle(color: Colors.black),
//              )),
          RaisedButton(
              onPressed: _saveData,
              child: Text(
                'Save for Later',
                style: TextStyle(color: Colors.black),
              )),
        ],
      ), //Scaffold
    ); //KeyboardDismisser
  }
}

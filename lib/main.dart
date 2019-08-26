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
  int engineOilRadio;
  String engineOilStatus;
  int hydraulicOilRadio;
  String hydraulicOilStatus;

  TextEditingController _commentsController = TextEditingController();
  final TextEditingController _equipmentNumController = TextEditingController();
  final TextEditingController _coNameController = TextEditingController();
  final TextEditingController _recipientEmailController =
      TextEditingController();
  final TextEditingController _equipmentTypeController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
//  setData();
}

saveData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
//  int _engineOilRadio = prefs.getInt('engineOilRadio');
   prefs.setInt('engOil', engineOilRadio);
   prefs.setInt('hydOil', hydraulicOilRadio);
}

loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      engineOilRadio = prefs.getInt('engOil') ?? 0;
      hydraulicOilRadio = prefs.getInt('hydOil') ?? 0;
    });
}

clearData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
}

setData(){
  loadData().then((value){
    setState(() {
      engineOilRadio = value;
    });
  });
}
  _sendMail() async {
    setCommentsSection(_commentsController);
    final Email myEmail = Email(
      body: "Engine Oil: " +
          engineOilStatus +
          " \n" +
          "Hydraulic Oil: " +
          hydraulicOilStatus +
          " \n" +
          "\n Comments: " +
          _commentsController.text,
      subject: _coNameController.text +
          " Equipment Inspection: " +
          _equipmentTypeController.text +
          " " +
          _equipmentNumController.text,
      recipients: [_recipientEmailController.text],
//      cc: ['cc@example.com'],
//      bcc: ['bcc@example.com'],
//      attachmentPath: '/path/to/attachment.zip',
    );
    await FlutterEmailSender.send(myEmail);
   // saveData();
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
                onSubmitted: (String coName) {
                    setState((){
                      _coNameController.text = coName;
                    });
                  }// (){FocusScope.of(context).requestFocus(new FocusNode());}, TODO: Close this dialog onSubmit
                ),
                actions: <Widget>[
                  new FlatButton(
                    child: new Text('Cancel'),
                    onPressed: () {
                      //  Navigator.of(context).pop();
                      Navigator.pop(context);
                    },
                  ), //FlatButton
                  new FlatButton(
                    child: new Text('Done'),
                    onPressed: () {
                      //  Navigator.of(context).pop();
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
                title: Text("Set Recipient's E-mail Adrress"),
                content: TextField(
                  controller: _recipientEmailController,
                  decoration: InputDecoration(
                      hintText: "Recipient's E-mail goes here..."),
                ),
                actions: <Widget>[
                  new FlatButton(
                    child: new Text('Cancel'),
                    onPressed: () {
                      //  Navigator.of(context).pop();
                      Navigator.pop(context);
                    },
                  ), //FlatButton
                  new FlatButton(
                    child: new Text('Done'),
                    onPressed: () {
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
    setState(() {
      engineOilRadio = 0;
      hydraulicOilRadio = 0;
    });
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

  setEngineOilRadio(int val, String status) {
    setState(() {
      engineOilRadio = val;
      engineOilStatus = status;
    });
  }

  setHydraulicOilRadio(int val, String status) {
    setState(() {
      hydraulicOilRadio = val;
      hydraulicOilStatus = status;
    });
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
          title: Text(_coNameController.text  + " " + widget.title),
          actions: <Widget>[
            PopupMenuButton(
              onSelected: choiceSelection,
              itemBuilder: (BuildContext context) {
                return Constants.choices.map((String choice) {
                  return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice)); //PopupMenuItem
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
                    setEngineOilRadio(val, "Pass");
                  },
                ), //Radio
                Radio(
                  value: 2,
                  groupValue: engineOilRadio,
                  activeColor: Colors.red,
                  onChanged: (val) {
                    print("Radio $val");
                    setEngineOilRadio(val, "Fail");
                  },
                ), //Radio
                Radio(
                  value: 3,
                  groupValue: engineOilRadio,
                  activeColor: Colors.black,
                  onChanged: (val) {
                    print("Radio $val");
                    setEngineOilRadio(val, "Not Applicable");
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
                    setHydraulicOilRadio(val, "Pass");
                  },
                ), //Radio
                Radio(
                  value: 5,
                  groupValue: hydraulicOilRadio,
                  activeColor: Colors.red,
                  onChanged: (val) {
                    print("Radio $val");
                    setHydraulicOilRadio(val, "Fail");
                  },
                ), //Radio
                Radio(
                  value: 6,
                  groupValue: hydraulicOilRadio,
                  activeColor: Colors.black,
                  onChanged: (val) {
                    print("Radio $val");
                    setHydraulicOilRadio(val, "Not Applicable");
                  },
                ), //Radio
                Text("Hydraulic Oil"),
              ],
            ),
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(5, 35, 5, 0),
                child: TextField(
                  controller: _commentsController,
                  decoration: InputDecoration(hintText: "Comments..."),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                )), //Container
          ],
        ), //ListView

        floatingActionButton: FloatingActionButton(
          onPressed: _sendMail,
          tooltip: 'Send Report',
          child: Icon(Icons.send),
        ), //floatingActionButton This trailing comma makes auto-formatting nicer for build methods.
      persistentFooterButtons: <Widget>[
        RaisedButton(
          onPressed: loadData,
          child: Text('Read',
          style: TextStyle(color: Colors.black),),
        ),
        RaisedButton(
          onPressed: saveData,
          child: Text('Save',
          style: TextStyle(color: Colors.black),)
        ),
        RaisedButton(
            onPressed: clearData,
            child: Text('Clear',
              style: TextStyle(color: Colors.black),)
        ),
      ],
      ), //Scaffold
    ); //KeyboardDismisser
  }
}

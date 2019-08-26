//import 'package:flutter/material.dart';
//
//class TextFieldAlertDialog extends StatelessWidget {
//  final TextEditingController _textFieldController = TextEditingController();
//
//  Information(BuildContext context, String title, String description) {
//    return showDialog(
//      context: context,
//      barrierDismissible: true, //makes pressing outside to close dialog possible
//      builder: (BuildContext context){
//        return AlertDialog(
//          title: Text(title),
//          content: TextField(
//            controller: _textFieldController,
//            decoration: InputDecoration(hintText: "TextField in Dialog"),
//          ),
//          actions: <Widget>[
//            new FlatButton(
//              child: new Text('CANCEL'),
//              onPressed: () {
//                //  Navigator.of(context).pop();
//                Navigator.pop(context);
//              },
//            )
//          ],
//        );
//      },
//    );
//  }
//
////  displayDialog(BuildContext context) async {
////    print("inside _DisplayDialog");
////
////    return showDialog(
////        context: context,
////        builder: (context) {
////          return AlertDialog(
////            title: Text('TextField in Dialog'),
////            content: TextField(
////              controller: _textFieldController,
////              decoration: InputDecoration(hintText: "TextField in Dialog"),
////            ),
////            actions: <Widget>[
////              new FlatButton(
////                child: new Text('CANCEL'),
////                onPressed: () {
////                  //  Navigator.of(context).pop();
////                  Navigator.pop(context);
////                },
////              )
////            ],
////          );
////        });
////  }
////
////  //@override
////  Widget build(BuildContext context) {
////    return Scaffold(
////      appBar: AppBar(
////        title: Text('TextField in AlertDialog'),
////      ),
////      body: Center(
////        child: RaisedButton(
////          child: Text('Show Alert Dialog'),
////          color: Colors.red,
////          onPressed: () => displayDialog(context),
////        ),
////      ),
////    );
////  }
//}

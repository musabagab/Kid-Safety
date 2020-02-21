import 'package:flutter/material.dart';
import 'package:sms/sms.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Kids safety app'),
        ),
        body: Center(
          child: FlatButton(
            onPressed: () {
              getAllMessages();
            },
            child: Text('Get Messages'),
          ),
        ),
      ),
    );
  }
}

void getAllMessages() async {
  SmsQuery query = new SmsQuery();
  List messagesList = await query.getAllSms;
  // this is a comment for the app
  for (var message in messagesList) {
    // message body
    print(message.body);
    // message address
    print(message.address);
  }
}

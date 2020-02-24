import 'package:flutter/material.dart';
import 'package:sms/sms.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart'; //For creating the SMTP Server

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
            color: Colors.red,
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
  List<String> list = List();
  // this is a comment for the app
  for (var message in messagesList) {
    print(message.body);
    print(message.address);

    list.add(message.body);
  }

  sendEmail();
}

void sendEmail() async {
  String username = ""; //Your Email;
  String password = ""; //Your Email's password;
  // Creating the Gmail server
  final smtpServer = gmail(username, password);
  // Create our email message.
  final message = Message()
    ..from = Address(username)
    ..recipients.add('musabagab2010@gmail.com') //recipent email
    ..subject =
        'Test Dart Mailer library :: 😀 :: ${DateTime.now()}' //subject of the email
    ..text =
        'This is the plain text.\nThis is line 2 of the text part.'; //body of the email

  try {
    final sendReport = await send(message, smtpServer);
    print(
        'Message sent: ' + sendReport.toString()); //print if the email is sent
  } on MailerException catch (e) {
    print(
        'Message not sent. \n' + e.toString()); //print if the email is not sent
    // e.toString() will show why the email is not sending
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_mailer/flutter_mailer.dart';

class SupportPage extends StatefulWidget {
  @override
  _SupportPageState createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  TextEditingController feedbackController = TextEditingController();

  void sendFeedback(MailOptions mailOptions) async {
    MailerResponse response = await FlutterMailer.send(mailOptions);
    switch (response) {
      case MailerResponse.android:
        print("Intent was successful");
        break;
      default:
        print("Unknown");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            color: Colors.black38,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  child: TextField(
                    maxLines: 5,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      hintText: "Message to send",
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                    ),
                    controller: feedbackController,
                  ),
                ),
                RaisedButton(
                  color: Colors.blueGrey,
                  child: Text("Send feedback"),
                  onPressed: () {
                    if (feedbackController.text.isNotEmpty){
                    MailOptions mailOptions = MailOptions(
                      body: feedbackController.text,
                      subject: "Feedback from Fince",
                      recipients: ["henrique.combochi@gmail.com"],
                      isHTML: true,
                    );
                    sendFeedback(mailOptions);
                    }
                    else{
                      print("No text to send");
                    }
                  },
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

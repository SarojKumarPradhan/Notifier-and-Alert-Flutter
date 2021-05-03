import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool notification = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notifiers')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Visibility(
              visible: notification,
              child: ListTile(
                leading: Icon(
                  Icons.info_outline,
                ),
                title: Text("You received a new Message"),
                trailing: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    setState(() {
                      notification = false;
                    });
                  },
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  notification = true;
                });
              },
              child: Text("Custom Notification"),
            ),
            ElevatedButton(
              onPressed: () {
                //******************
                Fluttertoast.showToast(
                  msg: "This is Center Short Toast",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
                //*******************
              },
              child: Text("Toast"),
            ),
            ElevatedButton(
              onPressed: () {
                //******************************
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Info"),
                    content: Text("I am Saroj Kumar Pradhan."),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("OK"))
                    ],
                  ),
                );
                //*******************************
              },
              child: Text("Alert"),
            ),
            ElevatedButton(
              onPressed: () async {
                //********************************
                bool result = await showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Are you sure ?"),
                    content: Text("Do you want to exit from this app."),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        child: Text("yes"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: Text("no"),
                      ),
                    ],
                  ),
                );
                //********************************
                print(result);
              },
              child: Text("Confirmation Dialog"),
            ),
            ElevatedButton(
              onPressed: () {
                //*****************************
                SnackBar snackBar = SnackBar(
                    backgroundColor: Colors.teal,
                    content: Text('Successfully Send !!'),
                    duration: Duration(seconds: 2),
                    action: SnackBarAction(
                      textColor: Colors.black,
                      label: "OK",
                      onPressed: () {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar(
                            reason: SnackBarClosedReason.action);
                      },
                    ));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                //*****************************
              },
              child: Text("SnackBar"),
            ),
            ElevatedButton(
              onPressed: () {
                //***************************
                showModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                          child: Column(
                            children: [
                              ListTile(
                                leading: Icon(Icons.share),
                                title: Text('Share'),
                              ),
                              ListTile(
                                leading: Icon(Icons.share),
                                title: Text('Share'),
                              ),
                              ListTile(
                                leading: Icon(Icons.share),
                                title: Text('Share'),
                              ),
                              ListTile(
                                leading: Icon(Icons.share),
                                title: Text('Share'),
                              ),
                            ],
                          ),
                        ));
                //***************************
              },
              child: Text("Bottom Sheet"),
            ),
          ],
        ),
      ),
    );
  }
}

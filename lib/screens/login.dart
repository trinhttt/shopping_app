import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopping_app/home/home_screen.dart';
import 'package:shopping_app/screens/register.dart';
import 'package:shopping_app/shared/converts/hash.convert.dart';
import 'package:shopping_app/shared/local_storage.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final email = TextEditingController();
    final password = TextEditingController();
    LocalStorage local = LocalStorage();

    // Show alert
    showAlertDialog(BuildContext context) {
      // set up the buttons
      Widget cancelButton = TextButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      );

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        // title: Text("AlertDialog"),
        content: Text(
          "Email or password is not correct!",
          style: TextStyle(color: Colors.red),
        ),
        actions: [
          cancelButton,
        ],
      );

      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

    return Scaffold(
      // fix When the keyboard appears, the Flutter widgets resize.
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 80.0, top: 80.0),
              height: 100,
              width: double.infinity,
              // child: Image(image: AssetImage('assets/images/logo.png'), fit: BoxFit.cover,),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/logo.png"),
                  // fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 5.0, right: 5.0),
                height: 260,
                width: width,
                // color: Colors.red,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      // offset: Offset(0, 10),
                      blurRadius: 10,
                      spreadRadius: 0.5,
                    ),
                  ],
                ),
                child: Container(
                  margin: EdgeInsets.only(top: 25.0, bottom: 25.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20.0, right: 20.0),
                        height: 60,
                        // color: Colors.red,
                        // margin: ,
                        child: TextField(
                          controller: email,
                          // Set up keyboard email
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            filled: true,
                            // border: InputBorder.none,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                            fillColor: Color(0xFFE8E8E8),
                            // border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.email),
                            hintText: 'Email',
                            // disabledBorder: UnderlineInputBorder(),
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: 60,
                        // color: Colors.yellow,
                        margin: EdgeInsets.only(left: 20.0, right: 20.0),
                        child: TextField(
                          controller: password,
                          // Set input type password
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          // End Set input type password
                          decoration: InputDecoration(
                            filled: true,
                            // border: InputBorder.none,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                            fillColor: Color(0xFFE8E8E8),
                            // border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.password),
                            hintText: 'Password',
                            // disabledBorder: UnderlineInputBorder(),
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
                          margin: EdgeInsets.only(left: 20.0, right: 20.0),
                          height: 60,
                          width: double.infinity,
                          // color: Colors.red,
                          // margin: ,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      side: BorderSide(color: Colors.black))),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.black),
                            ),
                            onPressed: () async {
                              var contents = await local.readLocal();
                              // decode string to object
                              var data = json.decode(contents!);
                              if (email.text == data['email'] &&
                                  generateMd5(password.text) ==
                                      data['password']) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()),
                                );
                              } else {
                                showAlertDialog(context);
                              }
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                          )),
                    ],
                  ),
                )),
            Container(
              margin: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account?'),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()),
                      );
                      transitionDuration:
                      Duration.zero;
                    },
                    child: const Text('Create account!'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

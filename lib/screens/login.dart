import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
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
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        side: BorderSide(color: Colors.black))),
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                            ),
                            onPressed: () {},
                            child: Text('Login', style: TextStyle(
                              fontSize: 25,
                            ),),
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
                  Text(
                    'Create account!',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
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
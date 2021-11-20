// ignore_for_file: prefer_const_constructors

import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

enum LoginStatus { notSignIn, signIn }

class _LoginState extends State<Login> {
  LoginStatus _loginStatus = LoginStatus.notSignIn;
  late String username, password;
  final _key = GlobalKey<FormState>();
  late bool _secureText = true;
  bool _apiCall = false;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  check() {
    final form = _key.currentState;
    if (form!.validate()) {
      form.save();
      setState(() {
        _apiCall = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (_loginStatus) {
      case LoginStatus.notSignIn:
        return Scaffold(
          body: Form(
            key: _key,
            child: Container(
              padding: const EdgeInsets.only(top: 50),
              decoration: const BoxDecoration(
                  gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                Colors.white,
                Colors.white,
                Colors.white,
              ])),
              child: Center(
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    Text(
                                      "LOGIN",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontFamily: "Montserrat"),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Presensi Karyawan",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontFamily: "MontserratSemi"),
                                    )
                                  ],
                                ),
                              ),
                              Flexible(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    alignment: Alignment.centerRight,
                                    child: Image.asset(
                                      "assets/img/about.png",
                                      width: 100,
                                      height: 100,
                                    ),
                                  )
                                ],
                              ))
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(60),
                                  bottomRight: Radius.circular(50))),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.all(20.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                Color.fromRGBO(225, 95, 27, 3),
                                            blurRadius: 5,
                                            offset: Offset(0, 2))
                                      ]),
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.grey))),
                                        child: TextFormField(
                                          validator: (e) {
                                            if (e!.isEmpty) {
                                              return "Please Insert Your Username";
                                            }
                                          },
                                          onSaved: (e) => username = e!,
                                          decoration: InputDecoration(
                                              hintText: "Username",
                                              hintStyle: TextStyle(
                                                  color: Colors.grey)),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.grey))),
                                        child: TextFormField(
                                          obscureText: _secureText,
                                          validator: (e) {
                                            if (e!.isEmpty) {
                                              return "Please Insert Password";
                                            }
                                          },
                                          onSaved: (e) => password = e!,
                                          decoration: InputDecoration(
                                              hintText: "Password",
                                              hintStyle:
                                                  TextStyle(color: Colors.grey),
                                              suffixIcon: IconButton(
                                                onPressed: showHide,
                                                icon: Icon(_secureText
                                                    ? Icons.visibility_off
                                                    : Icons.visibility),
                                              )),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    check();
                                  },
                                  child: Container(
                                    height: 50,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 50),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.red),
                                    child: Center(
                                        child: _apiCall
                                            ? CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(Colors.white),
                                              )
                                            : Text(
                                                "Login",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                ),
                                              )),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
        break;
      case LoginStatus.signIn:
        // TODO: Handle this case.
        break;
    }
    return Text("Halaman Cacad");
  }
}

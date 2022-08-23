import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test1/core/app_images.dart';

class home_page extends StatelessWidget {
  const home_page({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Test'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final numberController = TextEditingController();
  int total = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Form(
          key: _formkey,
          child: Container(
              color: Colors.blue,
              margin: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
              child: SingleChildScrollView(
                child: Column(children: [
                  Image(
                    width: 350,
                    height: 350,
                    image: AssetImage(AppImages.logo),
                  ),
                  new Container(
                    width: 250,
                    height: 60,
                    decoration: new BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                        border: Border.symmetric()),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: numberController,
                      style: TextStyle(color: Colors.black, fontSize: 20),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Número",
                        labelStyle:
                            TextStyle(color: Colors.black, fontSize: 20),
                        border: OutlineInputBorder(),
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      validator: (String? value) {
                        if (value != null && value.isEmpty) {
                          return "Error";
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: 350,
                    height: 45,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                        child: Text(
                          'Calcular',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () async {
                          if (_formkey.currentState!.validate()) {
                            setState(() {
                              total =
                                  Calculate(int.parse(numberController.text));
                            });
                          } else {
                            Fluttertoast.showToast(
                                msg: "Você deve digitar um número",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.white,
                                textColor: Colors.black,
                                fontSize: 16.0);
                          }
                        }),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 0, bottom: 30, top: 50, left: 0),
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: "Meu Total = " + total.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 21,
                              color: Color(0xFF3D3838),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              )),
          // This trailing comma makes auto-formatting nicer for build methods.
        ),
      ),
    );
  }

  int Calculate(int number) {
    int total = 0;
    int counter = 1;
    while (counter < number) {
      if ((counter % 3 == 0) || (counter % 5) == 0) {
        total = total + counter;
      }
      counter++;
    }
    return total;
  }
}

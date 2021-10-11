import 'package:flutter/material.dart';

class LoadingP extends StatefulWidget {
  @override
  _LoadingPState createState() => _LoadingPState();
}

class _LoadingPState extends State<LoadingP> {

  String redirectTrix() {
    Future.delayed(Duration(milliseconds: 500), (){
      Navigator.pushReplacementNamed(context, '/login');
    });
    return 'Encrypto';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        // padding: EdgeInsets.fromLTRB(32, 280, 32, 96),
        // alignment: Alignment.center,
        color: Color(0xff4A7C59),
        child: Center(
          child: Text(
            redirectTrix(),
            style: TextStyle(
              fontSize: 56,
              fontFamily: 'Wind',
              color: Color(0xffFAF3DD),
            ),
          ),
        ),
      ),
    );
  }
}
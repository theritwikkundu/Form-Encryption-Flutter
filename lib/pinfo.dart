import 'package:flutter/material.dart';
import 'package:form_encryption_flutter/main.dart';

class PinfoP extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Color(0xff4A7C59)
        ),
        elevation: 24,
        title: Text(
          "Encrypto",
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'Wind',
            color: Color(0xff4A7C59),
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xffFAF3DD),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff4A7C59),
                Color(0xff4A7C59),
                // Color(0xffC8D5B9),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // SizedBox(height: 30,),
              // Text(
              //   "My info",
              //   style: TextStyle(
              //     fontSize: 48,
              //     fontFamily: 'Wind',
              //     color: Color(0xffFAF3DD),
              //   ),
              // ),
              SizedBox(height: 30,),
              CircleAvatar(
                child: Icon(
                  Icons.person_pin_sharp,
                  size: 162,
                  color: Color(0xffFAF3DD),
                ),
                radius: 81,
                backgroundColor: Color(0x00000000),
              ),
              SizedBox(height: 60,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 2000,),
                  Text(
                      "Name",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Righteous',
                        color: Color(0xffFAF3DD),
                      )
                  ),
                  Text(
                      currentFname+" "+currentLname,
                      style: TextStyle(
                        fontSize: 36,
                        fontFamily: 'Nexa',
                        color: Color(0xffFAF3DD),
                      )
                  ),
                  SizedBox(height: 20,),
                  Text(
                      "Email ID",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Righteous',
                        color: Color(0xffFAF3DD),
                      )
                  ),
                  Text(
                      currentEmail,
                      style: TextStyle(
                        fontSize: 36,
                        fontFamily: 'Nexa',
                        color: Color(0xffFAF3DD),
                      )
                  ),
                  SizedBox(height: 20,),
                  Text(
                      "Date of Birth",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Righteous',
                        color: Color(0xffFAF3DD),
                      )
                  ),
                  Text(
                      currentDob,
                      style: TextStyle(
                        fontSize: 36,
                        fontFamily: 'Nexa',
                        color: Color(0xffFAF3DD),
                      )
                  ),
                  SizedBox(height: 20,),
                  Text(
                      "Gender",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Righteous',
                        color: Color(0xffFAF3DD),
                      )
                  ),
                  Text(
                      currentGender,
                      style: TextStyle(
                        fontSize: 36,
                        fontFamily: 'Nexa',
                        color: Color(0xffFAF3DD),
                      )
                  ),
                  SizedBox(height: 20,),
                  Text(
                      "Register ID",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Righteous',
                        color: Color(0xffFAF3DD),
                      )
                  ),
                  Text(
                      currentReg,
                      style: TextStyle(
                        fontSize: 36,
                        fontFamily: 'Nexa',
                        color: Color(0xffFAF3DD),
                      )
                  ),
                ],
              ),
              SizedBox(height: 0,),
              SizedBox(height: 0,),
            ],
          ),
        ),
      ),
    );
  }
}

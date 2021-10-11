import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:form_encryption_flutter/database/dboperate.dart';
import 'package:form_encryption_flutter/editinfo.dart';
import 'package:form_encryption_flutter/loader.dart';
import 'package:form_encryption_flutter/login.dart';
import 'package:form_encryption_flutter/pinfo.dart';
import 'package:form_encryption_flutter/register.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:form_encryption_flutter/crypto/cryptojs_aes.dart';

// global variables
String currentReg="default reg";
String currentFname="default first";
String currentLname="default last";
String currentEmail="default email";
String currentPass="default pass";
String currentDob="default dob";
String currentGender="default gender";
String nodeid="default";

// var key="password";

void clearAll(){
  currentReg="default reg";
  currentFname="default first";
  currentLname="default last";
  currentEmail="default email";
  currentPass="default pass";
  currentDob="default dob";
  currentGender="default gender";
  nodeid="default";
}

void main() {
  // version compliance
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    // initialRoute: '/login',
    routes: {
      '/': (context) => LoadingP(),
      '/home': (context) => HomeP(),
      '/login': (context) => LoginP(),
      '/register': (context) => RegisterP(),
      '/info': (context) => PinfoP(),
      '/editinfo': (context) => EditinfoP(),
    },
  ));
}

class HomeP extends StatefulWidget {
  // database reference string
  @override
  _HomePState createState() => _HomePState();
}

class _HomePState extends State<HomeP> {
  final DBRef = FirebaseDatabase.instance.reference();

  void linkop (work) async{
    if (await canLaunch(work)){
      await launch(work);
    }
    else{
      print('Whoops!');
    }
  }

  void dltAc(){
    DBOperate.deleteAccData(nodeid);
    print("Deleted account");
    Navigator.pop(context);
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        elevation: 24,
        title: Text(
          "Encrypto",
          style: TextStyle(
            fontSize: 28,
            fontFamily: 'Wind',
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff4A7C59),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 70, 20, 30),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffFAF3DD),
              Color(0xffC8D5B9),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
          ),
        ),
        alignment: Alignment.center,
        child: Column(
          children: [
            RaisedButton(
              elevation: 24,
              padding: EdgeInsets.fromLTRB(32, 12, 32, 12),
              child: SizedBox(
                height: 28,
                width: 260,
                child: Text(
                  "View info",
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Nexa',
                    color: Colors.white,
                    // fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              onPressed: (){
                Navigator.pushNamed(context, '/info');
              },
              color: Color(0xff4A7C59),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            RaisedButton(
              elevation: 24,
              padding: EdgeInsets.fromLTRB(32, 12, 32, 12),
              child: SizedBox(
                // height: 54,
                width: 260,
                child: Text(
                  "Edit info",
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Nexa',
                    color: Colors.white,
                    // fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              onPressed: (){Navigator.pushNamed(context, '/editinfo');},
              color: Color(0xff4A7C59),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            RaisedButton(
              elevation: 24,
              padding: EdgeInsets.fromLTRB(32, 12, 32, 12),
              child: SizedBox(
                // height: 54,
                width: 260,
                child: Text(
                  "Delete info",
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Nexa',
                    color: Colors.white,
                    // fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              onPressed: (){
                return showDialog(context: context, barrierDismissible: false, builder: (context){
                  return AlertDialog(
                    title: Text(
                      "Are you sure you want to delete your account?",
                      textAlign: TextAlign.center,
                    ),
                    titleTextStyle: TextStyle(
                      color: Color(0xff4A7C59),
                      fontFamily: 'Nexa',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    content: Icon(
                      Icons.warning_amber_outlined,
                      size: 72,
                      color: Color(0xff4A7C59),
                    ),
                    actions: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              MaterialButton(
                                onPressed: (){
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(
                                    color: Color(0xff4A7C59),
                                    fontFamily: 'Nexa',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                splashColor: Color(0xff4A7C59),
                              ),
                              MaterialButton(
                                onPressed: null,
                                child: Text(
                                  '     ',
                                  style: TextStyle(
                                    color: Color(0xff4A7C59),
                                    fontFamily: 'Nexa',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                splashColor: Color(0xff4A7C59),
                              ),
                              MaterialButton(
                                onPressed: (){
                                  dltAc();
                                  showDialog(context: context, barrierDismissible: false, builder: (context){
                                    return AlertDialog(
                                      title: Text(
                                        "Sorry, to see you go!",
                                        textAlign: TextAlign.center,
                                      ),
                                      titleTextStyle: TextStyle(
                                        color: Color(0xff4A7C59),
                                        fontFamily: 'Nexa',
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      content: Icon(
                                        Icons.warning_amber_outlined,
                                        size: 72,
                                        color: Color(0xff4A7C59),
                                      ),
                                      actions: [
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width,
                                          child: Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                MaterialButton(
                                                  onPressed: (){
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text(
                                                    'Close',
                                                    style: TextStyle(
                                                      color: Color(0xff4A7C59),
                                                      fontFamily: 'Nexa',
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  splashColor: Color(0xff4A7C59),
                                                ),
                                              ]
                                          ),
                                        ),
                                      ],
                                      backgroundColor: Color(0xffFAF3DD),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                    );
                                  });
                                  // Navigator.of(context).pop();
                                },
                                child: Text(
                                  'Confirm',
                                  style: TextStyle(
                                    color: Color(0xff4A7C59),
                                    fontFamily: 'Nexa',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                splashColor: Color(0xff4A7C59),
                              ),
                            ]
                        ),
                      ),
                    ],
                    backgroundColor: Color(0xffFAF3DD),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  );
                }
                );
              },
              color: Color(0xff4A7C59),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
      drawer: Container(
        width: 150,
        padding: EdgeInsets.fromLTRB(10, 42, 10, 36),
        alignment: Alignment.topCenter,
        color: Color(0xff4A7C59),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  child: Icon(
                    Icons.person_pin_rounded,
                    size: 108,
                    color: Colors.white,
                  ),
                  radius: 56,
                  backgroundColor: Color(0x00000000),
                ),
                SizedBox(height: 20,),
                SizedBox(
                  width: 170,
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello,",
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: 'Nexa',
                          color: Colors.white,
                          // fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 10,),
                      Text(
                        currentFname,
                        style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'Nexa',
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 30,),
                    ],
                  ),
                )
              ],
            ),
            Column(
              children: [
                OutlineButton(
                  onPressed: (){
                    linkop('mailto:theritwikkundu@gmail.com');
                  },
                  child: SizedBox(
                    width: 140,
                    child: Text(
                      "FEEDBACK",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Nexa',
                          color: Color(0xffffffff),
                          fontWeight: FontWeight.w600
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 1,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                FlatButton(
                  onPressed: (){
                    clearAll();
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  child: SizedBox(
                    width: 140,
                    child: Text(
                      "LOGOUT",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Nexa',
                          color: Color(0xff4A7C59),
                          fontWeight: FontWeight.w600
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      drawerScrimColor: Color(0x55FAF3DD),
      floatingActionButton: Container(
        width: 70,
        height: 70,
        alignment: Alignment.topLeft,
        child: FloatingActionButton(
          elevation: 100,
          // onPressed: (){
          //   return showDialog(context: context, barrierDismissible: false, builder: (context){
          //     return AlertDialog(
          //       title: Text(
          //         "About the app",
          //         textAlign: TextAlign.center,
          //       ),
          //       titleTextStyle: TextStyle(
          //         color: Color(0xff4A7C59),
          //         fontFamily: 'Nexa',
          //         fontSize: 24,
          //         fontWeight: FontWeight.bold,
          //       ),
          //       content: SingleChildScrollView(
          //         child: Text(
          //           "This is a simulation of form encryption and decryption using AES algorithm.",
          //           style: TextStyle(
          //             fontFamily: 'Nexa',
          //             fontSize: 16,
          //           ),
          //           textAlign: TextAlign.justify,
          //         ),
          //       ),
          //       actions: [
          //         MaterialButton(
          //           onPressed: (){
          //             Navigator.of(context).pop();
          //           },
          //           child: Text(
          //             'Close',
          //             style: TextStyle(
          //               color: Color(0xff4A7C59),
          //               fontFamily: 'Nexa',
          //               fontSize: 20,
          //               fontWeight: FontWeight.bold,
          //             ),
          //           ),
          //           splashColor: Color(0xff4A7C59),
          //         )
          //       ],
          //       backgroundColor: Color(0xffC8D5B9),
          //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          //     );
          //   });
          // },


          //database handler
          onPressed: (){
            // readData();
            writeData();
            // deleteData();
            // updateData();
          },

          backgroundColor: Color(0x004A7C59),
          // splashColor: Color(0x004A7C59),
          // shape: ,
          child: Icon(
            Icons.info_sharp,
            size: 60,
            color: Color(0xff4A7C59),
          ),
        ),
      ),
    );
  }

  /*database handler*/
  void readData(){}

  void writeData(){
    DBRef.child("regn").push().set({
      'reg': encryptAESCryptoJS("19BCE0547", "password"),
      'fname': encryptAESCryptoJS("Ritwik", "password"),
      'lname': encryptAESCryptoJS("Kundu", "password"),
      'mail': encryptAESCryptoJS("theritwikkundu@gmail.com", "password"),
      'dob': encryptAESCryptoJS("06/10", "password"),
      'gender': encryptAESCryptoJS("M", "password"),
      'pass': encryptAESCryptoJS("abcd1234", "password"),
    });
    print("data created");
  }

  void updateData(){}
  void deleteData(){}
}
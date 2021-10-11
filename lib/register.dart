import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:form_encryption_flutter/database/dboperate.dart';
import 'package:form_encryption_flutter/crypto/cryptojs_aes.dart';
import 'package:form_encryption_flutter/main.dart';

class RegisterP extends StatelessWidget {
  TextEditingController fnm = TextEditingController();
  TextEditingController lnm = TextEditingController();
  TextEditingController mail = TextEditingController();
  TextEditingController db = TextEditingController();
  TextEditingController reg = TextEditingController();
  TextEditingController pw = TextEditingController();
  TextEditingController gd = TextEditingController();

  //flag is true when no matching phone number in database
  bool flag=true;
  Future<void> credValid(String regg) async
  {
    // database reference variable
    final DBRef = await FirebaseDatabase.instance.reference();

    await DBRef.child("regn").once().then((DataSnapshot dataSnapShot){
      var newdata = dataSnapShot.value;
      newdata.forEach((key, values) {
        // print(values['phone']);
        if (decryptAESCryptoJS(values['reg'], "password").toString() == regg) {
          reg.clear();
          fnm.clear();
          lnm.clear();
          mail.clear();
          db.clear();
          pw.clear();
          gd.clear();
          flag = false;
        }
      });
    });
    // await Future.delayed(Duration(seconds:0),(){
    //   print("Assigned flag = "+flag.toString()+" in line x");
    // });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
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
        body: Container(
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30,),
                Text(
                  "Welcome!",
                  style: TextStyle(
                    fontSize: 48,
                    fontFamily: 'Nexa',
                    color: Color(0xffFAF3DD),
                  ),
                ),
                SizedBox(height: 50,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextField(
                      controller: fnm,
                      // maxLength: 10,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Color(0xffFAF3DD),
                        filled: true,
                        hintText: 'First Name *',
                        hintStyle: TextStyle(
                          fontSize: 22,
                          fontFamily: 'Nexa',
                          color: Color(0x884A7C59),
                        ),
                      ),
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.go,
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Righteous',
                        color: Color(0xff4A7C59),
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextField(
                      controller: lnm,
                      // maxLength: 10,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Color(0xffFAF3DD),
                        filled: true,
                        hintText: 'Last Name',
                        hintStyle: TextStyle(
                          fontSize: 22,
                          fontFamily: 'Nexa',
                          color: Color(0x884A7C59),
                        ),
                      ),
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.go,
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Righteous',
                        color: Color(0xff4A7C59),
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextField(
                      controller: mail,
                      // maxLength: 10,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Color(0xffFAF3DD),
                        filled: true,
                        hintText: 'Email ID',
                        hintStyle: TextStyle(
                          fontSize: 22,
                          fontFamily: 'Nexa',
                          color: Color(0x884A7C59),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.go,
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Righteous',
                        color: Color(0xff4A7C59),
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextField(
                      controller: db,
                      maxLength: 10,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Color(0xffFAF3DD),
                        filled: true,
                        hintText: 'Date of Birth *',
                        hintStyle: TextStyle(
                          fontSize: 22,
                          fontFamily: 'Nexa',
                          color: Color(0x884A7C59),
                        ),
                      ),
                      keyboardType: TextInputType.datetime,
                      textInputAction: TextInputAction.go,
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Righteous',
                        color: Color(0xff4A7C59),
                      ),
                    ),
                    TextField(
                      controller: gd,
                      // maxLength: 10,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Color(0xffFAF3DD),
                        filled: true,
                        hintText: 'Gender',
                        hintStyle: TextStyle(
                          fontSize: 22,
                          fontFamily: 'Nexa',
                          color: Color(0x884A7C59),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.go,
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Righteous',
                        color: Color(0xff4A7C59),
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextField(
                      controller: reg,
                      maxLength: 9,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Color(0xffFAF3DD),
                        filled: true,
                        hintText: 'Register ID *',
                        hintStyle: TextStyle(
                          fontSize: 22,
                          fontFamily: 'Nexa',
                          color: Color(0x884A7C59),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.go,
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Righteous',
                        color: Color(0xff4A7C59),
                      ),
                    ),
                    // SizedBox(height: 20,),
                    TextField(
                      controller: pw,
                      maxLength: 20,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Color(0xffFAF3DD),
                        filled: true,
                        hintText: 'Password *',
                        hintStyle: TextStyle(
                          fontSize: 22,
                          fontFamily: 'Nexa',
                          color: Color(0x884A7C59),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.go,
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Righteous',
                        color: Color(0xff4A7C59),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 20),
                    RaisedButton(
                      onPressed: () async{
                        if(reg.text.length==4 && pw.text.length >= 4 && db.text.length!=0 && fnm.text.length!=0){
                          await credValid(reg.text);
                        }
                        else{
                          flag = false;
                        }

                        if(flag) {
                          var en_fnm = encryptAESCryptoJS(fnm.text, "password");
                          var en_lnm = encryptAESCryptoJS(lnm.text, "password");
                          var en_mail = encryptAESCryptoJS(mail.text, "password");
                          var en_db = encryptAESCryptoJS(db.text, "password");
                          var en_reg = encryptAESCryptoJS(reg.text, "password");
                          var en_pw = encryptAESCryptoJS(pw.text, "password");
                          var en_gd = encryptAESCryptoJS(gd.text, "password");

                          DBOperate.writeRegData(en_fnm,en_lnm,en_mail,en_db,en_reg,en_pw,en_gd);
                          print("Created account");

                          Navigator.pop(context);
                          return showDialog(context: context, barrierDismissible: false, builder: (context){
                            return AlertDialog(
                              title: Text(
                                "Registration successful!",
                                textAlign: TextAlign.center,
                              ),
                              titleTextStyle: TextStyle(
                                color: Color(0xff4A7C59),
                                fontFamily: 'Nexa',
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                              content: Icon(
                                Icons.done_outline_outlined,
                                size: 72,
                                color: Color(0xff4A7C59),
                              ),
                              actions: [
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
                                )
                              ],
                              backgroundColor: Color(0xffFAF3DD),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                            );
                          }
                          );
                        }
                        else {
                          flag=true;
                          return showDialog(context: context,
                              barrierDismissible: false,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(
                                    "Try again!",
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
                                    MaterialButton(
                                      onPressed: () {
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
                                    )
                                  ],
                                  backgroundColor: Color(0xffFAF3DD),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16)),
                                );
                              }
                          );
                        }
                      },
                      child: Text(
                        "SIGN UP",
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Nexa',
                          color: Color(0xff4A7C59),
                        ),
                      ),
                      elevation: 24,
                      padding: EdgeInsets.fromLTRB(45, 14, 45, 13),
                      color: Color(0xffFAF3DD),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    )
                  ],
                ),
                // SizedBox(height: 0,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
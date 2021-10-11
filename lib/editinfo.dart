import 'package:flutter/material.dart';
import 'dart:math';
import 'package:form_encryption_flutter/database/dboperate.dart';
import 'package:form_encryption_flutter/main.dart';
import 'package:form_encryption_flutter/crypto/cryptojs_aes.dart';
import 'package:form_encryption_flutter/main.dart';

class EditinfoP extends StatefulWidget {

  @override
  _EditinfoPState createState() => _EditinfoPState();
}

class _EditinfoPState extends State<EditinfoP> {

  TextEditingController fnm = TextEditingController();
  TextEditingController lnm = TextEditingController();
  TextEditingController db = TextEditingController();
  TextEditingController pw = TextEditingController();
  TextEditingController pw2 = TextEditingController();

  bool credValid(String psw, String psw2)
  {
    if ((psw2.length>=4 && psw==psw2 && psw!=currentPass) || (psw=="" && psw2==currentPass))
    {
      return true;
    }
    else
    {
      pw.clear();
      pw2.clear();
      return false;
    }
  }

  void updtAc(){
    var en_fnm = encryptAESCryptoJS(fnm.text, "password");
    var en_lnm = encryptAESCryptoJS(lnm.text, "password");
    var en_db = encryptAESCryptoJS(db.text, "password");
    var en_pw = encryptAESCryptoJS(pw2.text, "password");

    DBOperate.updateRegData(en_fnm,en_lnm,en_db,en_pw,nodeid);
    print("Updated account");
  }

  void insertText(String insert, TextEditingController controller) {
    final int cursorPos = controller.selection.base.offset;
    controller.value = controller.value.copyWith(
        text: controller.text.replaceRange(max(cursorPos, 0), max(cursorPos, 0), insert),
        selection: TextSelection.fromPosition(TextPosition(offset: max(cursorPos, 0) + insert.length))
    );
  }

  @override
  void initState() {
    super.initState();
    insertText(currentFname, fnm);
    insertText(currentLname, lnm);
    insertText(currentDob, db);
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
        // resizeToAvoidBottomInset: false,
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
          padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
          alignment: Alignment.center,
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
                // SizedBox(height: 10,),
                Text(
                  "Edit info",
                  style: TextStyle(
                    fontSize: 46,
                    fontFamily: 'Nexa',
                    color: Color(0xffFAF3DD),
                  ),
                ),
                SizedBox(height: 30,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextField(
                      cursorColor: Color(0x884A7C59),
                      controller: fnm,
                      // maxLength: 10,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Color(0xffFAF3DD),
                        filled: true,
                        hintText: 'First Name',
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
                      cursorColor: Color(0x884A7C59),
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
                      cursorColor: Color(0x884A7C59),
                      controller: db,
                      maxLength: 10,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Color(0xffFAF3DD),
                        filled: true,
                        hintText: 'Date of Birth',
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
                      cursorColor: Color(0x884A7C59),
                      obscureText: true,
                      controller: pw,
                      maxLength: 20,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Color(0xffFAF3DD),
                        filled: true,
                        hintText: 'New password',
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
                    TextField(
                      cursorColor: Color(0x884A7C59),
                      obscureText: true,
                      controller: pw2,
                      maxLength: 20,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Color(0xffFAF3DD),
                        filled: true,
                        hintText: 'Confirm password *',
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
                    SizedBox(height: 30,),
                  ],
                ),
                FlatButton(
                  onPressed: (){
                    var text1="",text2=pw2.text;
                    if(pw.text.isNotEmpty){
                      text1=pw.text;
                    }
                    if(credValid(text1, text2)) {
                      updtAc();
                      Navigator.of(context).pop();
                      Navigator.pushReplacementNamed(context, '/login');
                      return showDialog(context: context, barrierDismissible: false, builder: (context) {
                        return AlertDialog(
                          title: Text(
                            "Update successfull!",
                            textAlign: TextAlign.center,
                          ),
                          titleTextStyle: TextStyle(
                            color: Color(0xff4A7C59),
                            fontFamily: 'Nexa',
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          content: Icon(
                            Icons.done_outline_sharp,
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
                            ),
                          ],
                          backgroundColor: Color(0xffFAF3DD),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                        );
                      }
                      );
                    }
                    else
                    {
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
                                ),
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
                    "UPDATE",
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Nexa',
                      color: Color(0xff4A7C59),
                    ),
                  ),
                  // elevation: 24,
                  padding: EdgeInsets.fromLTRB(32, 14, 32, 13),
                  color: Color(0xffFAF3DD),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                SizedBox(height: 10,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

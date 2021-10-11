import 'package:firebase_database/firebase_database.dart';

class DBOperate{

  /*function to read data*/
  // static bool readData(String reg){
  //   // database reference string
  //   final DBRef = FirebaseDatabase.instance.reference();
  //   bool fl = false;
  //   print("Reg: "+reg);
  //   DBRef.child("regn").once().then((DataSnapshot dataSnapShot){
  //     var newdata = dataSnapShot.value;
  //     // var key = newdata.keys.elementAt("1234");
  //     newdata.forEach((key, values){print(values['reg']);if((values['reg'])==reg){fl = true;}});
  //     return fl;
  //   });
  // }

  /*function to write registration data*/
  static void writeRegData(String fname, String lname, String mail, String dob, String reg, String password, String gender){
    // database reference string
    final DBRef = FirebaseDatabase.instance.reference();
    DBRef.child("regn").push().set({
      'reg': reg,
      'fname': fname,
      'lname': lname,
      'mail': mail,
      'dob': dob,
      'gender': gender,
      'pass': password
    });
    // print("data created");
  }

  /*function to update data on edit info*/
  static void updateRegData(String fname, String lname, String dob, String password, String nodeid){
    // database reference string
    final DBRef = FirebaseDatabase.instance.reference();
    DBRef.child("regn").child(nodeid).update({
      'fname': fname,
      'lname': lname,
      'dob': dob,
      'pass': password
    });
    // print("data updated");
  }

  /*function to delete data on account deletion*/
  static void deleteAccData(String nodeid){
    // database reference string
    final DBRef = FirebaseDatabase.instance.reference();
    DBRef.child("regn").child(nodeid).remove();
    // print("data deleted");
  }
}
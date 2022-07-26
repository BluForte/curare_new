import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class UserModel {
  final String? pid;
  final String? pname;
  final String? pno;
  final String? page;
  final String? psex;
  final String? pmail;

  UserModel({this.pname, this.pno, this.pid, this.page, this.psex, this.pmail});

  factory UserModel.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return UserModel(
      pname: snapshot['Patient Name'],
      pno: snapshot['Phone Number'],
      pid: snapshot['Patient Id'],
      page: snapshot['Age'],
      psex: snapshot['Sex'],
      pmail: snapshot['Email'],
    );
  }

  Map<String, dynamic> toJson() => {
        "Patient Name": pname,
        "Phone Number": pno,
        "Patient Id": pid,
        "Patient Age": page,
        "Sex": psex,
        "Email": pmail
      };
}
// class UserModel1 {
//   final String? pid;
//   final String? pname;
//   final String? pno;
  

//   UserModel1({this.pname, this.pno, this.pid});

//   factory UserModel1.fromSnapshot(DocumentSnapshot snap) {
//     var snapshot = snap.data() as Map<String, dynamic>;

//     return UserModel1(
//       pname: snapshot['Patient Name'],
//       pno: snapshot['Phone Number'],
//       pid: snapshot['Patient Id'],
//     );
//   }

//   Map<String, dynamic> toJson() => {
//     "Patient Name": pname,
//     "Phone Number": pno,
//     "Patient Id": pid,
//   };
// }
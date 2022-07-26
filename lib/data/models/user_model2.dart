import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel3{
  final String? did;
  final String? dname;
  final String? ddes;

  UserModel3({this.dname, this.ddes, this.did});

  factory UserModel3.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return UserModel3(
      dname: snapshot['Doctor Name'],
      ddes: snapshot['Designation'],
      did: snapshot['doctor Id'],
    );
  }

  Map<String, dynamic> toJson() => {
        "Patient Name": dname,
        "Phone Number": ddes,
        "Patient Id": did,
      };
}
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:curare/data/models/user_model2.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class FirestoreHelper2 {
  static Stream<List<UserModel3>> read() {
    final userCollection = FirebaseFirestore.instance.collection("Doctors");
    return userCollection.snapshots().map((querySnapshot) =>
        querySnapshot.docs.map((e) => UserModel3.fromSnapshot(e)).toList());
  }

//   //firebase for hospital appbar(Ann)
//   static Future<HospitalModel>getDescAndName() async{
//   DocumentSnapshot snap = await FirebaseFirestore
//   .collection("Hospitals")
//   .doc(FirebaseAuth.currentUser!.uid)
//   .get();

// HospitalModel hospitalModel = HospitalModel.getModelFromJson((
//   snap.data()as dynamic),

// );
// return hospitalModel;

// }

  // static Future<UserModel2> readUser() async {
  //   //final uid = FirebaseAuth.instance.currentUser!.uid;

  //   var data =
  //       await FirebaseFirestore.instance.collection('Doctors').doc(uid).get();

  //   UserModel2 _user = UserModel2.fromSnapshot(data);

  //   return _user;
  // }

  // static Future create(UserModel2 user) async {
  //   final userCollection = FirebaseFirestore.instance.collection("Doctors");

  //   // final uid = userCollection.doc().id;
  //   //final uid = FirebaseAuth.instance.currentUser!.uid;
  //   final uid = userCollection.doc().id;
  //   final docRef = userCollection.doc(uid);

  //   final newUser =
  //       UserModel2(did: uid, dname: user.dname, ddes: user.ddes).toJson();

  //   try {
  //     await docRef.set(newUser);
  //   } catch (e) {
  //     print("some error occured $e");
  //   }
  // }

//   static Future update(UserModel2 user) async {
//     final userCollection = FirebaseFirestore.instance.collection("Doctors");

//     final docRef = userCollection.doc(user.did);

//     final newUser =
//         UserModel2(did: user.did, dname: user.dname, ddes: user.ddes).toJson();

//     try {
//       await docRef.update(newUser);
//     } catch (e) {
//       print("some error occured $e");
//     }
//   }

//   static Future delete(UserModel2 user) async {
//     final userCollection = FirebaseFirestore.instance.collection("Doctors");

//     final docRef = userCollection.doc(user.did).delete();
//   }
}

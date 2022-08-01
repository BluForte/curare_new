import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curare/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreHelper {
  static Stream<List<UserModel>> read() {
    final userCollection = FirebaseFirestore.instance.collection("users");
    return userCollection.snapshots().map((querySnapshot) =>
        querySnapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList());
  }

  static Future<UserModel> readUser() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    var data =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();

    UserModel user = UserModel.fromSnapshot(data);

    return user;
  }

  static Future create(UserModel user) async {
    final userCollection = FirebaseFirestore.instance.collection("users");

    // final uid = userCollection.doc().id;
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final docRef = userCollection.doc(uid);

    final newUser = UserModel(
            pid: uid,
            pname: user.pname,
            pno: user.pno,
            page: user.page,
            psex: user.psex,
            pmail: user.pmail)
        .toJson();

    try {
      await docRef.set(newUser);
    } catch (e) {
      print("some error occured $e");
    }
  }

  static Future update(UserModel user) async {
    final userCollection = FirebaseFirestore.instance.collection("users");

    final docRef = userCollection.doc(user.pid);

    final newUser = UserModel(
            pid: user.pid,
            pname: user.pname,
            pno: user.pno,
            page: user.page,
            psex: user.psex,
            pmail: user.pmail)
        .toJson();

    try {
      await docRef.update(newUser);
    } catch (e) {
      print("some error occured $e");
    }
  }

  static Future delete(UserModel user) async {
    final userCollection = FirebaseFirestore.instance.collection("users");

    final docRef = userCollection.doc(user.pid).delete();
  }
}

// class FirestoreHelper1 {

//   static Stream<List<UserModel1>> read() {
//     final userCollection = FirebaseFirestore.instance.collection("users");
//     return userCollection.snapshots().map((querySnapshot) => querySnapshot.docs.map((e) => UserModel1.fromSnapshot(e)).toList());

//   }

//   static Future create(UserModel1 user) async {
//     final userCollection = FirebaseFirestore.instance.collection("users");

//     final uid = userCollection.doc().id;
//     final docRef = userCollection.doc(uid);

//     final newUser = UserModel1(
//       pid: uid,
//         pname: user.pname,
//         pno: user.pno
//     ).toJson();

//     try {
//       await docRef.set(newUser);
//     } catch (e) {
//       print("some error occured $e");
//     }
//   }

//   static Future update(UserModel1 user) async {
//     final userCollection = FirebaseFirestore.instance.collection("users");

//     final docRef = userCollection.doc(user.pid);

//     final newUser = UserModel1(
//         pid: user.pid,
//         pname: user.pname,
//         pno: user.pno
//     ).toJson();

//     try {
//       await docRef.update(newUser);
//     } catch (e) {
//       print("some error occured $e");
//     }
//   }

//   static Future delete(UserModel1 user) async {
//     final userCollection = FirebaseFirestore.instance.collection("users");

//     final docRef = userCollection.doc(user.pid).delete();

//   }



// }
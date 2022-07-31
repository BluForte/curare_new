import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curare/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:curare/data/models/hospital_provider.dart';

class CloudFire {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<HospitalModel> getDescAndName({required String hospitalId}) async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('Hospitals')
        .doc(hospitalId)
        .get();

    HospitalModel hospitalModel = HospitalModel.getModelFromJson(
      (snap.data() as dynamic),
    );
    return hospitalModel;
  }

//   Future<UserModel>getNameAndAdddress()async{
//   DocumentSnapshot snap=await firebaseFirestore
//   .collection("users")
//   .doc(FirebaseAuth.currentUser!.Id)

//   .get();
//   UserModel usermodel =UserModel.getModelFromJson(
//     (snap.data()as dynamic)
//   );
// }
// return UserModel;
//
}

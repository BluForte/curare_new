// ignore_for_file: sort_child_properties_last

import 'package:curare/data/models/user_model2.dart';
//import 'package:curare/data/models/user_model2.dart';
import 'package:curare/data/remote_data_source/firestore_helper2.dart';
import 'package:curare/dprofile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:curare/dprofile.dart';



class Doctors1 extends StatefulWidget {
  const Doctors1({Key? key}) : super(key: key);

  @override
  State<Doctors1> createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors1> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  // Future<ParseUser?> getUser() async {
  //   currentUser = await ParseUser.currentUser() as ParseUser?;
  //   return currentUser;
  // }


  @override
  void dispose() {
    _usernameController.dispose();
    _ageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Pediatrician"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder<List<UserModel3>>(
                    stream: FirestoreHelper22.read(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.hasError) {
                        return Center(
                          child: Text("some error occured"),
                        );
                      }
                      if (snapshot.hasData) {
                        final userData = snapshot.data;
                        return Expanded(
                          child: ListView.builder(
                              itemCount: userData!.length,
                              itemBuilder: (context, index) {
                                final singleUser = userData[index];
                                return Container(
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  child: ListTile(
                                    // onLongPress: () {
                                    //   showDialog(context: context, builder: (context) {
                                    //     return AlertDialog(
                                    //       title: Text("Delete"),
                                    //       content: Text("are you sure you want to delete"),
                                    //       actions: [
                                    //         ElevatedButton(onPressed: () {
                                    //           FirestoreHelper.delete(singleUser).then((value) {
                                    //             Navigator.pop(context);
                                    //           });
                                    //         }, child: Text("Delete"))
                                    //       ],
                                    //     );
                                    //   });
                                    // },
                                    leading: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(color: Colors.deepPurple, shape: BoxShape.circle),
                                    ),
                                    title: Text("${singleUser.dname}"),
                                    subtitle: Text("${singleUser.ddes}"),
                                    trailing: InkWell(onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => EditPage(user: UserModel3(dname: singleUser.dname),)));
                                    },child: Icon(Icons.edit)),
                                  ),
                                );
                              }),
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }),
        ) );
  }
}

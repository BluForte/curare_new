// ignore_for_file: sort_child_properties_last

import 'package:curare/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dprofile.dart';
import 'package:curare/data/remote_data_source/firestore_helper.dart';


class Doctors extends StatefulWidget {
  const Doctors({Key? key}) : super(key: key);

  @override
  State<Doctors> createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {
  // TextEditingController _usernameController = TextEditingController();
  // TextEditingController _ageController = TextEditingController();

  // @override
  // void dispose() {
  //   _usernameController.dispose();
  //   _ageController.dispose();
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Neurologists"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder<List<UserModel>>(
                    stream: FirestoreHelper.read(),
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
                                    title: Text("${singleUser.pname}"),
                                    subtitle: Text("${singleUser.pno}"),
                                    trailing: InkWell(onTap: () {
                                     // Navigator.push(context, MaterialPageRoute(builder: (context) => EditPage(user: UserModel1(pname: singleUser.pname, pno: singleUser.pno, pid: singleUser.pid),)));
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

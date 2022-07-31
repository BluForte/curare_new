import 'package:curare/data/models/user_model2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:curare/data/models/user_model.dart';
import 'package:curare/data/remote_data_source/firestore_helper.dart';


class EditPage extends StatefulWidget {
  final UserModel3 user;
   EditPage({Key? key, required this.user}) : super(key: key);
  String? uname;

  @override
  State<EditPage> createState() => _ProfileUI2State();
  //TextEditingController? _usernameController;
  //TextEditingController? _ageController;

  // @override
  // void initState() {
  //   _usernameController = TextEditingController(text: widget.user.dname);
  // //  _ageController = TextEditingController(text: widget.user.age);
  //   super.initState();
  // }
//     @override
//   void initState() {
//     super.initState();
//     _getUserFromFirestore();
//   }
 
//  _getUserFromFirestore() async {
//     final user = await FirestoreHelper.readUser();
//     setState(() {
//       username = user.pname;
//       print(username);
//     });
//   }
}

class _ProfileUI2State extends State<EditPage> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 180,
              child: Container(
                alignment: Alignment(0.0, 2.5),
                child: const CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 134, 100, 234),
                  //backgroundImage: AssetImage("assete/c3.JPG"),
                  radius: 70.0,
                  child: Icon(
                    Icons.person,
                    size: 80,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
              height: 30,
            ),
            Row(
              children: [
                Center(
                  child: Container(
                    height: 20,
                    width: 20,
                    child: Icon(Icons.person),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        SizedBox(
                          width: 10,
                          height: 10,
                        ),
                        Text(
                          "Name",
                          style: TextStyle(
                            fontSize: 12.0, color: Color.fromARGB(255, 255, 255, 255),
                            //letterSpacing: 2.0,
                            //fontWeight: FontWeight.w800
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Row(
                      children:  [
                        SizedBox(
                          width: 10,
                          height: 20,
                        ),
                        Text(
                          widget.user.dname!,
                          style: TextStyle(
                            fontSize: 25.0, color: Color.fromARGB(255, 0, 0, 0),
                            // letterSpacing: 2.0,
                            //fontWeight: FontWeight.w800
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: <Widget>[
                  Text(
                    "About the Doctor",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "A highly skilled Doctor with over an experience of more than two decade.She has been prominently working for the hospital for past 6 years and is a recipient of many awards in the field",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Available Time Slots",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  timeSlotWidget(
                      "1", "JULY", "Consultation ", "Sunday 9 am to 11.30 am"),
                  timeSlotWidget(
                      "2", "JULY", "Consultation ", "Monday 10 am to 12.30 am"),
                  timeSlotWidget(
                      "3", "JULY", "Consultation  ", "Wednesday 8 am to 12.30 pm"),
                  timeSlotWidget(
                      "4", "JULY", "Consultation  ", "Friday 8 am to 1 am"),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: 290,
              height: 44,
              child: MaterialButton(
                onPressed: () {
                  //TODO FORGOT PASSWORD SCREEN GOES HERE
                 },
                color: Color.fromARGB(255, 131, 86, 255),
                child: Text(
                  'go to payments',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  timeSlotWidget(String date, String month, String slotType, String time) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color:Color.fromARGB(255, 160, 95, 252)),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Container(
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    date,
                    style: TextStyle(
                        color: Color.fromARGB(255, 150, 99, 244),
                        fontSize: 30,
                        fontWeight: FontWeight.w800),
                  ),
                  Text(
                    month,
                    style: TextStyle(
                        color: Color.fromARGB(255, 179, 116, 255),
                        fontSize: 12,
                        fontWeight: FontWeight.w800),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  slotType,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  time,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

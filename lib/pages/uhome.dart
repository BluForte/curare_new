import 'package:curare/data/remote_data_source/firestore_helper.dart';
import 'package:curare/pages/token_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:curare/screens/signin_screen.dart';
import 'package:google_fonts/google_fonts.dart';

//import 'package:url_launcher/url_launcher.dart';

import 'cards.dart';

class Mypage1 extends StatefulWidget {
  Mypage1({Key? key}) : super(key: key);

  @override
  State<Mypage1> createState() => _Mypage1State();
}

class _Mypage1State extends State<Mypage1> {
  int index = 2;
  ParseUser? currentUser;
  String? username;

  @override
  void initState() {
    super.initState();
    _getUserFromFirestore();
  }

  _getUserFromFirestore() async {
    final user = await FirestoreHelper.readUser();
    setState(() {
      username = user.pname;
      print(username);
    });
  }

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Mypage1(),
              ));
        },
        child: const Icon(
          Icons.home,
          size: 30,
          color: Colors.white,
        ),
      ),
      const Icon(
        Icons.search,
        size: 30,
        color: Colors.white,
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyCardWidget(),
              ));
        },
        child: const Icon(
          Icons.generating_tokens,
          size: 30,
          color: Colors.white,
        ),
      ),
      const Icon(
        Icons.question_answer,
        size: 30,
        color: Colors.white,
      ),
      const Icon(
        Icons.person,
        size: 30,
        color: Colors.white,
      ),
    ];
    return Scaffold(
        body: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return Center(
                    child: Container(
                        width: 100,
                        height: 100,
                        child: const CircularProgressIndicator()),
                  );
                default:
                  if (snapshot.hasData) {
                    return Scaffold(
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      body: SafeArea(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Image.asset(
                                    "lib/assets/logo1.png",
                                    height: 100,
                                    width: 150,
                                  ),
                                  const SizedBox(
                                    width: 130,),

                                  
                                 
                                
                                  ElevatedButton(
                                    child: const Text('Logout'),
                                    onPressed: () {
                                      FirebaseAuth.instance
                                          .signOut()
                                          .then((value) {
                                        print("Signed Out");
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>

                                                    const SignInScreen()));
                                      });
                                    },
                                  ),
                                
                                  // SizedBox(

                                  //   width: 10,
                                  // )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    if (snapshot.hasData)
                                      Text(

                                          // Greeting with username
                                          username == null
                                              ? 'Hi '
                                              : 'Hi $username',
                                          style: GoogleFonts.openSans(
                                              fontSize: 29,
                                              fontWeight: FontWeight.bold)),
                                    //Icon
                                    Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                                255, 192, 145, 220)
                                            .withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      child: Image.asset(
                                        'lib/assets/children.png',
                                        scale: 8,

                                       ),
                                    ),
                                  ],
                                ),
                              ),
                              //for animated box

                              const SizedBox(height: 1),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color.fromARGB(
                                                255, 192, 145, 220)
                                            .withOpacity(0.5),
                                        spreadRadius: 3,
                                        blurRadius: 10,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 170,

                                        width: 210,
                                        //child: Lottie.asset('assets/hos.json'),
                                        child: Lottie.network(
                                            'https://assets4.lottiefiles.com/packages/lf20_wdXBRc.json'),
                                      ),
                                      Column(
                                        children: const [
                                          Text(
                                            'How do u feel today',
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                          Center(
                                            child: Text('"We Exist To Care"'),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              const SizedBox(height: 1),

                              //cards for articles
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Top Hospitals For You ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              const CardsWidget(),
                            ],
                          ),
                        ),
                      ),
                      bottomNavigationBar: CurvedNavigationBar(
                        height: 45,
                        index: index,
                        items: items,
                        backgroundColor: Colors.white10,
                        color: const Color.fromARGB(255, 85, 164, 244),
                        animationDuration: const Duration(milliseconds: 300),
                        onTap: (index) {
                          //Handle button tap
                        },
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  }

                  return const SignInScreen();
              }
            }));
  }

  //Logout method
  void doUserLogout() async {
    var response = await currentUser!.logout();
    if (response.success) {
      Message.showSuccess(
          context: context,
          message: 'User was successfully logout!',
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const SignInScreen()),
              (Route<dynamic> route) => false,
            );
          });
    } else {
      Message.showError(context: context, message: response.error!.message);
    }
  }
}

//Message Class
class Message {
  static void showSuccess(
      {required BuildContext context,
      required String message,
      VoidCallback? onPressed}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Success!"),
          content: Text(message),
          actions: <Widget>[
            ElevatedButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
                if (onPressed != null) {
                  onPressed();
                }
              },
            ),
          ],
        );
      },
    );
  }

  static void showError(
      {required BuildContext context,
      required String message,
      VoidCallback? onPressed}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error!"),
          content: Text(message),
          actions: <Widget>[
            ElevatedButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
                if (onPressed != null) {
                  onPressed();
                }
              },
            ),
          ],
        );
      },
    );
  }
}

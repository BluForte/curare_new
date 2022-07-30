import 'package:curare/data/remote_data_source/firestore_helper.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:curare/screens/signin_screen.dart';
//import '../login_page.dart';
import 'booking_page.dart';
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
      Icon(
        Icons.home,
        size: 30,
        color: Colors.white,
      ),
      Icon(
        Icons.search,
        size: 30,
        color: Colors.white,
      ),
      Icon(
        Icons.generating_tokens,
        size: 30,
        color: Colors.white,
      ),
      Icon(
        Icons.question_answer,
        size: 30,
        color: Colors.white,
      ),
      Icon(
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
                        child: CircularProgressIndicator()),
                  );
                default:
                  if (snapshot.hasData) {
                    return Scaffold(
                      backgroundColor: Color.fromARGB(255, 255, 255, 255),
                      body: SafeArea(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  
                                  // if(snapshot.hasData)
                                  
                                  // Text(
                                   
                                  //   // Greeting with username
                                  //   username == null ? 
                                  //   'Hi ' : 'Hi $username',
                                  
                                  //   style: TextStyle(
                                  //     fontSize: 24,
                                  //     fontWeight: FontWeight.bold,
                                  //   ),
                                  // ),
                                  Image.asset(
                                    "lib/assets/logo1.png",
                                    height: 60,
                                    width: 80,
                                  ),
                                  SizedBox(
                                    width: 210,
                                  ),
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
                                                    SignInScreen()));
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: 10,
                                  )
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

                                        style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    //Icon
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 90, 174, 238),
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      child: Image.asset(
                                        'lib/assets/woman.png',
                                        scale: 7.8,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //for animated box
                              SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 3,
                                        blurRadius: 10,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 180,
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
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.5),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 3,
                                          blurRadius: 10,
                                          offset: Offset(0, 3),
                                        ),
                                      ]),
                                  child: Row(
                                    children: [
                                      SizedBox(width: 80),
                                      Container(
                                        height: 150,
                                        width: 200,
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        BookingWidget()));
                                          },
                                          child: Container(
                                            child: Center(
                                              child: Column(
                                                children: [
                                                  Icon(Icons.token_outlined),
                                                  const Text(
                                                    'BookAppointment',
                                                    textAlign: TextAlign.center,
                                                    style:
                                                        TextStyle(fontSize: 22),
                                                  ),
                                                  Container(
                                                    height: 90,
                                                    width: 200,
                                                    //child: Lottie.asset('assets/hos.json'),
                                                    child: Lottie.network(
                                                        'https://assets6.lottiefiles.com/private_files/lf30_BP4Us7.json',
                                                        animate: false),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              //cards for articles
                              const Padding(
                                padding: EdgeInsets.only(top: 10, left: 10),
                                child: Text(
                                  'Top picks for you',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
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
                        height: 50,
                        index: index,
                        items: items,
                        backgroundColor: Colors.white10,
                        color: Color.fromARGB(255, 85, 164, 244),
                        animationDuration: Duration(milliseconds: 300),
                        onTap: (index) {
                          //Handle button tap
                        },
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  }

                  return SignInScreen();
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
              MaterialPageRoute(builder: (context) => SignInScreen()),
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

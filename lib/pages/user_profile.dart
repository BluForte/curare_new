import 'package:flutter/material.dart';

class UP extends StatefulWidget {
  const UP({Key? key}) : super(key: key);

  @override
  State<UP> createState() => _UPState();
}

class _UPState extends State<UP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 106, 255, 243),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        height: 30,
                        width: 40,
                        child: Icon(Icons.person),
                      ),
                    ),
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 228, 220, 220),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Name"),
                          ),
                          SizedBox(width: 15),
                          Text(""),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Name"),
                          ),
                          SizedBox(width: 15),
                          Text(""),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

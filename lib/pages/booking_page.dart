import 'package:curare/pages/cardiologist.dart';
import 'package:curare/pages/departments.dart';
import 'package:curare/pages/gynecologist.dart';
import 'package:curare/pages/pediatrican.dart';
import 'package:flutter/material.dart';
import 'package:curare/data/models/hos_provider.dart';
import 'package:provider/provider.dart';
import 'package:curare/data/models/hospital_provider.dart';

import 'uhome.dart';

class BookingWidget extends StatefulWidget {
  const BookingWidget({Key? key}) : super(key: key);

  @override
  State<BookingWidget> createState() => _BookingWidgetState();
}

class _BookingWidgetState extends State<BookingWidget> {
  @override
  Widget build(BuildContext context) {
    HospitalModel h1 =
        Provider.of<HosModelDetailsProvider>(context).hospitalDetails;

    return Scaffold(
      appBar: AppBar(
        title: Text(h1.name),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 228, 220, 220),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 25),
                  Text(
                    h1.desc,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 228, 220, 220),
                borderRadius: BorderRadius.circular(30),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Doctors(),
                      ));
                },
                child: Column(
                  children: [
                    SizedBox(height: 25),
                    Row(
                      children: [
                        Container(
                          height: 100,
                          width: 200,
                          child: Image.asset("lib/assets/neurology.png"),
                        ),
                        Text(
                          'Neurologist',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 228, 220, 220),
                borderRadius: BorderRadius.circular(30),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Doctors1(),
                      ));
                },
                child: Column(
                  children: [
                    SizedBox(height: 25),
                    Row(
                      children: [
                        Container(
                          height: 112,
                          width: 200,
                          child: Image.asset("lib/assets/pediatrician.png"),
                        ),
                        Text(
                          'Pediatrician',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 228, 220, 220),
                borderRadius: BorderRadius.circular(30),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Doctors2(),
                      ));
                },
                child: Column(
                  children: [
                    SizedBox(height: 25),
                    Row(
                      children: [
                        Container(
                          height: 112,
                          width: 200,
                          child: Image.asset("lib/assets/gynecologist.png"),
                        ),
                        Text(
                          'Gynecologist',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 228, 220, 220),
                borderRadius: BorderRadius.circular(30),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Doctors3(),
                      ));
                },
                child: Column(
                  children: [
                    SizedBox(height: 25),
                    Row(
                      children: [
                        Container(
                          height: 112,
                          width: 200,
                          child: Image.asset("lib/assets/doctor.png"),
                        ),
                        Text(
                          'Cardiologist',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 228, 220, 220),
                borderRadius: BorderRadius.circular(30),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Mypage1(),
                      ));
                },
                child: Column(
                  children: [
                    SizedBox(height: 25),
                    Row(
                      children: [
                        Container(
                          height: 112,
                          width: 200,
                          child: Image.asset("lib/assets/phy.png"),
                        ),
                        Text(
                          'Physician',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          /* Padding(
              padding:const EdgeInsets.all(10),
              child:Container(
              height: 150,
               decoration: BoxDecoration(
              color:Color.fromARGB(255, 228, 220, 220),
              borderRadius: BorderRadius.circular(30),
                       ),
                      
                      
                  
                      child: GestureDetector(
                          onTap: (){
                                  Navigator.push(context,
                                   MaterialPageRoute(builder: (context) => Mypage1(),
                                   )
                                   );
                                },
                        child: Column(
                          
                      
                          children: [
                      
                            SizedBox(height: 25),
                           
                                
                            Row(
                              children: [
                                 Container(
                              height: 120,
                              width: 260,
                              //child: Lottie.asset('assets/hos.json'),
                               child: Lottie.network(
                                  'https://assets4.lottiefiles.com/packages/lf20_gnh15vxc.json',
                                  animate: false),
                            ),
                                Text('ENT',textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 25),
                                ),
                              ],
                            ),
                             
                             
                            
                      
                          ],
                          ),
                      ),
                         
                      


                                        ),
                                                     
              
             ),*/
        ],
      ),
    );
  }
}

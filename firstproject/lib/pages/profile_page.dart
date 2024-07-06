import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstproject/authentication/login_screen.dart';
import 'package:firstproject/global/global_var.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController carTextEditingController = TextEditingController();

  setDriverInfo()
  {
    setState(() {
      nameTextEditingController.text = driverName;
      phoneTextEditingController.text = driverPhone;
      emailTextEditingController.text = FirebaseAuth.instance.currentUser!.email.toString();
      carTextEditingController.text = carNumber + " - " + carColor + " - " + carModel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
          
              //image
              Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                    image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: NetworkImage(
                          driverPhoto,
                        ),
                    )
                ),
              ),
          
              const SizedBox(height: 16,),
          
              //driver's name
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 4),
                child: TextField(
                  controller: nameTextEditingController,
                  textAlign: TextAlign.center,
                  enabled: false,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white24,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.white,
                    )
                  ),
                ),
              ),
          
              //driver's phone
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 4),
                child: TextField(
                  controller: phoneTextEditingController,
                  textAlign: TextAlign.center,
                  enabled: false,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white24,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Colors.white,
                      )
                  ),
                ),
              ),
          
              //driver's email
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 4),
                child: TextField(
                  controller: emailTextEditingController,
                  textAlign: TextAlign.center,
                  enabled: false,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white24,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.white,
                      )
                  ),
                ),
              ),
          
              //driver's car info
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 4),
                child: TextField(
                  controller: carTextEditingController,
                  textAlign: TextAlign.center,
                  enabled: false,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white24,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.drive_eta_rounded,
                        color: Colors.white,
                      )
                  ),
                ),
              ),
          
              const SizedBox(height: 12,),
          
              //log out button
              ElevatedButton(
                onPressed: ()
                {
                  FirebaseAuth.instance.signOut();
                  Navigator.push(context, MaterialPageRoute(builder: (c)=> LoginScreen()));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 18)
                ),
                child: const Text(
                    "Logout"
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:ems/view/Profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Profile_update extends StatefulWidget{
  const Profile_update({super.key, required String title});

  @override
  State<Profile_update> createState() => _Profile_updateState();
}

class _Profile_updateState extends State<Profile_update>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, // Set the color for the hamburger icon
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 95.0, bottom: 0.0),
          child: SizedBox(
            child: Image.asset('assets/LOGO/EA_white.png'),
            height: 60.0,
            width: 60.0,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 14, 78, 143),
      ),

      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100), 
                      child: const Image(image: AssetImage('assets/images/onboarding_images/Scalability_and_Flexibility.png')),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0, 
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100), 
                        color: Colors.blue.withOpacity(0.4),
                      ),
                      child: const Icon(
                        LineAwesomeIcons.camera_solid,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  )
                ],
              ),

              const SizedBox(
                height: 50,
              ),
              Form(child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
                      prefixIconColor: Colors.black,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      floatingLabelStyle: const TextStyle(color: Colors.red),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: BorderSide(width: 2, color: Colors.red),
                      ),
                      hintText: "FullName",
                      fillColor: Colors.blue,
                      prefixIcon: const Icon(Icons.person_outline_rounded), 
                    ),
                  ),

                  const SizedBox(height: 20.0,),

                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
                      prefixIconColor: Colors.black,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      floatingLabelStyle: const TextStyle(color: Colors.red),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: BorderSide(width: 2, color: Colors.red),
                      ),
                      hintText: "FullName",
                      fillColor: Colors.blue,
                      prefixIcon: const Icon(Icons.person_outline_rounded), 
                    ),
                  ),

                  const SizedBox(height: 20.0,),

                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
                      prefixIconColor: Colors.black,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      floatingLabelStyle: const TextStyle(color: Colors.red),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: BorderSide(width: 2, color: Colors.red),
                      ),
                      hintText: "FullName",
                      fillColor: Colors.blue,
                      prefixIcon: const Icon(Icons.person_outline_rounded), 
                    ),
                  ),

                  const SizedBox(height: 20.0,),

                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
                      prefixIconColor: Colors.black,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      floatingLabelStyle: const TextStyle(color: Colors.red),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: BorderSide(width: 2, color: Colors.red),
                      ),
                      hintText: "FullName",
                      fillColor: Colors.blue,
                      prefixIcon: const Icon(Icons.person_outline_rounded), 
                    ),
                  ),

                  const SizedBox(height: 30.0,),

                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 241, 207, 207),
                        side: BorderSide.none,
                        shape: const StadiumBorder(),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Profile_screen(title: 'Update Profile Page')),
                        );
                      },
                      child: const Text('Edit Profile',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ],
              ))
            ],
          ),
        ),
      )
      
    );
  }
}
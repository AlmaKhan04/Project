import 'package:ems/view/Profile/profile_update.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Profile_screen extends StatefulWidget{
  const Profile_screen({super.key, required String title});

  @override
  State<Profile_screen> createState() => _Profile_screenState();
}

class _Profile_screenState extends State<Profile_screen>{

  var username = "Sam";

  @override
  Widget build(BuildContext context){
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
                    width: 120, height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100), child: const Image(image: AssetImage('assets/images/onboarding_images/Scalability_and_Flexibility.png')),
                    ),
                  ),
                  
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.blue.withOpacity(0.4),
                      ),
                      child: Icon(LineAwesomeIcons.pencil_alt_solid,  color: Colors.black,),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),

              Text(username,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text('Profile Subheading', 
                style:Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 20,
              ),
              
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
                      MaterialPageRoute(builder: (context) => Profile_update(title: 'Update Profile Page')),
                    );
                  },
                  child: const Text('Edit Profile',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30,),
              const Divider(),
              const SizedBox(height: 10,),
              ProfileMenuWidget(
                title: "Setting",
                icon: LineAwesomeIcons.cog_solid,
                endIcon: false,
                onPressed: (){},
              ),

              ProfileMenuWidget(
                title: "Billing Details",
                icon: LineAwesomeIcons.wallet_solid,
                endIcon: false,
                onPressed: (){},
              ),

              const Divider(),
              ProfileMenuWidget(title: "Information", icon: LineAwesomeIcons.info_solid, onPressed: (){}),

              ProfileMenuWidget(
                title: "Logout",
                icon: LineAwesomeIcons.sign_out_alt_solid,
                textColor: Colors.red,
                endIcon: false,
                onPressed: (){},
              ),
            ],
          ),
        ),
      ),
      //bottomNavigationBar: Navigation_bar(title: 'Navigation'),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key,
    
    required this.title,
    required this.icon,
    required this.onPressed,
    this.endIcon = true,
    this.textColor,
  });

  final String title;
  final IconData icon;
  final VoidCallback onPressed;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {

    return ListTile(
      onTap: onPressed,
      leading: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.red.withOpacity(0.1),
        ),
        child: Icon(icon, color: Colors.black,),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium?.apply(color: textColor),
      ),
      trailing: endIcon? Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.blue.withOpacity(0.1),
        ),
        child: Icon(LineAwesomeIcons.angle_right_solid, size: 18.0, color: Colors.grey,),
      ) : null,
    );
  }
}
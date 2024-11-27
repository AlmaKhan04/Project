import 'package:ems/constants/styles.dart';
import 'package:ems/view/Signin_Singup/signup.dart';
import 'package:ems/view/Dashboard/dashboard.dart';
import 'package:ems/view/OLD_PAGES/Forget_Password/forget_password_mail.dart';
import 'package:ems/view/OLD_PAGES/Forget_Password/forget_password_phone.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class Test_signin extends StatefulWidget{
  const Test_signin({super.key, required String title});

  @override
  State<Test_signin> createState() => _Test_signinState();
}

class _Test_signinState extends State<Test_signin>{

bool _rememberMe = false;

  Widget _buildEmailTF(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, 
      children: <Widget>[
        Text(
          'Email', 
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Color.fromARGB(255, 105, 59, 105),
              fontFamily: 'OpenSans',  
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Color.fromARGB(255, 100, 100, 100),
              ),
              hintText: 'Enter your Email',
              hintStyle: kHintTextStyle,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildPasswordTF(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, 
      children: <Widget>[
        Text(
          'Password', 
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            obscureText: true,
            style: TextStyle(
              color: Color.fromARGB(255, 100, 100, 100), 
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Color.fromARGB(255, 100, 100, 100),
              ),
              hintText: 'Enter your Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildForgetPasswordBtn(){
    return Container(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 0.0),
        child: TextButton(
          onPressed: () {
            showModalBottomSheet(
              context: context, 
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              builder: (context) => Container(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Make Selection!", style: TextStyle(fontSize: 30.0)), 
                    Text("Select one of the options given below \nto reset your password.", style: TextStyle(fontSize: 15.0),textAlign: TextAlign.center,),
                    const SizedBox(height: 30.0,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Forget_password_mail(title: 'Profile Setup Page',)),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey.shade200,
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.mail_outline_rounded, size: 50,),
                            const SizedBox(width: 10.0),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("E-Mail",style: TextStyle(fontSize: 20.0)),
                                  Text("Reset via E-mail Verification.", style: TextStyle(fontSize: 15.0)),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Forget_password_phone(title: 'Profile Setup Page')),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey.shade200,
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.mobile_friendly_rounded, size: 50,),
                            const SizedBox(width: 10.0),
                            Padding(
                              padding: const EdgeInsets.only(left:8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Phone",style: TextStyle(fontSize: 20.0)),
                                  Text("Reset via Phone Verification.", style: TextStyle(fontSize: 15.0)),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          child: Text(
              'Forgot Password',
              style: kLabelStyle,
          ),
        ),
      ),
    );
  }

  Widget _buildRememberMeCheckbox(){
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe, 
              checkColor: Colors.green, 
              activeColor: Colors.white,
              onChanged: (value){
                setState(() {
                  _rememberMe = value!;
                });
              },
            ),
          ),
          Text(
            'Remember me', 
            style: kLabelStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 169, 135, 168), 
              Color.fromARGB(255, 121, 68, 121)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 5),
              blurRadius: 10.0,
            ),
          ],
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            padding: EdgeInsets.all(15.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Dashboard(title: 'Profile Setup Page')),
            );
          },
          child: Text(
            'LOGIN',
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 1.5,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
        ),  
      ),
    );
  }

  Widget _buildSignupBtn(){
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Signup(title: 'Sign Up',)),
        );
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Dont have an Account?',
              style: TextStyle(
                color: Color.fromARGB(255, 85, 85, 85),
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
                    
            TextSpan(
              text: ' SignUp',
              style: TextStyle(
                color: Color.fromARGB(255, 139, 83, 139),
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
      

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                color: Color.fromARGB(255, 254, 250, 255),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 70.0,
                  ),
          
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Sign In',
                        style: TextStyle(
                          color: Color.fromARGB(255, 85, 85, 85), 
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          'Welcome, Please Sign in and continue \nyour journey with us',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 100, 100, 100),
                            fontFamily: 'OpenSans',
                            fontSize: 15.0,
                          ),
                        ),
                      ),
          
                      SizedBox(height: 40.0),
                      _buildEmailTF(),
                      SizedBox(
                        height: 30.0
                      ),
          
                      _buildPasswordTF(),
          
                      _buildForgetPasswordBtn(),
          
                      _buildRememberMeCheckbox(),
                      
                      _buildLoginBtn(),
          
                      _buildSignupBtn(),    
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
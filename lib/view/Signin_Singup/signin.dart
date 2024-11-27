import 'package:ems/constants/styles.dart';
import 'package:ems/view/Dashboard/dashboard.dart';
import 'package:ems/view/OLD_PAGES/Forget_Password/forget_password.dart';
import 'package:ems/view/Signin_Singup/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class Signin extends StatefulWidget{
  
  const Signin({super.key, required String title});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin>{

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
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ForgetPassword(title: 'Home')),
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
                    vertical: 80.0,
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

                      SizedBox(height: 30.0),
                      _buildPasswordTF(),
          
                      _buildForgetPasswordBtn(),
                      
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
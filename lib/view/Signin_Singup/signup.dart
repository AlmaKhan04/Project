import 'package:ems/constants/styles.dart';
import 'package:ems/view/Profile/profile_setup.dart';
import 'package:ems/view/Signin_Singup/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Signup extends StatefulWidget {
  final String title;

  const Signup({super.key, required this.title});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  String? _contactError;
  String? _emailError;
  String? _passwordError;
  String? _confirmPasswordError;

  Widget _buildNameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Full Name',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            keyboardType: TextInputType.name,
            style: kInputLabelStyle,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.person,
                color: Color.fromARGB(255, 100, 100, 100),
              ),
              hintText: 'Enter your Name',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContactTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Mobile Number',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          decoration: kBoxDecorationStyle,
          child: TextFormField(
            keyboardType: TextInputType.phone,
            style: TextStyle(
              color: Color.fromARGB(255, 100, 100, 100),
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.phone,
                color: Color.fromARGB(255, 100, 100, 100),
              ),
              hintText: 'Enter your Mobile Number',
              hintStyle: kHintTextStyle,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                setState(() {
                  _contactError = 'Please enter your mobile number';
                });
                return '';
              }
              return null;
            },
          ),
        ),
        if (_contactError != null) ...[
          SizedBox(height: 5.0),
          Text(
            _contactError!,
            style: TextStyle(color: Colors.red),
          ),
        ],
      ],
    );
  }

  Widget _buildEmailTF() {
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
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Color.fromARGB(255, 100, 100, 100),
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
            validator: (value) {
              if (value == null || value.isEmpty) {
                setState(() {
                  _emailError = 'Please enter your email';
                });
                return '';
              }
              return null;
            },
          ),
        ),
        if (_emailError != null) ...[
          SizedBox(height: 5.0),
          Text(
            _emailError!,
            style: TextStyle(color: Colors.red),
          ),
        ],
      ],
    );
  }

  Widget _buildPasswordTF() {
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
          child: TextFormField(
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
            validator: (value) {
              if (value == null || value.isEmpty) {
                setState(() {
                  _passwordError = 'Please enter your password';
                });
                return '';
              }
              return null;
            },
          ),
        ),
        if (_passwordError != null) ...[
          SizedBox(height: 5.0),
          Text(
            _passwordError!,
            style: TextStyle(color: Colors.red),
          ),
        ],
      ],
    );
  }

  Widget _buildConfirmPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Confirm Password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            obscureText: true,
            style: TextStyle(
              color: Color.fromARGB(255, 100, 100, 100),
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.key,
                color: Color.fromARGB(255, 100, 100, 100),
              ),
              hintText: 'Confirm Password',
              hintStyle: kHintTextStyle,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                setState(() {
                  _confirmPasswordError = 'Please confirm your password';
                });
                return '';
              }
              return null;
            },
          ),
        ),
        if (_confirmPasswordError != null) ...[
          SizedBox(height: 5.0),
          Text(
            _confirmPasswordError!,
            style: TextStyle(color: Colors.red),
          ),
        ],
      ],
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
          setState(() {
            _contactError = null;
            _emailError = null;
            _passwordError = null;
            _confirmPasswordError = null;
          });

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Profile_setup(title: 'Profile Setup Page')),
          );
        },
        child: Text(
          'Next',
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

  Widget _buildSignupBtn() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Signin(title: 'Sign In')),
        );
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Already have an Account?',
              style: TextStyle(
                color: Color.fromARGB(255, 100, 100, 100),
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: ' SignIn',
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
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Sign Up',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22.0,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 150, 93, 150),
      ),

      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
              color:Color.fromARGB(255, 254, 250, 255),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 40.0,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Sign Up',
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
                            'Welcome, Sign up to manage your events',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(255, 100, 100, 100),
                              fontFamily: 'OpenSans',
                              fontSize: 15.0,
                            ),
                          ),
                        ),

                        SizedBox(height: 40.0),
                        _buildNameTF(),
                        SizedBox(height: 15.0),
                        _buildContactTF(),
                        SizedBox(height: 15.0),
                        _buildEmailTF(),
                        SizedBox(height: 15.0),
                        _buildPasswordTF(),
                        SizedBox(height: 15.0),
                        _buildConfirmPasswordTF(),
                        SizedBox(height: 15.0),
                        _buildLoginBtn(),
                        _buildSignupBtn(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

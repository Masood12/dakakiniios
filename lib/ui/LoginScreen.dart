//import 'package:camera/camera.dart';
import 'package:dakakini/ui/SignUpScreen.dart';
import 'package:dakakini/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passwordVisible = false;
  bool checkBoxValue = false;
  FocusNode fullNameFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height / 15;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 22.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                  width: 250,
                  height: 300,
                  child: Image.asset('assets/logo.png')),
              emailTextFormFeild(),
              SizedBox(
                height: 5,
              ),
              passwordTextFormFeild(),
              SizedBox(
                height: 25,
              ),
              signInWidget(),
              SizedBox(
                height: 15,
              ),
              Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    agreeText(),
                    Spacer(
                      flex: 1,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: new Text("Forget Your Password?",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w600)),
                    )
                  ]),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                          child: Container(
                        height: 1,
                        color: Colors.grey,
                      )),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Text(
                          '0R',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Expanded(
                          child: Container(
                        height: 1,
                        color: Colors.grey,
                      )),
                    ]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset(
                    "assets/facebook.svg",
                    height: 36,
                    width: 36,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  SvgPicture.asset(
                    "assets/google.svg",
                    height: 36,
                    width: 36,
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Don't Have an account?",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 12.0, color: Colors.black)),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => SignUp()));
                    },
                    child: Text("SIGN UP",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 14.0,
                            color: colorMain,
                            fontWeight: FontWeight.w600)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

//
  signInWidget() {
    return Container(
      padding: EdgeInsets.all(0.0),
      height: height40,
      child: RaisedButton(
        padding: EdgeInsets.all(0),
        onPressed: () {},
        // onPressed: store.validateEmailAndPassword() ? null : callSignInApi,
        color: colorMain,
        disabledColor: disabledButtonColor,
        textColor: Colors.white,
        disabledTextColor: Colors.white,
        child: Stack(
          // mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Text(
                ' SIGN IN',
                style: TextStyle(
                    fontSize: buttonFontSize, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
      ),
    );
  }

  emailTextFormFeild() {
    return TextFormField(
        focusNode: emailFocus,
        // onChanged: (value) => store.password = value,
        decoration: InputDecoration(
          hintText: 'Email',
          hintStyle: TextStyle(fontSize: 12, color: Colors.black),
          // errorText: store.error.password,
          prefixIcon: Container(
            margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
            child: Icon(
              Icons.email,
              size: prefixIconSize,
              color: Colors.black54,
            ),
          ),
          labelStyle:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
        ));
  }

  passwordTextFormFeild() {
    return TextFormField(
      obscureText: !passwordVisible,
      focusNode: passwordFocus,
      // onChanged: (value) => store.password = value,
      decoration: InputDecoration(
          hintText: 'Password',
          hintStyle: TextStyle(fontSize: 12, color: Colors.black),
          // errorText: store.error.password,
          suffixIcon: IconButton(
            icon: Icon(
                // Based on passwordVisible state choose the icon
                passwordVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.black54),
            onPressed: () {
              setState(() {
                passwordVisible = !passwordVisible;
              });
            },
          ),
          prefixIcon: Container(
            margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
            child: Icon(
              Icons.lock,
              size: prefixIconSize,
              color: Colors.black54,
            ),
          ),
          labelStyle:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          border: new UnderlineInputBorder(
              borderSide: new BorderSide(color: Colors.black))),
    );
  }

  codeTextFormFeild() {
    return TextFormField(
      // onChanged: (value) => store.password = value,
      decoration: InputDecoration(
          hintText: 'Code if you have',
          hintStyle: TextStyle(fontSize: 12, color: Colors.black),
          // errorText: store.error.password,
          prefixIcon: Container(
            margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
            child: Icon(
              Icons.email,
              size: prefixIconSize,
              color: Colors.black54,
            ),
          ),
          labelStyle:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          border: new UnderlineInputBorder(
              borderSide: new BorderSide(color: Colors.black))),
    );
  }

  agreeText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        checkBox(),
        SizedBox(
          width: 3,
        ),
        Text(
          'Remember Me',
          style: TextStyle(
              color: Colors.black, fontSize: 12, fontWeight: FontWeight.w600),
        )
      ],
    );
  }

  checkBox() {
    return SizedBox(
      height: 24,
      width: 24,
      child: Checkbox(
        activeColor: colorMain,
        value: checkBoxValue,
        onChanged: (bool value) {
          setState(() {
            checkBoxValue = value;
          });
        },
      ),
    );
  }
}

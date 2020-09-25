import 'package:dakakini/store/sign_up_store.dart';
import 'package:dakakini/ui/LoginScreen.dart';
import 'package:dakakini/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final store = SignUpStore();
  bool passwordVisible = false;
  bool checkBoxValue = false;
  FocusNode fullNameFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  var dropDownValue = "Select Shop Type";
  var dropDownValueID = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(width: 250, child: Image.asset('assets/logo.png')),
              fullNameTextFormFeild(),
              emailTextFormFeild(),
              passwordTextFormFeild(),
              shopType(),
              codeTextFormFeild(),
              agreeText(),
              singUpBotton(),
              alreadyHaveAnAccount()
            ],
          ),
        ),
      ),
    );
  }

//
  fullNameTextFormFeild() {
    return TextFormField(
      focusNode: fullNameFocus,
      textInputAction: TextInputAction.next,
      onChanged: (value) => store.fullName = value,
      decoration: InputDecoration(
        hintText: 'Full Name',
        hintStyle: TextStyle(fontSize: 12, color: Colors.black),
        // errorText: store.error.password,
        prefixIcon: Container(
          margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
          child: Icon(
            Icons.person,
            size: prefixIconSize,
            color: Colors.black54,
          ),
        ),
        labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: underLineColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: underLineColor),
        ),
      ),
    );
  }

  emailTextFormFeild() {
    return TextFormField(
      focusNode: emailFocus,
      textInputAction: TextInputAction.next,
      onChanged: (value) => store.email = value,
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
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: underLineColor),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: underLineColor),
          )),
    );
  }

  passwordTextFormFeild() {
    return TextFormField(
      obscureText: !passwordVisible,
      textInputAction: TextInputAction.next,
      focusNode: passwordFocus,
      onChanged: (value) => store.password = value,
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
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: underLineColor),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: underLineColor),
          )),
    );
  }

  shopType() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(),
          child: new DropdownButton<String>(
            value: dropDownValue,
            icon: Icon(Icons.keyboard_arrow_down),
            underline: Container(
              height: 0,
              width: 0,
            ),
            items: <String>[
              'Select Shop Type',
              'VIP shop',
              'Gold Shop',
              'Silver Shop',
              'Free Shop',
              'User'
            ].map((String value) {
              return new DropdownMenuItem<String>(
                value: value,
                child: Container(width: 200, child: new Text(value)),
                onTap: () {
                  setState(() {
                    dropDownValue = value;
                    if (dropDownValue == "VIP shop") {
                      dropDownValueID = "1003";
                    } else if (dropDownValue == "Gold Shop") {
                      dropDownValueID = "1002";
                    } else if (dropDownValue == "Silver Shop") {
                      dropDownValueID = "1006";
                    } else if (dropDownValue == "Free Shop") {
                      dropDownValueID = "1007";
                    } else if (dropDownValue == "User") {
                      dropDownValueID = "1005";
                    }
                    store.userType = dropDownValueID;
                  });
                },
              );
            }).toList(),
            onChanged: (_) {},
          ),
        ),
        Container(
          height: 1,
          width: MediaQuery.of(context).size.width,
          color: underLineColor,
        )
      ],
    );
  }

  codeTextFormFeild() {
    return TextFormField(
      onChanged: (value) => store.refNo = value,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          hintText: 'Code if you have',
          hintStyle: TextStyle(fontSize: 12, color: Colors.black),
          // errorText: store.error.password,
          prefixIcon: Container(
            margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
            child: Icon(
              Icons.code,
              size: prefixIconSize,
              color: Colors.black54,
            ),
          ),
          labelStyle:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: underLineColor),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: underLineColor),
          )),
    );
  }

  agreeText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        checkBox(),
        Text(
          'I accept all terms and conditions',
          style: TextStyle(color: Colors.black54),
        )
      ],
    );
  }

  checkBox() {
    return Checkbox(
      activeColor: colorMain,
      value: checkBoxValue,
      onChanged: (bool value) {
        setState(() {
          checkBoxValue = value;
        });
      },
    );
  }

  singUpBotton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: RaisedButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
          color: colorMain,
          textColor: Colors.white,
          child: Text("Sign Up"),
          onPressed: () {
            store.signUp(context);
          }),
    );
  }

  alreadyHaveAnAccount() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Already have an Account',
            style: TextStyle(color: Colors.black54),
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => LoginScreen()));
            },
            child: Text(
              'Sign In',
              style: TextStyle(color: colorMain),
            ),
          )
        ],
      ),
    );
  }
}

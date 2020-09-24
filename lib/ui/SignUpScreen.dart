import 'package:dakakini/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool passwordVisible = false;
  bool checkBoxValue = false;
  FocusNode fullNameFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
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
              Text(
                "SIGN UP",
                style: TextStyle(fontSize: 20.0, color: Colors.grey),
              ),
              SizedBox(
                height: 25,
              ),
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
      // onChanged: (value) => store.password = value,
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
          borderSide: BorderSide(color: colorMain),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: colorMain),
        ),
      ),
    );
  }

  emailTextFormFeild() {
    return TextFormField(
      focusNode: emailFocus,
      textInputAction: TextInputAction.next,
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
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: colorMain),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: colorMain),
          )),
    );
  }

  passwordTextFormFeild() {
    return TextFormField(
      obscureText: !passwordVisible,
      textInputAction: TextInputAction.next,
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
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: colorMain),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: colorMain),
          )),
    );
  }

  shopType() {
    return Container(
      padding: EdgeInsets.symmetric(),
      width: MediaQuery.of(context).size.width,
      child: new DropdownButton<String>(
        items: <String>['A', 'B', 'C', 'D'].map((String value) {
          return new DropdownMenuItem<String>(
            value: value,
            child: Container(
                width: MediaQuery.of(context).size.width - 65, //200.0 to 100.0
                child: new Text(value)),
          );
        }).toList(),
        onChanged: (_) {},
      ),
    );
  }

  codeTextFormFeild() {
    return TextFormField(
      // onChanged: (value) => store.password = value,
      textInputAction: TextInputAction.done,
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
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: colorMain),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: colorMain),
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
          onPressed: () {}),
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
          Text(
            'Sign In',
            style: TextStyle(color: colorMain),
          )
        ],
      ),
    );
  }
}

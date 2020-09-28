import 'package:dakakini/store/sign_up_store.dart';
import 'package:dakakini/ui/LoginScreen.dart';
import 'package:dakakini/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {

  bool passwordVisible = false;
  bool cnfrmpasswordVisible = false;

  bool checkBoxValue = false;

  FocusNode fullNameFocus = FocusNode();
  FocusNode confrmPasswordFocous = FocusNode();
  FocusNode passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(width: 250, child: Image.asset('assets/logo.png')),
                UIHelper.verticalSpace(10),
                Text('Please enter old password and add a new password in order to change app password.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black,fontSize: 12),
                ),
                passwordTextFormFeild(),
                UIHelper.verticalSpace(10),

                confirmpasswordTextFormFeild(),
                UIHelper.verticalSpace(20),

                singUpBotton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

//


  passwordTextFormFeild() {
    return TextFormField(
      obscureText: !passwordVisible,
      focusNode: passwordFocus,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      //onChanged: (value) => store.password = value,
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
  confirmpasswordTextFormFeild() {
    return TextFormField(
      obscureText: !passwordVisible,
      focusNode: confrmPasswordFocous,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      //onChanged: (value) => store.password = value,
      decoration: InputDecoration(
          hintText: 'Confirm Password',
          hintStyle: TextStyle(fontSize: 12, color: Colors.black),
          // errorText: store.error.password,
          suffixIcon: IconButton(
            icon: Icon(
              // Based on passwordVisible state choose the icon
                cnfrmpasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.black54),
            onPressed: () {
              setState(() {
                cnfrmpasswordVisible = !cnfrmpasswordVisible;
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







  singUpBotton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: RaisedButton(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
          color: colorMain,
          textColor: Colors.white,
          child: Text("CHANGE PASSWORD"),
          onPressed: () {
            //store.validate(context);
          }),
    );
  }

}

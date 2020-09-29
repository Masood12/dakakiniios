
import 'package:dakakini/store/forget_password_store.dart';
import 'package:dakakini/store/sign_up_store.dart';
import 'package:dakakini/ui/LoginScreen.dart';
import 'package:dakakini/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ForgetPasswordScreen extends StatefulWidget {
  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  FocusNode emailFocus = FocusNode();
    ForgetPasswordStore store = ForgetPasswordStore();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorMain,
        title: Text('Forget Password',style: TextStyle(
          color: Colors.white
        ),),
        leading: GestureDetector(
            onTap:(){
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back,color: Colors.white,)),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(width: 250, child: Image.asset('assets/logo.png')),
                Text(
                  'FORGET PASSWORD?',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                UIHelper.verticalSpace(20),
                Text(
                  'We just need your registered Email id to sent you password reset Instructions',
                  textAlign: TextAlign.center,
                  style: TextStyle( fontSize: 12),
                ),
                UIHelper.verticalSpace(10),

                emailTextField(),
                UIHelper.verticalSpace(25),
                forgetPassworBtn(),
              ],
            ),
          ),
        ),
      ),
    );
  }

//

  emailTextField() {
    return TextFormField(
      focusNode: emailFocus,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      style: TextStyle(fontSize: 12),
      onChanged: (value) => store.email = value,
      decoration: InputDecoration(
          hintText: 'Email Address',
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

  forgetPassworBtn() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: RaisedButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
          color: colorMain,
          textColor: Colors.white,
          child: Text("FORGET PASSWORD"),
          onPressed: () {
            store.validate(context);
          }),
    );
  }
}

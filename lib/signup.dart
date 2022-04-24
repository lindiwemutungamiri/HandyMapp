import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'serviceauth/auth.dart';
import 'signin.dart';

class SignUp extends StatelessWidget {
  GlobalKey<FormState> _formKey = GlobalKey();

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNo = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Sign Up'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 100.0,
                child: SvgPicture.asset(
                  "images/icons/signUp.svg",
                  height: size.height * 0.45,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    hintText: "Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0))),
                controller: name,
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    hintText: "Email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0))),
                controller: email,
              ),
              const SizedBox(
                height: 10,
              ),
              IntlPhoneField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    hintText: "Phone Number",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0))),
                onCountryChanged: (country) {
                  print('Country changed to: ' + country.name);
                },
                controller: phoneNo,
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    hintText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0))),
                controller: password,
                obscureText: true,
              ),
              const SizedBox(
                height: 10,
              ),

              const Text(
                "By proceeding, you consent to get calls, WhatsApp,\nSMS messages or email, including automated means,\nfrom HandyMapp.",
                style: TextStyle(fontStyle: FontStyle.italic),
              ),

              SizedBox(height: 16), //<----

              ElevatedButton(
                onPressed: () {
                  _formKey.currentState!.validate();
                  signUp(
                          name: name.text,
                          email: email.text,
                          phoneNo: phoneNo.text,
                          password: password.text)
                      .then((value) {
                    if (value != null) {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => SignIn()));
                    }
                  });
                },
                child: const Text('Sign Up'),
                style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    primary: Colors.purple,
                    padding: EdgeInsets.symmetric(horizontal: 67, vertical: 10),
                    textStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

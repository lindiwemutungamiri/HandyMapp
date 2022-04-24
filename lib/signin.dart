import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'serviceauth/auth.dart';
import 'servicesmain.dart';
import 'signup.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  GlobalKey<FormState> _formKey = GlobalKey();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Sign In'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(60.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //const SizedBox(height: 30),
              SizedBox(
                height: 100.0,
                child: SvgPicture.asset(
                  "images/icons/loginicon.svg",
                  height: size.height * 0.45,
                ),
              ),
              const SizedBox(
                height: 50,
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
              const SizedBox(
                height: 10,
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
                height: 40,
              ),

              ElevatedButton(
                onPressed: () {
                  _formKey.currentState!.validate();
                  signIn(email: email.text, password: password.text)
                      .then((value) {
                    if (value != null) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MyHomePage()));
                    }
                  });
                },
                child: const Text('Login'),
                style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    primary: Colors.purple,
                    padding: EdgeInsets.symmetric(horizontal: 67, vertical: 10),
                    textStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),

              SizedBox(height: 16), //<----
              const Text(
                "Don't have an account?",
                style: TextStyle(fontStyle: FontStyle.italic),
              ),

              SizedBox(height: 6),

              ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => SignUp()));
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

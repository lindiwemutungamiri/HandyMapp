import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import 'worker.dart';

class ServiceProfile extends StatefulWidget {
  final Worker worker;

  const ServiceProfile({Key? key, required this.worker}) : super(key: key);

  @override
  _ServiceProfileState createState() => _ServiceProfileState();
}

class _ServiceProfileState extends State<ServiceProfile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(' '),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 100.0,
              child: Image.asset(
                "images/plumberCarpenter.png",
                height: size.height * 0.45,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('images/hmlogo2.jpg'),
            ),
            Text(
              widget.worker.name,
              style: const TextStyle(
                fontFamily: 'Lobster',
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(widget.worker.phoneNumber,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                _callNumber();
              },
              child: Text("Call"),
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
    );
  }

  _callNumber() async {
    String number = widget.worker.phoneNumber; //set the number here
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }
}

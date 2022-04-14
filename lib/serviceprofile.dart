import 'package:flutter/material.dart';
import 'package:flutter_handymappisioma/worker.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class ServiceProfile extends StatefulWidget {
  final Worker worker;

  const ServiceProfile({Key? key, required this.worker}) : super(key: key);

  @override
  _ServiceProfileState createState() => _ServiceProfileState();
}

class _ServiceProfileState extends State<ServiceProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' '),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('images/1761201.jpg'),
            ),
            // const Text(
            //   'Isioma Ekejiuba',
            //   style: TextStyle(
            //     fontFamily: 'Lobster',
            //     fontSize: 30.0,
            //     fontWeight: FontWeight.bold,
            //     color: Colors.black,
            //   ),
            // ),
            Text(
              widget.worker.name,
              style: TextStyle(
                fontFamily: 'Lobster',
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(widget.worker.phoneNumber,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            ElevatedButton(
                onPressed: () {
                  _callNumber();
                },
                child: Text("Call")),
            // const Text('isiomaekejiuba@yahoo.com',
            //     style: TextStyle(
            //         fontSize: 20,
            //         fontWeight: FontWeight.bold,
            //         color: Colors.black))
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

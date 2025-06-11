import 'package:flutter/material.dart';

class MessageDisplayWidget extends StatelessWidget {
  final String message;
  const MessageDisplayWidget({super.key, required this.message,});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: Center(
          child: Column(
            spacing: 20,
            children: [
              Icon(Icons.signal_wifi_statusbar_connected_no_internet_4,size: 40,color: Colors.red,),
             Text(message, style: TextStyle(fontSize: 20), textAlign: TextAlign.center),

            ],
          )),
    );
  }
}
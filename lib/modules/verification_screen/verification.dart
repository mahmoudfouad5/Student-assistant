
import 'package:flutter/material.dart';

class VerificationScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Center(
              child:Column(
                children: [
                  Icon(
                    Icons.verified_user_rounded,
                    size: 80,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Pleas Check Your InBox Mail")
                ],
              )
              
            )
          ],
        ),
      ),
    );
  }
}

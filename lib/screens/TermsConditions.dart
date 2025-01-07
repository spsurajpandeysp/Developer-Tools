import 'package:flutter/material.dart';

class TermsConditions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Terms and Conditions')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text('Terms and Conditions details go here.'),
        ),
      ),
    );
  }
}

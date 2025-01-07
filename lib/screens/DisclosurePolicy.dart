import 'package:flutter/material.dart';

class DisclosurePolicy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Disclosure Policy')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text('Disclosure Policy details go here.'),
        ),
      ),
    );
  }
}

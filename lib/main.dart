import 'package:flutter/material.dart';

import './home.dart';

main() {
  runApp(GadakYentra());
}

class GadakYentra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Gadak Yentra'),
        centerTitle: true,
      ),
      body: Container(
        child: HomePage(),
      ),
    ));
  }
}

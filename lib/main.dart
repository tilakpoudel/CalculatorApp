import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import './home.dart';

main() {
  // debugPaintSizeEnabled = true;
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

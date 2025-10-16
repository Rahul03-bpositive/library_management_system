import 'package:flutter/material.dart';

class Portfolio extends StatelessWidget {
  const Portfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text("My Portfolio")),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(10.0),
          child: Divider(color: Color.fromARGB(17, 0, 0, 0), height: 0.1),
        ),
      ),
      backgroundColor: Color(0xfff5f5f5),
    );
  }
}

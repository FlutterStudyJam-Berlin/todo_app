import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  final String title;
  final Widget body;

  const Screen({
    @required this.title,
    @required this.body,
  })  : assert(title != null),
        assert(body != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: body,
    );
  }
}

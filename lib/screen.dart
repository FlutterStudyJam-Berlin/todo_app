import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  final String title;
  final Widget body;
  final FloatingActionButton floatingActionButton;

  const Screen({
    @required this.title,
    @required this.body,
    this.floatingActionButton,
  })  : assert(title != null),
        assert(body != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }
}

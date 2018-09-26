import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  final String title;
  final Widget body;
  final List<Widget> actions;
  final FloatingActionButton floatingActionButton;

  const Screen({
    @required this.title,
    @required this.body,
    this.actions,
    this.floatingActionButton,
  })  : assert(title != null),
        assert(body != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: actions,
      ),
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }
}

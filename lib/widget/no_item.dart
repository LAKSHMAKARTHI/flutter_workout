import 'package:flutter/material.dart';

class NoItem extends StatelessWidget {
  final String content;

  NoItem(this.content);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(this.content),
    );
  }
}

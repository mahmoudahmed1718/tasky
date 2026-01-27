import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Arrowbackwidget extends StatelessWidget {
  const Arrowbackwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(FontAwesomeIcons.arrowLeft, size: 18),
      onPressed: () => Navigator.pop(context),
    );
  }
}

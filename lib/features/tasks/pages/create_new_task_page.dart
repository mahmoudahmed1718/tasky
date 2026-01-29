import 'package:flutter/material.dart';
import 'package:tasky/core/utils/styels.dart';
import 'package:tasky/core/widgets/arrow_back_widget.dart';

class CreateNewTaskPage extends StatelessWidget {
  const CreateNewTaskPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Task', style: Styels.textStyle16),
        leading: Arrowbackwidget(),
      ),
    );
  }
}

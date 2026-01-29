import 'package:app_forms/app_forms.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tasky/core/extensions/context_extension.dart';
import 'package:tasky/core/utils/styels.dart';
import 'package:tasky/core/widgets/arrow_back_widget.dart';
import 'package:tasky/features/tasks/actions/pick_image_action.dart';
import 'package:tasky/theme/app_colors.dart';

class CreateNewTaskPage extends StatelessWidget {
  const CreateNewTaskPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Task', style: Styels.textStyle16),
        leading: Arrowbackwidget(),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            DottedBorder(
              child: InkWell(
                onTap: () async {
                  final image = await PickImageAction().pickImage(
                    ImageSource.gallery,
                  );

                  if (image != null) {
                    final String imagePath = image.path;
                    print("Selected Image Path: $imagePath");
                  }
                },

                child: Container(
                  height: 54, // Adjust based on your needs
                  width: context.width,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_photo_alternate_outlined,
                        color: AppColors.primaryColor,
                        size: 28,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Add Img",
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Gap(12),
            FormBuilder(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Task Title", style: Styels.textStyle14),
                  Gap(6),
                  FormBuilderTextField(
                    name: "task title",
                    onSaved: (newValue) {},
                    validator: FormBuilderValidators.required(
                      errorText: "Task title is required",
                    ),
                    decoration: InputDecoration(
                      hint: Text("Task title", style: Styels.textStyle14),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  Gap(14),
                  Text("Task Description", style: Styels.textStyle14),
                  Gap(6),
                  FormBuilderTextField(
                    name: "task title",
                    maxLines: 6,
                    onSaved: (newValue) {},
                    decoration: InputDecoration(
                      hint: Text(
                        "Enter Task Description",
                        style: Styels.textStyle14,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:daytask/dashboard/task_model.dart';
import 'package:daytask/dashboard/task_service.dart';
import 'package:daytask/utils/validators.dart';
import 'package:daytask/widgets/custom_button.dart';
import 'package:daytask/widgets/custom_datetimepicker.dart';
import 'package:daytask/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskBottomSheet extends StatefulWidget {
  final TaskService taskService;
  TaskBottomSheet({super.key, required this.taskService});

  @override
  State<TaskBottomSheet> createState() => _TaskBottomSheetState();
}

class _TaskBottomSheetState extends State<TaskBottomSheet> {
  final TextEditingController _taskTitleController = TextEditingController();

  final TextEditingController _taskDetailController = TextEditingController();

  final TextEditingController _taskTimeController = TextEditingController();

  final TextEditingController _taskDateController = TextEditingController();

  final GlobalKey<FormState> _btsht_key = GlobalKey<FormState>();

  @override
  void dispose() {
    _taskTimeController.dispose();
    _taskDateController.dispose();
    _taskDetailController.dispose();
    _taskTitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
        backgroundColor: Theme.of(context).colorScheme.onTertiary,
        onClosing: () {},
        builder: (context) {
          return SizedBox(
              height: 70,
              width: double.infinity,
              child: Center(
                child: CustomButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {
                          return Container(
                            height: 600,
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.all(20),
                            child: Form(
                              key: _btsht_key,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    'Task Title',
                                    style:
                                        Theme.of(context).textTheme.labelLarge,
                                  ),
                                  SizedBox(height: 14),
                                  CustomTextformfield(
                                      validator: isEmptyValidator,
                                      controller: _taskTitleController,
                                      hintText: "Enter the Task",
                                      obscureText: false),
                                  SizedBox(height: 26),
                                  Text(
                                    'Task Details',
                                    style:
                                        Theme.of(context).textTheme.labelLarge,
                                  ),
                                  SizedBox(height: 14),
                                  CustomTextformfield(
                                      validator: isEmptyValidator,
                                      controller: _taskDetailController,
                                      hintText: "Enter the Description",
                                      mline: 3,
                                      obscureText: false),
                                  SizedBox(height: 26),
                                  Text(
                                    'Time & Date',
                                    style:
                                        Theme.of(context).textTheme.labelLarge,
                                  ),
                                  SizedBox(height: 14),
                                  Row(
                                    children: [
                                      CustomDatetimepicker(
                                        validator: isEmptyValidator,
                                        controller: _taskDateController,
                                        isDate: true,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      CustomDatetimepicker(
                                        validator: isEmptyValidator,
                                        controller: _taskTimeController,
                                        isDate: false,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 36),
                                  CustomButton(
                                      outlined: false,
                                      onPressed: () {
                                        if (_btsht_key.currentState != null) {
                                          if (_btsht_key.currentState!
                                              .validate()) {

                                            try {
                                              widget.taskService.insertTaskToSupabase(
                                                  Task.fromJson({
                                                'id': 0,
                                                'title':
                                                    _taskTitleController.text,
                                                'date':
                                                    _taskDateController.text,
                                                'time':
                                                    _taskTimeController.text,
                                                'description':
                                                    _taskDetailController.text,
                                                'status': false
                                              }));

                                              _taskTitleController.clear();
                                              _taskDetailController.clear();
                                              _taskTimeController.clear();
                                              _taskDateController.clear();

                                              Navigator.of(context).pop();
                                            } catch (e) {
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                  SnackBar(content: Text('Error creating task: $e')));
                                            }
                                          }
                                        }
                                      },
                                      text: 'Create'),
                                  SizedBox(height: 26),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  text: 'Add Task',
                  outlined: false,
                ),
              ));
        });
  }
}

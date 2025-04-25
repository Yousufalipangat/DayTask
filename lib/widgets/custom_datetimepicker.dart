import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDatetimepicker extends StatelessWidget {
  final TextEditingController controller;
  final IconData? icon;
  final bool isDate;
  final String? Function(String?) validator;

  const CustomDatetimepicker(

      {super.key, required this.controller, this.icon, required this.isDate, required this.validator});

  @override
  Widget build(BuildContext context) {
    final _focusNode = FocusNode();

    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: Container(
              height: 56,
              decoration: BoxDecoration(

                  color: Theme.of(context).colorScheme.secondary,
                  shape: BoxShape.rectangle,
                  border: Border.all(width: 0),
                  borderRadius: BorderRadius.horizontal(left: Radius.circular(3),right: Radius.zero)),
              child: isDate
                  ? Icon(
                      Icons.calendar_month,
                      size: 32,
                      color: Theme.of(context).colorScheme.onSecondary,
                    )
                  : Icon(Icons.timer,
                      color: Theme.of(context).colorScheme.onSecondary),
            ),
          ),
          Expanded(
            flex: 10,
            child: TextFormField(
              validator: validator,
              onTap: () async {
                _focusNode.unfocus();
                if(isDate){
                final DateTime? dt = await showDatePicker(
                    context: context,
                    firstDate: DateTime(1900),
                    lastDate: DateTime(9999));
                if (dt != null) {
                  controller.text = DateFormat('yyyy-MM-dd').format(dt);
                }}else {

                  final TimeOfDay? tim = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay(hour: 10, minute: 10));


                  if (tim!=null) {
                    controller.text =

                    '${tim.hour}:${tim.minute}';
                  }

                      }
              },
              focusNode: _focusNode,
              controller: controller,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: Colors.white,
                  ),
              // maxLines: 1,
              decoration: InputDecoration(
                hintStyle: TextStyle(
                  color: Theme.of(context).hintColor,
                ),
                hintText: isDate?
                DateFormat('yyyy-MM-dd').format(DateTime.now()):
                '${TimeOfDay.now().hour.toString().padLeft(2,"0")}:${TimeOfDay.now().minute.toString().padRight(2,"0")}'
                ,
                filled: true,
                fillColor: Color.fromARGB(255, 68, 92, 100),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.zero, right: Radius.circular(3)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.zero, right: Radius.circular(3)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:daytask/auth/auth_service.dart';
import 'package:daytask/dashboard/task_model.dart';
import 'package:daytask/dashboard/task_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key});

  @override
  Widget build(BuildContext context) {
    final task = Provider.of<Task>(context);
    final service = Provider.of<TaskService>(context, listen: false);
    final index = service.taskList.indexOf(task);

    return Dismissible(
      onDismissed: (dismissDirection){

        service.deleteTaskFromSupabase(task.id);
        },
      key: UniqueKey(),
      child: ExpansionTile(
        // expandedAlignment: Alignment.topLeft,
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
      
        title: Text(
          task.title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      
        trailing: Container(
            height: 40,
            width: 40,
            color: Theme.of(context).colorScheme.secondary,
            child: IconButton(
              onPressed: () {
                service.changeTaskStatus(
                    task.copyWith(status: !task.status), index);
              },
              icon: task.status
                  ? Icon(
                      Icons.check_circle_outlined,
                      color: Theme.of(context).colorScheme.onSecondary,
                    )
                  : Icon(
                      Icons.circle_outlined,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
            )),
        children: [
      
      
          Text('Title:'),
          SizedBox(height: 5,),
          Row(children: [
            SizedBox(
              width: 50,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  shape: BoxShape.rectangle,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                child: Text(task.title),
              ),
            )
          ]),
          SizedBox(height: 5,),
          Text('Description:'),
          SizedBox(height: 5,),
          Row(children: [
            SizedBox(
              width: 50,
            ),
            Expanded(
              child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    shape: BoxShape.rectangle,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                  child: Text(task.description)),
            )
          ]),
          SizedBox(height: 5,),
          Text('Date:'),
          SizedBox(height: 5,),
          Row(children: [
            SizedBox(
              width: 50,
            ),
            Expanded(
              child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    shape: BoxShape.rectangle,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                  child: Text(DateFormat('yyyy-MM-dd').format(task.date))),
            )
          ]),
          SizedBox(height: 5,),
          Text('Time'),
          SizedBox(height: 5,),
          Row(children: [
            SizedBox(
              width: 50,
            ),
            Expanded(
              child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    shape: BoxShape.rectangle,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                  child: Text('${task.time.hour>12?(task.time.hour-12).toString().padLeft(2,"0"):task.time.hour.toString().padLeft(2,"0")}:${task.time.minute.toString().padRight(2,"0")} ${task.time.hour>=12? "AM" : "PM"}')),
            )
          ]),
      
          //   ],
          // )
        ],
      ),
    );
  }
}

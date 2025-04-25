
import 'package:daytask/auth/auth_service.dart';
import 'package:daytask/dashboard/task_bottom_sheet.dart';
import 'package:daytask/dashboard/task_model.dart';
import 'package:daytask/dashboard/task_service.dart';
import 'package:daytask/dashboard/task_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  @override
  void initState() {
    super.initState();
    // Fetch tasks when screen initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TaskService>(context, listen: false).fetchAllTasksFromSupabase();
    });
  }
var count = 0;
  @override
  Widget build(BuildContext context) {
    print('rebuilding scafforld');
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks'),
        actions: [
          IconButton(
              onPressed: AuthService().signOut, icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text("All Tasks"),

            Consumer<TaskService>(builder: (context, taskService, _ ) {

              return Expanded(
                flex: 12,
                child: RefreshIndicator(
                  onRefresh: () {
                    return taskService.fetchAllTasksFromSupabase();
                  },
                  child: ListView.separated(

                      separatorBuilder: (context, index) => SizedBox(
                            height: 10,
                          ),
                      padding: EdgeInsets.all(25),
                      shrinkWrap: true,
                      itemCount: taskService.taskList.length,
                      itemBuilder: (context, index) {

                        return Provider.value(
                          value: taskService.taskList[index],
                          child: TaskTile( key: ValueKey('task_${index}'),),
                        );
                      }),
                ),
              );
            }),
            Expanded(
                flex: 2,
                child: SizedBox(
                  height: 10,
                ))
          ],
        ),
      ),
      bottomSheet: TaskBottomSheet(
        taskService: Provider.of<TaskService>(context,listen: false),
      ),
    );
  }
}

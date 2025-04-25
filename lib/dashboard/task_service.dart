import 'package:daytask/dashboard/task_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TaskService extends ChangeNotifier {
  List<Task> taskList = [];
  bool isLoading = false;
  final _supabase = Supabase.instance.client;


  Future<void> fetchAllTasksFromSupabase() async {
    try {
      isLoading = true;
      notifyListeners();





      final res = await _supabase.from('Tasks').select('*').eq('user_id', _supabase.auth.currentUser!.id).order('created_at',ascending: true);
      taskList = res.map((item) => Task.fromJson(item)).toList();
    } catch (e) {
      debugPrint('Error fetching tasks: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> insertTaskToSupabase(Task task) async {
    try {
      isLoading = true;
      notifyListeners();

      print(_supabase.auth.currentUser!.id);

      await _supabase.from('Tasks').insert([{...task.toJson(),'user_id':_supabase.auth.currentUser!.id}])

      ;
      await fetchAllTasksFromSupabase(); // Refresh the list
    } catch (e) {
      debugPrint('Error inserting task: $e');
    }
  }

  Future<void> deleteTaskFromSupabase(int id) async {
    try {
      isLoading = true;
      taskList.removeWhere((item)=>item.id == id);
      notifyListeners();

      await _supabase.from('Tasks').delete().eq('id', id).eq('user_id', _supabase.auth.currentUser!.id);
       // await fetchAllTasksFromSupabase(); // Refresh the list
    } catch (e) {
      debugPrint('Error deleting task: $e');
    }
  }

  Future<void> changeTaskStatus(Task task, int index) async {
    try {

      taskList[index] = task;

      await _supabase.from('Tasks')
          .update({'status': taskList[index].status})
          .eq('id', task.id).eq('user_id', _supabase.auth.currentUser!.id);

      notifyListeners();
      // Optional: Refresh from server to confirm sync
      // await fetchAllTasksFromSupabase(); // Second update - ensures consistency
    } catch (e) {

      // 2. Update local state immediately
      taskList[index] = task.copyWith(
        status: !task.status
      );
      notifyListeners();
      debugPrint('Error updating status: $e');
    }
  }

}
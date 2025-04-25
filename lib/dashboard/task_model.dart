import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Task{
  final int id;
  final String title;
  final String description;
  final DateTime date;
  final TimeOfDay time;
  final bool status;

  var isExpanded = false;

  Task({required this.id, required this.title, required this.date, required this.time, required this.description , required this.status } );

  factory Task.fromJson(Map<String,dynamic> json){
      return Task(
        id: json['id'],
        title : json['title'],
        description: json['description'],
        date: DateTime.parse(json['date']),
        time: TimeOfDay.fromDateTime(DateFormat('hh:mm').parse(json['time'])) ,
        status : json['status']

      );
  }

 Map<String,dynamic> toJson(){
    return {
      'title' : title,
      'description':description,
      'date':'${date.year}-${date.month}-${date.day}',
      'time': '${time.hour}:${time.minute}:00',
      'status':status
    };
  }

  @override
  String toString(){
    return 'Task:${title}, id:${id} , description:${description}  date:${date} time:${time} status :${status} ';
  }

  Task copyWith({
    int? id,
    String? title,
    String? description,
    DateTime? date,
    TimeOfDay? time,
    bool? status,
    bool? isExpanded,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      time: time ?? this.time,
      status: status ?? this.status,
    )..isExpanded = isExpanded ?? this.isExpanded

    ;
  }

}
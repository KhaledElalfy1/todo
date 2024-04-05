import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testfirebase/core/helpers/fire_store_keys.dart';

class TaskModel {
  final String taskName;
  final String taskDescription;
  final String uId;
  final DateTime createdAt;
  final DateTime dueDate;
  final bool isDone;

  TaskModel(
      {required this.taskName,
      required this.taskDescription,
      required this.uId,
      required this.createdAt,
      required this.dueDate,
      required this.isDone});
  factory TaskModel.fromFirestore(Map<String, dynamic> jsonData) {
    return TaskModel(
      taskName: jsonData[FireStoreKeys.task],
      uId: jsonData[FireStoreKeys.uId],
      createdAt: (jsonData[FireStoreKeys.createdAt] as Timestamp).toDate(),
      taskDescription: jsonData[FireStoreKeys.taskDescription],
      dueDate: (jsonData[FireStoreKeys.dueDate] as Timestamp).toDate(),
      isDone: jsonData[FireStoreKeys.isDone],
    );
  }
}

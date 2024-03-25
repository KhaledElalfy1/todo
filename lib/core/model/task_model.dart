import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testfirebase/core/helpers/fire_store_keys.dart';

class TaskModel {
  final String taskName;
  final String uId;
  final Timestamp dateTime;

  TaskModel(
      {required this.taskName, required this.uId, required this.dateTime});

  factory TaskModel.fromFirestore(Map<String, dynamic> jsonData) {
    return TaskModel(
      taskName: jsonData[FireStoreKeys.task],
      uId: jsonData[FireStoreKeys.uId],
      dateTime: jsonData[FireStoreKeys.time],
    );
  }
}

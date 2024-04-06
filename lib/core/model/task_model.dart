import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testfirebase/core/helpers/fire_store_keys.dart';

class TaskModel {
  final String taskName;
  final String taskDescription;
  final String uId;
  final DateTime createdAt;
  final DateTime dueDate;
  final bool isDone;
  final String docID;
  TaskModel(
      {required this.taskName,
      required this.taskDescription,
      required this.uId,
      required this.createdAt,
      required this.dueDate,
      required this.isDone,required this.docID});
  factory TaskModel.fromFirestore(Map<String, dynamic> doc,String id) {
    return TaskModel(
      taskName: doc[FireStoreKeys.task],
      uId: doc[FireStoreKeys.uId],
      createdAt: (doc[FireStoreKeys.createdAt] as Timestamp).toDate(),
      taskDescription: doc[FireStoreKeys.taskDescription],
      dueDate: (doc[FireStoreKeys.dueDate] as Timestamp).toDate(),
      isDone: doc[FireStoreKeys.isDone],
      docID: id
    );
  }
}

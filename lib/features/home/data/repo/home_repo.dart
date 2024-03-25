import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:testfirebase/core/helpers/fire_store_keys.dart';
import 'package:testfirebase/core/model/task_model.dart';

class HomeRepo {
  CollectionReference tasks =
      FirebaseFirestore.instance.collection(FireStoreKeys.tasksCollection);
  Future<Either<String, String>> addTask({required String task}) async {
    try {
      await tasks.add(
        {
          FireStoreKeys.task: task,
          FireStoreKeys.time: DateTime.now(),
          FireStoreKeys.uId: FirebaseAuth.instance.currentUser!.uid,
        },
      );
      return right('Data Added Successfully');
    } catch (e) {
      return left('Failure while adding, please try later!');
    }
  }

  Future<Either<String, List<TaskModel>>> getUerTasks() async {
    final data = await FirebaseFirestore.instance
        .collection(FireStoreKeys.tasksCollection)
        .where(FireStoreKeys.uId,
            isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    try {
      List<TaskModel> tasksList = [];
      for (var doc in data.docs) {
        tasksList.add(TaskModel.fromFirestore(doc.data()));
      }
      return right(tasksList);
    } on Exception catch (e) {
      return left(e.toString());
    }
  }
}

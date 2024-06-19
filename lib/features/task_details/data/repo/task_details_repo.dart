import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:testfirebase/core/helpers/fire_store_keys.dart';

class TaskDetailRepo {
  CollectionReference tasks =
      FirebaseFirestore.instance.collection(FireStoreKeys.tasksCollection);

  Future<Either<String, String>> checkTask(
      {required String doc, required bool value}) async {
    try {
      await tasks.doc(doc).update({FireStoreKeys.isDone: value});
      return right('Success');
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, String>> deleteTask({required String doc}) async {
    try {
      await tasks.doc(doc).delete();
      return right('Success');
    } catch (e) {
      return left('Failure');
    }
  }
}

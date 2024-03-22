import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:testfirebase/core/helpers/fire_store_keys.dart';

class HomeRepo {
  CollectionReference tasks =
      FirebaseFirestore.instance.collection(FireStoreKeys.tasks);
  Future<Either<String, String>> addTask({required String task}) async {
    try {
      await tasks.add(
        {
          'task': 'task3',
          'time': DateTime.now(),
          'uId': FirebaseAuth.instance.currentUser!.uid,
        },
      );
      return right('Data Added Successfully');
    } catch (e) {
      return left('Failure while adding, please try later!');
    }
  }
}

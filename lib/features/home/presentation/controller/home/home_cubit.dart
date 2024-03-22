import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testfirebase/core/service/service_locator.dart';
import 'package:testfirebase/features/home/data/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  // CollectionReference tasks =
  //     FirebaseFirestore.instance.collection(FireStoreKeys.tasks);
  void addTask() async {
    emit(AddItemLoading());
    final result = await getIt<HomeRepo>().addTask(task: 'task3');
    result.fold(
      (l) => emit(
        AddItemFailure(),
      ),
      (r) => emit(
        AddItemSuccess(),
      ),
    );
  }
}

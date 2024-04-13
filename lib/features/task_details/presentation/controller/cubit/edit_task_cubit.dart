import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testfirebase/core/helpers/extentions.dart';
import 'package:testfirebase/core/routes/routing.dart';
import 'package:testfirebase/core/service/service_locator.dart';
import 'package:testfirebase/features/home/presentation/view/home.dart';
import 'package:testfirebase/features/task_details/data/repo/task_details_repo.dart';
import 'package:testfirebase/features/task_details/presentation/controller/cubit/edit_task_state.dart';

class EditTaskCubit extends Cubit<EditTaskState> {
  EditTaskCubit() : super(EditTaskInitial());
  static EditTaskCubit get(context) => BlocProvider.of(context);

  void makeTaskChecked({required String doc, required bool value}) async {
    final result =
        await getIt<TaskDetailRepo>().checkTask(doc: doc, value: value);
    result.fold((l) => emit(EditTaskFailure(eMessage: l)), (r) {
      emit(EditTaskSuccess());
    });
  }

  navigation(BuildContext context) {
    return WillPopScope(
      child:const MainScreen(),
      // Wrap your widget with WillPopScope to handle back button press
      onWillPop: () async {
        // Navigate to another screen when back button is pressed
        context.pushReplacementNamed(Routing.home);
        return true; // Return true to allow the back navigation
      },
    );
  }
}

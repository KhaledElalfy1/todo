import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testfirebase/features/profile/presentation/controller/cubit/update_name_state.dart';

class UpdateNameCubit extends Cubit<UpdateNameState> {
  UpdateNameCubit() : super(UpdateNameInitial());
  static UpdateNameCubit get(context) => BlocProvider.of(context);
  void updateName() {
    emit(UpdateNameDone());
  }
}

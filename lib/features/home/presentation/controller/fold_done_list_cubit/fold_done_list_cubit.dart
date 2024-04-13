import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testfirebase/features/home/presentation/controller/fold_done_list_cubit/fold_done_list_state.dart';

class FoldDoneListCubit extends Cubit<FoldDoneListState> {
  FoldDoneListCubit() : super(FoldDoneListInitial());
  static FoldDoneListCubit get(context) => BlocProvider.of(context);
    IconData expandedIcon = Icons.expand_more;
  bool isExpanded = true;

   void changeExpandedIcon() {
    isExpanded = !isExpanded;
    expandedIcon = isExpanded ? Icons.expand_more : Icons.chevron_right;
    emit(ChangeExpandedIcon());
  }
}

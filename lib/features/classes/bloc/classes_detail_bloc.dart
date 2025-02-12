import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'classes_detail_event.dart';
part 'classes_detail_state.dart';

class ClassesDetailBloc extends Bloc<ClassesDetailEvent, ClassesDetailState> {
  ClassesDetailBloc() : super(const ClassesDetailState()) {
    on<SelectItemForDelete>((event, emit) {
      emit(state.copyWith(selectedItemCount: event.count));
    });
    on<RemoveSelectItemForDelete>((event, emit) {
      emit(state.copyWith(selectedItemCount: event.count));
    });
  }
}

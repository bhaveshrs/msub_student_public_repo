import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

part 'calender_event.dart';
part 'calender_state.dart';

class CalenderBloc extends Bloc<CalenderEvent, CalenderState> {
  CalenderBloc() : super(CalenderState.initial()) {
    on<ChangeTargetDate>((event, emit) {
      try {
        String currentMonth = DateFormat.yMMM().format(event.targetDateTime);
        emit(state.copyWith(
            targetDateTime: event.targetDateTime, currentMonth: currentMonth));
      } catch (e) {
        print(e);
      }
    });
    on<SelectDate>((event, emit) {
      try {
        String currentMonth = DateFormat.yMMM().format(event.selectDateTime);
        emit(state.copyWith(
            currentDate2: event.selectDateTime,
            currentMonth: currentMonth,
            targetDateTime: event.selectDateTime));
      } catch (e) {
        print(e);
      }
    });
  }
}

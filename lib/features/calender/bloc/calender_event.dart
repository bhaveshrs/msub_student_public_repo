part of 'calender_bloc.dart';

sealed class CalenderEvent extends Equatable {
  const CalenderEvent();

  @override
  List<Object> get props => [];
}

class ChangeTargetDate extends CalenderEvent {
  final DateTime targetDateTime;
  const ChangeTargetDate({required this.targetDateTime});

  @override
  List<Object> get props => [targetDateTime];
}
class SelectDate extends CalenderEvent {
  final DateTime selectDateTime;
  const SelectDate({required this.selectDateTime});

  @override
  List<Object> get props => [selectDateTime];
}

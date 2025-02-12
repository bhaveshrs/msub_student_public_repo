// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'calender_bloc.dart';

class CalenderState extends Equatable {
  final DateTime targetDateTime;
  final DateTime? currentDate2;
  final String currentMonth;

  const CalenderState({
    required this.targetDateTime, // Default constant date
    this.currentDate2,
    required this.currentMonth,
  });

  factory CalenderState.initial() {
    final now = DateTime.now();
    return CalenderState(
      targetDateTime: now,
      currentMonth: DateFormat.yMMM().format(now),
    );
  }
  @override
  List<Object?> get props => [targetDateTime, currentDate2, currentMonth];

  CalenderState copyWith({
    DateTime? targetDateTime,
    DateTime? currentDate2,
    String? currentMonth,
  }) {
    return CalenderState(
      targetDateTime: targetDateTime ?? this.targetDateTime,
      currentDate2: currentDate2 ?? this.currentDate2,
      currentMonth: currentMonth ?? this.currentMonth,
    );
  }
}

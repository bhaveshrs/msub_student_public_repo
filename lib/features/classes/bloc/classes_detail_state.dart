// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'classes_detail_bloc.dart';

class ClassesDetailState extends Equatable {
  final int selectedItemCount;
  final String? selectedFrom;
  const ClassesDetailState({
    this.selectedItemCount = 0,
    this.selectedFrom,
  });

  @override
  List<Object?> get props => [selectedItemCount, selectedFrom];

  ClassesDetailState copyWith({
    int? selectedItemCount,
    String? selectedFrom,
  }) {
    return ClassesDetailState(
      selectedItemCount: selectedItemCount ?? this.selectedItemCount,
      selectedFrom: selectedFrom ?? this.selectedFrom,
    );
  }

  @override
  bool get stringify => true;
}

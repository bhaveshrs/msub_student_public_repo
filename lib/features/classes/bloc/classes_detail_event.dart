part of 'classes_detail_bloc.dart';

sealed class ClassesDetailEvent extends Equatable {
  const ClassesDetailEvent();

  @override
  List<Object> get props => [];
}

class SelectItemForDelete extends ClassesDetailEvent {
  final int count;
  const SelectItemForDelete(this.count);

  @override
  List<Object> get props => [];
}

class RemoveSelectItemForDelete extends ClassesDetailEvent {
  final int count;
  const RemoveSelectItemForDelete(this.count);

  @override
  List<Object> get props => [];
}

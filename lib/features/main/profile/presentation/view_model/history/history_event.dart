import 'package:equatable/equatable.dart';

abstract class HistoryEvent extends Equatable {
  const HistoryEvent();
  @override
  List<Object?> get props => [];
}

class LoadHistory extends HistoryEvent {}

class AddHistoryItem extends HistoryEvent {
  final String title;
  final String image;
  final String rating;
  final String id;

  const AddHistoryItem(this.title, this.image, this.rating, this.id);
  @override
  List<Object?> get props => [title, image, rating, id];
}

class ClearHistory extends HistoryEvent {}

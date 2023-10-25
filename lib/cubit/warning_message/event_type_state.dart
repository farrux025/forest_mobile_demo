part of 'event_type_cubit.dart';

@immutable
abstract class EventTypeState extends Equatable {}

class EventTypeInitial extends EventTypeState {
  @override
  List<Object> get props => [];
}

class EventTypeLoading extends EventTypeState {
  @override
  List<Object> get props => [];
}

class EventTypeLoaded extends EventTypeState {
  final List<EventTypeRes> eventList;

  EventTypeLoaded(this.eventList);

  @override
  List<Object?> get props => [eventList];
}

class EventTypeError extends EventTypeState {
  final String error;

  EventTypeError(this.error);

  @override
  List<Object?> get props => [error];
}

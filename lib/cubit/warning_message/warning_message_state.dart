part of 'warning_message_cubit.dart';

@immutable
abstract class WarningMessageState extends Equatable {}

class WarningMessageInitial extends WarningMessageState {
  @override
  List<Object> get props => [];
}

class WarningMessageLoading extends WarningMessageState {
  @override
  List<Object> get props => [];
}

class WarningMessageLoaded extends WarningMessageState {
  final WarningMessageCreateRes response;

  WarningMessageLoaded(this.response);

  @override
  List<Object?> get props => [response];
}

class WarningMessageError extends WarningMessageState {
  final String error;

  WarningMessageError(this.error);

  @override
  List<Object?> get props => [error];
}

part of 'one_id_cubit.dart';

@immutable
abstract class OneIDState extends Equatable {}

class OneIDInitial extends OneIDState {
  @override
  List<Object?> get props => [];
}

class OneIDLoading extends OneIDState {
  @override
  List<Object?> get props => [];
}

class OneIDLoaded extends OneIDState {
  final String url;

  OneIDLoaded(this.url);

  @override
  List<Object?> get props => [url];
}

class OneIDError extends OneIDState {
  final String error;

  OneIDError(this.error);

  @override
  List<Object?> get props => [error];
}

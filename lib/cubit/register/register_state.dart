part of 'register_cubit.dart';

@immutable
abstract class RegisterState extends Equatable {}

class RegisterInitial extends RegisterState {
  @override
  List<Object?> get props => [];
}

class RegisterLoading extends RegisterState {
  @override
  List<Object?> get props => [];
}

class RegisterLoaded extends RegisterState {
  final bool? success;

  RegisterLoaded(this.success);

  @override
  List<Object?> get props => [success];
}

class RegisterError extends RegisterState {
  final String error;

  RegisterError(this.error);

  @override
  List<Object?> get props => [error];
}

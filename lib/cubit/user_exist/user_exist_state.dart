part of 'user_exist_cubit.dart';

@immutable
abstract class UserExistState extends Equatable {}

class UserExistInitial extends UserExistState {
  @override
  List<Object?> get props => [];
}

class UserExistLoading extends UserExistState {
  @override
  List<Object?> get props => [];
}

class UserExistLoaded extends UserExistState {
  final bool? success;
  final String phone;

  UserExistLoaded(this.success, this.phone);

  @override
  List<Object?> get props => [success, phone];
}

class UserExistError extends UserExistState {
  final String error;

  UserExistError(this.error);

  @override
  List<Object?> get props => [error];
}

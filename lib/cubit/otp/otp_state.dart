part of 'otp_cubit.dart';

@immutable
abstract class OtpState extends Equatable {}

class OtpInitial extends OtpState {
  @override
  List<Object?> get props => [];
}

class OtpLoading extends OtpState {
  @override
  List<Object?> get props => [];
}

class OtpLoaded extends OtpState {
  final bool? success;

  OtpLoaded(this.success);

  @override
  List<Object?> get props => [success];
}

class OtpError extends OtpState {
  final String error;

  OtpError(this.error);

  @override
  List<Object?> get props => [error];
}
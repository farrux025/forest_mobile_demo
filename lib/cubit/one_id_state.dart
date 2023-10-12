part of 'one_id_cubit.dart';

@immutable
abstract class OneIDState {}

class OneIDInitial extends OneIDState {}

class OneIDLoading extends OneIDState {}

class OneIDLoaded extends OneIDState {}

class OneIDError extends OneIDState {}
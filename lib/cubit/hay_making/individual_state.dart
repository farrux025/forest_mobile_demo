part of 'individual_cubit.dart';

@immutable
abstract class HayMakingIndividualState extends Equatable {}

class HayMakingIndividualInitial extends HayMakingIndividualState {
  @override
  List<Object?> get props => [];
}

class HayMakingIndividualLoading extends HayMakingIndividualState {
  @override
  List<Object?> get props => [];
}

class HayMakingIndividualLoaded extends HayMakingIndividualState {
  final RuxsatnomaResponse ruxsatnomaDetails;

  HayMakingIndividualLoaded(this.ruxsatnomaDetails);

  @override
  List<Object?> get props => [ruxsatnomaDetails];
}

class HayMakingIndividualError extends HayMakingIndividualState {
  final String error;

  HayMakingIndividualError(this.error);

  @override
  List<Object?> get props => [error];
}

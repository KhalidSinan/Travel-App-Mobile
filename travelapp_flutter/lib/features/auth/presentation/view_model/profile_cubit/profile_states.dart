abstract class ProfileStates {}

class InitialProfile extends ProfileStates {}

class GetDataLoading extends ProfileStates {}

class GetDataSuccess extends ProfileStates {}

class GetDataFailure extends ProfileStates {
  final String errMessage;

  GetDataFailure({required this.errMessage});
}

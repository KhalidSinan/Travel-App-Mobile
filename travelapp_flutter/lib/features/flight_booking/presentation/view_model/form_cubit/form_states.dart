part of 'form_cubit.dart';

class FormCubitState {}

class FormInitial extends FormCubitState {}

class FormLoading extends FormCubitState {}

class FormSuccess extends FormCubitState {
  final String reservationId;

  FormSuccess({required this.reservationId});
}

class FormNotFilled extends FormCubitState {}

class PassengerDelete extends FormCubitState {}

class PassengerAdd extends FormCubitState {}

class FormFailure extends FormCubitState {
  final Failure failure;

  FormFailure({required this.failure});
}

class DeleteSuccess extends FormCubitState {}

class DeleteLoading extends FormCubitState {}

class DeleteFailure extends FormCubitState {
  final Failure failure;

  DeleteFailure({required this.failure});
}

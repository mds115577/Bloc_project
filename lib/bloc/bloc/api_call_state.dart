part of 'api_call_bloc.dart';

@immutable
abstract class ApiCallState {}

class ApiCallInitial extends ApiCallState {}

class RequestApiCall extends ApiCallState {}

class SuccessApiCall extends ApiCallState {
  final HomeScreenModel homeScreenModel;

  SuccessApiCall(this.homeScreenModel);
}

class SuccessSecondScreenApiCall extends ApiCallState {
  final ShopDetailsModel shopDetailsModel;

  SuccessSecondScreenApiCall(this.shopDetailsModel);
}

class FailureApiCall extends ApiCallState {}

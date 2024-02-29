part of 'api_call_bloc.dart';

@immutable
abstract class ApiCallEvent {}

class FetchHomeApiCallEvent extends ApiCallEvent {
  final int id;

  FetchHomeApiCallEvent(this.id);
}

class SecondApiCallEvent extends ApiCallEvent {
  final int shopid;

  SecondApiCallEvent(this.shopid);
}

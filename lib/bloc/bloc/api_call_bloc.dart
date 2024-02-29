import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_project/functions.dart';
import 'package:bloc_project/model/home_model.dart';
import 'package:meta/meta.dart';

import '../../model/details_model.dart';

part 'api_call_event.dart';
part 'api_call_state.dart';

class ApiCallBloc extends Bloc<ApiCallEvent, ApiCallState> {
  ApiCallBloc() : super(ApiCallInitial()) {
    on<FetchHomeApiCallEvent>(_handleFetchApi);
    on<SecondApiCallEvent>(_handleSecondCall);
  }

  FutureOr<void> _handleFetchApi(
      FetchHomeApiCallEvent event, Emitter<ApiCallState> emit) async {
    emit(RequestApiCall());
    try {
      var success = await homeScreenApiCall(event.id);
      if (success != null) {
        emit(SuccessApiCall(success));
      } else {
        emit(FailureApiCall());
      }
    } catch (e) {
      emit(FailureApiCall());
    }
  }

  FutureOr<void> _handleSecondCall(
      SecondApiCallEvent event, Emitter<ApiCallState> emit) async {
    emit(RequestApiCall());
    try {
      var success = await shopDetails(shopId: event.shopid);
      if (success != null) {
        emit(SuccessSecondScreenApiCall(success));
      } else {
        emit(FailureApiCall());
      }
    } catch (e) {
      emit(FailureApiCall());
    }
  }
}

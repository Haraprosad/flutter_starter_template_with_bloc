// import 'dart:async';
//
// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter_starter_template_with_bloc/app/network/exceptions/api_exception.dart';
// import 'package:flutter_starter_template_with_bloc/app/network/exceptions/app_exception.dart';
// import 'package:flutter_starter_template_with_bloc/app/network/exceptions/json_format_exception.dart';
// import 'package:flutter_starter_template_with_bloc/app/network/exceptions/network_exception.dart';
// import 'package:flutter_starter_template_with_bloc/app/network/exceptions/not_found_exception.dart';
// import 'package:flutter_starter_template_with_bloc/app/network/exceptions/service_unavailable_exception.dart';
// import 'package:flutter_starter_template_with_bloc/app/network/exceptions/unauthorize_exception.dart';
// import 'package:meta/meta.dart';
//
// part 'base_event.dart';
// part 'base_state.dart';
//
// class BaseBloc extends Bloc<BaseEvent, BaseState> {
//   BaseBloc() : super(BaseInitial()) {
//     on<BaseEvent>((event, emit) {
//       // TODO: implement event handler
//     });
//   }
//
//
//   ///Global error handling
//   // ignore: long-parameter-list
//   dynamic callDataService<T>(
//       Future<T> future, {
//         Function(Exception exception)? onError,
//         Function(T response)? onSuccess,
//         Function? onStart,
//         Function? onComplete,
//       }) async {
//     Exception? _exception;
//
//     onStart == null ? showLoading() : onStart();
//
//     try {
//       final T response = await future;
//
//       if (onSuccess != null) onSuccess(response);
//
//       onComplete == null ? hideLoading() : onComplete();
//
//       return response;
//     } on ServiceUnavailableException catch (exception) {
//       _exception = exception;
//       showErrorMessage(exception.message);
//     } on UnauthorizedException catch (exception) {
//       _exception = exception;
//       showErrorMessage(exception.message);
//     } on TimeoutException catch (exception) {
//       _exception = exception;
//       showErrorMessage(exception.message ?? 'Timeout exception');
//     } on NetworkException catch (exception) {
//       _exception = exception;
//       showErrorMessage(exception.message);
//     } on JsonFormatException catch (exception) {
//       _exception = exception;
//       showErrorMessage(exception.message);
//     } on NotFoundException catch (exception) {
//       _exception = exception;
//       showErrorMessage(exception.message);
//     } on ApiException catch (exception) {
//       _exception = exception;
//     } on AppException catch (exception) {
//       _exception = exception;
//       showErrorMessage(exception.message);
//     } catch (error) {
//       _exception = AppException(message: "$error");
//       logger.e("Controller>>>>>> error $error");
//     }
//
//     if (onError != null) onError(_exception);
//
//     onComplete == null ? hideLoading() : onComplete();
//   }
// }

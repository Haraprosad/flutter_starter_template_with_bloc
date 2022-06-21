import 'package:dio/dio.dart';
import 'package:flutter_starter_template_with_bloc/app/data/local/preference/preference_manager.dart';
import 'package:flutter_starter_template_with_bloc/app/data/local/preference/preference_manager_impl.dart';
import '/app/network/dio_provider.dart';

class DioRequestRetrier {
  final dioClient = DioProvider.tokenClient;
  final RequestOptions requestOptions;

  //todo: following logic have to be clear.
  // final PreferenceManager _preferenceManager =
  // getx.Get.find(tag: (PreferenceManager).toString());
  final PreferenceManagerImpl _preferenceManager = PreferenceManagerImpl(); //todo: remove this line

  DioRequestRetrier({required this.requestOptions});

  Future<Response<T>> retry<T>() async {
    var header = await getCustomHeaders();

    return await dioClient.request(
      requestOptions.path,
      cancelToken: requestOptions.cancelToken,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      onReceiveProgress: requestOptions.onReceiveProgress,
      onSendProgress: requestOptions.onSendProgress,
      options: Options(headers: header, method: requestOptions.method),
    );
  }

  Future<Map<String, String>> getCustomHeaders() async {
    final String accessToken =
    await _preferenceManager.getString(PreferenceManager.keyToken);
    var customHeaders = {'content-type': 'application/json'};
    if (accessToken.trim().isNotEmpty) {
      customHeaders.addAll({
        'Authorization': "Bearer $accessToken",
      });
    }

    return customHeaders;
  }
}

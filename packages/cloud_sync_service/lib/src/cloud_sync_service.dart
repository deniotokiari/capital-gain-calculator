import 'package:cloud_sync_service/src/model/alphavantage_api_key_response.dart';
import 'package:dio/dio.dart';

const _method = 'method';
const _alphavantageApiKey = 'alphavantage_api_key';

class CloudSyncService {
  final _cloudSyncDio = Dio(
    BaseOptions(
      baseUrl:
          'https://script.google.com/macros/s/AKfycbxAT0C65qxRvnQsSBi6iqV1-NppJqEjnn_IFKjrGmjGfsCE1DN_TIcRrc-yvcyiCxW5',
    ),
  );

  Future<AlphavantageApiKeyResponse> getAlphavantageApiKey() async {
    final response = await _cloudSyncDio.get(
      '/exec',
      queryParameters: {
        _method: _alphavantageApiKey,
      },
    );

    return AlphavantageApiKeyResponse.fromJson(response.data);
  }
}

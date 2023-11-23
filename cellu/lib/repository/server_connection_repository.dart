import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../services/logger_service.dart';

class ServerConnectionRepository {
  Future<bool> checkConnection() async {
    try {
      final response = await http.get(Uri.parse(dotenv.env['BACKEND_URL']!));
      return response.statusCode == 200;
    } catch (e) {
      LoggerService.error('Server Connection Failed', error: e);

      if (e is http.ClientException) {
        // HTTP 클라이언트 예외의 경우
        LoggerService.error('HTTP Client Exception', error: e.message);
      } else {
        // 기타 예외의 경우
        LoggerService.error('Unknown Exception', error: e.toString());
      }

      throw Exception('Server Connection Failed: $e');
    }
  }
}

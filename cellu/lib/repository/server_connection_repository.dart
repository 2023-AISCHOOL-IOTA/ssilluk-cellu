import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ServerConnectionRepository {
  Future<bool> checkConnection() async {
    try {
      final response = await http.get(Uri.parse(dotenv.env['BACKEND_URL']!));
      return response.statusCode == 200;
    } catch (_) {
      throw Exception('Server Connection Failed');
    }
  }
}

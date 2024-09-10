import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:logger/logger.dart';

class NetworkHelper {
  NetworkHelper(this.url);

  final Logger _logger = Logger();

  final String url;
  //https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey'

  Future getData() async {
    Response response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      _logger.e('Failed to get data. Status code: ${response.statusCode}');
    }
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiHelper {
  ApiHelper(this.city);
  final String city;

  Future call_api() async {
    String url = "https://weatherapi-com.p.rapidapi.com/current.json?q=${city}";

    Map<String, String> headers = {
      "X-RapidAPI-Key": "b002965aa9mshb864bb4714542eap13ae60jsn9e1b03c89954",
      "X-RapidAPI-Host": "weatherapi-com.p.rapidapi.com",
    };

    var resp = await http.get(Uri.parse(url), headers: headers);

    if (resp.statusCode == 200) {
      return jsonDecode(resp.body);
    } else {
      return {'error': true};
    }
  }
}

import 'package:http/http.dart' as http;
import 'dart:convert';

Future<dynamic> getData(Uri uri) async {
  http.Response response = await http.get(uri);
  if (response.statusCode == 200) {
    String data = response.body;
    return jsonDecode(data);
  } else {
    print(response.statusCode);
  }
}

Future<dynamic> getDataWithBasicAuth(
    Uri uri, String authorizationCode) async {
  http.Response response =
      await http.get(uri, headers: {'Authorization': authorizationCode});
  if (response.statusCode == 200) {
    String data = response.body;
    return jsonDecode(data);
  } else {
    print(response.statusCode);
  }
}

Future<dynamic> postData(Uri uri) async {
  http.Response response = await http.post(uri);
  if (response.statusCode == 200) {
    String data = response.body;
    return jsonDecode(data);
  } else {
    print(response.statusCode);
  }
}

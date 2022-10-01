import 'dart:convert';

import 'package:doctor_app/models/test_model.dart';
import 'package:http/http.dart' as http;

class CallApi
{
  final String url = "https://d3mk.com/apinew.php";

  getData() async
  {
    http.Response response = await http.get(
      Uri.parse(url));
    try
        {
          if(response.statusCode == 200)
            {
              return response;
            } else
              {
                return "Failed";
              }
        } catch (e)
    {
      print(e);
      return "Failed";
    }
  }
}

class TestApi{

  List<Photo> parsePhotos(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
  }

  Future<List<Photo>> fetchPhotos(http.Client client) async {
    final response = await client
        .get(Uri.parse("https://d3mk.com/apinew.php"));
    return parsePhotos(response.body);

  }
}

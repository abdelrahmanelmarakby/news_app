import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/NewsScreen/model.dart';

Stream<News> getData() {
  try {
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=mars&apiKey=ea525e573f6b460ca66f2554c5f7f8fd");
    final http.Response response = http.get(url);
    print(response.body);
    final res = jsonDecode(response.body);
    return News.fromJson(res);
  } catch (e) {
    print(e.message);
  }
}

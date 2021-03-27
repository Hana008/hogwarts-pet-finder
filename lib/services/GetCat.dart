import 'dart:convert';
import 'package:http/http.dart';

class GetCat {
  String url;
  String text;
  Future<void> getCat() async {
    try {
      Response response =
          await get('https://api.thecatapi.com/v1/images/search');
      List data = jsonDecode(response.body);
      text = 'Meet your sidekick';
      url = data[0]['url'];
    } catch (e) {
      text = 'oops something went wrong';
      url =
          'https://www.novafm.com.au/wp-content/uploads/2019/11/confused_ron_weasley-1024x512.jpg';
    }
  }
}

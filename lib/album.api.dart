import 'album.dart';
import 'package:http/http.dart' as http;

Future<Album>fetchalbum()  async{
  String url = "http://vayradio.ru/song_update.php";
  final response = await http.get(url);
  print(response.body);

  return albumFromJson(response.body);
}

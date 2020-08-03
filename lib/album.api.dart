import 'album.dart';
import 'package:http/http.dart' as http;

Future<Album>fetchalbum()  async{
  String url = "https://hydra.shoutca.st/rpc/vayradio95/streaminfo.get";
  final response = await http.get(url);

  return albumFromJson(response.body);
}

import "dart:convert";
import 'package:http/http.dart' as http;

class PicsumImage {
  final String? id;
  final String? author;
  final int? width;
  final int? height;
  final String? url;

  PicsumImage({
    this.id,
    this.author,
    this.width,
    this.height,
    this.url,
  });

  static Future<List<dynamic>> fetchPicsumImages() async {
    final response = await http.get(Uri.parse('https://picsum.photos/v2/list'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Failed to fetch Picsum images');
    }
  }

  List<PicsumImage> parsePicsumImages(List<dynamic> data) {
    return data.map((item) {
      return PicsumImage(
        id: item['id'].toString(),
        author: item['author'].toString(),
        width: int.parse(item['width'].toString()),
        height: int.parse(item['height'].toString()),
        url: item['download_url'].toString(),
      );
    }).toList();
  }
}

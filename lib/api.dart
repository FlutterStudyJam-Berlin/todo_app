import 'dart:async';
import 'dart:convert' show json, utf8;
import 'dart:io';
import 'todo.dart';

class Api {
  final httpClient = HttpClient();
  final url = 'gist.github.com';

  Future<List<Todo>> getTodos() async {
    final uri = Uri.https(url, 'fgoncalves/def5fd5bd9e8af8db9432f9be0e405d0/raw');
    final httpRequest = await httpClient.getUrl(uri);
    final httpResponse = await httpRequest.close();

    if (httpResponse.statusCode != HttpStatus.ok) {
      return null;
    }

    final responseBody = await httpResponse.transform(utf8.decoder).join();
    final List data = json.decode(responseBody);
    return data.map((entry) => Todo.fromJson(entry)).toList();
  }
}

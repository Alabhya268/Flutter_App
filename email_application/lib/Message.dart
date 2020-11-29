import 'dart:convert';

import 'package:json_annotation/json_annotation.dart' show JsonSerializable;
import 'package:http/http.dart' as http;

part 'Message.g.dart';

@JsonSerializable()
class Message {
  final String subject;
  final String body;

  Message(this.subject, this.body);

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  static Future<List<Message>> browse({status = 'important'}) async {
    String url = status == 'important'
        ? 'https://run.mocky.io/v3/e3c4ee75-03ed-4c93-975d-546118f778dd'
        : 'https://run.mocky.io/v3/63460031-a7c6-417f-aecd-91dfb0a43b89';

    http.Response response = await http.get(url);
    String content = response.body;
    List collection = json.decode(content);
    List<Message> _messages =
        collection.map((json) => Message.fromJson(json)).toList();

    return _messages;
  }
}

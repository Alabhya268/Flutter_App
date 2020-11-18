import 'package:json_annotation/json_annotation.dart' show JsonSerializable;

part 'Message.g.dart';

@JsonSerializable()
class Message {
  final String subject;
  final String body;

  Message(this.subject, this.body);

 factory Message.fromJson(Map<String, dynamic> json)
      =>_$MessageFromJson(json);
}

import 'package:chat_bot/data/models/message.dart';
import 'package:chat_bot/data/models/subject.dart';

class Chat {
  String? id;
  Subject? subject;
  List<Message>? messages;
  String? uid;

  Chat({this.id , this.subject, this.messages, this.uid});

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      id: json['id'],
      subject:
          json['subject'] != null ? Subject.fromJson(json['subject']) : null,
      messages: json['messages'] != null
          ? (json['messages'] as List).map((i) => Message.fromJson(i)).toList()
          : null,
      uid: json['uid'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'subject': subject?.toJson(),
      'messages': messages?.map((i) => i.toJson()).toList(),
      'uid': uid,
    };
  }
}

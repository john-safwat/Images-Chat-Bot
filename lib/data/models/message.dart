class Message {
  int? id;
  String? message;
  bool? isResponse;
  String? taskId;
  String? apiKey;
  String? imageLink;
  int? dateTime;

  Message({
    this.id,
    this.message,
    this.isResponse,
    this.taskId,
    this.apiKey,
    this.imageLink,
    this.dateTime,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'],
      message: json['message'],
      isResponse: json['isResponse'],
      taskId: json['taskId'],
      apiKey: json['apiKey'],
      imageLink: json['imageLink'],
      dateTime: json['dateTime'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'message': message,
      'isResponse': isResponse,
      'taskId': taskId,
      'apiKey': apiKey,
      'imageLink': imageLink,
      'dateTime': dateTime,
    };
  }
}

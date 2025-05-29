import 'package:json_annotation/json_annotation.dart';

part 'create_image_response.g.dart';

@JsonSerializable()
class CreateImageResponse {
  @JsonKey(name: "code")
  final String? code;
  @JsonKey(name: "msg")
  final String? msg;
  @JsonKey(name: "data")
  final ImageResponse? imageResponse;

  CreateImageResponse ({
    this.code,
    this.msg,
    this.imageResponse,
  });

  factory CreateImageResponse.fromJson(Map<String, dynamic> json) {
    return _$CreateImageResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CreateImageResponseToJson(this);
  }
}

@JsonSerializable()
class ImageResponse {
  @JsonKey(name: "taskId")
  final String? taskId;
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "nsfw")
  final bool? nsfw;
  @JsonKey(name: "resultUrl")
  final String? resultUrl;
  @JsonKey(name: "isSync")
  final bool? isSync;
  @JsonKey(name: "result")
  final String? result;

  ImageResponse ({
    this.taskId,
    this.status,
    this.nsfw,
    this.resultUrl,
    this.isSync,
    this.result,
  });

  factory ImageResponse.fromJson(Map<String, dynamic> json) {
    return _$ImageResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ImageResponseToJson(this);
  }
}



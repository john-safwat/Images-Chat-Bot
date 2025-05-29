import 'package:json_annotation/json_annotation.dart';

part 'get_image_response.g.dart';

@JsonSerializable()
class GetImageResponse {
  @JsonKey(name: "code")
  final String? code;
  @JsonKey(name: "msg")
  final String? msg;
  @JsonKey(name: "data")
  final ImageURL? imageURL;

  GetImageResponse ({
    this.code,
    this.msg,
    this.imageURL,
  });

  factory GetImageResponse.fromJson(Map<String, dynamic> json) {
    return _$GetImageResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetImageResponseToJson(this);
  }
}

@JsonSerializable()
class ImageURL {
  @JsonKey(name: "taskId")
  final String? taskId;
  @JsonKey(name: "createTime")
  final int? createTime;
  @JsonKey(name: "updateTime")
  final int? updateTime;
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "businessId")
  final String? businessId;
  @JsonKey(name: "type")
  final String? type;
  @JsonKey(name: "resultUrl")
  final String? resultUrl;
  @JsonKey(name: "hasHsfw")
  final bool? hasHsfw;
  @JsonKey(name: "avatarResult")
  final dynamic? avatarResult;
  @JsonKey(name: "infomation")
  final dynamic? infomation;

  ImageURL ({
    this.taskId,
    this.createTime,
    this.updateTime,
    this.status,
    this.businessId,
    this.type,
    this.resultUrl,
    this.hasHsfw,
    this.avatarResult,
    this.infomation,
  });

  factory ImageURL.fromJson(Map<String, dynamic> json) {
    return _$ImageURLFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ImageURLToJson(this);
  }
}



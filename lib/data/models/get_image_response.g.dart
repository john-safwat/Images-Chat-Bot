// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_image_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetImageResponse _$GetImageResponseFromJson(Map<String, dynamic> json) =>
    GetImageResponse(
      code: json['code'] as String?,
      msg: json['msg'] as String?,
      imageURL: json['data'] == null
          ? null
          : ImageURL.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetImageResponseToJson(GetImageResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.imageURL,
    };

ImageURL _$ImageURLFromJson(Map<String, dynamic> json) => ImageURL(
      taskId: json['taskId'] as String?,
      createTime: (json['createTime'] as num?)?.toInt(),
      updateTime: (json['updateTime'] as num?)?.toInt(),
      status: (json['status'] as num?)?.toInt(),
      businessId: json['businessId'] as String?,
      type: json['type'] as String?,
      resultUrl: json['resultUrl'] as String?,
      hasHsfw: json['hasHsfw'] as bool?,
      avatarResult: json['avatarResult'],
      infomation: json['infomation'],
    );

Map<String, dynamic> _$ImageURLToJson(ImageURL instance) => <String, dynamic>{
      'taskId': instance.taskId,
      'createTime': instance.createTime,
      'updateTime': instance.updateTime,
      'status': instance.status,
      'businessId': instance.businessId,
      'type': instance.type,
      'resultUrl': instance.resultUrl,
      'hasHsfw': instance.hasHsfw,
      'avatarResult': instance.avatarResult,
      'infomation': instance.infomation,
    };

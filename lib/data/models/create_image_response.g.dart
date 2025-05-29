// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_image_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateImageResponse _$CreateImageResponseFromJson(Map<String, dynamic> json) =>
    CreateImageResponse(
      code: json['code'] as String?,
      msg: json['msg'] as String?,
      imageResponse: json['data'] == null
          ? null
          : ImageResponse.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateImageResponseToJson(
        CreateImageResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.imageResponse,
    };

ImageResponse _$ImageResponseFromJson(Map<String, dynamic> json) =>
    ImageResponse(
      taskId: json['taskId'] as String?,
      status: (json['status'] as num?)?.toInt(),
      nsfw: json['nsfw'] as bool?,
      resultUrl: json['resultUrl'] as String?,
      isSync: json['isSync'] as bool?,
      result: json['result'] as String?,
    );

Map<String, dynamic> _$ImageResponseToJson(ImageResponse instance) =>
    <String, dynamic>{
      'taskId': instance.taskId,
      'status': instance.status,
      'nsfw': instance.nsfw,
      'resultUrl': instance.resultUrl,
      'isSync': instance.isSync,
      'result': instance.result,
    };

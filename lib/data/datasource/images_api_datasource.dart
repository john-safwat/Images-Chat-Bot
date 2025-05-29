import 'package:chat_bot/data/models/create_image_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'images_api_datasource.g.dart';

@singleton
@RestApi(baseUrl: "https://api-b.fotor.com")
abstract class ImagesApiDatasource {
  @factoryMethod
  factory ImagesApiDatasource(Dio dio) = _ImagesApiDatasource;

  @POST("/v1/aiart/text2img")
  Future<CreateImageResponse> createImage(
    @Body() Map<String, dynamic> createImageRequest,
  );

  @GET("/v1/aiart/tasks/{taskId}")
  Future<CreateImageResponse> getImage(
    @Path("taskId") String taskId,
    @Header("Authorization") String apiKey,
  );
}

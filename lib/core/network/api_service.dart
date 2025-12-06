import 'package:dio/dio.dart';
import 'package:plantapp/features/home/data/models/categories_response.dart';
import 'package:plantapp/features/home/data/models/question_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('/getCategories')
  Future<CategoriesResponse> getCategories();

  @GET('/getQuestions')
  Future<List<QuestionModel>> getQuestions();
}

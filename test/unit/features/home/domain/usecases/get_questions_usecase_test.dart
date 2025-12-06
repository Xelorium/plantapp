import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plantapp/core/error/failures.dart';
import 'package:plantapp/features/home/data/models/question_model.dart';
import 'package:plantapp/features/home/domain/usecases/get_questions_usecase.dart';
import '../../../../../mocks/mock_dependencies.dart';

void main() {
  late GetQuestionsUseCase useCase;
  late MockHomeRepository mockRepository;

  setUp(() {
    mockRepository = MockHomeRepository();
    useCase = GetQuestionsUseCase(mockRepository);
  });

  group('GetQuestionsUseCase', () {
    const tQuestionList = [
      QuestionModel(
        id: 1,
        title: 'Test Question',
        subtitle: 'Test subtitle',
        imageUri: 'https://example.com/question.jpg',
        uri: 'test-question',
        order: 1,
      ),
    ];

    test('should get questions from the repository', () async {
      when(() => mockRepository.getQuestions())
          .thenAnswer((_) async => const Right(tQuestionList));

      final result = await useCase();

      expect(result, const Right(tQuestionList));
      verify(() => mockRepository.getQuestions()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return failure when repository call fails', () async {
      final tFailure = ServerFailure('Server error');
      when(() => mockRepository.getQuestions())
          .thenAnswer((_) async => Left(tFailure));

      final result = await useCase();

      expect(result, Left(tFailure));
      verify(() => mockRepository.getQuestions()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
import 'package:flutter_test/flutter_test.dart';
import 'package:plantapp/features/home/data/models/question_model.dart';

void main() {
  group('QuestionModel', () {
    const tQuestionModel = QuestionModel(
      id: 1,
      title: 'Test Question',
      subtitle: 'Test subtitle',
      imageUri: 'https://example.com/question.jpg',
      uri: 'test-question',
      order: 1,
    );

    const tJsonMap = {
      'id': 1,
      'title': 'Test Question',
      'subtitle': 'Test subtitle',
      'image_uri': 'https://example.com/question.jpg',
      'uri': 'test-question',
      'order': 1,
    };

    test('should create a valid QuestionModel instance', () {
      expect(tQuestionModel.id, equals(1));
      expect(tQuestionModel.title, equals('Test Question'));
      expect(tQuestionModel.subtitle, equals('Test subtitle'));
      expect(tQuestionModel.imageUri, equals('https://example.com/question.jpg'));
      expect(tQuestionModel.uri, equals('test-question'));
      expect(tQuestionModel.order, equals(1));
    });

    test('should create QuestionModel from JSON', () {
      final result = QuestionModel.fromJson(tJsonMap);

      expect(result, equals(tQuestionModel));
    });

    test('should convert QuestionModel to JSON', () {
      final result = tQuestionModel.toJson();

      expect(result['id'], equals(1));
      expect(result['title'], equals('Test Question'));
      expect(result['subtitle'], equals('Test subtitle'));
      expect(result['image_uri'], equals('https://example.com/question.jpg'));
      expect(result['uri'], equals('test-question'));
      expect(result['order'], equals(1));
    });

    test('should support equality comparison', () {
      const questionModel1 = QuestionModel(
        id: 1,
        title: 'Test',
        subtitle: 'Test subtitle',
        imageUri: 'test.jpg',
        uri: 'test',
        order: 1,
      );
      const questionModel2 = QuestionModel(
        id: 1,
        title: 'Test',
        subtitle: 'Test subtitle',
        imageUri: 'test.jpg',
        uri: 'test',
        order: 1,
      );

      expect(questionModel1, equals(questionModel2));
    });

    test('should handle JSON key mapping correctly for image_uri', () {
      const json = {
        'id': 2,
        'title': 'Another Question',
        'subtitle': 'Another subtitle',
        'image_uri': 'https://example.com/another.jpg',
        'uri': 'another-question',
        'order': 2,
      };

      final result = QuestionModel.fromJson(json);

      expect(result.imageUri, equals('https://example.com/another.jpg'));
    });
  });
}
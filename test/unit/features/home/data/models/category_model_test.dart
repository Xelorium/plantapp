import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:plantapp/features/home/data/models/category_model.dart';

void main() {
  group('CategoryModel', () {
    const tCategoryModel = CategoryModel(
      id: 1,
      name: 'test_category',
      title: 'Test Category',
      rank: 1,
      image: CategoryImage(
        id: 1,
        url: 'https://example.com/image.jpg',
      ),
    );

    const tJsonMap = {
      'id': 1,
      'name': 'test_category',
      'title': 'Test Category',
      'rank': 1,
      'image': {
        'id': 1,
        'url': 'https://example.com/image.jpg',
      },
    };

    test('should create a valid CategoryModel instance', () {
      expect(tCategoryModel.id, equals(1));
      expect(tCategoryModel.name, equals('test_category'));
      expect(tCategoryModel.title, equals('Test Category'));
      expect(tCategoryModel.rank, equals(1));
      expect(tCategoryModel.image?.id, equals(1));
      expect(tCategoryModel.image?.url, equals('https://example.com/image.jpg'));
    });

    test('should create CategoryModel from JSON', () {
      final result = CategoryModel.fromJson(tJsonMap);

      expect(result, equals(tCategoryModel));
    });

    test('should convert CategoryModel to JSON', () {
      final result = tCategoryModel.toJson();

      expect(result['id'], equals(1));
      expect(result['name'], equals('test_category'));
      expect(result['title'], equals('Test Category'));
      expect(result['rank'], equals(1));
      expect(result['image'], isA<Map<String, dynamic>>());
    });

    test('should support equality comparison', () {
      const categoryModel1 = CategoryModel(
        id: 1,
        name: 'test',
        title: 'Test',
        rank: 1,
        image: null,
      );
      const categoryModel2 = CategoryModel(
        id: 1,
        name: 'test',
        title: 'Test',
        rank: 1,
        image: null,
      );

      expect(categoryModel1, equals(categoryModel2));
    });

    test('should create CategoryModel with null image', () {
      const categoryWithoutImage = CategoryModel(
        id: 2,
        name: 'no_image',
        title: 'No Image Category',
        rank: 2,
        image: null,
      );

      expect(categoryWithoutImage.image, isNull);
    });
  });

  group('CategoryImage', () {
    const tCategoryImage = CategoryImage(
      id: 1,
      url: 'https://example.com/image.jpg',
    );

    const tJsonMap = {
      'id': 1,
      'url': 'https://example.com/image.jpg',
    };

    test('should create a valid CategoryImage instance', () {
      expect(tCategoryImage.id, equals(1));
      expect(tCategoryImage.url, equals('https://example.com/image.jpg'));
    });

    test('should create CategoryImage from JSON', () {
      final result = CategoryImage.fromJson(tJsonMap);

      expect(result, equals(tCategoryImage));
    });

    test('should convert CategoryImage to JSON', () {
      final result = tCategoryImage.toJson();

      expect(result['id'], equals(1));
      expect(result['url'], equals('https://example.com/image.jpg'));
    });
  });
}
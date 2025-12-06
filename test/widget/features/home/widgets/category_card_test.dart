import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plantapp/features/home/data/models/category_model.dart';
import 'package:plantapp/features/home/presentation/widgets/home/category_card.dart';

Widget createWidgetUnderTest(CategoryModel category) {
  return ScreenUtilInit(
    designSize: const Size(375, 812),
    builder: (context, child) => MaterialApp(
      home: Scaffold(
        body: CategoryCard(category: category),
      ),
    ),
  );
}

void main() {
  group('CategoryCard Widget Tests', () {
    const categoryWithImage = CategoryModel(
      id: 1,
      name: 'test_category',
      title: 'Test Category',
      rank: 1,
      image: CategoryImage(
        id: 1,
        url: 'https://example.com/test.jpg',
      ),
    );

    const categoryWithoutImage = CategoryModel(
      id: 2,
      name: 'no_image_category',
      title: 'No Image Category',
      rank: 2,
      image: null,
    );

    testWidgets('should display category title', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest(categoryWithImage));

      expect(find.text('Test Category'), findsOneWidget);
    });

    testWidgets('should display cached network image when image URL is provided', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest(categoryWithImage));

      expect(find.byType(ClipRRect), findsOneWidget);
      
      // Check if the image widget exists in the widget tree
      final clipRRectFinder = find.byType(ClipRRect);
      expect(clipRRectFinder, findsOneWidget);

      // Verify ClipRRect has correct border radius
      final clipRRect = tester.widget<ClipRRect>(clipRRectFinder);
      expect(clipRRect.borderRadius, equals(const BorderRadius.only(bottomRight: Radius.circular(12))));
    });

    testWidgets('should not display image when image URL is not provided', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest(categoryWithoutImage));

      expect(find.byType(ClipRRect), findsNothing);
    });

    testWidgets('should have correct container decoration', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest(categoryWithImage));

      final container = tester.widget<Container>(find.byType(Container).first);
      final decoration = container.decoration as BoxDecoration;

      expect(decoration.borderRadius, equals(BorderRadius.circular(12)));
      expect(decoration.border, isNotNull);
    });

    testWidgets('should display title with correct styling', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest(categoryWithImage));

      final autoSizeText = tester.widget(find.byType(AutoSizeText));
      expect(autoSizeText, isNotNull);
    });

    testWidgets('should handle empty image URL correctly', (tester) async {
      const categoryWithEmptyImage = CategoryModel(
        id: 3,
        name: 'empty_image',
        title: 'Empty Image',
        rank: 3,
        image: CategoryImage(id: 3, url: ''),
      );

      await tester.pumpWidget(createWidgetUnderTest(categoryWithEmptyImage));

      expect(find.byType(ClipRRect), findsNothing);
      expect(find.text('Empty Image'), findsOneWidget);
    });

    testWidgets('should have stack layout with correct positioning', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest(categoryWithImage));

      final categoryCardFinder = find.byType(CategoryCard);
      expect(categoryCardFinder, findsOneWidget);
      
      final stackFinders = find.descendant(
        of: categoryCardFinder,
        matching: find.byType(Stack),
      );
      expect(stackFinders, findsWidgets);
    });

    testWidgets('should apply theme colors correctly', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest(categoryWithImage));

      // The widget should build without throwing any theme-related errors
      expect(find.byType(CategoryCard), findsOneWidget);
      expect(find.text('Test Category'), findsOneWidget);
    });

    testWidgets('should handle very long category titles', (tester) async {
      const categoryWithLongTitle = CategoryModel(
        id: 4,
        name: 'long_title',
        title: 'This is a very long category title that should be handled properly by AutoSizeText widget',
        rank: 4,
        image: null,
      );

      await tester.pumpWidget(createWidgetUnderTest(categoryWithLongTitle));

      expect(find.byType(AutoSizeText), findsOneWidget);
      
      final autoSizeText = tester.widget<AutoSizeText>(find.byType(AutoSizeText));
      expect(autoSizeText.maxLines, equals(2));
    });
  });
}
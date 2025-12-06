import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plantapp/core/widgets/gradient_text.dart';

void main() {
  group('GradientText Widget Tests', () {
    const testText = 'Test Gradient Text';
    const testGradient = LinearGradient(
      colors: [Colors.blue, Colors.red],
    );

    testWidgets('should display text with gradient', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GradientText(
              testText,
              gradient: testGradient,
            ),
          ),
        ),
      );

      expect(find.text(testText), findsOneWidget);
      expect(find.byType(ShaderMask), findsOneWidget);
      expect(find.byType(Text), findsOneWidget);
    });

    testWidgets('should apply custom text style', (tester) async {
      const customStyle = TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      );

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GradientText(
              testText,
              gradient: testGradient,
              style: customStyle,
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.byType(Text));
      expect(textWidget.style, equals(customStyle));
    });

    testWidgets('should apply text alignment', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GradientText(
              testText,
              gradient: testGradient,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.byType(Text));
      expect(textWidget.textAlign, equals(TextAlign.center));
    });

    testWidgets('should use correct blend mode', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GradientText(
              testText,
              gradient: testGradient,
            ),
          ),
        ),
      );

      final shaderMask = tester.widget<ShaderMask>(find.byType(ShaderMask));
      expect(shaderMask.blendMode, equals(BlendMode.srcIn));
    });
  });

  group('GradientRichText Widget Tests', () {
    const testTextSpan = TextSpan(
      text: 'Rich ',
      style: TextStyle(fontWeight: FontWeight.bold),
      children: [
        TextSpan(
          text: 'Text',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
      ],
    );
    const testGradient = LinearGradient(
      colors: [Colors.green, Colors.yellow],
    );

    testWidgets('should display rich text with gradient', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GradientRichText(
              textSpan: testTextSpan,
              gradient: testGradient,
            ),
          ),
        ),
      );

      expect(find.byType(ShaderMask), findsOneWidget);
      expect(find.byType(RichText), findsOneWidget);
      expect(find.byType(RichText), findsOneWidget);
    });

    testWidgets('should apply text alignment with default left alignment', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GradientRichText(
              textSpan: testTextSpan,
              gradient: testGradient,
            ),
          ),
        ),
      );

      final richTextWidget = tester.widget<RichText>(find.byType(RichText));
      expect(richTextWidget.textAlign, equals(TextAlign.left));
    });

    testWidgets('should apply custom text alignment', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GradientRichText(
              textSpan: testTextSpan,
              gradient: testGradient,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );

      final richTextWidget = tester.widget<RichText>(find.byType(RichText));
      expect(richTextWidget.textAlign, equals(TextAlign.center));
    });

    testWidgets('should use correct blend mode', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GradientRichText(
              textSpan: testTextSpan,
              gradient: testGradient,
            ),
          ),
        ),
      );

      final shaderMask = tester.widget<ShaderMask>(find.byType(ShaderMask));
      expect(shaderMask.blendMode, equals(BlendMode.srcIn));
    });

    testWidgets('should preserve TextSpan styling', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GradientRichText(
              textSpan: testTextSpan,
              gradient: testGradient,
            ),
          ),
        ),
      );

      final richTextWidget = tester.widget<RichText>(find.byType(RichText));
      expect(richTextWidget.text, equals(testTextSpan));
    });
  });
}
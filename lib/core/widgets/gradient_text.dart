import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    required this.gradient,
    super.key,
    this.style,
    this.textAlign,
  });

  final String text;
  final Gradient gradient;
  final TextStyle? style;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return gradient.createShader(
          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
        );
      },
      blendMode: BlendMode.srcIn,
      child: Text(
        text,
        textAlign: textAlign,
        style: style,
      ),
    );
  }
}

class GradientRichText extends StatelessWidget {
  const GradientRichText({
    required this.textSpan,
    required this.gradient,
    super.key,
    this.textAlign,
  });

  final TextSpan textSpan;
  final Gradient gradient;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return gradient.createShader(
          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
        );
      },
      blendMode: BlendMode.srcIn,
      child: RichText(
        text: textSpan,
        textAlign: textAlign ?? TextAlign.left,
      ),
    );
  }
}

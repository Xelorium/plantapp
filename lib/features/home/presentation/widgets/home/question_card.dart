import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plantapp/features/home/data/models/question_model.dart';
import 'package:plantapp/core/theme/app_spacings.dart';
import 'package:plantapp/core/theme/app_text_styles.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({required this.question, super.key});

  final QuestionModel question;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: .7.sw,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSpacings.radius),
        image: DecorationImage(
          image: CachedNetworkImageProvider(question.imageUri),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSpacings.radius),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black.withValues(alpha: 0.8),
            ],
            stops: const [0.5, 1.0],
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: AppSpacings.s16, vertical: AppSpacings.s12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              question.title,
              style: AppTextStyles.bodyLarge(context).copyWith(color: Colors.white, fontWeight: FontWeight.w500),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

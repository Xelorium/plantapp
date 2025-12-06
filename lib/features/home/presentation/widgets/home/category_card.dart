import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plantapp/features/home/data/models/category_model.dart';
import 'package:plantapp/core/theme/app_spacings.dart';
import 'package:plantapp/core/theme/app_text_styles.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({required this.category, super.key});

  final CategoryModel category;

  String get imageUrl => category.image?.url ?? '';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(AppSpacings.radius),
        border: Border.all(color: theme.colorScheme.onSurface.withValues(alpha: 0.1)),
      ),
      child: Stack(
        children: [
          if (imageUrl.isNotEmpty) ...[
            Positioned(
              right: 0,
              bottom: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(AppSpacings.radius)),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  height: .4.sw,
                  fit: BoxFit.fitHeight,
                  errorWidget: (context, error, stackTrace) => const SizedBox.shrink(),
                ),
              ),
            ),
          ],
          Padding(
            padding: AppSpacings.cardPadding,
            child: SizedBox(
              width: .3.sw,
              child: AutoSizeText(
                category.title,
                style: AppTextStyles.sectionTitle.copyWith(fontSize: 18.sp),
                maxLines: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

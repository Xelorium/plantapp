import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plantapp/features/home/data/models/category_model.dart';

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
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colorScheme.onSurface.withValues(alpha: 0.1)),
      ),
      child: Stack(
        children: [
          if (imageUrl.isNotEmpty) ...[
            Positioned(
              right: 0,
              bottom: 0,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12)),
                child: Image.network(
                  imageUrl,
                  height: .4.sw,
                  fit: BoxFit.fitHeight,
                  errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
                ),
              ),
            ),
          ],
          Padding(
            padding: EdgeInsets.all(16.sp),
            child: SizedBox(
              width: .3.sw,
              child: AutoSizeText(
                category.title,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: theme.colorScheme.onSurface,
                ),
                maxLines: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

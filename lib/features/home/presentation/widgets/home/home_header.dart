import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plantapp/core/constants/app_constants.dart';
import 'package:plantapp/core/theme/app_spacings.dart';
import 'package:plantapp/core/theme/app_text_styles.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key, this.onSearchSubmitted});

  final void Function(String query)? onSearchSubmitted;

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSpacings.s24, vertical: AppSpacings.s16),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage(AppAssets.headerBackground),
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(theme.colorScheme.surface, BlendMode.modulate),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                child: Text(
                  AppStrings.hiPlantLover,
                  style: AppTextStyles.bodyLarge(context).copyWith(fontWeight: FontWeight.w400, color: theme.colorScheme.onSurface),
                ),
              ),
            ],
          ),
          SizedBox(height: 6.sp),
          Row(
            children: [
              Flexible(
                child: Text(
                  AppStrings.goodAfternoon,
                  style: AppTextStyles.h2(context).copyWith(color: theme.colorScheme.onSurface),
                ),
              ),
            ],
          ),
          SizedBox(height: AppSpacings.s16),
          TextField(
            controller: _searchController,
            textInputAction: TextInputAction.search,
            onTapUpOutside: (_) => FocusScope.of(context).unfocus(),
            onSubmitted: widget.onSearchSubmitted,
            decoration: InputDecoration(
              hintText: AppStrings.searchForPlants,
              prefixIcon: const Icon(Icons.search),
              suffixIcon: _searchController.text.isNotEmpty
                  ? GestureDetector(
                      onTap: () {
                        _searchController.clear();
                        FocusScope.of(context).unfocus();
                        widget.onSearchSubmitted?.call('');
                        setState(() {});
                      },
                      child: const Icon(Icons.clear),
                    )
                  : null,
              contentPadding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: AppSpacings.s16),
              filled: true,
              fillColor: theme.colorScheme.onPrimary.withValues(alpha: .88),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSpacings.radius),
                borderSide: BorderSide(color: theme.colorScheme.onSurface.withValues(alpha: 0.25)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSpacings.radius),
                borderSide: BorderSide(color: theme.colorScheme.onSurface.withValues(alpha: 0.25)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:plantapp/core/constants/app_constants.dart';

class SubscriptionPlan {
  const SubscriptionPlan({
    required this.id,
    required this.title,
    required this.subtitle,
    this.badgeText,
  });

  final String id;
  final String title;
  final String subtitle;
  final String? badgeText;

  static const List<SubscriptionPlan> availablePlans = [
    SubscriptionPlan(
      id: AppStrings.monthlyPlanId,
      title: AppStrings.monthlyPlanTitle,
      subtitle: AppStrings.monthlyPlanSubtitle,
    ),
    SubscriptionPlan(
      id: AppStrings.yearlyPlanId,
      title: AppStrings.yearlyPlanTitle,
      subtitle: AppStrings.yearlyPlanSubtitle,
      badgeText: AppStrings.yearlyPlanBadge,
    ),
  ];
}

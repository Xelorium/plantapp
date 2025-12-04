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
      id: 'monthly',
      title: '1 Month',
      subtitle: r'$32.99 per month, auto renewable',
    ),
    SubscriptionPlan(
      id: 'yearly',
      title: '1 Year',
      subtitle: r'First 3 days free, then $529,99/year',
      badgeText: 'Save 50%',
    ),
  ];
}

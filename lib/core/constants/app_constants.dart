abstract final class AppFonts {
  static const String primary = 'Roboto';
}

abstract final class AppConstants {
  static const String appName = 'PlantApp';
}

abstract final class AppUrls {
  static const String apiBaseUrl = 'https://dummy-api-jtg6bessta-ey.a.run.app';
}

abstract final class AppStrings {
  // General UI
  static const String onboardingSubtitle = 'Identify more than 3000+ plants and 88% accuracy.';
  static const String getStarted = 'Get Started';
  static const String continueText = 'Continue';
  
  // Navigation Labels
  static const String home = 'Home';
  static const String diagnose = 'Diagnose';
  static const String myGarden = 'My Garden';
  static const String profile = 'Profile';
  static const String scanner = 'Scanner';
  
  // Onboarding Content
  static const String takePhotoTo = 'Take a photo to ';
  static const String identify = 'identify';
  static const String thePlant = 'the plant!';
  static const String getPlant = 'Get plant ';
  static const String careGuides = 'care guides';
  
  // Welcome and Greeting
  static const String welcomeTo = 'Welcome to ';
  static const String hiPlantLover = 'Hi, plant lover!';
  static const String goodAfternoon = 'Good Afternoon! ⛅';
  static const String searchForPlants = 'Search for plants';
  
  // Premium Features
  static const String free = 'FREE ';
  static const String premiumAvailable = 'Premium Available';
  static const String premium = ' Premium';
  static const String tapToUpgrade = 'Tap to upgrade your account!';
  static const String accessAllFeatures = 'Access All Features';
  
  // Paywall Features
  static const String unlimited = 'Unlimited';
  static const String plantIdentify = 'Plant Identify';
  static const String faster = 'Faster';
  static const String process = 'Process';
  static const String detailed = 'Detailed';
  static const String plantCare = 'Plant care';
  static const String tryFor3Days = 'Try for 3 days';
  
  // Legal and Terms
  static const String byTappingNext = 'By tapping next, you are agreeing to PlantID\n';
  static const String termsOfUse = 'Terms of Use';
  static const String and = ' & ';
  static const String privacyPolicy = 'Privacy Policy';
  static const String period = '.';
  static const String terms = 'Terms';
  static const String privacy = 'Privacy';
  static const String restore = 'Restore';
  static const String bulletSeparator = '  •  ';
  
  // Subscription Plans
  static const String monthlyPlanId = 'monthly';
  static const String monthlyPlanTitle = '1 Month';
  static const String monthlyPlanSubtitle = r'$32.99 per month, auto renewable';
  static const String yearlyPlanId = 'yearly';
  static const String yearlyPlanTitle = '1 Year';
  static const String yearlyPlanSubtitle = r'First 3 days free, then $529,99/year';
  static const String yearlyPlanBadge = 'Save 50%';
  static const String paywallDisclaimer = r"After the 3-day free trial period you'll be charged ₺274.99 per year unless you cancel\nbefore the trial expires. Yearly Subscription is Auto-Renewable";
  
  // Empty States
  static const String empty = '';
}

abstract final class AppAssets {
  static const String getStartedBackground = 'assets/images/get_started_bg.png';
  static const String onboardingBackground1 = 'assets/images/onboarding_bg_1.png';
  static const String onboardingBackground2 = 'assets/images/onboarding_bg_2.png';
  static const String paywallBackground = 'assets/images/paywall_bg.png';
  static const String headerBackground = 'assets/images/header_bg.png';

  static const String brushLine = 'assets/images/brush_line.png';
  static const String mailIconSvg = 'assets/icons/mail_icon.svg';
  static const String rightArrowIconSvg = 'assets/icons/right_arrow_icon.svg';

  static const String scannerFeatureIconSvg = 'assets/icons/scanner_feature_icon.svg';
  static const String speedFeatureIconSvg = 'assets/icons/speed_feature_icon.svg';

  static const String navBarHomeSvg = 'assets/icons/navigation/home_icon.svg';
  static const String navBarDiagnoseSvg = 'assets/icons/navigation/diagnose_icon.svg';
  static const String navBarScannerSvg = 'assets/icons/navigation/scanner_icon.svg';
  static const String navBarGardenSvg = 'assets/icons/navigation/garden_icon.svg';
  static const String navBarProfileSvg = 'assets/icons/navigation/profile_icon.svg';
}

abstract final class AppMessages {
  static const String connectionError = 'Please check your internet connection.';

  static const String cacheError = 'A cache error occurred.';

  static const String timeoutError = 'The connection has timed out or there is no internet.';

  static const String serverError = 'A server error occurred.';

  static const String requestCancelled = 'The request was cancelled.';

  static const String unknownNetworkError = 'An unknown network error occurred.';

  static const String invalidCertificateError = 'An invalid certificate error occurred.';

  static const String unexpectedError = 'An unexpected error occurred.';

  static const String onboardingReadError = 'Onboarding status could not be read: ';

  static const String onboardingSaveError = 'Onboarding status could not be saved: ';
}

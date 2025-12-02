import 'package:flutter/material.dart';

class AppColors {
  // Primary Brand Colors
  /// The main green used for Buttons, Active States, and Highlights.
  /// Extracted from the "Continue" and "Try free for 3 days" buttons.
  static const Color primary = Color(0xFF28AF6E);
  static const Color onPrimary = Colors.white;
  
  // Secondary / Text Colors
  /// Used for main headlines (e.g., "Welcome to PlantApp").
  /// A very dark, almost black, jungle green.
  static const Color secondary = Color(0xFF13231B);
  static const Color onSecondary = Colors.white;

  // Backgrounds
  static const Color background = Color(0xFFFFFFFF);
  static const Color surface = Color(0xFFF5F5F5); // Light grey for inputs/backgrounds
  
  // Text
  static const Color textPrimary = Color(0xFF13231B);
  static const Color textSecondary = Color(0xFF979798); // Grey subtext
  static const Color textHint = Color(0xFFAFAFAF);
  static const Color textTerms = Color(0xFF597165);

  // Status & Accents
  static const Color premiumGold = Color(0xFFD4AF37); // For the Premium banner icon
  static const Color warning = Color(0xFFFFB020);
  static const Color error = Color(0xFFFF4B4B);

  // UI Elements
  static const Color border = Color(0xFFE5E7EB);
  static const Color divider = Color(0xFFF3F4F6);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  
  // Paywall Specific
  static const Color paywallBackground = Color(0xFF101E17); // Dark background for paywall
  static const Color paywallCardOverlay = Color(0x4D000000); // Semi-transparent black

  // Dark Theme Colors
  static const Color backgroundDark = Color(0xFF101E17); // Same as paywall background for consistency
  static const Color surfaceDark = Color(0xFF1C2923); // Slightly lighter for cards/inputs
  static const Color textPrimaryDark = Color(0xFFFFFFFF);
  static const Color textSecondaryDark = Color(0xFFB0B3B8);
  static const Color textHintDark = Color(0xFF6B7280);
}

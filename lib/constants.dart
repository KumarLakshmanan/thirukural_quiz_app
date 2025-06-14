import 'package:flutter/material.dart';

// Modern Color Palette
const kPrimaryColor = Color(0xFF6366F1); // Indigo
const kSecondaryColor = Color(0xFF8B5CF6); // Purple
const kAccentColor = Color(0xFF06B6D4); // Cyan
const kSurfaceColor = Color(0xFFFAFAFA); // Light gray
const kBackgroundColor = Color(0xFFFFFFFF); // White
const kCardColor = Color(0xFFF8FAFC); // Very light gray
const kTextPrimaryColor = Color(0xFF1E293B); // Dark slate
const kTextSecondaryColor = Color(0xFF64748B); // Slate gray
const kSuccessColor = Color(0xFF10B981); // Emerald
const kErrorColor = Color(0xFFEF4444); // Red
const kWarningColor = Color(0xFFF59E0B); // Amber

// Legacy colors for backward compatibility
const kGreenColor = Color(0xFF10B981);
const kRedColor = Color(0xFFEF4444);
const kGrayColor = Color(0xFF64748B);
const kBlackColor = Color(0xFF1E293B);

// Modern Gradients
const kPrimaryGradient = LinearGradient(
  colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

const kAccentGradient = LinearGradient(
  colors: [Color(0xFF06B6D4), Color(0xFF3B82F6)],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

const kSuccessGradient = LinearGradient(
  colors: [Color(0xFF10B981), Color(0xFF059669)],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

// Spacing and Layout
const double kDefaultPadding = 20.0;
const double kSmallPadding = 12.0;
const double kLargePadding = 32.0;
const double kDefaultRadius = 20.0;
const double kSmallRadius = 12.0;
const double kLargeRadius = 28.0;

// Shadows
const kCardShadow = [
  BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.08),
    offset: Offset(0, 4),
    blurRadius: 24,
    spreadRadius: 0,
  ),
];

const kElevatedShadow = [
  BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.12),
    offset: Offset(0, 8),
    blurRadius: 32,
    spreadRadius: 0,
  ),
];

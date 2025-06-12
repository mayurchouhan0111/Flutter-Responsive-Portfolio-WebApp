import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Base Colors
const Color kPrimaryTextColor = Colors.white;
const Color kSecondaryTextColor = Colors.grey;
const Color kAccentTextColor = Colors.cyanAccent;

/// Heading Text Style
final TextStyle headingTextStyle = GoogleFonts.poppins(
  color: kPrimaryTextColor,
  fontSize: 32,
  fontWeight: FontWeight.bold,
  letterSpacing: 1.0,
);

/// Subheading Text Style
final TextStyle subheadingTextStyle = GoogleFonts.poppins(
  color: kPrimaryTextColor.withOpacity(0.9),
  fontSize: 24,
  fontWeight: FontWeight.w600,
);

/// Body Text Style
final TextStyle bodyTextStyle = GoogleFonts.poppins(
  color: kSecondaryTextColor,
  fontSize: 16,
  fontWeight: FontWeight.w400,
  height: 1.5,
);

/// Small Caption Text Style
final TextStyle captionTextStyle = GoogleFonts.robotoMono(
  color: kSecondaryTextColor,
  fontSize: 12,
  fontWeight: FontWeight.w300,
  letterSpacing: 0.5,
);

/// Accent Text Style (for gradient or attention elements)
final TextStyle accentTextStyle = GoogleFonts.poppins(
  color: kAccentTextColor,
  fontSize: 20,
  fontWeight: FontWeight.w600,
);

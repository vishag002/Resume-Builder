import 'package:flutter/material.dart';

class TextConstants {
  // Name Heading (Bold, Large)
  static const TextStyle nameHeading = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.bold,
    fontSize: 32.0, // Large for the name at the top
    color: Colors.black,
  );

  // Section Heading (Bold, Medium)
  static const TextStyle sectionHeading = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.bold,
    fontSize: 20.0, // Section title like "Work Experience", "Education", etc.
    color: Colors.black87,
  );

  // Subheading (Medium Weight, Slightly Smaller)
  static const TextStyle subHeading = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
    fontSize: 16.0, // Job titles, Company names
    color: Colors.black54,
  );

  // Body Text (Normal, Regular)
  static const TextStyle bodyText = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.normal,
    fontSize: 14.0, // Regular text, e.g., job descriptions, skills
    color: Colors.black,
  );

  // Highlighted Body Text (Bold, Small)
  static const TextStyle highlightedText = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.bold,
    fontSize: 14.0, // Use for emphasizing key details, e.g., dates, locations
    color: Colors.black,
  );

  // Skills Section Text (Regular, Small)
  static const TextStyle skillsText = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.normal,
    fontSize: 14.0, // Skills, Technical abilities, etc.
    color: Colors.black,
  );

  // Footer Text (Light Weight, Small)
  static const TextStyle footerText = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w300,
    fontSize: 12.0, // Footer like contact info, email, LinkedIn
    color: Colors.black38,
  );
}

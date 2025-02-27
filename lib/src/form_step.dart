import 'package:flutter/material.dart';

/// Represents a single step in a multi-step form.
///
/// Each FormStep contains a title and a collection of form fields
/// that represent a logical grouping of input elements.
class FormStep {
  /// Creates a FormStep.
  ///
  /// The [title] parameter is required and displayed at the top of the step.
  /// The [fields] parameter is required and contains the form fields for this step.
  const FormStep({
    required this.title,
    required this.fields,
    this.subtitle,
  });

  /// The title displayed at the top of the form step.
  final String title;

  /// An optional subtitle displayed below the title.
  final String? subtitle;

  /// The list of form field widgets to display in this step.
  final List<Widget> fields;
}

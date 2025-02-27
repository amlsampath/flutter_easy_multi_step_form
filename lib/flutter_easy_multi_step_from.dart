/// A Flutter package that provides an easy-to-use multi-step form widget
/// with built-in validation and navigation capabilities.
///
/// This library includes:
/// * [MultiStepFormWidget] - The main widget for creating multi-step forms
/// * [FormStep] - Represents a single step in the form
/// * [EasyTextFormField] - A customizable form field widget
///
/// Example usage:
/// ```dart
/// MultiStepFormWidget(
///   steps: [
///     FormStep(
///       title: 'Personal Info',
///       fields: [
///         EasyTextFormField(
///           label: 'Name',
///           validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
///         ),
///       ],
///     ),
///   ],
/// )
/// ```
library flutter_easy_multi_step_from;

export 'src/form_step.dart';
export 'src/multi_step_form_widget.dart';
export 'src/easy_text_form_field.dart';

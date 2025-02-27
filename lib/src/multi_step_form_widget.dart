// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'theme/form_theme.dart';

import 'package:flutter_easy_multi_step_from/src/form_step.dart';
import 'package:flutter_easy_multi_step_from/src/multi_step_elevated_button.dart';

/// A widget that displays a multi-step form with navigation controls.
///
/// This widget manages the state and navigation between multiple form steps,
/// providing a consistent interface for collecting user input across multiple screens.
class MultiStepFormWidget extends StatefulWidget {
  /// Creates a MultiStepFormWidget.
  ///
  /// The [steps] parameter is required and contains the list of form steps to display.
  const MultiStepFormWidget({
    super.key,
    required this.steps,
    required this.onSubmit,
    this.nextButtonColor = Colors.black,
    this.prevButtonColor = Colors.white,
    this.submitButtonColor = Colors.white,
    this.nextButtonTextColor = Colors.white,
    this.prevButtonTextColor = Colors.black,
    this.submitButtonTextColor = Colors.green,
    this.stepIndicatorActiveColor = Colors.green,
    this.stepIndicatorDefaultColor = Colors.black,
    this.fontFamily = '',
  });

  /// The list of form steps to display.
  final List<FormStep> steps;

  /// Callback function called when all steps are completed.
  ///
  /// This function is called when the user reaches and completes the last step.
  final Function onSubmit;

  /// The color of the next button.
  final Color nextButtonColor;

  /// The color of the previous button.
  final Color prevButtonColor;

  /// The color of the submit button.
  final Color submitButtonColor;

  /// The color of the next button text.
  final Color nextButtonTextColor;

  /// The color of the previous button text.
  final Color prevButtonTextColor;

  /// The color of the submit button text.
  final Color submitButtonTextColor;

  /// The color of the active step indicator.
  final Color stepIndicatorActiveColor;

  /// The color of the default step indicator.
  final Color stepIndicatorDefaultColor;

  /// The font family to use for text in the form.
  final String fontFamily;

  @override
  State<MultiStepFormWidget> createState() => _MultiStepFormWidgetState();
}

class _MultiStepFormWidgetState extends State<MultiStepFormWidget>
    with SingleTickerProviderStateMixin {
  int _currentStep = 0;

  late List<GlobalKey<FormState>> formKeys;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    initFormGlobalKeys();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  initFormGlobalKeys() {
    setState(() {
      formKeys = List.generate(
        widget.steps.length,
        (index) => GlobalKey<FormState>(),
      );
    });
  }

  Widget _buildStepIndicator(int index, String title) {
    bool isActive = _currentStep == index;
    bool isPast = _currentStep > index;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isPast
                  ? widget.stepIndicatorActiveColor
                  : isActive
                      ? widget.stepIndicatorActiveColor
                      : widget.stepIndicatorDefaultColor.withAlpha(26),
              border: Border.all(
                color: isActive
                    ? widget.stepIndicatorActiveColor
                    : Colors.transparent,
                width: 2,
              ),
            ),
            child: Center(
              child: isPast
                  ? Icon(Icons.check, color: Colors.white, size: 20)
                  : Text(
                      '${index + 1}',
                      style: TextStyle(
                        color: isActive
                            ? Colors.white
                            : widget.stepIndicatorDefaultColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              color: isActive
                  ? widget.stepIndicatorActiveColor
                  : widget.stepIndicatorDefaultColor,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Form(
        key: formKeys[_currentStep],
        child: Scaffold(
          body: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(FormTheme.spacing),
                decoration: FormTheme.cardDecoration,
                child: Column(
                  children: [
                    LinearProgressIndicator(
                      value: (_currentStep + 1) / widget.steps.length,
                      backgroundColor:
                          widget.stepIndicatorDefaultColor.withAlpha(26),
                      valueColor: AlwaysStoppedAnimation(
                          widget.stepIndicatorActiveColor),
                      minHeight: 4,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    const SizedBox(height: FormTheme.spacing),
                    SizedBox(
                      height: 80,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.steps.length,
                        itemBuilder: (context, index) => _buildStepIndicator(
                          index,
                          widget.steps[index].title,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(FormTheme.spacing),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.steps[_currentStep].title,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: FormTheme.secondaryColor,
                            fontFamily: widget.fontFamily.isEmpty
                                ? GoogleFonts.poppins().fontFamily
                                : widget.fontFamily,
                          ),
                        ),
                        const SizedBox(height: FormTheme.spacing),
                        ...widget.steps[_currentStep].fields,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          bottomSheet: Container(
            padding: const EdgeInsets.all(FormTheme.spacing),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(13),
                  blurRadius: 10,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              children: [
                if (_currentStep != 0)
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: MultiStepElevatedButton(
                        onPressed: () {
                          _animationController.reverse().then((_) {
                            setState(() => _currentStep--);
                            _animationController.forward();
                          });
                        },
                        text: 'Previous',
                        foregroundColor: widget.prevButtonTextColor,
                        backgroundColor: widget.prevButtonColor,
                      ),
                    ),
                  ),
                Expanded(
                  flex: 5,
                  child: MultiStepElevatedButton(
                    onPressed: () {
                      if (formKeys[_currentStep].currentState!.validate()) {
                        if (_currentStep < widget.steps.length - 1) {
                          _animationController.reverse().then((_) {
                            setState(() => _currentStep++);
                            _animationController.forward();
                          });
                        } else {
                          widget.onSubmit();
                        }
                      }
                    },
                    foregroundColor: _currentStep == widget.steps.length - 1
                        ? widget.submitButtonTextColor
                        : widget.nextButtonTextColor,
                    text: _currentStep == widget.steps.length - 1
                        ? 'Submit'
                        : 'Continue',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

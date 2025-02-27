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
    this.formBackgroundColor = Colors.white,
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

  /// The color of the default step indicator.
  final Color formBackgroundColor;

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

  Widget _buildStepIndicator(int index, String title, BuildContext context) {
    bool isActive = _currentStep == index;
    bool isPast = _currentStep > index;
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isPast || isActive
                      ? widget.stepIndicatorActiveColor
                      : isDark
                          ? Colors.white10
                          : Colors.grey[200],
                  boxShadow: isPast || isActive
                      ? [
                          BoxShadow(
                            color: widget.stepIndicatorActiveColor
                                .withOpacity(0.4),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          )
                        ]
                      : null,
                ),
                child: Center(
                  child: isPast
                      ? Icon(Icons.check, color: Colors.white, size: 22)
                      : Text(
                          '${index + 1}',
                          style: TextStyle(
                            color: isActive
                                ? Colors.white
                                : isDark
                                    ? Colors.white70
                                    : Colors.grey[600],
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
              if (index < widget.steps.length - 1)
                Positioned(
                  right: -25,
                  child: Container(
                    width: 25,
                    height: 2,
                    color: isPast
                        ? widget.stepIndicatorActiveColor
                        : isDark
                            ? Colors.white10
                            : Colors.grey[300],
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 13,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              color: isActive
                  ? widget.stepIndicatorActiveColor
                  : isDark
                      ? Colors.white70
                      : Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      child: Form(
        key: formKeys[_currentStep],
        child: Scaffold(
          body: Column(
            children: [
              Container(
                padding: EdgeInsets.all(size.width * 0.04),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  boxShadow: [
                    BoxShadow(
                      color: isDark
                          ? Colors.black38
                          : Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: (_currentStep + 1) / widget.steps.length,
                        backgroundColor: isDark
                            ? Colors.white10
                            : widget.stepIndicatorDefaultColor.withAlpha(15),
                        valueColor: AlwaysStoppedAnimation(
                            widget.stepIndicatorActiveColor),
                        minHeight: 6,
                      ),
                    ),
                    const SizedBox(height: FormTheme.spacing * 1.5),
                    SizedBox(
                      height: 85,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.steps.length,
                        itemBuilder: (context, index) => _buildStepIndicator(
                          index,
                          widget.steps[index].title,
                          context,
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
                    padding: EdgeInsets.only(
                        top: size.width * 0.04,
                        left: size.width * 0.02,
                        right: size.width * 0.02),
                    child: Card(
                      elevation: isDark ? 2 : 1,
                      shadowColor:
                          isDark ? Colors.black : Colors.black.withOpacity(0.2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(size.width * 0.02),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.steps[_currentStep].title,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: isDark ? Colors.white : Colors.black87,
                              ),
                            ),
                            const SizedBox(height: FormTheme.spacing * 1),
                            ...widget.steps[_currentStep].fields,
                            SizedBox(height: size.height * 0.1),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          bottomSheet: Container(
            padding: EdgeInsets.all(size.width * 0.04),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              boxShadow: [
                BoxShadow(
                  color:
                      isDark ? Colors.black38 : Colors.black.withOpacity(0.05),
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
                    backgroundColor: _currentStep == widget.steps.length - 1
                        ? widget.stepIndicatorActiveColor
                        : widget.nextButtonColor,
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

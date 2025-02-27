// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    this.submitButtonColor = Colors.green,
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

  /// The color of the active step indicator.
  final Color stepIndicatorActiveColor;

  /// The color of the default step indicator.
  final Color stepIndicatorDefaultColor;

  /// The font family to use for text in the form.
  final String fontFamily;

  @override
  State<MultiStepFormWidget> createState() => _MultiStepFormWidgetState();
}

class _MultiStepFormWidgetState extends State<MultiStepFormWidget> {
  int _currentStep = 0;

  late List<GlobalKey<FormState>> formKeys;
  @override
  void initState() {
    super.initState();
    initFormGlobalKeys();
  }

  initFormGlobalKeys() {
    setState(() {
      formKeys = List.generate(
        widget.steps.length,
        (index) => GlobalKey<FormState>(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    String fontFamily = widget.fontFamily.isEmpty
        ? GoogleFonts.poppins().fontFamily!
        : widget.fontFamily;

    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Form(
        key: formKeys[_currentStep],
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.08,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.steps.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                  left: 13,
                                  right: 13,
                                  top: 5,
                                  bottom: 5,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: _currentStep == index
                                      ? widget.stepIndicatorActiveColor
                                      : widget.stepIndicatorDefaultColor,
                                ),
                                child: Text(
                                  (index + 1).toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                    fontFamily: fontFamily,
                                  ),
                                ),
                              ),
                              Text(
                                widget.steps[index].title,
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: _currentStep == index
                                      ? widget.stepIndicatorActiveColor
                                      : widget.stepIndicatorDefaultColor,
                                  fontFamily: fontFamily,
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                width: size.width * .15,
                                height: 3,
                                color: _currentStep == index
                                    ? widget.stepIndicatorActiveColor
                                    : widget.stepIndicatorDefaultColor,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Column(children: widget.steps[_currentStep].fields),
                ],
              ),
            ),
          ),
          bottomSheet: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (_currentStep != 0)
                  Expanded(
                    child: MultiStepElevatedButton(
                      backgroundColor: widget.prevButtonColor,
                      foregroundColor: Colors.black,
                      onPressed: () {
                        setState(() {
                          _currentStep--;
                        });
                      },
                      text: 'Previous',
                    ),
                  ),
                SizedBox(width: 10),
                if (_currentStep != widget.steps.length - 1)
                  Expanded(
                    child: MultiStepElevatedButton(
                      backgroundColor: widget.nextButtonColor,
                      text: 'Next',
                      onPressed: () {
                        if (formKeys[_currentStep].currentState!.validate()) {
                          setState(() {
                            _currentStep++;
                          });
                        }
                      },
                    ),
                  ),
                if (_currentStep == widget.steps.length - 1)
                  Expanded(
                    child: MultiStepElevatedButton(
                      backgroundColor: widget.submitButtonColor,
                      onPressed: () {
                        if (formKeys[_currentStep].currentState!.validate()) {
                          widget.onSubmit();
                        }
                      },
                      text: 'Submit',
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

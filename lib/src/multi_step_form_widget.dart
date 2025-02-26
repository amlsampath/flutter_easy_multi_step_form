import 'package:flutter/material.dart';
import 'package:flutter_easy_multi_step_from/src/form_step.dart';

class MultiStepFormWidget extends StatefulWidget {
  final List<FormStep> steps;
  final Function onSubmit;
  const MultiStepFormWidget({
    super.key,
    required,
    required this.steps,
    required this.onSubmit,
  });

  @override
  State<MultiStepFormWidget> createState() => _MultiStepFormWidgetState();
}

class _MultiStepFormWidgetState extends State<MultiStepFormWidget> {
  int _currentStep = 0;
  bool isStepping = true;
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
      isStepping = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isStepping
        ? CircularProgressIndicator()
        : SafeArea(
          child: Form(
            key: formKeys[_currentStep],
            child: Scaffold(
              body: Column(
                children: [
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.steps.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _currentStep = index;
                            });
                          },
                          child: Container(
                            width: 100,
                            child: Text(widget.steps[index].title),
                          ),
                        );
                      },
                    ),
                  ),
                  Column(children: widget.steps[_currentStep].content),
                ],
              ),
              bottomSheet: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (_currentStep != 0)
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _currentStep--;
                        });
                      },
                      child: Text('Previous'),
                    ),
                  if (_currentStep != widget.steps.length - 1)
                    ElevatedButton(
                      onPressed: () {
                        if (formKeys[_currentStep].currentState!.validate()) {
                          setState(() {
                            _currentStep++;
                          });
                        }
                      },
                      child: Text('Next'),
                    ),
                  if (_currentStep == widget.steps.length - 1)
                    ElevatedButton(
                      onPressed: () {
                        if (formKeys[_currentStep].currentState!.validate()) {
                          widget.onSubmit();
                        }
                      },
                      child: Text('Submit'),
                    ),
                ],
              ),
            ),
          ),
        );
  }
}

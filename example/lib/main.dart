import 'package:flutter/material.dart';
import 'package:flutter_easy_multi_step_form/flutter_easy_multi_step_form.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multistep Registration Form',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(), // Light theme
      darkTheme: ThemeData.dark(), // Dark theme
      themeMode: ThemeMode.dark,
      home: const ProfileCreationForm(),
    );
  }
}

class ProfileCreationForm extends StatefulWidget {
  const ProfileCreationForm({super.key});

  @override
  _ProfileCreationFormState createState() => _ProfileCreationFormState();
}

class _ProfileCreationFormState extends State<ProfileCreationForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Controllers for text form fields
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController streetAddressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController jobTitleController = TextEditingController();
  final TextEditingController experienceController = TextEditingController();
  final TextEditingController contactNameController = TextEditingController();
  final TextEditingController relationshipController = TextEditingController();
  final TextEditingController contactPhoneController = TextEditingController();
  final TextEditingController contactMethodController = TextEditingController();
  final TextEditingController newsletterController = TextEditingController();
  final TextEditingController additionalNotesController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Registration'),
        centerTitle: false,
      ),
      body: Form(
        key: _formKey,
        child: MultiStepFormWidget(
          onSubmit: () {
            if (_formKey.currentState!.validate()) {
              print('Form submitted');
            }
          },
          steps: [
            FormStep(
              title: 'Personal Info',
              fields: [
                const Text('Enter your personal details:'),
                EasyTextFormField(
                  controller: firstNameController,
                  label: 'First Name',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'First name is required';
                    }
                    return null;
                  },
                ),
                EasyTextFormField(
                  controller: lastNameController,
                  label: 'Last Name',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Last name is required';
                    }
                    return null;
                  },
                ),
                EasyTextFormField(
                  controller: dobController,
                  label: 'Date of Birth',
                  keyboardType: TextInputType.datetime,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Date of birth is required';
                    }
                    return null;
                  },
                ),
                EasyTextFormField(
                  controller: phoneController,
                  label: 'Phone Number',
                  keyboardType: TextInputType.phone,
                ),
              ],
            ),
            FormStep(
              title: 'Address Info',
              fields: [
                const Text('Enter your address details:'),
                EasyTextFormField(
                  controller: streetAddressController,
                  label: 'Street Address',
                ),
                EasyTextFormField(
                  controller: cityController,
                  label: 'City',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'City is required';
                    }
                    return null;
                  },
                ),
                EasyTextFormField(
                  controller: stateController,
                  label: 'State/Province',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Postal code is required';
                    }
                    return null;
                  },
                ),
                EasyTextFormField(
                  controller: postalCodeController,
                  label: 'Postal Code',
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Postal code is required';
                    }
                    return null;
                  },
                ),
                EasyTextFormField(
                  controller: countryController,
                  label: 'Country',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Country is required';
                    }
                    return null;
                  },
                ),
              ],
            ),
            FormStep(
              title: 'Account Settings',
              fields: [
                const Text('Set up your account credentials:'),
                EasyTextFormField(
                  controller: emailController,
                  label: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email is required';
                    } else if (!RegExp(
                      r'^[^@]+@[^@]+\.[^@]+',
                    ).hasMatch(value)) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                ),
                EasyTextFormField(
                  controller: usernameController,
                  label: 'Username',
                ),
                EasyTextFormField(
                  controller: passwordController,
                  label: 'Password',
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password is required';
                    } else if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                EasyTextFormField(
                  controller: confirmPasswordController,
                  label: 'Confirm Password',
                  obscureText: true,
                ),
              ],
            ),
            //FormStep(
            //   title: 'Employment Info',
            //   fields: [
            //     const Text('Enter your employment details:'),
            //     EasyTextFormField(
            //       controller: companyController,
            //       label: 'Company Name',
            //     ),
            //     EasyTextFormField(
            //       controller: jobTitleController,
            //       label: 'Job Title',
            //     ),
            //     EasyTextFormField(
            //       controller: experienceController,
            //       label: 'Years of Experience',
            //       keyboardType: TextInputType.number,
            //     ),
            //   ],
            // ),
            // FormStep(
            //   title: 'Emergency Contact',
            //   fields: [
            //     const Text('Enter an emergency contact:'),
            //     EasyTextFormField(
            //       controller: contactNameController,
            //       label: 'Contact Name',
            //     ),
            //     EasyTextFormField(
            //       controller: relationshipController,
            //       label: 'Relationship',
            //     ),
            //     EasyTextFormField(
            //       controller: contactPhoneController,
            //       label: 'Contact Phone Number',
            //       keyboardType: TextInputType.phone,
            //     ),
            //   ],
            // ),
            // FormStep(
            //   title: 'Preferences',
            //   fields: [
            //     const Text('Select your preferences:'),
            //     EasyTextFormField(
            //       controller: contactMethodController,
            //       label: 'Preferred Contact Method (Email/Phone)',
            //     ),
            //     EasyTextFormField(
            //       controller: newsletterController,
            //       label: 'Newsletter Subscription (Yes/No)',
            //     ),
            //     EasyTextFormField(
            //       controller: additionalNotesController,
            //       label: 'Additional Notes',
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}

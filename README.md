# **Flutter Easy Multi-Step Form**

A Flutter package designed to streamline the creation of multi-step forms with built-in validation, customizable UI components, and seamless navigation.

---

## **Features**

✅ Simple and intuitive multi-step form implementation\
✅ Integrated form validation for a seamless user experience\
✅ Fully customizable UI components\
✅ Step-by-step navigation with real-time progress tracking

---

## **Installation**

Add the package to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter_easy_multi_step_form: ^1.0.3
```

Run the following command to install the package:

```sh
flutter pub get
```

---

## **Usage**

```dart
import 'package:flutter_easy_multi_step_form/flutter_easy_multi_step_form.dart';

final form = MultiStepFormWidget(
  // Required callback
  onSubmit: () {
    if (_formKey.currentState!.validate()) {
      print('Form submitted successfully');
    }
  },
  
  // Define form steps
  steps: [
    // Step 1
    FormStep(
      title: 'Personal Information',
      fields: [
        EasyTextFormField(
          controller: firstNameController,
          label: 'First Name',
          validator: (value) => value!.isEmpty ? 'First name is required' : null,
        ),
        TextFormField(
          decoration: InputDecoration(labelText: 'Last Name'),
        ),
      ],
    ),
    
    // Step 2
    FormStep(
      title: 'Contact Details',
      fields: [
        EasyTextFormField(
          controller: emailController,
          label: 'Email',
          validator: (value) => value!.isEmpty ? 'Email is required' : null,
        ),
        TextFormField(
          decoration: InputDecoration(labelText: 'Username'),
        ),
      ],
    ),
  ],
  
  // Customizable button styles
  nextButtonColor: const Color(0xFF2196F3),
  prevButtonColor: const Color(0xFF424242),
  submitButtonColor: const Color(0xFF4CAF50),
  nextButtonTextColor: Colors.white,
  prevButtonTextColor: Colors.white,
  submitButtonTextColor: Colors.white,
  stepIndicatorActiveColor: const Color(0xFF2196F3),
  stepIndicatorDefaultColor: const Color(0xFF757575),
);
```

---

## **Live Demo**

### **Light Mode**
<div style="display: flex; justify-content: center; gap: 20px;">
  <img src="https://appmastersinstitute.com/assets/Screenshot_1740664878.png" alt="Light Mode" width="400">
  <img src="https://appmastersinstitute.com/assets/ios-light.png" alt="Dark Mode" width="400">
</div>

🔗 **[Watch Demo](https://www.youtube.com/shorts/DQpwuJ1mlLo)**

### **Dark Mode**
<div style="display: flex; justify-content: center; gap: 20px;">
  <img src="https://appmastersinstitute.com/assets/Screenshot_1740665232.png" alt="Light Mode" width="400">
  <img src="https://appmastersinstitute.com/assets/ios-dark.png" alt="Dark Mode" width="400">
</div>

🔗 **[Watch Demo](https://www.youtube.com/shorts/e-lStGjX6P0)**

---

## **Additional Resources**

For detailed documentation and more examples, visit our official [GitHub Repository](https://github.com/amlsampath/flutter_easy_multi_step_form).

**Stay updated with the latest features and improvements by following our project.**

---


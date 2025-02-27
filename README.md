# **Flutter Easy Multi-Step Form**  

A Flutter package that simplifies the creation of multi-step forms with built-in validation and navigation.  

## **Features**  

✅ Easy-to-implement multi-step forms  
✅ Built-in form validation  
✅ Customizable UI components  
✅ Step navigation with progress tracking  

## **Getting Started**  

Add the package to your `pubspec.yaml`:  

```yaml
dependencies:
  flutter_easy_multi_step_form: ^1.0.3
```

## **Usage**  

```dart
import 'package:flutter_easy_multi_step_form/flutter_easy_multi_step_form.dart';

final form = MultiStepFormWidget(
  steps: [
    FormStep(
      title: 'Personal Info',
      fields: [
        // Use our predefined widgets
        EasyTextFormField(
          label: 'Name',
          validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
        ),
        // Or your own widget
        TextFormField(),
      ],
    ),
  ],
);
```

## **Demo**  

### **Light Mode**  
<img src="https://appmastersinstitute.com/assets/Screenshot_1740664878.png" alt="Light Mode" width="400">


🔗 **[Watch Demo](https://www.youtube.com/shorts/DQpwuJ1mlLo)**  

### **Dark Mode**  
<img src="https://appmastersinstitute.com/assets/Screenshot_1740665232.png" alt="Light Mode" width="400">

🔗 **[Watch Demo](https://www.youtube.com/shorts/e-lStGjX6P0)**  

## **Additional Information**  

For more examples and detailed documentation, visit the [GitHub Repository](https://github.com/amlsampath/flutter_easy_multi_step_form).  

---

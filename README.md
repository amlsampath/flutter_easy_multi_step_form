# Flutter Easy Multi Step Form

A Flutter package that simplifies the creation of multi-step forms with built-in validation and navigation.

## Features

- Easy to implement multi-step forms
- Built-in form validation
- Customizable UI components
- Step navigation with progress tracking
- Form state management

## Getting started

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_easy_multi_step_from: ^1.0.0
```

## Usage

```dart
import 'package:flutter_easy_multi_step_from/flutter_easy_multi_step_from.dart';

final form = MultiStepFormWidget(
  steps: [
    FormStep(
      title: 'Personal Info',
      fields: [
        EasyTextFormField(
          label: 'Name',
          validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
        ),
      ],
    ),
  ],
);
```

## Additional information

For more examples and documentation, visit the [repository](https://github.com/yourusername/flutter_easy_multi_step_from).
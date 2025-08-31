import 'package:flutter/material.dart';

class FormSubmitHelper {
  static void handleSubmit({
    required BuildContext context,
    required GlobalKey<FormState> formKey,
    required VoidCallback onSuccess,
    VoidCallback? onFailure,
    String failureMessage = "Please fill all mandatory fields",
  }) {
    if (formKey.currentState?.validate() ?? false) {
      onSuccess();
    } else {
      onFailure?.call();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(failureMessage)),
      );
    }
  }
}
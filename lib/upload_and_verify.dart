import 'package:flutter/material.dart';

class UploadAndVerify {

Widget buildUploadField(
      {required String label, required TextEditingController controller, bool isRequired = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: label,
            style: const TextStyle(
                fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500),
            children: isRequired
                ? [
                    const TextSpan(
                      text: ' *',
                      style: TextStyle(color: Colors.red),
                    ),
                  ]
                : [],
          ),
        ),
        const SizedBox(height: 6),
        SizedBox(
          height: 48,
          child: TextFormField(
            controller: controller,
            readOnly: true,
            validator: (value) {
              if (isRequired && (value == null || value.isEmpty)) {
                return '';
              }
              return null;
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(color: Colors.grey, width: 1),
              ),
              suffix: GestureDetector(
                onTap: () {
                  // TODO: Add photo/video picker logic here
                  // Example:
                  // controller.text = "file_name.jpg";
                },
                child: const Text(
                  "upload",
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label.toLowerCase().contains('video')
              ? "MP4 Upto 10MB"
              : "JPG, JPEG, PNG, PDF Upto 5MB",
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
        const SizedBox(height: 12),
      ],
    );
  }



  
   Widget buildVerifyField(
      {required String label, required TextEditingController controller, bool isRequired = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: label,
            style: const TextStyle(
                fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500),
            children: isRequired
                ? [
                    const TextSpan(
                      text: ' *',
                      style: TextStyle(color: Colors.red),
                    ),
                  ]
                : [],
          ),
        ),
        const SizedBox(height: 6),
        SizedBox(
          height: 48,
          child: TextFormField(
            controller: controller,
            readOnly: true,
            validator: (value) {
              if (isRequired && (value == null || value.isEmpty)) {
                return '';
              }
              return null;
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(color: Colors.grey, width: 1),
              ),
              suffix: GestureDetector(
                onTap: () {
                  // TODO: Add photo/video picker logic here
                  // Example:
                  // controller.text = "file_name.jpg";
                },
                child: const Text(
                  "Verify",
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label.toLowerCase().contains('video')
              ? "MP4 Upto 10MB"
              : "JPG, JPEG, PNG, PDF Upto 5MB",
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
        const SizedBox(height: 12),
      ],
    );
  }



}
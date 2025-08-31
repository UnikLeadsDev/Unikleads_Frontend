// lib/helpers/details_form_helper.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsFormHelper {
  // Section Title
  static Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 8),
      child: Text(
        title,
        style: TextStyle(
          color: Color.fromRGBO(70, 53, 254, 1),
          fontWeight: FontWeight.bold,
            fontSize: 14.sp,
        ),
      ),

      
    );
  }

  // Inside DetailsFormHelper
static Widget sectionTitleWithSkip({
  required String title,
  required VoidCallback onSkip,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style:  TextStyle(
           color: Color.fromRGBO(70, 53, 254, 1),
          fontWeight: FontWeight.bold,
           fontSize: 14.sp,
          ),
        ),
        GestureDetector(
          onTap: onSkip,
          child:  Text(
            "SKIP",
           style: TextStyle(
                            color: Color.fromRGBO(70, 53, 254, 1),
          fontWeight: FontWeight.bold,
          fontSize: 14.sp,
          ),

        ),
        )
      ],
    ),
  );
}


  // Text Field
  static Widget buildTextField(
    TextEditingController controller,
    String hintText, {
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: (val) =>
            val == null || val.isEmpty ? "This field is required" : null,
        decoration: inputDecoration().copyWith(hintText: hintText),
      ),
    );
  }

  // Date Picker
  static Widget buildDatePicker(
    BuildContext context,
    String label,
    DateTime? date,
    ValueChanged<DateTime?> onPick,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: InkWell(
        onTap: () async {
          final picked = await showDatePicker(
            context: context,
            initialDate: DateTime(2000),
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
          );
          if (picked != null) onPick(picked);
        },
        child: InputDecorator(
          decoration: inputDecoration(),
          child: Text(
            date == null ? label : date.toLocal().toString().split(' ')[0],
            style: TextStyle(
              color: date == null ? Colors.grey : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  // Dropdown
  static Widget buildDropdownField({
    required String? value,
    required String hint,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: DropdownButtonFormField<String>(
        value: value,
        hint: Text(hint),
        items: items
            .map((e) => DropdownMenuItem(value: e, child: Text(e)))
            .toList(),
        onChanged: onChanged,
        validator: (val) =>
            val == null || val.isEmpty ? "This field is required" : null,
        decoration: inputDecoration(),
      ),
    );
  }

  // Radio Button
  static Widget buildRadioButton({
    required String value,
    required String groupValue,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: groupValue == value ? Colors.blue : Colors.grey,
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      child: RadioListTile<String>(
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
        title: Text(value),
        dense: true,
        contentPadding: EdgeInsets.zero,
      ),
    );
  }

  // Input Decoration
  static InputDecoration inputDecoration() {
    return InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
    );
  }
}

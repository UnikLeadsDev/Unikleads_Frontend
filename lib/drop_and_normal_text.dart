import 'package:flutter/material.dart';

class DropdownAndNormaltext  {

 

    Widget sectionTitle1(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 16.0),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
//for asterix
Widget sectionTitle(String title, {bool isRequired = false}) {
  return Text.rich(
    TextSpan(
      text: title,
      style: const TextStyle(
        color: Color.fromRGBO(70, 53, 254, 1), // your default title color
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      children: isRequired
          ? const [
              TextSpan(
                text: " *",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]
          : [],
    ),
  );
}

  
  Widget buildDropdownField({
    required String label,
    String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged, required String hint,
    bool isRequired = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
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
          DropdownButtonFormField<String>(
            value: value,
            hint: Text(label.isEmpty ? hint : label),
            items: items
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
            onChanged: onChanged,
            validator: (val) =>
                val == null || val.isEmpty ? "This field is required" : null,
            decoration: inputDecoration(),
          ),
        ],
      ),
    );
  }

InputDecoration inputDecoration() {
    return InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
    );
  }


Widget buildTextField({
  required TextEditingController controller,
  required String label,
  String? title,
  TextInputType? keyboardType,
  bool isRequired = true,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 12.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            // text: label,
            style: const TextStyle(
                fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500),
            children: isRequired
                ? [
                    const TextSpan(
                      text: ' ',
                      style: TextStyle(color: Colors.red),
                    ),
                  ]
                : [],
          ),
        ),
        if(title != null)
        Padding(
          padding: const EdgeInsets.only(bottom:8.0),
          child: Text(title),
        ),
        
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          validator: (val) =>
              val == null || val.isEmpty ? "This field is required" : null,
          decoration: inputDecoration().copyWith(hintText: label),
        ),
      ],
    ),
  );
}


  Widget buildDatePicker({
  required BuildContext context,
  required String label,
  required DateTime? date,
  required ValueChanged<DateTime?> onPick,
  bool isRequired = false,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 12.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        RichText(
          text: TextSpan(
            //text: label,
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
        InkWell(
          onTap: () async {
            final picked = await showDatePicker(
              context: context,
              initialDate: date ?? DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
            );
            if (picked != null) onPick(picked);
          },
          child: InputDecorator(
            decoration: InputDecoration(
              // labelText: label,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: Text(
              date == null
                  ? label
                  : date.toLocal().toString().split(' ')[0],
              style: TextStyle(
                color: date == null ? Colors.grey : Colors.black,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
}
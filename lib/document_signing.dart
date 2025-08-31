import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart'; // Added for file picking
import 'package:loan_application/loan_disbursement_status.dart';
import 'header_helper.dart';
import 'custom_snackbar.dart'; // Your snackbar code

class DocumentSigningScreen extends StatefulWidget {
  const DocumentSigningScreen({super.key});

  @override
  State<DocumentSigningScreen> createState() => _DocumentSigningScreenState();
}

class _DocumentSigningScreenState extends State<DocumentSigningScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for form fields
  final TextEditingController sanctionLetterController =
      TextEditingController();
  final TextEditingController loanAgreementController = TextEditingController();
  final TextEditingController repaymentScheduleController =
      TextEditingController();

  bool nachInitiated = false; // To track NACH initiation

  // Method to validate and submit form
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // TODO: Store details in database here
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => LoanDisbursementStatusScreen()),
      );
    } else {
      CustomSnackbar.show(context, message: "Please fill all required fields");
    }
  }

  // Pick file from gallery
  Future<void> _pickFile(TextEditingController controller) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
    );
    if (result != null && result.files.single.path != null) {
      setState(() {
        controller.text = result.files.single.name;
      });
    }
  }

  // // Initiate NACH process
  // void _initiateNach() {
  //   setState(() {
  //     nachInitiated = true;
  //   });
  //   CustomSnackbar.show(context, message: "NACH Initiated Successfully");
  // }

  // Custom text field with upload button
  Widget _buildUploadField({
    required String label,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: label,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            children: const [
              TextSpan(text: " *", style: TextStyle(color: Colors.red)),
            ],
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          readOnly: true,
          validator:
              (value) =>
                  (value == null || value.isEmpty) ? "Required field" : null,
          decoration: InputDecoration(
            hintText: "Manual Upload",
            suffix: GestureDetector(
              onTap: () => _pickFile(controller),
              child: const Text(
                "Upload",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 12,
            ),
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          "JPG, JPEG, PNG, PDF Upto 5MB",
          style: TextStyle(fontSize: 10, color: Colors.grey),
        ),
        const SizedBox(height: 14),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: SafeArea(
          top:false,
        child: Column(
          children: [
            const CustomHeader(title: "Documents Signing"),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Documents Signing",
                        style: TextStyle(
                          color: Color.fromRGBO(70, 53, 254, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),

                      
                      const SizedBox(height: 20),

                      _buildUploadField(
                        label: "Sanction Letter",
                        controller: sanctionLetterController,
                      ),
                      _buildUploadField(
                        label: "Loan Agreement Registration with E-Stamp",
                        controller: loanAgreementController,
                      ),
                      _buildUploadField(
                        label: "Repayment Schedule",
                        controller: repaymentScheduleController,
                      ),

                      SizedBox(height: height * 0.02),

                      SizedBox(
                        width: double.infinity,
                        height:50,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1769E9),
                            shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: _submitForm,
                          child: const Text(
                            "SAVE & NEXT",
                             style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

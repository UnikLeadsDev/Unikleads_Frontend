import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:loan_application/applicant_bank_details.dart';
import 'header_helper.dart';
import 'custom_snackbar.dart'; // Your snackbar file

class ApplicantDocumentsScreen extends StatefulWidget {
  const ApplicantDocumentsScreen({super.key});

  @override
  State<ApplicantDocumentsScreen> createState() =>
      _ApplicantDocumentsScreenState();
}

class _ApplicantDocumentsScreenState extends State<ApplicantDocumentsScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for all fields
  final TextEditingController _itrCurrentYear = TextEditingController();
  final TextEditingController _itrLastYear = TextEditingController();
  final TextEditingController _itrSecondLastYear = TextEditingController();
  final TextEditingController _financialStatement = TextEditingController();
  final TextEditingController _bankStatement = TextEditingController();
  final TextEditingController _bankPassword = TextEditingController();
  final TextEditingController _salarySlipCurrent = TextEditingController();
  final TextEditingController _salarySlipLast = TextEditingController();
  final TextEditingController _salarySlipSecondLast = TextEditingController();
  final TextEditingController _additionalDoc1 = TextEditingController();
  final TextEditingController _additionalDoc2 = TextEditingController();

  // Method to build upload textfield
  Widget _buildUploadField({
    required String label,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 4),
        TextFormField(
          controller: controller,
          readOnly: true,
          validator:
              (value) =>
                  value == null || value.isEmpty
                      ? "This field is required"
                      : null,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 14,
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            suffix: GestureDetector(
              onTap: () async {
                // File picker logic
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
                );
                if (result != null && result.files.isNotEmpty) {
                  controller.text =
                      result.files.single.name; // Display file name
                  // TODO: Upload file to backend if needed
                }
              },
              child: const Text(
                "Upload",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          "PDF/JPG/JPEG/PNG up to 5MB",
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      // TODO: Send all document details to backend here
      // Example: Use Multipart request to upload images/files

      // Navigate to next screen
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ApplicantBankDetailsScreen()),
      );
    } else {
      CustomSnackbar.show(context, message: "Please fill all required fields");
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: SafeArea(
          top:false,
        child: Column(
          children: [
            CustomHeader(title: "Applicant Documents"),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 6. Upload Financial Documents
                      const Text(
                        "Upload Financial Documents *",
                        style: TextStyle(
                          color: Color.fromRGBO(70, 53, 254, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),
                      _buildUploadField(
                        label: "ITR Current Year *",
                        controller: _itrCurrentYear,
                      ),
                      _buildUploadField(
                        label: "ITR Last Year *",
                        controller: _itrLastYear,
                      ),
                      _buildUploadField(
                        label: "ITR Second Last Year *",
                        controller: _itrSecondLastYear,
                      ),
                      _buildUploadField(
                        label: "Financial Statement *",
                        controller: _financialStatement,
                      ),

                      // 7. Upload Bank Statement Documents
                      const Text(
                        "Upload Bank Statement Documents *",
                        style: TextStyle(
                          color: Color.fromRGBO(70, 53, 254, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),
                      _buildUploadField(
                        label:
                            "Last 6 Months Bank Account Statement till Date *",
                        controller: _bankStatement,
                      ),
                      TextFormField(
                        controller: _bankPassword,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText:
                              "If Bank Statement Password Protected - Enter Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildUploadField(
                        label: "Upload Current Month's Salary Slip *",
                        controller: _salarySlipCurrent,
                      ),
                      _buildUploadField(
                        label: "Upload Last Month's Salary Slip *",
                        controller: _salarySlipLast,
                      ),
                      _buildUploadField(
                        label: "Upload Second Last Month's Salary Slip *",
                        controller: _salarySlipSecondLast,
                      ),
                      _buildUploadField(
                        label: "1 Additional Document",
                        controller: _additionalDoc1,
                      ),
                      _buildUploadField(
                        label: "2 Additional Document",
                        controller: _additionalDoc2,
                      ),

                      const SizedBox(height: 20),
                      SizedBox(
                        width: size.width,
                        height: 48,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                           backgroundColor: const Color(0xFF1769E9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: _handleSubmit,
                          child: const Text(
                            "CHECK ELIGIBILITY",
                            style: TextStyle(
                              color: Colors.white,fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
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

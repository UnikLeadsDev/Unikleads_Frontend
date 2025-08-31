import 'package:flutter/material.dart';
import 'package:loan_application/complete_preview.dart';
import 'package:loan_application/document_signing.dart';
import 'header_helper.dart'; 
import 'custom_snackbar.dart'; 
import 'package:file_picker/file_picker.dart'; 

class LoanDisbursementStatusScreen extends StatefulWidget {
  const LoanDisbursementStatusScreen({super.key});

  @override
  State<LoanDisbursementStatusScreen> createState() =>
      _LoanDisbursementStatusScreenState();
}

class _LoanDisbursementStatusScreenState
    extends State<LoanDisbursementStatusScreen> {
  final TextEditingController _statusController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  String? uploadedFileName; // Store uploaded file name

  void _submitForm() {
    if (_statusController.text.isEmpty || _dateController.text.isEmpty) {
      CustomSnackbar.show(context, message: "Please fill all mandatory fields");
      return;
    }

    // TODO: Integrate with backend/database here
    // Example: send _statusController.text, _dateController.text, uploadedFileName

    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => SuccessScreen()));
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any, // You can set FileType.image for only images
    );

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        uploadedFileName = result.files.single.name; // Store file name
      });
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
            CustomHeader(
              title: "Loan Disbursement Status",
              onBack: () => Navigator.pop(context),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Loan Disbursement Status",
                      style: TextStyle(
                        color: Color.fromRGBO(70, 53, 254, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 20),

                    const Text(
                      "Check Status of Loan Disbursement",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 6),
                    TextField(
                      controller: _statusController,
                      decoration: InputDecoration(
                        hintText: "Check Status of Loan Disbursement",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 14,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    RichText(
                      text: const TextSpan(
                        text: "Date of Loan Disbursement ",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: "*",
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextField(
                      controller: _dateController,
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: "Select Date",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 14,
                        ),
                        suffixIcon: const Icon(Icons.calendar_today, size: 20),
                      ),
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101),
                        );
                        if (pickedDate != null) {
                          setState(() {
                            _dateController.text =
                                "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                          });
                        }
                      },
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      "Upload Document",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 6),
                    GestureDetector(
                      onTap: _pickFile, // <-- Added function
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 14,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              uploadedFileName ?? "",
                              style: TextStyle(
                                color:
                                    uploadedFileName == null
                                        ? Colors.grey
                                        : Colors.black,
                              ),
                            ),
                            const Text(
                              "Upload",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),

                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                           backgroundColor: const Color(0xFF1769E9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                        ),
                        onPressed: _submitForm,
                        child: const Text(
                          "BACK",
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
          ],
        ),
      ),
    );
  }
}

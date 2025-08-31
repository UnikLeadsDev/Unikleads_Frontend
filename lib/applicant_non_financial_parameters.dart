import 'package:flutter/material.dart';
import 'package:loan_application/applicant_buisness_details.dart';
import 'header_helper.dart';
import 'custom_snackbar.dart';
import 'package:file_picker/file_picker.dart'; // <-- Added for file selection

class ApplicantNonFinancialParametersScreen extends StatefulWidget {
  const ApplicantNonFinancialParametersScreen({super.key});

  @override
  State<ApplicantNonFinancialParametersScreen> createState() =>
      _ApplicantNonFinancialParametersScreenState();
}

class _ApplicantNonFinancialParametersScreenState
    extends State<ApplicantNonFinancialParametersScreen> {
  final _formKey = GlobalKey<FormState>();

  String? jobStability;
  String? residentialOwnership;
  String? residentialVintage;
  String? residentialZone;

  String employmentVerificationFile = "";
  String salaryVerificationFile = "";

  // File picker logic
  void _uploadFile(Function(String) onUploaded) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
      withData: false,
    );

    if (result != null && result.files.isNotEmpty) {
      String fileName = result.files.single.name;
      onUploaded(fileName);
    } else {
      CustomSnackbar.show(context, message: "No file selected");
    }
  }

  void _onSubmit() {
    if (_formKey.currentState!.validate() &&
        employmentVerificationFile.isNotEmpty &&
        salaryVerificationFile.isNotEmpty) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ApplicantBusinessDetailsScreen(),
        ),
      );
    } else {
      CustomSnackbar.show(
        context,
        message: "Please fill all required fields and upload files",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),

      body: SafeArea(
        top:false,
        child: Column(
          children: [
            
            CustomHeader(title: "Applicant Non Financial Parameters"),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                  vertical: 16,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Non Financial Parameters",
                        style: TextStyle(
                          color: Color.fromRGBO(70, 53, 254, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 16),

                      const Text(
                        "Job Stability *",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 6),
                      DropdownButtonFormField<String>(
                        value: jobStability,
                        items: [
                          DropdownMenuItem(
                            value: "Stable",
                            child: Text("Stable"),
                          ),
                          DropdownMenuItem(
                            value: "Unstable",
                            child: Text("Unstable"),
                          ),
                        ],
                        onChanged:
                            (value) => setState(() {
                              jobStability = value;
                            }),
                        decoration: const InputDecoration(
                          hintText: "Select",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) => value == null ? 'Required' : null,
                      ),
                      const SizedBox(height: 12),

                      const Text(
                        "Residential Ownership *",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 6),
                      DropdownButtonFormField<String>(
                        value: residentialOwnership,
                        items: [
                          DropdownMenuItem(
                            value: "Owned",
                            child: Text("Owned"),
                          ),
                          DropdownMenuItem(
                            value: "Rented",
                            child: Text("Rented"),
                          ),
                        ],
                        onChanged:
                            (value) => setState(() {
                              residentialOwnership = value;
                            }),
                        decoration: const InputDecoration(
                          hintText: "Select",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) => value == null ? 'Required' : null,
                      ),
                      const SizedBox(height: 12),

                      const Text(
                        "Residential Vintage *",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 6),
                      DropdownButtonFormField<String>(
                        value: residentialVintage,
                        items: [
                          DropdownMenuItem(
                            value: "Less than 1 year",
                            child: Text("Less than 1 year"),
                          ),
                          DropdownMenuItem(
                            value: "More than 1 year",
                            child: Text("More than 1 year"),
                          ),
                        ],
                        onChanged:
                            (value) => setState(() {
                              residentialVintage = value;
                            }),
                        decoration: const InputDecoration(
                          hintText: "Select",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) => value == null ? 'Required' : null,
                      ),
                      const SizedBox(height: 12),

                      const Text(
                        "Residential Zone *",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 6),
                      DropdownButtonFormField<String>(
                        value: residentialZone,
                        items: [
                          DropdownMenuItem(
                            value: "Urban",
                            child: Text("Urban"),
                          ),
                          DropdownMenuItem(
                            value: "Rural",
                            child: Text("Rural"),
                          ),
                        ],
                        onChanged:
                            (value) => setState(() {
                              residentialZone = value;
                            }),
                        decoration: const InputDecoration(
                          hintText: "Select",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) => value == null ? 'Required' : null,
                      ),
                      const SizedBox(height: 24),

                      const Text(
                        "Verification Form",
                        style: TextStyle(
                          color: Color.fromRGBO(70, 53, 254, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 12),

                      const Text(
                        "Employment Verification Form *",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 6),
                      GestureDetector(
                        onTap: () {
                          _uploadFile((fileName) {
                            setState(() {
                              employmentVerificationFile = fileName;
                            });
                          });
                        },
                        child: AbsorbPointer(
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText:
                                  employmentVerificationFile.isEmpty
                                      ? "Upload"
                                      : employmentVerificationFile,
                              border: const OutlineInputBorder(),
                              suffixIcon: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                ),
                                color: Colors.blue.shade50,
                                child: const Center(
                                  child: Text(
                                    "Upload",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            validator:
                                (value) =>
                                    employmentVerificationFile.isEmpty
                                        ? 'Required'
                                        : null,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        "JPG, JPEG, PNG, PDF Upto 5MB",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      const SizedBox(height: 16),

                      const Text(
                        "Salary Verification Form *",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 6),
                      GestureDetector(
                        onTap: () {
                          _uploadFile((fileName) {
                            setState(() {
                              salaryVerificationFile = fileName;
                            });
                          });
                        },
                        child: AbsorbPointer(
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText:
                                  salaryVerificationFile.isEmpty
                                      ? "Upload"
                                      : salaryVerificationFile,
                              border: const OutlineInputBorder(),
                              suffixIcon: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                ),
                                color: Colors.blue.shade50,
                                child: const Center(
                                  child: Text(
                                    "Upload",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            validator:
                                (value) =>
                                    salaryVerificationFile.isEmpty
                                        ? 'Required'
                                        : null,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        "JPG, JPEG, PNG, PDF Upto 5MB",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),

                      const SizedBox(height: 24),

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
                          onPressed: _onSubmit,
                          child: const Text(
                            "SAVE & NEXT",
                            style: TextStyle(
                              color: Colors.white,fontWeight: FontWeight.bold,
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

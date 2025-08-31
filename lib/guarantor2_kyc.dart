import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:loan_application/applicant_basic_details.dart';
import 'package:loan_application/applicant_employment_details.dart';
import 'package:loan_application/details_helper.dart';
import 'package:loan_application/guarantor1_kyc.dart';
import 'package:loan_application/header_helper.dart';
import 'custom_snackbar.dart'; // Your CustomSnackbar file

class Guarantor2KYCDocumentsScreen extends StatefulWidget {
  const Guarantor2KYCDocumentsScreen({Key? key}) : super(key: key);

  @override
  State<Guarantor2KYCDocumentsScreen> createState() =>
      _Guarantor2KYCDocumentsScreenState();
}

class _Guarantor2KYCDocumentsScreenState
    extends State<Guarantor2KYCDocumentsScreen> {
  final _formKey = GlobalKey<FormState>();

  // Text controllers
  final TextEditingController _panController = TextEditingController();
  final TextEditingController _aadhaarController = TextEditingController();

  // Files (PlatformFile contains name & size etc.)
  PlatformFile? applicantPhotoFile;
  PlatformFile? panCardFile;
  PlatformFile? aadhaarFrontFile;
  PlatformFile? aadhaarBackFile;
  PlatformFile? creditReportFile;

  // verification flags (placeholders)
  bool panVerified = false;
  bool aadhaarVerified = false;

  // Constants for constraints
  static const int photoMaxBytes = 5 * 1024 * 1024; // 5 MB
  static const int creditMaxBytes = 10 * 1024 * 1024; // 10 MB

  @override
  void dispose() {
    _panController.dispose();
    _aadhaarController.dispose();
    super.dispose();
  }

  // Generic file picker with validation for extension and size.
  // Leaves TODO comment where you can add upload logic.
  Future<PlatformFile?> _pickFile({
    required List<String> allowedExtensions,
    required int maxBytes,
  }) async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: allowedExtensions,
        withData: true, // brings bytes so you can check size
      );

      if (result == null || result.files.isEmpty) return null;

      final file = result.files.single;
      if (file.size > maxBytes) {
        CustomSnackbar.show(context,
            message:
                "File exceeds maximum size of ${maxBytes ~/ (1024 * 1024)} MB");
        return null;
      }

      // TODO: If you want to upload immediately after selection, add
      // your upload API logic here. Example:
      // final uploadResponse = await Api.uploadFile(file.bytes, file.name);
      // handle uploadResponse accordingly.

      return file;
    } catch (e) {
      CustomSnackbar.show(context, message: "File selection failed");
      return null;
    }
  }

  // Placeholders for verification logic. Replace TODO with real API calls.
  Future<void> _verifyPan() async {
    final pan = _panController.text.trim();
    if (pan.isEmpty) {
      CustomSnackbar.show(context, message: "Enter PAN to verify");
      return;
    }

    // TODO: call your PAN verification API here and set panVerified accordingly.
    // Example:
    // final result = await Api.verifyPan(pan);
    // setState(() => panVerified = result.isValid);

    // Placeholder behavior:
    setState(() => panVerified = true);
    CustomSnackbar.show(context, message: "PAN verification placeholder (success)", backgroundColor: Colors.green);
  }

  Future<void> _verifyAadhaar() async {
    final aadhaar = _aadhaarController.text.trim();
    if (aadhaar.isEmpty) {
      CustomSnackbar.show(context, message: "Enter Aadhaar to verify");
      return;
    }

    // TODO: call your Aadhaar verification API here and set aadhaarVerified accordingly.
    // Example:
    // final result = await Api.verifyAadhaar(aadhaar);
    // setState(() => aadhaarVerified = result.isValid);

    // Placeholder behavior:
    setState(() => aadhaarVerified = true);
    CustomSnackbar.show(context, message: "Aadhaar verification placeholder (success)", backgroundColor: Colors.green);
  }

  String _displayFileName(PlatformFile? f) {
    if (f == null) return "";
    final name = f.name;
    if (name.length > 35) return "${name.substring(0, 32)}...";
    return name;
  }

  void _onSubmit() async {
    // Validate form fields first
    if (!_formKey.currentState!.validate()) {
      CustomSnackbar.show(context, message: "Please fill all required fields");
      return;
    }

    // Validate file selections
    if (applicantPhotoFile == null ||
        panCardFile == null ||
        aadhaarFrontFile == null ||
        aadhaarBackFile == null) {
      CustomSnackbar.show(context,
          message: "Please upload all mandatory documents (photos/PAN/Aadhaar)");
      return;
    }

   

    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ApplicantEmploymentDetailsScreen())); // Replace with your route
  }

  Widget _header() {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.16,

      padding: const EdgeInsets.fromLTRB(16, 14, 16, 20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0D47A1), Color(0xFF1976D2)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => Navigator.pop(context),
            child: Row(
              children: const [
                Icon(Icons.arrow_back, color: Colors.white, size: 20),
                SizedBox(width: 8),
                Text(
                  'BACK',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Guarantor KYC Documents',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  
  Widget _buildTextFieldWithVerify({
    required TextEditingController controller,
    required String hint,
    required VoidCallback onVerify,
    required bool verifiedFlag,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextFormField(
        controller: controller,
        validator: (val) =>
            val == null || val.trim().isEmpty ? 'Please enter ${hint}' : null,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          suffix: GestureDetector(
            onTap: onVerify,
            child: Text(
              verifiedFlag ? "Verified" : "Verify",
              style: TextStyle(
                color: verifiedFlag ? Colors.green : Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUploadRow({
    required String title,
    required PlatformFile? file,
    required VoidCallback onUpload,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        const SizedBox(height: 6),
        GestureDetector(
          onTap: onUpload,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFE0E0E0)),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    _displayFileName(file),
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
                Text(
                  'Upload',
                  style: const TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _hintText(String text) => Padding(
        padding: const EdgeInsets.only(top: 6.0, bottom: 10.0),
        child: Text(text,
            style: const TextStyle(fontSize: 12, color: Colors.grey)),
      );

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: SafeArea(
          top:false,
        child: Column(
          children: [
            //_header(),
             CustomHeader(title: "Guarantor KYC Documents"),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DetailsFormHelper.sectionTitleWithSkip(
                        title: "2.Guarantor KYC Digital Validation",
                        onSkip: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ApplicantEmploymentDetailsScreen(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 8),

                      _buildTextFieldWithVerify(
                        controller: _panController,
                        hint: "Enter PAN Card Number *",
                        onVerify: _verifyPan,
                        verifiedFlag: panVerified,
                      ),
                      const SizedBox(height: 8),

                      _buildTextFieldWithVerify(
                        controller: _aadhaarController,
                        hint: "Enter Aadhaar Card Number *",
                        onVerify: _verifyAadhaar,
                        verifiedFlag: aadhaarVerified,
                      ),
                      const SizedBox(height: 16),

                      const Text(
                        "Guarantor Documents Upload",
                          style: TextStyle(
                          color: Color.fromRGBO(70, 53, 254, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Applicant Photo
                      _buildUploadRow(
                        title: "Applicant Photo *",
                        file: applicantPhotoFile,
                        onUpload: () async {
                          final f = await _pickFile(
                              allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
                              maxBytes: photoMaxBytes);
                          if (f != null) {
                            setState(() => applicantPhotoFile = f);
                            // TODO: Optionally auto-upload the file here
                          }
                        },
                      ),
                      _hintText("JPG, JPEG, PNG, PDF Upto 5MB"),

                      // PAN Card Photo
                      _buildUploadRow(
                        title: "PAN Card Photo *",
                        file: panCardFile,
                        onUpload: () async {
                          final f = await _pickFile(
                              allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
                              maxBytes: photoMaxBytes);
                          if (f != null) {
                            setState(() => panCardFile = f);
                            // TODO: Optionally auto-upload the file here
                          }
                        },
                      ),
                      _hintText("JPG, JPEG, PNG, PDF Upto 5MB"),

                      // Aadhaar Front
                      _buildUploadRow(
                        title: "Aadhaar Card Photo (Front Side) *",
                        file: aadhaarFrontFile,
                        onUpload: () async {
                          final f = await _pickFile(
                              allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
                              maxBytes: photoMaxBytes);
                          if (f != null) {
                            setState(() => aadhaarFrontFile = f);
                            // TODO: Optionally auto-upload the file here
                          }
                        },
                      ),
                      _hintText("JPG, JPEG, PNG, PDF Upto 5MB"),

                      // Aadhaar Back
                      _buildUploadRow(
                        title: "Aadhaar Card Photo (Back Side) *",
                        file: aadhaarBackFile,
                        onUpload: () async {
                          final f = await _pickFile(
                              allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
                              maxBytes: photoMaxBytes);
                          if (f != null) {
                            setState(() => aadhaarBackFile = f);
                            // TODO: Optionally auto-upload the file here
                          }
                        },
                      ),
                      _hintText("JPG, JPEG, PNG, PDF Upto 5MB"),

                      // Credit Report (optional)
                      _buildUploadRow(
                        title: "Applicant Credit Report",
                        file: creditReportFile,
                        onUpload: () async {
                          final f = await _pickFile(
                              allowedExtensions: ['pdf'], maxBytes: creditMaxBytes);
                          if (f != null) {
                            setState(() => creditReportFile = f);
                            // TODO: Optionally auto-upload the file here
                          }
                        },
                      ),
                      _hintText("PDF Upto 10MB"),

                      const SizedBox(height: 12),

                      SizedBox(
                        width: width,
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
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
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

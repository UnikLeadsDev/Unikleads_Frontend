

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loan_application/applicant_basic_details.dart';
import 'package:loan_application/co_applicant_basic_details.dart';
import 'package:loan_application/header_helper.dart';
import 'custom_snackbar.dart'; 

class ApplicantKYCDocumentsScreen extends StatefulWidget {
  const ApplicantKYCDocumentsScreen({Key? key}) : super(key: key);

  @override
  State<ApplicantKYCDocumentsScreen> createState() =>
      _ApplicantKYCDocumentsScreenState();
}

class _ApplicantKYCDocumentsScreenState
    extends State<ApplicantKYCDocumentsScreen> {
  final _formKey = GlobalKey<FormState>();

  // Text controllers
  final TextEditingController _panController = TextEditingController();
  final TextEditingController _aadhaarController = TextEditingController();

  // Files
  PlatformFile? applicantPhotoFile;
  PlatformFile? panCardFile;
  PlatformFile? aadhaarFrontFile;
  PlatformFile? aadhaarBackFile;
  PlatformFile? creditReportFile;

  // verification flags
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

  Future<PlatformFile?> _pickFile({
    required List<String> allowedExtensions,
    required int maxBytes,
  }) async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: allowedExtensions,
        withData: true,
      );

      if (result == null || result.files.isEmpty) return null;

      final file = result.files.single;
      if (file.size > maxBytes) {
        CustomSnackbar.show(context,
            message:
                "File exceeds maximum size of ${maxBytes ~/ (1024 * 1024)} MB");
        return null;
      }

      return file;
    } catch (e) {
      CustomSnackbar.show(context, message: "File selection failed");
      return null;
    }
  }

  Future<void> _verifyPan() async {
    final pan = _panController.text.trim();
    if (pan.isEmpty) {
      CustomSnackbar.show(context, message: "Enter PAN to verify");
      return;
    }
    setState(() => panVerified = true);
    CustomSnackbar.show(context,
        message: "PAN verification placeholder (success)",
        backgroundColor: Colors.green);
  }

  Future<void> _verifyAadhaar() async {
    final aadhaar = _aadhaarController.text.trim();
    if (aadhaar.isEmpty) {
      CustomSnackbar.show(context, message: "Enter Aadhaar to verify");
      return;
    }
    setState(() => aadhaarVerified = true);
    CustomSnackbar.show(context,
        message: "Aadhaar verification placeholder (success)",
        backgroundColor: Colors.green);
  }

  String _displayFileName(PlatformFile? f) {
    if (f == null) return "";
    final name = f.name;
    if (name.length > 35) return "${name.substring(0, 32)}...";
    return name;
  }

  void _onSubmit() async {
    if (!_formKey.currentState!.validate()) {
      CustomSnackbar.show(context, message: "Please fill all required fields");
      return;
    }

    if (applicantPhotoFile == null ||
        panCardFile == null ||
        aadhaarFrontFile == null ||
        aadhaarBackFile == null) {
      CustomSnackbar.show(context,
          message: "Please upload all mandatory documents (photos/PAN/Aadhaar)");
      return;
    }

    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => CoApplicantBasicDetailsScreen()));
  }

  Widget _buildTextFieldWithVerify({
    required TextEditingController controller,
    required String hint,
    required VoidCallback onVerify,
    required bool verifiedFlag,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: TextFormField(
        controller: controller,
        validator: (val) =>
            val == null || val.trim().isEmpty ? 'Please enter $hint' : null,
        style: TextStyle(fontSize: 14.sp),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(fontSize: 13.sp),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.r),
          ),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
          suffix: GestureDetector(
            onTap: onVerify,
            child: Text(
              verifiedFlag ? "Verified" : "Verify",
              style: TextStyle(
                fontSize: 13.sp,
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
        Text(title, style: TextStyle(fontSize: 13.sp)),
        SizedBox(height: 6.h),
        GestureDetector(
          onTap: onUpload,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFE0E0E0)),
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    _displayFileName(file),
                    style: TextStyle(color: Colors.black, fontSize: 13.sp),
                  ),
                ),
                Text(
                  'Upload',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 13.sp),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _hintText(String text) => Padding(
        padding: EdgeInsets.only(top: 6.h, bottom: 10.h),
        child: Text(
          text,
          style: TextStyle(fontSize: 12.sp, color: Colors.grey),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            CustomHeader(title: "Applicant KYC Document"),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.w),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "APPLICANT KYC DIGITAL VALIDATION",
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromRGBO(70, 53, 254, 1),
                        ),
                      ),
                      SizedBox(height: 8.h),

                      _buildTextFieldWithVerify(
                        controller: _panController,
                        hint: "Enter PAN Card Number *",
                        onVerify: _verifyPan,
                        verifiedFlag: panVerified,
                      ),
                      SizedBox(height: 8.h),

                      _buildTextFieldWithVerify(
                        controller: _aadhaarController,
                        hint: "Enter Aadhaar Card Number *",
                        onVerify: _verifyAadhaar,
                        verifiedFlag: aadhaarVerified,
                      ),
                      SizedBox(height: 16.h),

                      Text(
                        "Applicant Documents Upload",
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromRGBO(70, 53, 254, 1),
                        ),
                      ),
                      SizedBox(height: 8.h),

                      _buildUploadRow(
                        title: "Applicant Photo *",
                        file: applicantPhotoFile,
                        onUpload: () async {
                          final f = await _pickFile(
                              allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
                              maxBytes: photoMaxBytes);
                          if (f != null) {
                            setState(() => applicantPhotoFile = f);
                          }
                        },
                      ),
                      _hintText("JPG, JPEG, PNG, PDF Upto 5MB"),

                      _buildUploadRow(
                        title: "PAN Card Photo *",
                        file: panCardFile,
                        onUpload: () async {
                          final f = await _pickFile(
                              allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
                              maxBytes: photoMaxBytes);
                          if (f != null) {
                            setState(() => panCardFile = f);
                          }
                        },
                      ),
                      _hintText("JPG, JPEG, PNG, PDF Upto 5MB"),

                      _buildUploadRow(
                        title: "Aadhaar Card Photo (Front Side) *",
                        file: aadhaarFrontFile,
                        onUpload: () async {
                          final f = await _pickFile(
                              allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
                              maxBytes: photoMaxBytes);
                          if (f != null) {
                            setState(() => aadhaarFrontFile = f);
                          }
                        },
                      ),
                      _hintText("JPG, JPEG, PNG, PDF Upto 5MB"),

                      _buildUploadRow(
                        title: "Aadhaar Card Photo (Back Side) *",
                        file: aadhaarBackFile,
                        onUpload: () async {
                          final f = await _pickFile(
                              allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
                              maxBytes: photoMaxBytes);
                          if (f != null) {
                            setState(() => aadhaarBackFile = f);
                          }
                        },
                      ),
                      _hintText("JPG, JPEG, PNG, PDF Upto 5MB"),

                      _buildUploadRow(
                        title: "Applicant Credit Report",
                        file: creditReportFile,
                        onUpload: () async {
                          final f = await _pickFile(
                              allowedExtensions: ['pdf'],
                              maxBytes: creditMaxBytes);
                          if (f != null) {
                            setState(() => creditReportFile = f);
                          }
                        },
                      ),
                      _hintText("PDF Upto 10MB"),

                      SizedBox(height: 12.h),

                      SizedBox(
                        width: double.infinity,
                        height: 50.h,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1769E9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                          ),
                          onPressed: _onSubmit,
                          child: Text(
                            "SAVE & NEXT",
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h),
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

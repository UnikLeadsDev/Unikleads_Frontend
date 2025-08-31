import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:loan_application/register_paper_nach.dart';
import 'header_helper.dart';
import 'custom_snackbar.dart';

class ApplicantPremisesPhotosScreen extends StatefulWidget {
  const ApplicantPremisesPhotosScreen({super.key});

  @override
  State<ApplicantPremisesPhotosScreen> createState() =>
      _ApplicantPremisesPhotosScreenState();
}

class _ApplicantPremisesPhotosScreenState
    extends State<ApplicantPremisesPhotosScreen> {
  final _formKey = GlobalKey<FormState>();

  // Store selected file paths
  String? resPhoto1, resPhoto2, resPhoto3, resVideo;
  String? busPhoto1, busPhoto2, busPhoto3, busVideo;

  Future<void> _pickFile(
    Function(String) onFilePicked, {
    List<String>? allowedExtensions,
  }) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: allowedExtensions,
    );
    if (result != null && result.files.isNotEmpty) {
      onFilePicked(result.files.first.name);
    }
  }

  Widget _buildUploadField({
    required String label,
    required bool isMandatory,
    required String? value,
    required Function(String) onFilePicked,
    List<String>? allowedExtensions,
    String? fileHint,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: label,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (isMandatory)
                const TextSpan(text: " *", style: TextStyle(color: Colors.red)),
            ],
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          readOnly: true,
          validator:
              (val) =>
                  isMandatory && (value == null || value.isEmpty)
                      ? "Required field"
                      : null,
          decoration: InputDecoration(
            hintText: value ?? '',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
            suffix: GestureDetector(
              onTap:
                  () => _pickFile(
                    onFilePicked,
                    allowedExtensions: allowedExtensions,
                  ),
              child: const Text(
                "Upload",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        if (fileHint != null)
          Padding(
            padding: const EdgeInsets.only(top: 4.0, bottom: 12),
            child: Text(
              fileHint,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
      ],
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // TODO: Store details to database / backend integration here
      // Example:
      // await uploadFiles({
      //   'residence_photo1': resPhoto1,
      //   ...
      // });

      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => RegisterPaperNachScreen()),
      ); // Route to next screen
    } else {
      CustomSnackbar.show(context, message: "Please fill all mandatory fields");
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
              title: "Applicant Premises Photos",
              onBack: () => Navigator.pop(context),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 19. Residence Photos Section
                      const Text(
                        "APPLICANT RESIDENCE PREMISES PHOTOS & VIDEOS",
                        style: TextStyle(
                          color: Color.fromRGBO(70, 53, 254, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 12),

                      _buildUploadField(
                        label: "Residence Premises Photos 1",
                        isMandatory: true,
                        value: resPhoto1,
                        onFilePicked:
                            (file) => setState(() => resPhoto1 = file),
                        allowedExtensions: ["jpg", "jpeg", "png", "pdf"],
                        fileHint: "JPG, JPEG, PNG, PDF Upto 5MB",
                      ),
                      _buildUploadField(
                        label: "Residence Premises Photos 2",
                        isMandatory: false,
                        value: resPhoto2,
                        onFilePicked:
                            (file) => setState(() => resPhoto2 = file),
                        allowedExtensions: ["jpg", "jpeg", "png", "pdf"],
                        fileHint: "JPG, JPEG, PNG, PDF Upto 5MB",
                      ),
                      _buildUploadField(
                        label: "Residence Premises Photos 3",
                        isMandatory: false,
                        value: resPhoto3,
                        onFilePicked:
                            (file) => setState(() => resPhoto3 = file),
                        allowedExtensions: ["jpg", "jpeg", "png", "pdf"],
                        fileHint: "JPG, JPEG, PNG, PDF Upto 5MB",
                      ),
                      _buildUploadField(
                        label: "Residence Premises Video (30 Sec.)",
                        isMandatory: false,
                        value: resVideo,
                        onFilePicked: (file) => setState(() => resVideo = file),
                        allowedExtensions: ["mp4"],
                        fileHint: "MP4 Upto 10MB",
                      ),

                      const SizedBox(height: 20),

                      // 20. Business Photos Section
                      const Text(
                        "APPLICANT BUSINESS PREMISES PHOTOS & VIDEOS",
                         style:  TextStyle(
           color: Color.fromRGBO(70, 53, 254, 1),
          fontWeight: FontWeight.bold,
          fontSize: 16,
          ),
                      ),
                      const SizedBox(height: 12),

                      _buildUploadField(
                        label: "Business Premises Photos 1",
                        isMandatory: true,
                        value: busPhoto1,
                        onFilePicked:
                            (file) => setState(() => busPhoto1 = file),
                        allowedExtensions: ["jpg", "jpeg", "png", "pdf"],
                        fileHint: "JPG, JPEG, PNG, PDF Upto 5MB",
                      ),
                      _buildUploadField(
                        label: "Business Premises Photos 2",
                        isMandatory: false,
                        value: busPhoto2,
                        onFilePicked:
                            (file) => setState(() => busPhoto2 = file),
                        allowedExtensions: ["jpg", "jpeg", "png", "pdf"],
                        fileHint: "JPG, JPEG, PNG, PDF Upto 5MB",
                      ),
                      _buildUploadField(
                        label: "Business Premises Photos 3",
                        isMandatory: false,
                        value: busPhoto3,
                        onFilePicked:
                            (file) => setState(() => busPhoto3 = file),
                        allowedExtensions: ["jpg", "jpeg", "png", "pdf"],
                        fileHint: "JPG, JPEG, PNG, PDF Upto 5MB",
                      ),
                      _buildUploadField(
                        label: "Business Premises Video (30 Sec.)",
                        isMandatory: false,
                        value: busVideo,
                        onFilePicked: (file) => setState(() => busVideo = file),
                        allowedExtensions: ["mp4"],
                        fileHint: "MP4 Upto 10MB",
                      ),

                      const SizedBox(height: 40),

                      // Save & Next Button
                      SizedBox(
                        width: double.infinity,
                        height: size.height * 0.06,
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

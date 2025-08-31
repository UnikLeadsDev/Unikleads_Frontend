import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loan_application/applicant_refrence_details.dart';
import 'header_helper.dart';
import 'custom_snackbar.dart';

class ApplicantBusinessDetailsScreen extends StatefulWidget {
  const ApplicantBusinessDetailsScreen({super.key});

  @override
  State<ApplicantBusinessDetailsScreen> createState() =>
      _ApplicantBusinessDetailsScreenState();
}

class _ApplicantBusinessDetailsScreenState
    extends State<ApplicantBusinessDetailsScreen> {
  final _formKey = GlobalKey<FormState>();

  String? _entityType;
  String? _natureOfActivity;
  String? _nameOfOrganization;
  DateTime? _dateOfIncorporation;
  String? _certificateType;
  String? _certificateNumber;
  String? _udyamCertificateNumber;

  bool _certificateVerified = false;
  bool _udyamVerified = false;

  XFile? _certificateFile;
  XFile? _udyamFile;
  XFile? _verificationFormFile;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickFile(Function(XFile) onFilePicked) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      onFilePicked(pickedFile);
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Save form data
      _formKey.currentState!.save();

      // TODO: Send data to backend API & upload files
      // Example: await apiService.submitBusinessDetails(...);

      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ReferenceDetailsScreen()),
      ); // Route to next screen
    } else {
      CustomSnackbar.show(
        context,
        message: "Please fill all mandatory fields.",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: SafeArea(
          top:false,
        child: Column(
          children: [
            CustomHeader(
              title: "Applicant Business Details",
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
                      // Section 9 - Entity Details
                      const Text(
                        "Entity Details",
                        style: TextStyle(
                          color: Color.fromRGBO(70, 53, 254, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),

                      _buildDropdownField(
                        label: "Select Entity Type *",
                        value: _entityType,
                        items: [
                          "Option 1",
                          "Option 2",
                        ], // TODO: Replace with backend data
                        onChanged:
                            (value) => setState(() => _entityType = value),
                      ),

                      _buildDropdownField(
                        label: "Nature of Activity *",
                        value: _natureOfActivity,
                        items: [
                          "Activity 1",
                          "Activity 2",
                        ], // TODO: Replace with backend data
                        onChanged:
                            (value) =>
                                setState(() => _natureOfActivity = value),
                      ),

                      _buildTextField(
                        label: "Name of Organization *",
                        onSaved: (val) => _nameOfOrganization = val,
                      ),

                      _buildDatePickerField(
                        label: "Date of Incorporation *",
                        date: _dateOfIncorporation,
                        onDatePicked:
                            (date) =>
                                setState(() => _dateOfIncorporation = date),
                      ),

                      const SizedBox(height: 20),

                      // Section 10 - Entity KYC Documents
                      const Text(
                        "Entity KYC Documents",
                        style: TextStyle(
                          color: Color.fromRGBO(70, 53, 254, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),

                      _buildDropdownField(
                        label: "Select Certificate Type *",
                        value: _certificateType,
                        items: [
                          "Type 1",
                          "Type 2",
                        ], // TODO: Replace with backend data
                        onChanged:
                            (value) => setState(() => _certificateType = value),
                      ),

                      _buildUploadField(
                        label: "Upload Certificate *",
                        file: _certificateFile,
                        onUpload:
                            () => _pickFile(
                              (file) => setState(() => _certificateFile = file),
                            ),
                      ),

                      _buildVerifyField(
                        label: "Certificate Number *",
                        initialValue: _certificateNumber,
                        verified: _certificateVerified,
                        onVerify: () {
                          setState(() => _certificateVerified = true);
                          // TODO: Backend verification API
                        },
                        onSaved: (val) => _certificateNumber = val,
                      ),

                      _buildUploadField(
                        label: "Udyam Certificate *",
                        file: _udyamFile,
                        onUpload:
                            () => _pickFile(
                              (file) => setState(() => _udyamFile = file),
                            ),
                      ),

                      _buildVerifyField(
                        label: "Udyam Certificate Number *",
                        initialValue: _udyamCertificateNumber,
                        verified: _udyamVerified,
                        onVerify: () {
                          setState(() => _udyamVerified = true);
                          // TODO: Backend verification API
                        },
                        onSaved: (val) => _udyamCertificateNumber = val,
                      ),

                      _buildUploadField(
                        label: "Business Verification Form *",
                        file: _verificationFormFile,
                        onUpload:
                            () => _pickFile(
                              (file) =>
                                  setState(() => _verificationFormFile = file),
                            ),
                      ),

                      const SizedBox(height: 20),

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

  Widget _buildDropdownField({
    required String label,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 4),
        DropdownButtonFormField<String>(
          value: value,
          items:
              items
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
          onChanged: onChanged,
          validator: (val) => val == null ? "Required field" : null,
          decoration: const InputDecoration(border: OutlineInputBorder()),
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  Widget _buildTextField({
    required String label,
    required FormFieldSetter<String> onSaved,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 4),
        TextFormField(
          validator:
              (val) => val == null || val.isEmpty ? "Required field" : null,
          onSaved: onSaved,
          decoration: const InputDecoration(border: OutlineInputBorder()),
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  Widget _buildDatePickerField({
    required String label,
    required DateTime? date,
    required Function(DateTime) onDatePicked,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 4),
        InkWell(
          onTap: () async {
            DateTime? picked = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime(2100),
            );
            if (picked != null) onDatePicked(picked);
          },
          child: InputDecorator(
            decoration: const InputDecoration(border: OutlineInputBorder()),
            child: Text(
              date == null ? "Select" : "${date.toLocal()}".split(' ')[0],
            ),
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  Widget _buildUploadField({
    required String label,
    required XFile? file,
    required VoidCallback onUpload,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 4),
        InkWell(
          onTap: onUpload,
          child: InputDecorator(
            decoration: const InputDecoration(border: OutlineInputBorder()),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(file == null ? "" : file.name),
                const Text("Upload", style: TextStyle(color: Colors.blue)),
              ],
            ),
          ),
        ),
        const Text(
          "JPG, JPEG, PNG, PDF Upto 5MB",
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  Widget _buildVerifyField({
    required String label,
    String? initialValue,
    required bool verified,
    required VoidCallback onVerify,
    required FormFieldSetter<String> onSaved,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 4),
        TextFormField(
          initialValue: initialValue,
          validator:
              (val) => val == null || val.isEmpty ? "Required field" : null,
          onSaved: onSaved,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            suffixIcon: GestureDetector(
              onTap: onVerify,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
                child: Text(
                  verified ? "Verified" : "Verify",
                  style: TextStyle(
                    color: verified ? Colors.green : Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}

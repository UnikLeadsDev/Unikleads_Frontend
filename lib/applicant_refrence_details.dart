import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loan_application/applicant_documents.dart';
import 'header_helper.dart';
import 'custom_snackbar.dart';

class ReferenceDetailsScreen extends StatefulWidget {
  const ReferenceDetailsScreen({super.key});

  @override
  State<ReferenceDetailsScreen> createState() => _ReferenceDetailsScreenState();
}

class _ReferenceDetailsScreenState extends State<ReferenceDetailsScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final name1Controller = TextEditingController();
  final relation1Controller = TextEditingController();
  final mobile1Controller = TextEditingController();
  final name2Controller = TextEditingController();
  final relation2Controller = TextEditingController();
  final mobile2Controller = TextEditingController();

  @override
  void dispose() {
    name1Controller.dispose();
    relation1Controller.dispose();
    mobile1Controller.dispose();
    name2Controller.dispose();
    relation2Controller.dispose();
    mobile2Controller.dispose();
    super.dispose();
  }

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      // TODO: Store details to backend/database
      // Use name1Controller.text, relation1Controller.text, etc.

      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ApplicantDocumentsScreen()),);// Route to next screen
    } else {
      CustomSnackbar.show(
        context,
        message: 'Please fill all required fields',
      );
    }
  }

  Widget _buildReferenceSection({
    required String title,
    required TextEditingController nameController,
    required TextEditingController relationController,
    required TextEditingController mobileController,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(Icons.radio_button_unchecked, size: 18, color: Colors.grey),
            const SizedBox(width: 6),
            RichText(
              text: TextSpan(
                text: title,
                style:  TextStyle(
           color: Color.fromRGBO(70, 53, 254, 1),
          fontWeight: FontWeight.bold,
          fontSize: 16.sp,
          ),
                children: const [
                  TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        _buildLabel("Enter Name"),
        TextFormField(
          controller: nameController,
          validator: (value) => value!.isEmpty ? 'Required' : null,
          decoration: const InputDecoration(
            hintText: "Enter Referred Name",
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),
        _buildLabel("Select Relationship"),
        DropdownButtonFormField<String>(
          validator: (value) => value == null || value.isEmpty ? 'Required' : null,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
          items: [
            // TODO: Replace with your dropdown list data from backend
            const DropdownMenuItem(value: "Friend", child: Text("Friend")),
            const DropdownMenuItem(value: "Colleague", child: Text("Colleague")),
          ],
          onChanged: (value) {
            relationController.text = value ?? '';
          },
        ),
        const SizedBox(height: 16),
        _buildLabel("Mobile Number"),
        TextFormField(
          controller: mobileController,
          validator: (value) => value!.isEmpty ? 'Required' : null,
          keyboardType: TextInputType.phone,
          decoration: const InputDecoration(
            hintText: "Mobile Number",
            border: OutlineInputBorder(),
           // suffixIcon: Icon(Icons.upload_file), // Upload icon
          ),
          onTap: () {
            // TODO: Add photo upload logic here
          },
        ),
      ],
    );
  }

  Widget _buildLabel(String text) {
    return RichText(
      text: TextSpan(
        text: "$text ",
        style: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
        children: const [
          TextSpan(text: '*', ),
        ],
      ),
    );
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
              title: "Reference Details",
              onBack: () => Navigator.pop(context),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Reference details",
                        style:  TextStyle(
           color: Color.fromRGBO(70, 53, 254, 1),
          fontWeight: FontWeight.bold,
          fontSize: 16,
          ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "Required 2 References",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      const SizedBox(height: 8),
                      _buildReferenceSection(
                        title: "1 Applicant Professional Reference Details" ,
                        nameController: name1Controller,
                        relationController: relation1Controller,
                        mobileController: mobile1Controller,
                      ),
                      const SizedBox(height: 24),
                      _buildReferenceSection(
                        title: "2 Applicant Professional Reference Details",
                        nameController: name2Controller,
                        relationController: relation2Controller,
                        mobileController: mobile2Controller,
                      ),
                      const SizedBox(height: 30),
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
                            "SAVE AND CONTINUE",
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

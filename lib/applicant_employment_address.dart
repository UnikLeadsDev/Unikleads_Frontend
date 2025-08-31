import 'package:flutter/material.dart';
import 'package:loan_application/applicant_non_financial_parameters.dart';
import 'package:loan_application/details_helper.dart';
import 'header_helper.dart';
import 'custom_snackbar.dart';

class ApplicantEmployerAddressScreen extends StatefulWidget {
  const ApplicantEmployerAddressScreen({super.key});

  @override
  State<ApplicantEmployerAddressScreen> createState() =>
      _ApplicantEmployerAddressScreenState();
}

class _ApplicantEmployerAddressScreenState
    extends State<ApplicantEmployerAddressScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for all fields
  final TextEditingController _addressLine1Controller = TextEditingController();
  final TextEditingController _addressLine2Controller = TextEditingController();
  final TextEditingController _pinCodeController = TextEditingController();
  final TextEditingController _localityController = TextEditingController();
  final TextEditingController _landmarkController = TextEditingController();

  // Dropdown values
  String? _selectedState;
  String? _selectedDistrict;
  String? _selectedCity;

  // TODO: Replace with real dropdown list values from backend
  final List<String> states = ["State 1", "State 2", "State 3"];
  final List<String> districts = ["District 1", "District 2"];
  final List<String> cities = ["City 1", "City 2"];

  // TODO: Implement photo upload logic here (inside text field)
  void _uploadPhoto() async {
    // Pick image and upload logic here
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // TODO: Store details into database here
      // Example:
      // backendService.saveEmployerAddress({
      //   "addressLine1": _addressLine1Controller.text,
      //   "addressLine2": _addressLine2Controller.text,
      //   "pinCode": _pinCodeController.text,
      //   "state": _selectedState,
      //   "district": _selectedDistrict,
      //   "city": _selectedCity,
      //   "locality": _localityController.text,
      //   "landmark": _landmarkController.text,
      //   "photo": uploadedPhotoFile,
      // });

      // Navigate to next screen
     Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ApplicantNonFinancialParametersScreen(),
                            ),);
    } else {
      CustomSnackbar.show(context, message: "Please fill all mandatory fields");
    }
  }

  Widget _buildTextField({
    required String hintText,
    required TextEditingController controller,
    bool isMandatory = false,
    TextInputType keyboardType = TextInputType.text,
    bool enablePhotoUpload = false,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: isMandatory ? "$hintText  (*)" : hintText,
        suffixIcon: enablePhotoUpload
            ? IconButton(
                icon: const Icon(Icons.camera_alt, color: Colors.blue),
                onPressed: _uploadPhoto,
              )
            : null,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      validator: (value) {
        if (isMandatory && (value == null || value.trim().isEmpty)) {
          return "This field is required";
        }
        return null;
      },
    );
  }

  Widget _buildDropdown({
    required String hintText,
    required String? value,
    required List<String> items,
    required Function(String?) onChanged,
    bool isMandatory = false,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        hintText: isMandatory ? "$hintText  (*)" : hintText,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      items: items
          .map((e) => DropdownMenuItem(
                value: e,
                child: Text(e),
              ))
          .toList(),
      onChanged: onChanged,
      validator: (val) {
        if (isMandatory && (val == null || val.isEmpty)) {
          return "Please select $hintText";
        }
        return null;
      },
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
            CustomHeader(
              title: "Applicant Employer Address",
              actionWidget: GestureDetector(
                onTap: () {
                  // TODO: Handle skip logic here
                },
                child: const Text(
                  "",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Section Title
                      DetailsFormHelper.sectionTitleWithSkip(
                        title: "Applicant Employer Permanent Address"
                                 ,
                        onSkip: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ApplicantNonFinancialParametersScreen(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 12),

                      _buildTextField(
                        hintText: "Current Address Line 1",
                        controller: _addressLine1Controller,
                        isMandatory: true,
                        
                      ),
                      const SizedBox(height: 12),

                      _buildTextField(
                        hintText: "Current Address Line 2 (Optional)",
                        controller: _addressLine2Controller,
                      ),
                      const SizedBox(height: 12),

                      _buildTextField(
                        hintText: "Pin Code",
                        controller: _pinCodeController,
                        isMandatory: true,
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 12),

                      _buildDropdown(
                        hintText: "State",
                        value: _selectedState,
                        items: states,
                        onChanged: (val) => setState(() => _selectedState = val),
                        isMandatory: true,
                      ),
                      const SizedBox(height: 12),

                      _buildDropdown(
                        hintText: "District",
                        value: _selectedDistrict,
                        items: districts,
                        onChanged: (val) => setState(() => _selectedDistrict = val),
                        isMandatory: true,
                      ),
                      const SizedBox(height: 12),

                      _buildDropdown(
                        hintText: "City",
                        value: _selectedCity,
                        items: cities,
                        onChanged: (val) => setState(() => _selectedCity = val),
                        isMandatory: true,
                      ),
                      const SizedBox(height: 12),

                      _buildTextField(
                        hintText: "Locality/ Village",
                        controller: _localityController,
                        isMandatory: true,
                      ),
                      const SizedBox(height: 12),

                      _buildTextField(
                        hintText: "Near Landmark",
                        controller: _landmarkController,
                        isMandatory: true,
                      ),
                      SizedBox(height: height * 0.04),

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

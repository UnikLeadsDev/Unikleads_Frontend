import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loan_application/applicant_address_screen.dart';
import 'package:loan_application/applicant_kyc-documents.dart';
import 'package:loan_application/details_helper.dart';
import 'package:loan_application/guarrantor1_address.dart';
import 'package:loan_application/header_helper.dart';
import 'custom_snackbar.dart'; // Your snackbar file

class CoApplicantAddress extends StatefulWidget {
  const CoApplicantAddress({super.key});

  @override
  State<CoApplicantAddress> createState() => _COApplicantAddressScreenState();
}

class _COApplicantAddressScreenState extends State<CoApplicantAddress> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final currentAddress1Controller = TextEditingController();
  final currentAddress2Controller = TextEditingController();
  final currentPincodeController = TextEditingController();
  final currentLocalityController = TextEditingController();
  final currentLandmarkController = TextEditingController();

  final permanentAddress1Controller = TextEditingController();
  final permanentAddress2Controller = TextEditingController();
  final permanentPincodeController = TextEditingController();
  final permanentLocalityController = TextEditingController();
  final permanentLandmarkController = TextEditingController();

  // Dropdown values
  String? currentState;
  String? currentDistrict;
  String? currentCity;

  String? permanentState;
  String? permanentDistrict;
  String? permanentCity;

  bool sameAsAbove = false;

  // Example dropdown data
  final List<String> states = [
    'State 1',
    'State 2',
    'State 3',
  ]; // TODO: Replace with API data
  final List<String> districts = [
    'District 1',
    'District 2',
    'District 3',
  ]; // TODO: Replace with API data
  final List<String> cities = [
    'City 1',
    'City 2',
    'City 3',
  ]; // TODO: Replace with API data

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: SafeArea(
          top:false,
        child: Column(
          children: [
            
            CustomHeader(title: "Co.Applicant Current Adress"),

            // ===== FORM =====
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.w),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // -------- Current Address --------
                      DetailsFormHelper.sectionTitleWithSkip(
                        title: "Co. Applicant Current Address",
                        onSkip: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Guarrantor1Address(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      _buildTextField(
                        currentAddress1Controller,
                        "Current Address Line 1 (*)",
                      ),
                      _buildTextField(
                        currentAddress2Controller,
                        "Current Address Line 2 (Optional)",
                        isRequired: false,
                      ),
                      _buildTextField(currentPincodeController, "Pin Code"),
                      _buildDropdown(
                        states,
                        currentState,
                        "State",
                        (value) => setState(() => currentState = value),
                      ),
                      _buildDropdown(
                        districts,
                        currentDistrict,
                        "District",
                        (value) => setState(() => currentDistrict = value),
                      ),
                      _buildDropdown(
                        cities,
                        currentCity,
                        "City",
                        (value) => setState(() => currentCity = value),
                      ),
                      _buildTextField(
                        currentLocalityController,
                        "Locality/ Village",
                      ),
                      _buildTextField(
                        currentLandmarkController,
                        "Near Landmark",
                      ),

                      const SizedBox(height: 20),

                      // -------- Permanent Address --------
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           Text(
                            "Co. Applicant Permanant Address ",
                            style: TextStyle(
                              color: Color.fromRGBO(70, 53, 254, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp,
                            ),
                          ),
                          Expanded(
                            child: Row(
                               mainAxisSize: MainAxisSize.min,
                              children: [
                                Checkbox(
                                  value: sameAsAbove,
                                  onChanged: (value) {
                                    setState(() {
                                      sameAsAbove = value ?? false;
                                      if (sameAsAbove) {
                                        permanentAddress1Controller.text =
                                            currentAddress1Controller.text;
                                        permanentAddress2Controller.text =
                                            currentAddress2Controller.text;
                                        permanentPincodeController.text =
                                            currentPincodeController.text;
                                        permanentLocalityController.text =
                                            currentLocalityController.text;
                                        permanentLandmarkController.text =
                                            currentLandmarkController.text;
                                        permanentState = currentState;
                                        permanentDistrict = currentDistrict;
                                        permanentCity = currentCity;
                                      } else {
                                        permanentAddress1Controller.clear();
                                        permanentAddress2Controller.clear();
                                        permanentPincodeController.clear();
                                        permanentLocalityController.clear();
                                        permanentLandmarkController.clear();
                                        permanentState = null;
                                        permanentDistrict = null;
                                        permanentCity = null;
                                      }
                                    });
                                  },
                                ),
                                 Text("Same As Above", style: TextStyle(fontSize: 13.sp)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      _buildTextField(
                        permanentAddress1Controller,
                        "Permanent Address Line 1 (*)",
                      ),
                      _buildTextField(
                        permanentAddress2Controller,
                        "Permanent Address Line 2 (Optional)",
                        isRequired: false,
                      ),
                      _buildTextField(permanentPincodeController, "Pin Code"),
                      _buildDropdown(
                        states,
                        permanentState,
                        "State",
                        (value) => setState(() => permanentState = value),
                      ),
                      _buildDropdown(
                        districts,
                        permanentDistrict,
                        "District",
                        (value) => setState(() => permanentDistrict = value),
                      ),
                      _buildDropdown(
                        cities,
                        permanentCity,
                        "City",
                        (value) => setState(() => permanentCity = value),
                      ),
                      _buildTextField(
                        permanentLocalityController,
                        "Locality/ Village",
                      ),
                      _buildTextField(
                        permanentLandmarkController,
                        "Near Landmark",
                      ),

                      const SizedBox(height: 30),

                      // SAVE & NEXT
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1769E9),
                            shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          onPressed: _handleSubmit,
                          child: const Text(
                            "SAVE & NEXT",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
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

  Widget _buildTextField(
    TextEditingController controller,
    String hint, {
    bool isRequired = true,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 14,
          ),
        ),
        validator:
            isRequired
                ? (value) =>
                    value == null || value.isEmpty ? "Please enter $hint" : null
                : null,
      ),
    );
  }

  Widget _buildDropdown(
    List<String> items,
    String? selectedValue,
    String hint,
    ValueChanged<String?> onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: DropdownButtonFormField<String>(
        value: selectedValue,
        items:
            items.map((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 14,
          ),
        ),
        validator:
            (value) =>
                value == null || value.isEmpty ? "Please select $hint" : null,
      ),
    );
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      //  Store details to database here
      // TODO: Integrate with backend API

      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Guarrantor1Address()),
      ); // Route to next screen
    } else {
      CustomSnackbar.show(context, message: "Please fill all required fields");
    }
  }
}

import 'package:flutter/material.dart';
import 'package:loan_application/applicant_address_screen.dart';
import 'package:loan_application/co_applicant_address.dart';
import 'package:loan_application/details_helper.dart';
import 'package:loan_application/header_helper.dart';
import 'custom_snackbar.dart';

class Guarrantor2BasicDetails extends StatefulWidget {
  const Guarrantor2BasicDetails({Key? key}) : super(key: key);

  @override
  State<Guarrantor2BasicDetails> createState() =>
      _Guarrantor2BasicDetailsScreenState();
}

class _Guarrantor2BasicDetailsScreenState
    extends State<Guarrantor2BasicDetails> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final firstNameController = TextEditingController();
  final middleNameController = TextEditingController();
  final lastNameController = TextEditingController();
  DateTime? dateOfBirth;
  String? gender;
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  String maritalStatus = "Single";
  final spouseNameController = TextEditingController();
  final fatherNameController = TextEditingController();
  final motherNameController = TextEditingController();
  String? education;
  String? occupation;

  @override
  void dispose() {
    firstNameController.dispose();
    middleNameController.dispose();
    lastNameController.dispose();
    mobileController.dispose();
    emailController.dispose();
    spouseNameController.dispose();
    fatherNameController.dispose();
    motherNameController.dispose();
    super.dispose();
  }

  final List<String> genderList = ["Male", "Female", "Other"];
  final List<String> educationList = ["High School", "Bachelor's", "Master's"];
  final List<String> occupationList = [
    "Employed",
    "Self-employed",
    "Unemployed",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: SafeArea(
          top:false,
        child: Column(
          children: [
            // _buildHeader(),
            CustomHeader(title: "Guarantor Basic Details"),


            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DetailsFormHelper.sectionTitleWithSkip(
                        title: "2.Guarrantor Details",
                        onSkip: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => CoApplicantAddress(),
                            ),
                          );
                        },
                      ),
                      //if skip then next page without submit method written in details_helper

                      DetailsFormHelper.buildTextField(
                        firstNameController,
                        "First Name *",
                      ),
                      DetailsFormHelper.buildTextField(
                        middleNameController,
                        "Middle Name *",
                      ),
                      DetailsFormHelper.buildTextField(
                        lastNameController,
                        "Last Name *",
                      ),
                      DetailsFormHelper.buildDatePicker(
                        context,
                        "Date of Birth *",
                        dateOfBirth,
                        (picked) => setState(() => dateOfBirth = picked),
                      ),

                      DetailsFormHelper.sectionTitle("Gender"),
                      DetailsFormHelper.buildDropdownField(
                        value: gender,
                        hint: "Select",
                        items: genderList,
                        onChanged: (val) => setState(() => gender = val),
                      ),

                      DetailsFormHelper.buildTextField(
                        mobileController,
                        "Mobile Number *",
                        keyboardType: TextInputType.phone,
                      ),
                      DetailsFormHelper.buildTextField(
                        emailController,
                        "Email ID *",
                        keyboardType: TextInputType.emailAddress,
                      ),

                      DetailsFormHelper.sectionTitle("Marital Status"),
                      Row(
                        children: [
                          Expanded(
                            child: DetailsFormHelper.buildRadioButton(
                              value: "Single",
                              groupValue: maritalStatus,
                              onChanged:
                                  (val) => setState(() => maritalStatus = val!),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: DetailsFormHelper.buildRadioButton(
                              value: "Married",
                              groupValue: maritalStatus,
                              onChanged:
                                  (val) => setState(() => maritalStatus = val!),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      DetailsFormHelper.buildTextField(
                        spouseNameController,
                        "Spouse Name *",
                      ),
                      DetailsFormHelper.buildTextField(
                        fatherNameController,
                        "Father Full Name *",
                      ),
                      DetailsFormHelper.buildTextField(
                        motherNameController,
                        "Mother Name *",
                      ),
                      //const Sizedbox(height:10),
                      DetailsFormHelper.buildDropdownField(
                        value: education,
                        hint: "Education *",
                        items: educationList,
                        onChanged: (val) => setState(() => education = val),
                      ),

                      DetailsFormHelper.buildDropdownField(
                        value: occupation,
                        hint: "Occupation *",
                        items: occupationList,
                        onChanged: (val) => setState(() => occupation = val),
                      ),

                      const SizedBox(height: 20),
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
                            style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
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

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.16,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0D47A1), Color(0xFF1976D2)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Row(
              children: const [
                Icon(Icons.arrow_back, color: Colors.white),
                SizedBox(width: 6),
                Text(
                  "BACK",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Applicant Basic Details",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      // TODO: Store details in database here
      //       // Example: API call to backend

      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => CoApplicantAddress()));
    } else {
      CustomSnackbar.show(context, message: "Please fill all mandatory fields");
    }
  }
}

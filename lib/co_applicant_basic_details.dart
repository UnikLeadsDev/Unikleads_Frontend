

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loan_application/applicant_address_screen.dart';
import 'package:loan_application/details_helper.dart';
import 'package:loan_application/guarrantor1_basic_details.dart';
import 'package:loan_application/header_helper.dart';
import 'custom_snackbar.dart';

class CoApplicantBasicDetailsScreen extends StatefulWidget {
  const CoApplicantBasicDetailsScreen({Key? key}) : super(key: key);

  @override
  State<CoApplicantBasicDetailsScreen> createState() =>
      _COApplicantBasicDetailsScreenState();
}

class _COApplicantBasicDetailsScreenState
    extends State<CoApplicantBasicDetailsScreen> {
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
            CustomHeader(title: "Co. Applicant Basic Details"),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 8.h,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DetailsFormHelper.sectionTitleWithSkip(
                        title: "Co. Applicant Basic Details",
                        onSkip: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  const Guarrantor1BasicDetails(),
                            ),
                          );
                        },
                      ),

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

                      DetailsFormHelper.sectionTitle("Gender "),
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
                              onChanged: (val) =>
                                  setState(() => maritalStatus = val!),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Expanded(
                            child: DetailsFormHelper.buildRadioButton(
                              value: "Married",
                              groupValue: maritalStatus,
                              onChanged: (val) =>
                                  setState(() => maritalStatus = val!),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),

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

                      SizedBox(height: 20.h),

                      SizedBox(
                        width: double.infinity,
                        height: 50.h, // responsive height
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
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 16.sp, // responsive text
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 20.h),
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

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => const Guarrantor1BasicDetails()));
    } else {
      CustomSnackbar.show(context, message: "Please fill all mandatory fields");
    }
  }
}

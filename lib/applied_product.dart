

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loan_application/applicant_basic_details.dart';
import 'package:loan_application/drop_and_normal_text.dart';
import 'package:loan_application/form_submit_helper.dart';
import 'package:loan_application/header_helper.dart';

class AppliedProductScreen extends StatefulWidget {
  const AppliedProductScreen({Key? key}) : super(key: key);

  @override
  State<AppliedProductScreen> createState() => _AppliedProductScreenState();
}

class _AppliedProductScreenState extends State<AppliedProductScreen> {
  final _formKey = GlobalKey<FormState>();
  final DropdownAndNormaltext dropdownAndNormaltext = DropdownAndNormaltext();
  
  // Controllers
  String? productCategory;
  String? productName;
  String? applicantClass;
  DateTime? applicationDate;
  final loanAmountController = TextEditingController();
  final tenureController = TextEditingController();
  final interestRateController = TextEditingController();

  // Example dropdown data (replace with backend data later)
  final List<String> productCategories = [
    'Category 1',
    'Category 2',
    'Category 3',
    // TODO: Replace with backend list
  ];
  final List<String> productNames = [
    'Product 1',
    'Product 2',
    'Product 3',
    // TODO: Replace with backend list
  ];
  final List<String> applicantClasses = [
    'Class A',
    'Class B',
    'Class C',
    // TODO: Replace with backend list
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: Column(
            children: [
             
      CustomHeader(title: "Applied Product"),
              // FORM
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        dropdownAndNormaltext.sectionTitle("Applied Product",isRequired: true,),
      
                        dropdownAndNormaltext.buildDropdownField(
                          label: "",
                          value: productCategory,
                          items: productCategories,
                          onChanged: (value) =>
                              setState(() => productCategory = value),
                          hint: 'Product Category *',
                          //isRequired: true
                        ),
      
                        dropdownAndNormaltext.buildDropdownField(
                          label: "",
                          value: productName,
                          items: productNames,
                          onChanged: (value) =>
                              setState(() => productName = value),
                          hint: 'Product Name *',
                        ),
      
                        dropdownAndNormaltext.buildDropdownField(
                          label: "",
                          value: applicantClass,
                          items: applicantClasses,
                          onChanged: (value) =>
                              setState(() => applicantClass = value),
                          hint: 'Applicant Class *',
                        ),
      
                        dropdownAndNormaltext.buildDatePicker(
                          context: context,
                          label: "Application Date",
                          date: applicationDate,
                          onPick: (picked) =>
                              setState(() => applicationDate = picked),
                        ),
      
                        dropdownAndNormaltext.sectionTitle("Applied Product",isRequired:true),
      
                        dropdownAndNormaltext.buildTextField(
                          controller: loanAmountController,
                          label: "Requested Loan Amount *",
                          keyboardType: TextInputType.number,
                        ),
      
                        dropdownAndNormaltext.buildTextField(
                          controller: tenureController,
                          label: "Tenure in Months *",
                          keyboardType: TextInputType.number,
                        ),
      
                        dropdownAndNormaltext.buildTextField(
                          controller: interestRateController,
                          label: "Interest Rate *",
                          keyboardType: TextInputType.number,
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
                            onPressed: () {
                              FormSubmitHelper.handleSubmit(
                                context: context,
                                formKey: _formKey,
                                onSuccess: () {
                                  // ✅ Navigate or do something after validation
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          ApplicantBasicDetailsScreen(),
                                    ),
                                  );
                                },
                              );
                            },
                            child: const Text(
                              "SAVE & NEXT",
                              
                              style: TextStyle(fontWeight: FontWeight.bold,
                              color: Colors.white,
                              
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
    );
  }
}
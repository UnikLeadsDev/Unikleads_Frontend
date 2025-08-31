import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loan_application/applicant_employment_address.dart';
import 'package:loan_application/details_helper.dart';
import 'package:loan_application/header_helper.dart';
import 'custom_snackbar.dart'; 
import 'applicant_address_screen.dart'; 

class ApplicantEmploymentDetailsScreen extends StatefulWidget {
  const ApplicantEmploymentDetailsScreen({super.key});

  @override
  State<ApplicantEmploymentDetailsScreen> createState() => _ApplicantEmploymentDetailsScreenState();
}

class _ApplicantEmploymentDetailsScreenState extends State<ApplicantEmploymentDetailsScreen> {
  final _formKey = GlobalKey<FormState>();

  String? employmentType;
  String? salaryMode;
  String? jobFunction;
  String? designation;

  final TextEditingController employerNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController workingSinceController = TextEditingController();
  final TextEditingController salaryController = TextEditingController();
  final TextEditingController employeeIdController = TextEditingController();
  final TextEditingController uanController = TextEditingController();
  final TextEditingController epfoController = TextEditingController();

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        workingSinceController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // TODO: Integrate with backend API to store data in DB
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ApplicantEmployerAddressScreen()),
      );
    } else {
      CustomSnackbar.show(context, message: "Please fill all required fields");
    }
  }

  Widget _buildDropdownField({
    required String label,
    required String? value,
    required Function(String?) onChanged,
    required List<String> items,
  }) {
    return DropdownButtonFormField<String>(
      decoration: _inputDecoration(label),
      value: value,
      onChanged: onChanged,
      items: items
          .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              ))
          .toList(),
      validator: (val) => val == null || val.isEmpty ? 'Required' : null,
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    );
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
            // Custom header with skip
            CustomHeader(
            title: "Applicant Employment Details",
          ),
      
            
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                       DetailsFormHelper.sectionTitleWithSkip(
                        title: "Applicant Employment Details",
                        onSkip: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ApplicantEmployerAddressScreen(),
                            ),
                          );
                        },
                      ),
                      _buildDropdownField(
                        label: "Employment Type",
                        value: employmentType,
                        onChanged: (val) => setState(() => employmentType = val),
                        items: [
                          "Full-time",
                          "Part-time",
                          "Self-employed",
                          // TODO: Fetch from backend
                        ],
                      ),
                      const SizedBox(height: 12),

                      TextFormField(
                        controller: employerNameController,
                        decoration: _inputDecoration("Employer Name"),
                        validator: (val) => val == null || val.isEmpty ? 'Required' : null,
                      ),
                      const SizedBox(height: 12),

                      TextFormField(
                        controller: emailController,
                        decoration: _inputDecoration("Official Email"),
                        validator: (val) => val == null || val.isEmpty ? 'Required' : null,
                      ),
                      const SizedBox(height: 12),

                      TextFormField(
                        controller: workingSinceController,
                        readOnly: true,
                        decoration: _inputDecoration("Working Since").copyWith(
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.calendar_today),
                            onPressed: _selectDate,
                          ),
                        ),
                        validator: (val) => val == null || val.isEmpty ? 'Required' : null,
                      ),
                      const SizedBox(height: 12),

                      TextFormField(
                        controller: salaryController,
                        decoration: _inputDecoration("Net Monthly Salary"),
                        validator: (val) => val == null || val.isEmpty ? 'Required' : null,
                      ),
                      const SizedBox(height: 12),

                      _buildDropdownField(
                        label: "Salary Received Mode",
                        value: salaryMode,
                        onChanged: (val) => setState(() => salaryMode = val),
                        items: [
                          "Bank Transfer",
                          "Cash",
                          // TODO: Fetch from backend
                        ],
                      ),
                      const SizedBox(height: 12),

                      _buildDropdownField(
                        label: "Job Function",
                        value: jobFunction,
                        onChanged: (val) => setState(() => jobFunction = val),
                        items: [
                          "IT",
                          "Finance",
                          "HR",
                          // TODO: Fetch from backend
                        ],
                      ),
                      const SizedBox(height: 12),

                      _buildDropdownField(
                        label: "Designation",
                        value: designation,
                        onChanged: (val) => setState(() => designation = val),
                        items: [
                          "Manager",
                          "Developer",
                          "Analyst",
                          // TODO: Fetch from backend
                        ],
                      ),
                      const SizedBox(height: 12),

                      TextFormField(
                        controller: employeeIdController,
                        decoration: _inputDecoration("Employee ID"),
                        validator: (val) => val == null || val.isEmpty ? 'Required' : null,
                      ),
                      const SizedBox(height: 12),

                      TextFormField(
                        controller: uanController,
                        decoration: _inputDecoration("UAN Number"),
                        validator: (val) => val == null || val.isEmpty ? 'Required' : null,
                      ),
                      const SizedBox(height: 12),

                      TextFormField(
                        controller: epfoController,
                        decoration: _inputDecoration("EPFO Number"),
                        validator: (val) => val == null || val.isEmpty ? 'Required' : null,
                      ),
                      const SizedBox(height: 12),

                      

                      const SizedBox(height: 20),
                      SizedBox(
                        width: size.width,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: _submitForm,
                         style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1769E9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text("SAVE & NEXT", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,)),
                        ),
                      )
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

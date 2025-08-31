import 'package:flutter/material.dart';
import 'package:loan_application/loan_fee_charges.dart';
import 'custom_snackbar.dart';
import 'header_helper.dart';

class ApplicantBankDetailsScreen extends StatefulWidget {
  const ApplicantBankDetailsScreen({super.key});

  @override
  State<ApplicantBankDetailsScreen> createState() => _ApplicantBankDetailsScreenState();
}

class _ApplicantBankDetailsScreenState extends State<ApplicantBankDetailsScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _bankNameController = TextEditingController();
  final TextEditingController _accountNumberController = TextEditingController();
  final TextEditingController _confirmAccountNumberController = TextEditingController();
  final TextEditingController _ifscCodeController = TextEditingController();
  final TextEditingController _accountHolderNameController = TextEditingController();
  final TextEditingController _branchNameController = TextEditingController();

  String _accountType = "Saving";

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // TODO: Store details in database
      // Example: send details to backend API here
     Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => LoanFeeChargesDetailsScreen()),); // Route space for next screen
    } else {
      CustomSnackbar.show(context, message: "Please fill all required fields");
    }
  }

  Widget _buildUploadField(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            text: label,
            style: const TextStyle(fontWeight: FontWeight.w500),
            children: const [
              TextSpan(text: " *", style: TextStyle(color: Colors.red)),
            ],
          ),
        ),
        const SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(6),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(child: Text("")),
              GestureDetector(
                onTap: () {
                  // TODO: Implement file picker and backend upload logic here
                },
                child: const Text(
                  "Upload",
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller, {
    TextInputType inputType = TextInputType.text,
    bool obscure = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            text: label,
            style: const TextStyle(fontWeight: FontWeight.w500),
            children: const [
              TextSpan(text: " *", style: TextStyle(color: Colors.red)),
            ],
          ),
        ),
        const SizedBox(height: 5),
        TextFormField(
          controller: controller,
          keyboardType: inputType,
          obscureText: obscure,
          validator: (value) => value!.isEmpty ? "This field is required" : null,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
          ),
        ),
      ],
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
            CustomHeader(
              title: "Applicant Bank Details",
              onBack: () => Navigator.pop(context),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "ENTER BORROWERS BANK DETAILS",
                        style:  TextStyle(
           color: Color.fromRGBO(70, 53, 254, 1),
          fontWeight: FontWeight.bold,
          fontSize: 16,
          ),
                      ),
                      const SizedBox(height: 10),
                      _buildTextField("Bank Name", _bankNameController),

                      const SizedBox(height: 15),
                      Text.rich(
                        const TextSpan(
                          text: "Type of Account",
                          style: TextStyle(fontWeight: FontWeight.w500),
                          children: [
                            TextSpan(text: " *", style: TextStyle(color: Colors.red)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Expanded(
                            child: RadioListTile(
                              contentPadding: EdgeInsets.zero,
                              title: const Text("Saving"),
                              value: "Saving",
                              groupValue: _accountType,
                              onChanged: (value) {
                                setState(() {
                                  _accountType = value.toString();
                                });
                              },
                            ),
                          ),
                          Expanded(
                            child: RadioListTile(
                              contentPadding: EdgeInsets.zero,
                              title: const Text("Current"),
                              value: "Current",
                              groupValue: _accountType,
                              onChanged: (value) {
                                setState(() {
                                  _accountType = value.toString();
                                });
                              },
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),
                      _buildTextField("Bank Account Number", _accountNumberController, inputType: TextInputType.number),

                      const SizedBox(height: 15),
                      _buildTextField("Confirm Bank Account Number", _confirmAccountNumberController, inputType: TextInputType.number),

                      const SizedBox(height: 15),
                      _buildTextField("IFSC Code", _ifscCodeController),

                      const SizedBox(height: 15),
                      _buildTextField("Account Holder Name", _accountHolderNameController),

                      const SizedBox(height: 15),
                      _buildTextField("Branch Name", _branchNameController),


                      const SizedBox(height: 25),
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
                            "VERIFY BANK ACCOUNT",
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

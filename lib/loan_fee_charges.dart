import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loan_application/applicant_premises_photo.dart';
import 'header_helper.dart';
import 'custom_snackbar.dart';

class LoanFeeChargesDetailsScreen extends StatefulWidget {
  const LoanFeeChargesDetailsScreen({super.key});

  @override
  State<LoanFeeChargesDetailsScreen> createState() =>
      _LoanFeeChargesDetailsScreenState();
}

class _LoanFeeChargesDetailsScreenState
    extends State<LoanFeeChargesDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  bool verifiedFlag = false;
  final picker = ImagePicker();

  // Controllers for text fields
  final Map<String, TextEditingController> _controllers = {
    "loanPlan": TextEditingController(),
    "loanAppliedDate": TextEditingController(),
    "sanctionedAmount": TextEditingController(),
    "loanTenure": TextEditingController(),
    "processingFee": TextEditingController(),
    "amountCredited": TextEditingController(),
    "totalEmis": TextEditingController(),
    "emiBouncingCharges": TextEditingController(),
    "emiBouncingGST": TextEditingController(),
    "latePaymentCharges": TextEditingController(),
    "latePaymentGST": TextEditingController(),
    "totalRepayment": TextEditingController(),
  };

  Future<void> _pickImage(TextEditingController controller) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      // Store file path in controller
      controller.text = pickedFile.name;
      // TODO: Send file to backend here
    }
  }

  void _onVerify() {
    setState(() {
      verifiedFlag = true;
    });
    // TODO: Add backend verification logic here
  }

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // TODO: Send all field data to backend/database here

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ApplicantPremisesPhotosScreen(),
        ),
      ); // Route to next screen
    } else {
      CustomSnackbar.show(context, message: "Please fill all required fields");
    }
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    bool hasVerify = false,
    bool hasUpload = false,
    bool isRequired = true,
  }) {
    return TextFormField(
      controller: controller,
      validator: (val) {
        if (isRequired && (val == null || val.isEmpty)) {
          return "Required field";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
        suffixIcon:
            hasVerify
                ? GestureDetector(
                  onTap: _onVerify,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Center(
                      child: Text(
                        verifiedFlag ? "Verified" : "Verify",
                        style: TextStyle(
                          color: verifiedFlag ? Colors.green : Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
                : hasUpload
                ? IconButton(
                  icon: const Icon(Icons.upload_file, color: Colors.blue),
                  onPressed: () => _pickImage(controller),
                )
                : null,
      ),
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
            const CustomHeader(title: "LOANS FEE, CHARGES, DETAILS"),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "APPLIED LOANS FEE, CHARGES, NET DISBURSEMENT DETAILS",
                        style: TextStyle(
                          color: Color.fromRGBO(70, 53, 254, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Dropdown placeholder
                      // TODO: Add Dropdown widget for Loan Plan with backend integration
                      _buildTextField(
                        label: "Loan Plan *",
                        controller: _controllers["loanPlan"]!,
                        isRequired: true,
                      ),
                      const SizedBox(height: 12),

                      _buildTextField(
                        label: "Loan Applied Date",
                        controller: _controllers["loanAppliedDate"]!,
                      ),
                      const SizedBox(height: 12),

                      _buildTextField(
                        label: "Sanctioned Amount",
                        controller: _controllers["sanctionedAmount"]!,
                      ),
                      const SizedBox(height: 12),

                      _buildTextField(
                        label: "Loan Tenure",
                        controller: _controllers["loanTenure"]!,
                      ),
                      const SizedBox(height: 12),

                      _buildTextField(
                        label: "Processing Fee",
                        controller: _controllers["processingFee"]!,
                      ),
                      const SizedBox(height: 12),

                      _buildTextField(
                        label: "Amount Will Credited",
                        controller: _controllers["amountCredited"]!,
                      ),
                      const SizedBox(height: 12),

                      _buildTextField(
                        label: "Total EMIs",
                        controller: _controllers["totalEmis"]!,
                      ),
                      const SizedBox(height: 12),

                      _buildTextField(
                        label: "EMI Bouncing Charges",
                        controller: _controllers["emiBouncingCharges"]!,
                      ),
                      const SizedBox(height: 12),

                      _buildTextField(
                        label: "EMI Bouncing GST 18%",
                        controller: _controllers["emiBouncingGST"]!,
                      ),
                      const SizedBox(height: 12),

                      _buildTextField(
                        label: "Late Payment Charges",
                        controller: _controllers["latePaymentCharges"]!,
                      ),
                      const SizedBox(height: 12),

                      _buildTextField(
                        label: "Late Payment on GST 18%",
                        controller: _controllers["latePaymentGST"]!,
                      ),
                      const SizedBox(height: 12),

                      _buildTextField(
                        label: "Total Repayment",
                        controller: _controllers["totalRepayment"]!,
                        //hasVerify: true, // Example field with verify
                      ),
                      const SizedBox(height: 20),

                      SizedBox(
                        width: size.width,
                        height: 48,
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
}

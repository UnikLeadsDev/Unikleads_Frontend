import 'package:flutter/material.dart';
import 'package:loan_application/document_signing.dart';
import 'header_helper.dart'; 
import 'custom_snackbar.dart'; 

class RegisterPaperNachScreen extends StatefulWidget {
  const RegisterPaperNachScreen({super.key});

  @override
  State<RegisterPaperNachScreen> createState() =>
      _RegisterPaperNachScreenState();
}

class _RegisterPaperNachScreenState extends State<RegisterPaperNachScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController _uploadController = TextEditingController();
  final TextEditingController _eNachController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  // State variables
  String? uploadedFilePath;
  bool _isENachInitiated = false; // for button color change

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
              title: "Register Paper NACH, eNACH",
              onBack: () => Navigator.pop(context),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        " Register Paper NACH, eNACH",
                        style: TextStyle(
                          color: Color.fromRGBO(70, 53, 254, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Upload Field
                      const Text(
                        "Paper NACH Mandate Manual Upload",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: _uploadController,
                        readOnly: true,
                        onTap: _handleUpload,
                        decoration: InputDecoration(
                          hintText: "Upload",
                          suffix: GestureDetector(
                            onTap: _handleUpload,
                            child: const Text(
                              "Upload",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 14,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please upload file";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        "JPG, JPEG, PNG, PDF Upto 5MB",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      const SizedBox(height: 20),

                      // eNACH Registration
                      const Text(
                        "eNACH Registration",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: _eNachController,
                        readOnly: true,
                        onTap: _initiateENach,
                        decoration: InputDecoration(
                          hintText: "Initiate for eNACH Registration",
                          hintStyle: TextStyle(
                            color:
                                _isENachInitiated ? Colors.green : Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 14,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please initiate eNACH Registration";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),

                      // Date Field
                      const Text(
                        "Date of eNACH Registration*",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: _dateController,
                        readOnly: true,
                        onTap: _pickDate,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 14,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please select date";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),

                      // Save & Next Button
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
                          onPressed: _handleSubmit,
                          child: const Text(
                            "SAVE & NEXT",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
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

  void _handleUpload() async {
    // TODO: Add backend file picker logic here
    setState(() {
      _uploadController.text = "sample_file.pdf";
      uploadedFilePath = "path/to/sample_file.pdf";
    });
  }

  void _initiateENach() {
    // Simulate initiating eNACH process
    setState(() {
      _isENachInitiated = true;
      _eNachController.text = "Filled"; // so validation passes
    });
  }

  void _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      // TODO: Backend - save details to database here
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => DocumentSigningScreen()));
    } else {
      CustomSnackbar.show(context, message: "Please fill all fields");
    }
  }
}

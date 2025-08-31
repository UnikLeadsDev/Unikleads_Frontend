import 'package:flutter/material.dart';
import 'package:loan_application/applied_product.dart';
import 'package:loan_application/my_sales_dashboard.dart';
import 'header_helper.dart';
import 'package:lottie/lottie.dart'; 

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          top:false,
        child: Column(
          children: [
            const CustomHeader(title: "Preview Completed"),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    
                    const SizedBox(height: 20),
                    const Text(
                      "Your application Preview Completed!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Again Button
                    SizedBox(
                      width: 180,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1769E9),
                          shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {
                          // TODO: Add navigation logic here
                          // Navigator.pushNamed(context, '/formScreen');
                          Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => DashboardScreen()));
                        },
                        child: const Text(
                          "Again",
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
          ],
        ),
      ),
    );
  }
}

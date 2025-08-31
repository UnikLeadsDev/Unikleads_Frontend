import 'package:loan_application/colors.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  child: Image.asset(
                    'assets/header_bg1.png',
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: 190,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 42,
                    left: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.popAndPushNamed(
                                context, '/referralscreen'),
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.arrow_back_ios,
                                  size: 15,
                                  color: AppColors.whiteColor,
                                ),
                                Text(
                                  'BACK',
                                  style: TextStyle(
                                      color: AppColors.whiteColor,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Image.asset(
                                "assets/notification.png",
                                height: 40,
                                width: 40,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40), 
                      const Text(
                        'Terms & Conditions',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10), 
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(8)),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "1. Applications Referral Program",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 12),
                      buildTermsItem(
                          title: "Referral Points: ",
                          description:
                              "User earn 100 points for each successsful referral(when the referred user installs the application)."),
                      const Divider(thickness: 1),
                      buildTermsItem(
                          title: "Point Value: ",
                          description: "1 point = ₹0.25"),
                      const Divider(thickness: 1),
                      buildTermsItem(
                          title: "Redemption Threshold: ",
                          description:
                              "Users can redeem points only when they have accumulated at least 1000 points."),
                      const Divider(thickness: 1),
                      const SizedBox(height: 12),
                      const Text(
                        "2. Product Referral Earning Program",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 12),
                      buildTermsItem(
                          title: "Application Referral: ",
                          description:
                              "Tracking if the referral was sucesssful in the application installation."),
                      const Divider(thickness: 1),
                      buildTermsItem(
                          title: "Type of Product Referral: ",
                          description:
                              "Identifying the specific product being referred (e.g., personal loans, credit cards, insurance)."),
                      const Divider(thickness: 1),
                      const SizedBox(height: 12),
                      const Text(
                        "3. Earnings:",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 12),
                      buildTermsItem(
                          title: "",
                          description:
                              "Based on the predefined values for each product referral, the earned amount will be credited to the user's wallet account."),
                      buildTermsItem(
                          title: "",
                          description:
                              "Wallet to bank account money transfer option will be available, allowing users to easily transfer their earnings from the wallet to thier bank account once eligible."),
                      const Divider(thickness: 1),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget buildTermsItem({required String title, required String description}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('•', style: TextStyle(fontSize: 14)),
        const SizedBox(width: 8),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: const TextStyle(fontSize: 16, color: Colors.black),
              children: [
                TextSpan(
                  text: title,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                TextSpan(
                  text: description,
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

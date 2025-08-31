import 'package:loan_application/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

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
                             onTap: () => Navigator.pop(context),
                            child: const Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: Row(
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
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                "assets/notification.png",
                                height: 40,
                                width: 40,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        'Customer Support Center',
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Hey Sangram!",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "we are here to help.",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Lottie.asset("assets/animation/support.json",
                      height: 200, width: 300, fit: BoxFit.fill),
                  const Text(
                    "Get in touch",
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "We are always within your reach",
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  const Divider(color: Colors.grey),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Call us for immediate support",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "022-69711979",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF1769E9),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "We're available from:",
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  "Mon to Sat (09:30 am to 06:30 pm)",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Lottie.asset("assets/animation/call.json",
                              height: 40, width: 40),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(color: Colors.grey),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      SvgPicture.asset("assets/location.svg",
                          height: 20, width: 20),
                      const SizedBox(width: 5),
                      const Text(
                        "Registered Office",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.only(left: 25.0),
                    child: Text(
                      "Flat No F 1302, Tanish Pearls Airport Road, Charholi, Pune, Maharashtra. - 412105",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Divider(color: Colors.grey),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      SvgPicture.asset("assets/whatsapp.svg",
                          height: 30, width: 30),
                      const SizedBox(width: 8),
                      const Text(
                        'Chat with us',
                        style: TextStyle(fontSize: 18),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey.shade700,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(color: Colors.grey),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      SvgPicture.asset("assets/live.svg",
                          height: 30, width: 30),
                      const SizedBox(width: 8),
                      const Text(
                        'Live Support',
                        style: TextStyle(fontSize: 18),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey.shade700,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(color: Colors.grey),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      SvgPicture.asset("assets/mail.svg",
                          height: 30, width: 30),
                      const SizedBox(width: 8),
                      const Text(
                        'Write an email to us',
                        style: TextStyle(fontSize: 18),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey.shade700,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(color: Colors.grey),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:loan_application/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RevenueScreen extends StatelessWidget {
  const RevenueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
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
                    height: 400,
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
                            onTap: () => Navigator.pop(
                                context),
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
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
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
                      const SizedBox(height: 10),
                      const Text(
                        'My All Revenue',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 140),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.blue.shade50.withOpacity(0.2),
                        ),
                        height: 250,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 6),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(width: 14),
                                  const Column(
                                    children: [
                                      Text(
                                        "Total Earned Amount",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 15),
                                  Container(
                                      height: 40,
                                      width: 1,
                                      color: Colors.white30),
                                  const SizedBox(width: 50),
                                  const Column(
                                    children: [
                                      Text(
                                        "₹ 5800",
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(height: 20),
                              Container(
                                  height: 1,
                                  width: double.infinity,
                                  color: Colors.white30),
                              const SizedBox(height: 20),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 20),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                            "assets/paid.svg"),
                                      ],
                                    ),
                                    const SizedBox(width: 20),
                                    const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Paid",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          "₹ 1600",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 50),
                                    Container(
                                        height: 40,
                                        width: 1,
                                        color: Colors.white30),
                                    const SizedBox(width: 30),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(
                                            "assets/pending.svg"),
                                      ],
                                    ),
                                    const SizedBox(width: 15),
                                    const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Pending",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          "₹ 4200",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 30),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      foregroundColor: const Color(0xFF1769E9),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 50, vertical: 12),
                                      child: Text(
                                        "Withdraw",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: const [
                CardItem("My Sales Earning", "₹ 600"),
                CardItem("App Referral Earning", "₹ 750"),
                CardItem("Channel Partner Referral Earning", "₹ 64"),
                CardItem("Other Earnings", "₹ 512"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final String title;
  final String amount;

  const CardItem(this.title, this.amount, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.black12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                amount,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const Icon(
            Icons.chevron_right,
            color: Colors.black54,
          ),
        ],
      ),
    );
  }
}

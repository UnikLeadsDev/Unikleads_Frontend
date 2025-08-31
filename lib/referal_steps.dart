import 'package:loan_application/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ReferralSteps extends StatelessWidget {
  const ReferralSteps({super.key});

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
                    height: 190, // removed .h
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
                                  color: Colors.white,
                                ),
                                Text(
                                  'BACK',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
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
                      const SizedBox(height: 40), // removed .h
                      const Text(
                        'Steps to Earn Referral Payout',
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
            const SizedBox(height: 10), // removed .h
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(8),
                ),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const ReferralStepsData(
                        svgPath: 'assets/share.svg',
                        title: 'Share Link to Friends',
                        description:
                            'Tips: Share to groups and reach your cash rewards faster',
                      ),
                      const SizedBox(height: 10),
                      const ReferralStepsData(
                        svgPath: 'assets/download.svg',
                        title:
                            'Invitee fills in their mobile number to download Finovel App',
                      ),
                      const SizedBox(height: 10),
                      const ReferralStepsData(
                        svgPath: 'assets/new_user.svg',
                        title:
                            'Invitee signs up on Finovel App, claims the new user reward',
                      ),
                      const SizedBox(height: 10),
                      const ReferralStepsData(
                        svgPath: 'assets/reward_points.svg',
                        title: 'Get your reward points',
                      ),
                      const SizedBox(height: 10),
                      const ReferralStepsData(
                        svgPath: 'assets/badge.svg',
                        title:
                            'Get your extra rewards when invitee tops up airtime.',
                        isLastStep: true,
                      ),
                      const SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Center(
                            child: Text(
                              'RULES',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            color: Colors.grey[400],
                          ),
                          buildRuleItem(
                            title: 'Referral Points',
                            description:
                                'Users earn 100 points for each successful referral (when the referred user installs the application).',
                          ),
                          buildRuleItem(
                            title: 'Point Value',
                            description: '1 point = ₹0.25.',
                          ),
                          buildRuleItem(
                            title: 'Redemption Threshold',
                            description:
                                'Users can redeem points only when they have accumulated at least 1000 points.',
                          ),
                          buildRuleItem(
                            title: 'Application Referral',
                            description:
                                'Tracking if the referral was successful in the application installation.',
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20), // removed .h
          ],
        ),
      ),
    );
  }
}

class ReferralStepsData extends StatelessWidget {
  final String svgPath;
  final String title;
  final String? description;
  final bool isLastStep;

  const ReferralStepsData({
    super.key,
    required this.svgPath,
    required this.title,
    this.description,
    this.isLastStep = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              svgPath,
              width: 30,
              height: 30,
              colorFilter:
                  const ColorFilter.mode(Color(0xFF1769E9), BlendMode.srcIn),
            ),
            if (!isLastStep)
              Container(
                height: 40,
                width: 2,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue.withOpacity(0),
                      Colors.blue,
                      Colors.blue.withOpacity(0)
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              if (description != null)
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    description!,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

Widget buildRuleItem({required String title, required String description}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('•', style: TextStyle(fontSize: 18)),
        const SizedBox(width: 8),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: const TextStyle(fontSize: 16, color: Colors.black),
              children: [
                TextSpan(
                  text: '$title: ',
                  style: const TextStyle(fontWeight: FontWeight.bold),
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

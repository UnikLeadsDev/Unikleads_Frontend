import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loan_application/channel_partners.dashboard.dart';
import 'package:loan_application/colors.dart';
import 'package:loan_application/my_revenue.dart';
import 'package:loan_application/my_sales_dashboard.dart';
import 'package:lottie/lottie.dart';

class MainDashboardScreen extends StatelessWidget {
  const MainDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: SafeArea(
        top:false,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              /// HEADER
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.r),
                      bottomRight: Radius.circular(10.r),
                    ),
                    child: Image.asset(
                      'assets/header_bg1.png',
                      fit: BoxFit.fill,
                      width: double.infinity,
                      height: 160.h,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 15.h,
                      left: 20.w,
                      right: 20.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.popAndPushNamed(
                                  context, '/referralscreen'),
                              child: Padding(
                                padding: EdgeInsets.only(top: 30.h),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.arrow_back_ios,
                                      size: 15.sp,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      'BACK',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.sp,
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
                                padding: EdgeInsets.all(8.r),
                                child: Image.asset(
                                  "assets/notification.png",
                                  height: 40.h,
                                  width: 40.w,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30.h),
                        Text(
                          'Dashboard',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20.h),

              /// DASHBOARD OPTIONS
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 19.w),
                child: Column(
                  children: [
                    salesDashboardContainer(
                        context, "My Sales Dashboard", () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => DashboardScreen()),
                      );
                    }),
                    SizedBox(height: 30.h),
                    salesDashboardContainer(
                        context, "Channel Partners Dashboard", () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) =>
                                ChannelPartnerDashboardScreen()),
                      );
                    }),
                    SizedBox(height: 30.h),
                    salesDashboardContainer(context, "My All Revenue", () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => RevenueScreen()),
                      );
                    }),
                  ],
                ),
              ),

              SizedBox(height: 10.h),

              /// LOTTIE ANIMATION
              Lottie.asset(
                "assets/animation/sharee.json",
                //"assets/animation/Icon_Animation_2.json",
                height: 0.3.sh,
                width: 0.6.sw,
              ),
              Align(
            alignment: Alignment.bottomCenter,
            child: Lottie.asset(
              "assets/animation/Icon_Animation_2.json",
              height: 0.25.sh, // adjust height
              width: 1.sw, // take full width
              fit: BoxFit.fitWidth, // stretch horizontally
            ),
          ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget salesDashboardContainer(
    BuildContext context, String title, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 70.h,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: 18.sp,
              color: Colors.grey.shade700,
            ),
          ],
        ),
      ),
    ),
  );
}

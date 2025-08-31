import 'package:dotted_border/dotted_border.dart';
import 'package:loan_application/colors.dart';
import 'package:loan_application/custom_appbar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loan_application/my_revenue.dart';
import 'package:loan_application/my_sales_dashboard.dart';
import 'package:loan_application/referal_steps.dart';
import 'package:loan_application/terms_condition.dart';
import 'package:loan_application/main_dashboard.dart';

class ReferralProgramScreen extends StatelessWidget {
  const ReferralProgramScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              'assets/header_bg1.png',
              fit: BoxFit.fill,
              width: double.infinity,
              height: 300.h,
            ),

            Padding(
              padding: EdgeInsets.only(top: 42.h, left: 20.w),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
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
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      print('tapped notification icon');
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8.w),
                      child: Image.asset(
                        "assets/notification.png",
                        height: 40.h,
                        width: 40.w,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 100.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Column(
                      children: [
                        Text(
                          'Refer your friends and partners',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 8.h),
                        Text.rich(
                          TextSpan(children: [
                            const TextSpan(text: 'Earn'),
                            TextSpan(
                              text: ' 100 points',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                              ),
                            ),
                            const TextSpan(text: ' for each successful referral'),
                          ]),
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40.h),
                  SizedBox(height: 100.h),
                  Text(
                    'Your referral code',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: DottedBorder(
                      child: Row(
                        children: [
                          const Spacer(),
                          Text(
                            'John18233',
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          Expanded(
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {},
                              icon: Container(
                                height: 70.h,
                                width: 50.w,
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade50,
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: SvgPicture.asset(
                                  "assets/copy.svg",
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(height: 15.h),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.share, size: 24.sp),
                        label: Text(
                          'SHARE LINK',
                          style: TextStyle(fontSize: 12.sp),
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 14.h),
                          backgroundColor: const Color(0xFF1769E9),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24.r),
                      topRight: Radius.circular(24.r),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: Color(0xffE8F0FD),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 20.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 20.h),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 60.h,
                                        width: 60.w,
                                        decoration: BoxDecoration(
                                          color: Colors.blue.shade50,
                                          borderRadius:
                                              BorderRadius.circular(8.r),
                                        ),
                                        child: SvgPicture.asset(
                                          'assets/referred.svg',
                                          height: 24.h,
                                          width: 24.w,
                                          fit: BoxFit.scaleDown,
                                        ),
                                      ),
                                      SizedBox(width: 8.w),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Total App Referred',
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              color: Colors.black,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(height: 4.h),
                                          Text(
                                            '10',
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 60.h,
                                    width: 1.w,
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 60.h,
                                        width: 60.w,
                                        decoration: BoxDecoration(
                                          color: Colors.blue.shade50,
                                          borderRadius:
                                              BorderRadius.circular(8.r),
                                        ),
                                        child: SvgPicture.asset(
                                          'assets/My_partners.svg',
                                          height: 24.h,
                                          width: 24.w,
                                          fit: BoxFit.scaleDown,
                                        ),
                                      ),
                                      SizedBox(width: 8.w),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'My Partners',
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(height: 4.h),
                                          Text(
                                            '02',
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 15.h),
                            Container(
                              height: 60.h,
                              width: double.infinity,
                              padding:
                                  EdgeInsets.symmetric(horizontal: 12.w),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(color: Colors.black12),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset("assets/rupee.svg"),
                                      SizedBox(width: 8.w),
                                      Text(
                                        'Steps to Earn Referral Payout',
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 5.w),
                                  IconButton(
                                    icon: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.grey.shade700,
                                      size: 14.sp,
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ReferralSteps()));
                                    },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 15.h),
                            Container(
                              height: 60.h,
                              width: double.infinity,
                              padding:
                                  EdgeInsets.symmetric(horizontal: 12.w),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(color: Colors.black12),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset("assets/term.svg"),
                                      SizedBox(width: 8.w),
                                      Text(
                                        'Terms & Conditions',
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 5.w),
                                  IconButton(
                                    icon: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.grey.shade700,
                                      size: 14.sp,
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  TermsAndConditionsScreen()));
                                    },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 30.h),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => MainDashboardScreen(),
                                ));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF1769E9),
                                foregroundColor: Colors.white,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(12.w),
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 40.h,
                                  child: Center(
                                    child: Text(
                                      "DASHBOARD",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
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
          ],
        ),
      ),
    );
  }
}

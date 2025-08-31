

import 'package:loan_application/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loan_application/my_partners.dart';

class ChannelPartnerDashboardScreen extends StatelessWidget {
  const ChannelPartnerDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: SafeArea(
          top:false,
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                      width: 1.sw,
                      height: 350.h,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 42.h, left: 20.w, right: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.popAndPushNamed(
                                  context, '/dashboardscreen'),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.arrow_back_ios,
                                    size: 15.sp,
                                    color: AppColors.whiteColor,
                                  ),
                                  SizedBox(width: 4.w),
                                  Text(
                                    'BACK',
                                    style: TextStyle(
                                        color: AppColors.whiteColor,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: EdgeInsets.all(8.w),
                                child: Image.asset(
                                  "assets/notification.png",
                                  height: 40.w,
                                  width: 40.w,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'Channel Partners Dashboard',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 30.h),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    child: Column(
                      children: [
                        SizedBox(height: 140.h),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: Colors.blue.shade50.withOpacity(0.2),
                          ),
                          width: 1.sw,
                          padding: EdgeInsets.symmetric(
                              vertical: 16.h, horizontal: 6.w),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Total Earned Amount",
                                      style: TextStyle(
                                          fontSize: 16.sp, color: Colors.white),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Container(
                                    height: 40.h,
                                    width: 1.w,
                                    color: Colors.white30,
                                  ),
                                  SizedBox(width: 6.w),
                                  FittedBox(
                                    child: Text(
                                      "₹ 1654",
                                      style: TextStyle(
                                          fontSize: 22.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.h),
                              Container(
                                  height: 1.h,
                                  width: double.infinity,
                                  color: Colors.white30),
                              SizedBox(height: 20.h),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 12.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Flexible(
                                      child: Row(
                                        children: [
                                          SvgPicture.asset("assets/paid.svg",
                                              height: 28.h, width: 28.w),
                                          SizedBox(width: 8.w),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Paid",
                                                style: TextStyle(
                                                    fontSize: 16.sp,
                                                    color: Colors.white),
                                              ),
                                              FittedBox(
                                                fit: BoxFit.scaleDown,
                                                child: Text(
                                                  "₹ 1600",
                                                  style: TextStyle(
                                                      fontSize: 18.sp,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 40.h,
                                      width: 1.w,
                                      color: Colors.white30,
                                    ),
                                    Flexible(
                                      child: Row(
                                        children: [
                                          SvgPicture.asset("assets/pending.svg",
                                              height: 28.h, width: 28.w),
                                          SizedBox(width: 8.w),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Pending",
                                                style: TextStyle(
                                                    fontSize: 16.sp,
                                                    color: Colors.white),
                                              ),
                                              FittedBox(
                                                fit: BoxFit.scaleDown,
                                                child: Text(
                                                  "₹ 54",
                                                  style: TextStyle(
                                                      fontSize: 18.sp,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MyAllPartnersScreen(),
                        ));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1769E9),
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                            horizontal: 50.w, vertical: 15.h),
                      ),
                      child: FittedBox(
                        child: Text("My All Partners",
                            style: TextStyle(
                                fontSize: 18.sp, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    SvgPicture.asset(
                      "assets/channel.svg",
                      height: 250.h,
                      width: 250.w,
                    ),
                    Text(
                      "Congratulations",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.sp),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      "You have successfully earned from your referred partners. Make new referral and earn more!",
                      style: TextStyle(fontSize: 16.sp),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 100.h),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/dashboardscreen');
                      },
                      style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(fontSize: 18.sp),
                        backgroundColor: const Color(0xFF1769E9),
                        foregroundColor: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        child: SizedBox(
                          width: 1.sw,
                          height: 40.h,
                          child: Center(
                            child: FittedBox(
                              child: Text(
                                "ADD NEW PARTNER",
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
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
      ),
    );
  }
}

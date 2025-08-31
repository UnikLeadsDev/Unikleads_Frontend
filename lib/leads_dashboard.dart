import 'package:loan_application/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loan_application/filter.dart';
import 'package:loan_application/loan_application_traker.dart';

class MainDashboard extends StatelessWidget {
  const MainDashboard({super.key});

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
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.r),
                    bottomRight: Radius.circular(10.r),
                  ),
                  child: Image.asset(
                    'assets/header_bg1.png',
                    fit: BoxFit.fill,
                    width: 1.sw,
                    height: 190.h,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 42.h,
                    left: 20.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.popAndPushNamed(
                                context, '/mysalesdashboard'),
                            child: Padding(
                              padding: EdgeInsets.only(top: 10.h),
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
                      SizedBox(height: 25.h),
                      Padding(
                        padding: EdgeInsets.only(right: 16.w),
                        child: Row(
                          children: [
                            Text(
                              "Dashboard",
                              style: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Container(
                              height: 40.h,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => FilterScreen()),
                                  );
                                },
                                icon: SvgPicture.asset(
                                  "assets/filter.png",
                                  height: 18.h,
                                  width: 18.w,
                                ),
                                label: Text(
                                  "Filter",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  elevation: 0.0,
                                  backgroundColor: Colors.transparent,
                                  foregroundColor: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 18.h),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Lead ID, Name, Mobile Number',
                      hintStyle: TextStyle(
                        color: Colors.black45,
                        fontSize: 14.sp,
                      ),
                      suffixIcon: Icon(Icons.search, size: 22.sp),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.r)),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 12.h,
                      ),
                    ),
                  ),
                ),
                buildData(
                  "Sanjay Kumar Yadav",
                  "9876543210",
                  "654321",
                  "Personal Loan",
                  "4,50,000/-",
                  "Loan Disbursed",
                  () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ApplicationTrackingScreen(),
                    ));
                  },
                ),
                buildData(
                  "Jaydeep Kaur",
                  "4876543210",
                  "250221",
                  "Home Loan",
                  "54,50,000/-",
                  "Approved",
                  () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ApplicationTrackingScreen(),
                    ));
                  },
                ),
                buildData(
                  "Mangesh Kadam",
                  "3876543210",
                  "254621",
                  "Business Loan",
                  "10,00,000/-",
                  "Incomplete Documents",
                  () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ApplicationTrackingScreen(),
                    ));
                  },
                ),
                buildData(
                  "Amir Khan",
                  "2876543210",
                  "454271",
                  "Credit Card",
                  "1,50,000/-",
                  "Rejected",
                  () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ApplicationTrackingScreen(),
                    ));
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget buildData(String name, String number, String leadId, String product,
    String loanAmount, String leadStatus, VoidCallback onTap) {
  return Padding(
    padding: EdgeInsets.all(14.w),
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(8.r),
        ),
        padding: EdgeInsets.all(8.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(
                width: 180.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    paddedText('Customer Name:'),
                    paddedText('Mobile Number:'),
                    paddedText('Lead Id:'),
                    paddedText('Product:'),
                    paddedText('Loan Amount:'),
                    paddedText('Lead Status:'),
                  ],
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  paddedText(name),
                  paddedText(number),
                  paddedText(leadId),
                  paddedText(product),
                  paddedText(loanAmount),
                  paddedText(leadStatus),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget paddedText(String text) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 4.h),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 16.sp,
        color: Colors.black87,
      ),
    ),
  );
}

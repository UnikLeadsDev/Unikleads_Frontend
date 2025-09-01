import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loan_application/edge_cases/something_wrong.dart';

class MaintenancePage extends StatelessWidget {
  const MaintenancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),

      /// Bottom Button (fixed at bottom & touches edges)
      bottomNavigationBar: SizedBox(
        height: 54.h,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor:Color.fromARGB(255, 23, 105, 233),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero, // <-- flat edges
            ),
          ),
          onPressed: () {
           Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const SomethingWentWrongPage()),
      ); 
            // <-- Replace '/close' with your route
          },
          child: Text(
            "CLOSE",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 1.2,
            ),
          ),
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// SVG Illustration placeholder
              SizedBox(
                height: 423.h,
                width:424.w,
                child: Center(
                  child: SvgPicture.asset(
                    "assets/edge_cases/Under construction-rafiki 1.svg", // <-- your SVG file path
                    width: 424.w,
                    height: 423.h,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              

              /// Title
              Text(
                "We’re under maintenance",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 12.h),

              /// Subtitle
              Text(
                "Please check back soon just putting little\ntouch up on some pretty updates.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loan_application/edge_cases/coming_soon.dart';

class SomethingWentWrongPage extends StatelessWidget {
  const SomethingWentWrongPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),

      /// Bottom Button (fixed and touching edges)
      bottomNavigationBar: SizedBox(
        height: 54.h,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 23, 105, 233),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero, // flat edges like in image
            ),
          ),
          onPressed: () {
           Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const ComingSoonPage()),
      );
            // <-- Replace '/retry' with your route
          },
          child: Text(
            "TRY AGAIN",
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
                width: 298.48.w,
                height: 338.92.h,
                child: Center(
                  child: SvgPicture.asset(
                    "assets/edge_cases/Group 100.svg",
                    width: 298.48.w,
                    height: 338.92.h,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: 40.h),

              /// Title
              Text(
                "Oh No! Something went wrong",
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
                "We are not able to process your payment\ncurrently. Please try again.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.sp, color: Colors.grey.shade600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

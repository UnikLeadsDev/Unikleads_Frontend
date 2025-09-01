import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ComingSoonPage extends StatelessWidget {
  const ComingSoonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: const Color.fromRGBO(255, 255, 255, 1),

      /// Bottom Button (fixed & touching edges)
      bottomNavigationBar: SizedBox(
        height: 54.h,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 23, 105, 233),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero, // <-- flat edges
            ),
          ),
          onPressed: () {
           Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const ComingSoonPage()),
      );
            // <-- Replace '/home' with your route
          },
          child: Text(
            "BACK TO HOME",
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
                height: 481.h,
                width:482.w,
                child: Center(
                  child: SvgPicture.asset(
                    "assets/edge_cases/Opened-rafiki 1.svg", 
                    width: 482.w,
                    height: 481.h,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            

              /// Title
              Text(
                "Coming Soon!",
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
                "We are working very hard to provide you the\nbest experience as soon as possible.",
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

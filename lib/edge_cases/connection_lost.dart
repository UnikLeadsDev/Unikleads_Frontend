import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loan_application/edge_cases/under_maintenance.dart';

class ConnectionLostPage extends StatelessWidget {
  const ConnectionLostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: const Color.fromRGBO(255, 255, 255, 1),

      /// Button fixed at bottom
      bottomNavigationBar: SizedBox(
        height: 54.h,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 23, 105, 233),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero, // <-- makes it touch edges
            ),
          ),
          onPressed: () {
            Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const MaintenancePage()),
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
        top:false,
        child: Padding(
          
          padding: EdgeInsets.only(
      left: 20.w,
      right: 20.w,
      top: 10.h,    // reduced top space
      bottom: 10.h, // reduced bottom space
    ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// SVG Illustration placeholder
              SizedBox(
                height: 450.h,
                child: Center(
                  child: SvgPicture.asset(
                    "assets/edge_cases/No data-rafiki 1.svg", 
                    width: 450.w,
                    height: 450.h,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              

              /// Title
              Text(
                "Your connection are lost",
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
                "Please check your internet connection\nand try again.",
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

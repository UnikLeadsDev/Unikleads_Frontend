import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loan_application/edge_cases/connection_lost.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
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
        MaterialPageRoute(builder: (context) => const ConnectionLostPage()),
      );
            // <-- Replace '/close' with your route
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
                      height: 424.h,
                      width:424.w,
                      child: Center(
                        child: SvgPicture.asset(
                          "assets/edge_cases/404 Error Page not Found with people connecting a plug-rafiki (1) 1.svg", 
                          width: 424.w,
                          height: 424.h,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(height: 40.h),

                    /// Title
                    Text(
                      "Your page did not respond",
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
                      "This page doesn’t exist or maybe fall asleep!\nWe suggest you back to home!",
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

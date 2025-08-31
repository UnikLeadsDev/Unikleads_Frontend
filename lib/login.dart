
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loan_application/otp_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: SingleChildScrollView(
        child: Container(
          width: 1.sw, 
          
          padding: EdgeInsets.symmetric(
            horizontal: 20.w, 
            vertical: 20.h,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 120.h),

              /// --- App Logo / Image ---
              SizedBox(
                height: 200.h,
                child: Center(
                  child: Image.asset(
                    "assets/Unik_leads.jpg",
                    height: 120.h,
                  ),
                ),
              ),

              SizedBox(height: 10.h),

              /// --- Welcome Back Text ---
              Text(
                "Welcome back",
                style: TextStyle(
                  fontSize: 20.5.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                "Happy to see you again, please login here",
                style: TextStyle(
                  fontSize: 14.5.sp,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 30.h),

              /// --- Phone Number Field with Country Code ---
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 6.h,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: Colors.black26),
                ),
                child: Row(
                  children: [
                    /// Dropdown (Country flag + Code)
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/india.svg",
                          height: 20.h,
                          width: 25.w,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          "+91",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.black,
                          ),
                        ),
                        Icon(Icons.arrow_drop_down,
                            color: Colors.grey[600], size: 20.sp),
                      ],
                    ),
                    SizedBox(width: 10.w),

                    /// Phone Number Input
                    Expanded(
                      child: TextField(
                        maxLength: 10,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          counterText: "",
                          border: InputBorder.none,
                          hintText: "Enter your mobile number",
                          hintStyle:
                              TextStyle(fontSize: 14.sp, color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20.h),

              /// --- Login Button ---
              SizedBox(
                width: 400.w,
                height: 45.h,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => OtpVerificationScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 23, 105, 233),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 14.5.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 15.h),

              /// --- Fingerprint Button ---
              SizedBox(
                width: 400.w,
                height: 45.h,
                child: OutlinedButton.icon(
                  onPressed: () {
                    // TODO: Fingerprint authentication here
                  },
                  icon: Icon(
                    Icons.fingerprint,
                    color: const Color.fromARGB(255, 23, 105, 233),
                    size: 22.sp,
                  ),
                  label: Text(
                    "Login with Fingerprint",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 23, 105, 233),
                      fontSize: 13.6.sp,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 228, 227, 227),
                    side: BorderSide.none,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20.h),

              /// --- Terms & Conditions ---
              Text.rich(
                TextSpan(
                  text: "* By login I Agree with all the ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.sp,
                  ),
                  children: [
                    TextSpan(
                      text: "Terms & Conditions",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 23, 105, 233),
                        fontSize: 12.sp,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

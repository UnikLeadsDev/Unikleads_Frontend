
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loan_application/applied_product.dart';

class LoanOptionsScreen extends StatelessWidget {
  const LoanOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
   
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: SafeArea(
        top:false,
        
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header section
              
              Container(
                width: double.infinity,
                height: 200.h, // responsive height
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage("assets/header_bg1.png"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16.r),
                    bottomRight: Radius.circular(16.r),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  
                  children: [
                    // Menu + title + notifications
                    SizedBox(height:35),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Row(
                                children: [
                                  Icon(Icons.arrow_back_ios,
                                      color: Colors.white, size: 15.sp),
                                  SizedBox(width: 6.w),
                                  Text(
                                    "",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(Icons.menu, color: Colors.white, size: 20.sp),
                            SizedBox(width: 10.w),
                            Text(
                              "Unik Leads",
                              style: TextStyle(
                                fontFamily: "TitilliumWeb",
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp,
                              ),
                            ),
                          ],
                        ),
                        Icon(Icons.notifications,
                            color: Colors.white, size: 22.sp),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      "Welcome Back",
                      style: TextStyle(
                        fontSize: 22.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      "Doing Great Abhishek",
                      style:
                          TextStyle(fontSize: 16.sp, color: Colors.white70),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  "Add Loan Application",
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 15.h),

              // Loan options grid
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: size.width > 500 ? 4 : 3, // Responsive columns
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 20.h,
                  childAspectRatio: 0.85,
                  children: [
                    _buildOption(
                      context,
                      "Personal Loan",
                      "assets/personal_loan.svg",
                      () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const AppliedProductScreen(),
                          ),
                        );
                      },
                    ),
                    _buildOption(
                      context,
                      "Business Loan",
                      "assets/business_loan.svg",
                      () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const AppliedProductScreen(),
                          ),
                        );
                      },
                    ),
                    _buildOption(
                      context,
                      "Bullet Line",
                      "assets/bullet_line.svg",
                      () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const AppliedProductScreen(),
                          ),
                        );
                      },
                    ),
                    _buildOption(
                      context,
                      "Credit Card",
                      "assets/credit_card.svg",
                      () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const AppliedProductScreen(),
                          ),
                        );
                      },
                    ),
                    _buildOption(
                      context,
                      "Investment",
                      "assets/investment.svg",
                      () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const AppliedProductScreen(),
                          ),
                        );
                      },
                    ),
                    _buildOption(
                      context,
                      "Demat A/c",
                      "assets/demat_ac.svg",
                      () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const AppliedProductScreen(),
                          ),
                        );
                      },
                    ),
                    _buildOption(
                      context,
                      "Bank A/c",
                      "assets/bank.svg",
                      () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const AppliedProductScreen(),
                          ),
                        );
                      },
                    ),
                    _buildOption(
                      context,
                      "Insurance",
                      "assets/insurance.svg",
                      () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const AppliedProductScreen(),
                          ),
                        );
                      },
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

  /// Reusable widget for each loan option
  Widget _buildOption(
    BuildContext context,
    String title,
    String imagePath,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 60.h,
            width: 60.w,
            padding: EdgeInsets.all(10.w),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xfff3f3f3),
            ),
            child: SvgPicture.asset(
              imagePath,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 8.h),
          Flexible(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style:
                  TextStyle(fontSize: 12.5.sp, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}

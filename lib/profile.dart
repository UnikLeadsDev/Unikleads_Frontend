import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loan_application/main_dashboard.dart';
import 'package:loan_application/referal_program.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 23, 105, 233),
        leading: IconButton(
    icon: Icon(Icons.arrow_back,color:Colors.white),
    onPressed: () {
      Navigator.pop(context); // Go back
    },
  ),
        title: Text(
          "Profile",
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12.w),
          child: Column(
            children: [
              /// Header Section
              Container(
                width: 1.sw,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6.r,
                      spreadRadius: 2.r,
                    )
                  ],
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30.r,
                      backgroundColor: Colors.blue.shade100,
                      child: Icon(
                        Icons.person,
                        size: 35.sp,
                        color: Color.fromARGB(255, 23, 105, 233),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sangram Patil",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            "India",
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const MainDashboardScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 23, 105, 233),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      child: Text(
                        "Dashboard",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.sp,
                        ),
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(height: 20.h),

              /// Editable Fields
              ProfileTextField(
                  icon: Icons.person,
                  label: "Username",
                  hint: "Enter Username"),
              ProfileTextField(
                  icon: Icons.phone,
                  label: "Phone No.",
                  hint: "Enter Phone No."),
              ProfileTextField(
                  icon: Icons.email,
                  label: "Email",
                  hint: "Enter Email"),
              ProfileTextField(
                  icon: Icons.location_city,
                  label: "City",
                  hint: "Enter City"),
              ProfileTextField(
                  icon: Icons.map,
                  label: "State",
                  hint: "Enter State"),
              ProfileTextField(
                  icon: Icons.flag,
                  label: "Country",
                  hint: "Enter Country"),
              ProfileTextField(
                  icon: Icons.location_on,
                  label: "Pin Code",
                  hint: "Enter Pin Code"),
            ],
          ),
        ),
      ),
    );
  }
}

/// Reusable TextField Widget
class ProfileTextField extends StatelessWidget {
  final IconData icon;
  final String label;
  final String hint;

  const ProfileTextField({
    super.key,
    required this.icon,
    required this.label,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.r,
          )
        ],
      ),
      child: TextField(
        style: TextStyle(fontSize: 14.sp),
        decoration: InputDecoration(
          icon: Icon(icon, color: Color.fromARGB(255, 23, 105, 233), size: 20.sp),
          labelText: label,
          labelStyle: TextStyle(fontSize: 14.sp),
          hintText: hint,
          hintStyle: TextStyle(fontSize: 13.sp),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

/// Edit Profile Screen (separate route)
class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Profile",
          style: TextStyle(fontSize: 16.sp),
        ),
        backgroundColor: const Color.fromARGB(255, 23, 105, 233),
      ),
      body: Center(
        child: Text(
          "Edit Profile Page",
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:loan_application/colors.dart';
import 'package:loan_application/faq.dart';
import 'package:loan_application/filter.dart';
import 'package:loan_application/leads.dart';
import 'package:loan_application/leads_dashboard.dart';
import 'package:loan_application/support_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _MySalesDashboardScreenState();
}

class _MySalesDashboardScreenState extends State<DashboardScreen> {
  void _refreshScreen() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Stack(
          children: [
            Container(
              color: Colors.black12,
            ),
            const Center(
              child: CircularProgressIndicator(),
            ),
          ],
        );
      },
    );

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return SafeArea( 
    top:false,
      child: Scaffold(
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
                      width: double.infinity,
                      height: 200.h,
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
                                  context, '/dashboardscreen'),
                              child: Padding(
                                padding: EdgeInsets.only(top: 10.h),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.arrow_back_ios,
                                      size: 15.sp,
                                      color: AppColors.whiteColor,
                                    ),
                                    Text(
                                      'BACK',
                                      style: TextStyle(
                                          color: AppColors.whiteColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14.sp),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: EdgeInsets.all(8.r),
                                child: Image.asset(
                                  "assets/notification.png",
                                  height: 40.h,
                                  width: 40.w,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'My Sales Dashboard',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 15.h),
                        Padding(
                          padding: EdgeInsets.only(right: 16.w),
                          child: Row(
                            children: [
                              Text(
                                "Hey, John Dues",
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              const Spacer(),
                              Container(
                                height: 40.h,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(8.r)),
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                FilterScreen()));
                                  },
                                  icon: SvgPicture.asset("assets/filter.png"),
                                  label: Text("Filter",
                                      style: TextStyle(fontSize: 14.sp)),
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0.0,
                                    backgroundColor: Colors.transparent,
                                    foregroundColor: Colors.white,
                                  ),
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
              SizedBox(height: 10.h),
              DateTimeRow(
                onRefresh: _refreshScreen,
              ),
              SizedBox(height: 25.h),
              Column(
                children: [
                  Wrap(
                    spacing: 40.w,
                    runSpacing: 20.h,
                    children: [
                      GridView.count(
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          buildCircle('40', 'My Leads', Colors.blue.shade900,
                              () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => MainDashboard()));
                          }, context),
                          buildCircle('13', 'Login Leads', Colors.teal, () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => MainDashboard()));
                          }, context),
                          buildCircle('4', 'Pending Docs', Colors.brown, () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => MainDashboard()));
                          }, context),
                          buildCircle('6', 'Approved', Colors.purple, () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => MainDashboard()));
                          }, context),
                          buildCircle('9', 'Rejected', Colors.red, () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => MainDashboard()));
                          }, context),
                          buildCircle('5', 'Disbursed', Colors.green, () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => MainDashboard()));
                          }, context),
                          buildCircle(
                              '3', 'Expired Leads', Colors.yellow, () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => MainDashboard()));
                          }, context),
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => LoanOptionsScreen(),
                              ),
                            );
                          },
                          icon: Icon(Icons.add_circle_outline, size: 20.sp),
                          label: Text('Add New Leads',
                              style: TextStyle(fontSize: 14.sp)),
                          style: ElevatedButton.styleFrom(
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22.r),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 15.h),
                            backgroundColor: const Color(0xFF1769E9),
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Column(
                  children: [
                    buildAmountCard(
                      'Still Date Approved Amount',
                      '₹ 15,00,000/-',
                      "assets/star.svg",
                    ),
                    SizedBox(height: 10.h),
                    buildAmountCard(
                      'Still Date Net Disbursed Amount',
                      '₹ 8,50,000/-',
                      "assets/star.svg",
                    ),
                    SizedBox(height: 10.h),
                    buildAmountCard(
                      'Monthly Scorecard May 2024',
                      '91%',
                      "assets/medal.svg",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                height: 70.h,
                width: double.infinity,
                color: const Color(0xffE9F1FD),
                child: Row(
                  children: [
                    Text(
                      "Performance Chart",
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        elevation: 5.0,
                        backgroundColor: const Color(0xFF1769E9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22.r),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 25.w, vertical: 15.h),
                        child: Text("MORE",
                            style: TextStyle(
                                color: Colors.white, fontSize: 14.sp)),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                color: const Color(0xffFAF9FC),
                child: Column(
                  children: [
                    ListTile(
                      leading:
                          Icon(Icons.help_outline, color: Colors.teal, size: 22.sp),
                      title: Text("Faq",
                          style: TextStyle(fontSize: 16.sp)),
                      subtitle: Text("All your queries answer",
                          style: TextStyle(fontSize: 13.sp)),
                      trailing:
                          Icon(Icons.chevron_right, size: 20.sp),
                      onTap: () {Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => FAQScreen(),
                        ));},
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: Icon(Icons.support_agent,
                          color: Colors.pink, size: 22.sp),
                      title: Text("Support",
                          style: TextStyle(fontSize: 16.sp)),
                      subtitle: Text("Reach out for any help",
                          style: TextStyle(fontSize: 13.sp)),
                      trailing: Icon(Icons.chevron_right, size: 20.sp),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SupportScreen(),
                        ));
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}

class DateTimeRow extends StatefulWidget {
  final VoidCallback onRefresh;
  const DateTimeRow({
    Key? key,
    required this.onRefresh,
  }) : super(key: key);

  @override
  _DateTimeRowState createState() => _DateTimeRowState();
}

class _DateTimeRowState extends State<DateTimeRow> {
  late Timer _timer;
  late String _currentDate;
  late String _currentTime;

  @override
  void initState() {
    super.initState();
    _updateDateTime();
    _timer = Timer.periodic(
        const Duration(seconds: 1), (timer) => _updateDateTime());
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _updateDateTime() {
    setState(() {
      _currentDate = DateFormat('dd:MM:yyyy').format(DateTime.now());
      _currentTime = DateFormat('hh:mm:ss a').format(DateTime.now());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 17.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.calendar_today_outlined,
              color: Colors.grey.shade600, size: 18.sp),
          SizedBox(width: 8.w),
          Text(
            _currentDate,
            style: TextStyle(fontSize: 18.sp),
          ),
          SizedBox(width: 16.w),
          Text(
            _currentTime,
            style: TextStyle(fontSize: 18.sp),
          ),
          const Spacer(),
          SizedBox(width: 8.w),
          GestureDetector(
            onTap: widget.onRefresh,
            child: SvgPicture.asset("assets/sync.svg",
                width: 22.w, height: 22.h),
          ),
        ],
      ),
    );
  }
}

Widget buildCircle(String count, String label, Color color, VoidCallback onTap,
    BuildContext context) {
  double size = MediaQuery.of(context).size.width * 0.2;

  return Column(
    children: [
      GestureDetector(
        onTap: onTap,
        child: Container(
          height: size,
          width: size,
          padding: EdgeInsets.all(size * 0.15),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: color, width: size * 0.05),
          ),
          child: Center(
            child: Text(
              count,
              style: TextStyle(
                fontSize: size * 0.25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      SizedBox(height: 4.h),
      Text(
        label,
        style: TextStyle(fontSize: size * 0.18),
      ),
    ],
  );
}

Widget buildAmountCard(String title, String amount, String svgPath) {
  return Container(
    padding: EdgeInsets.all(16.r),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black12),
      borderRadius: BorderRadius.circular(10.r),
    ),
    child: Row(
      children: [
        SvgPicture.asset(
          svgPath,
          width: 52.w,
          height: 52.h,
        ),
        SizedBox(width: 16.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style:
                  TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4.h),
            Text(
              amount,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1769E9),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

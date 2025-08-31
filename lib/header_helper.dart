import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onBack;
  final Widget? actionWidget; 

  const CustomHeader({
    super.key,
    required this.title,
    this.onBack,
    this.actionWidget,
  });

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.16,
      // height: MediaQuery.of(context).size.height * 0.16 + statusBarHeight,
      padding: EdgeInsets.only( left: 16,
        right: 16,
        top: statusBarHeight +12, // push content below status bar
        bottom: 12,),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/header_bg1.png"), 
          fit: BoxFit.cover, // makes it cover the whole container
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height:5),
          GestureDetector(
            onTap: onBack ?? () => Navigator.pop(context),
            child: Row(
              children: const [
                Icon(Icons.arrow_back_ios, color: Colors.white, size: 15),
                SizedBox(width: 6),
                Text(
                  "BACK",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style:  TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              if (actionWidget != null) actionWidget!,
            ],
          ),
        ],
      ),
    );
  }
}

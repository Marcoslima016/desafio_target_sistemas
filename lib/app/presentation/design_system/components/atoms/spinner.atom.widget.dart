import 'package:desafio_target_sistemas/lib.exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ASpinner extends StatelessWidget {
  const ASpinner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.sp),
      ),
      child: SizedBox(
        width: 0.14.sw,
        height: 0.14.sw,
        child: SpinKitThreeBounce(
          color: context.design.colors.primary,
          size: 0.08.sw,
        ),
      ),
    );
  }
}

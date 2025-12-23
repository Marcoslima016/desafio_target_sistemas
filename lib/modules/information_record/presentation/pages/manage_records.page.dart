import 'package:desafio_target_sistemas/lib.exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ManageRecordsPage extends StatefulWidget {
  const ManageRecordsPage({super.key});

  @override
  State<ManageRecordsPage> createState() => _ManageRecordsPageState();
}

class _ManageRecordsPageState extends State<ManageRecordsPage> {
  _ManageRecordsPageState();

  //- - - - - - - - - - - - - - - - - - - - - -

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: context.design.colors.tertiary,
      body: SafeArea(
        child: _buildBody(),
      ),
    );
  }

  //- - - - - - - - - - - - - - - - - - - - - -
  // BODY

  Widget _buildBody() {
    return _buildPagePaddingWraper(
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        spacing: 24.sp,
        children: [
          const RecordedInfoGrid(),
          const RegisterNewInfoInput(),
          _buildEstatisticsButton(),
        ],
      ),
    );
  }

  //- - - - - - - - - - - - - - - - - - - - - -
  // PAGE PADDING WRAPER

  Widget _buildPagePaddingWraper(Widget child) {
    return Padding(
      padding: EdgeInsets.all(24.sp),
      child: child,
    );
  }

  //- - - - - - - - - - - - - - - - - - - - - -
  // BOTÃO ESTATISTICAS

  Widget _buildEstatisticsButton() {
    return Padding(
      padding: EdgeInsets.only(left: 105.sp, right: 105.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.bar_chart_outlined,
                color: const Color.fromARGB(255, 225, 225, 225),
                size: 22.sp,
              ),
              AText.bodyLarge(
                "Estatísticas",
                variation: TextStyle(
                  color: const Color.fromARGB(255, 225, 225, 225),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 5.sp),
          Divider(
            height: 4.sp,
            color: const Color.fromARGB(85, 253, 253, 253),
            thickness: 0.6.sp,
          )
        ],
      ),
    );
  }
}

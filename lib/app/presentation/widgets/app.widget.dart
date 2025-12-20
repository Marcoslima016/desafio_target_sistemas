import 'package:desafio_target_sistemas/lib.exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppWidget extends StatefulWidget {
  final double? textScaleFactor;
  const AppWidget({super.key, this.textScaleFactor});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 667),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: false,
            colorScheme: ColorScheme(
              brightness: Brightness.light,
              primary: context.design.colors.primary,
              onPrimary: context.design.colors.onPrimary,
              secondary: context.design.colors.secondary,
              onSecondary: context.design.colors.onSecondary,
              error: context.design.colors.error,
              onError: context.design.colors.onError,
              surface: context.design.colors.surface,
              onSurface: context.design.colors.onSurface,
            ),
          ),
          onGenerateRoute: AppRoutes.generateRoute,
          builder: (context, child) {
            final MediaQueryData data = MediaQuery.of(context);
            return MediaQuery(
              data: data.copyWith(textScaler: TextScaler.linear(1.0)),
              child: Stack(
                children: [
                  child!,
                ],
              ),
            );
          },
        );
      },
    );
  }
}

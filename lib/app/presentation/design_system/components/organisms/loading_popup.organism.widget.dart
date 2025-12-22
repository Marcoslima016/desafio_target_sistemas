import 'package:flutter/material.dart';
import '../components.exports.dart';

class LoadingPopup {
  const LoadingPopup();

  static Future<void> hide() async {
    try {
      Navigator.pop(LoadingPopupController.instance.context!);
      await Future.delayed(const Duration(milliseconds: 100), () {});
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> show(BuildContext context) async {
    LoadingPopupController.instance.setContext(context);
    showGeneralDialog(
      barrierDismissible: false,
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Container(
            clipBehavior: Clip.none,
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withValues(alpha: 0.65),
            child: Stack(
              children: [
                _body(),
              ],
            ),
          ),
        );
      },
    ).then((val) {});
    await Future.delayed(const Duration(milliseconds: 350), () {});
  }

  static Widget _body() {
    return SizedBox.expand(
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ASpinner(),
        ],
      ),
    );
  }
}

class LoadingPopupController {
  late BuildContext? context;
  static final LoadingPopupController instance = LoadingPopupController._();
  LoadingPopupController._();
  setContext(BuildContext context) {
    this.context = context;
  }
}

import 'package:desafio_target_sistemas/lib.exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterNewInfoInput extends StatefulWidget {
  const RegisterNewInfoInput({super.key});

  @override
  State<RegisterNewInfoInput> createState() => _RegisterNewInfoInputState();
}

class _RegisterNewInfoInputState extends State<RegisterNewInfoInput> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        bool hasItemsEditing = manageRecordsStore.recordedItems.where((e) => e.editing).isNotEmpty;

        return SizedBox(
          width: 1.sw,
          child: Padding(
            padding: EdgeInsets.only(bottom: 0),
            child: IgnorePointer(
              ignoring: hasItemsEditing,
              child: Opacity(
                opacity: hasItemsEditing ? 0.12 : 1.0,
                child: MTextInput(
                  controller: manageRecordsStore.newInfoInput,
                  hintText: "Digite o seu texto",
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

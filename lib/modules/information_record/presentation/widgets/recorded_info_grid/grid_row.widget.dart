import 'package:desafio_target_sistemas/lib.exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridRow extends StatelessWidget {
  final RecordedInfoStore gridItem;
  final bool isTemporary;

  const GridRow({
    super.key,
    required this.gridItem,
    this.isTemporary = false,
  });

  BoxDecoration _makeDecoration(BuildContext context) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(8.sp),
    );
  }

  // = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //
            Opacity(
              opacity: isTemporary ? 0.5 : 1,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 5.sp),
                decoration: _makeDecoration(context),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildInfoValueDisplay(),
                    _buildRowButtons(gridItem),
                  ],
                ),
              ),
            ),

            //DIVIDER
            Divider(
              height: 0.5.sp,
              thickness: 0.5.sp,
              color: const Color.fromARGB(255, 163, 163, 163),
            ),
            //
          ],
        );
      },
    );
  }

  //
  // = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
  // INFO VALUE DISPLAY

  Widget _buildInfoValueDisplay() {
    TextEditingController inputController = TextEditingController(text: gridItem.info.value);
    if (gridItem.editing) inputController = manageRecordsStore.itemEditingInput;

    return Expanded(
      child: MEditableText(
        controller: inputController,
        editing: gridItem.editing,
      ),
    );
  }

  //
  // = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
  // ROW BUTTONS

  Widget _buildRowButtons(RecordedInfoStore gridItem) {
    final store = manageRecordsStore;

    bool isThisItemEditing = gridItem.editing;
    bool isThisItemTemporary = gridItem.isTemporary;
    bool isRecordingNewInfo = store.isRecordingNewInfo;
    bool hasAnotherItemEditing = store.hasEditingItem;

    bool disableButtonsAction = false;

    if (isThisItemEditing == false) {
      disableButtonsAction = isRecordingNewInfo || hasAnotherItemEditing;
    }

    List<Widget> displayedButtonsList = [];

    if (isThisItemEditing || isThisItemTemporary) {
      //
      //BOTAO SALVAR
      displayedButtonsList.add(
        Padding(
          padding: EdgeInsets.only(right: 4.sp),
          child: InkWell(
            onTap: () => store.onTapSaveItem(gridItem),
            child: Row(
              children: [
                Icon(
                  Icons.save,
                  size: 22.sp,
                  color: const Color.fromARGB(255, 130, 130, 130),
                ),
              ],
            ),
          ),
        ),
      );

      //BOTAO CANCELAR
      displayedButtonsList.add(
        Padding(
          padding: EdgeInsets.only(left: 5.sp),
          child: InkWell(
            onTap: () => store.onTapCancelEdit(gridItem),
            child: Icon(
              Icons.close,
              color: const Color.fromARGB(255, 143, 143, 143),
              size: 20.5.sp,
            ),
          ),
        ),
      );
      //
    } else if (!isThisItemEditing) {
      //
      //BOTAO EDITAR
      displayedButtonsList.add(
        Padding(
          padding: EdgeInsets.only(right: 5.sp),
          child: InkWell(
            onTap: () => store.onTapEditItem(gridItem),
            child: Icon(
              Icons.edit,
              size: 20.6.sp,
              color: const Color.fromARGB(255, 55, 55, 55),
            ),
          ),
        ),
      );

      //BOTAO DELETAR
      displayedButtonsList.add(
        Padding(
          padding: EdgeInsets.only(left: 5.5.sp),
          child: InkWell(
            onTap: () => store.onTapDeleteItem(gridItem),
            child: Container(
              padding: EdgeInsets.all(3.5.sp),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color.fromARGB(255, 219, 70, 2),
              ),
              child: Icon(
                Icons.close,
                color: Colors.white,
                size: 14.sp,
              ),
            ),
          ),
        ),
      );
      //
    }

    return Opacity(
      opacity: disableButtonsAction ? 0.12 : 1.0,
      child: IgnorePointer(
        ignoring: disableButtonsAction,
        child: Padding(
          padding: EdgeInsetsGeometry.only(left: 12.sp, right: 4.sp),
          child: Row(
            children: displayedButtonsList,
          ),
        ),
      ),
    );
  }

  // = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
}

import 'package:desafio_target_sistemas/lib.exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecordedInfoGrid extends StatelessWidget {
  const RecordedInfoGrid({super.key});

  // = = = = = = = = = = = = = = = = = = = = = = =

  void _sortList(List<RecordedInfoStore> list) {
    list.sort(
      (a, b) {
        return b.info.registrationDate!.compareTo(
          a.info.registrationDate!,
        );
      },
    );
  }

  // = = = = = = = = = = = = = = = = = = = = = = =

  @override
  Widget build(BuildContext context) {
    return _buildGridStyleWraper(
      context: context,
      child: _buildList(),
    );
  }

  // = = = = = = = = = = = = = = = = = = = = = = =
  // GRID STYLE WRAPER

  Widget _buildGridStyleWraper({
    required BuildContext context,
    required Widget child,
  }) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(
          left: 8.sp,
          right: 8.sp,
          top: 6.sp,
          bottom: 6.sp,
        ),
        decoration: BoxDecoration(
          color: context.design.colors.containerSecondary,
          borderRadius: BorderRadius.circular(12.sp),
        ),
        child: child,
      ),
    );
  }

  // = = = = = = = = = = = = = = = = = = = = = = =
  // BUILD LIST

  Widget _buildList() {
    return Observer(
      builder: (_) {
        final recordItemsList = manageRecordsStore.recordedItems;
        final listLength = recordItemsList.length;
        _sortList(recordItemsList);

        return ListView.builder(
          itemCount: listLength,
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final RecordedInfoStore gridItem = recordItemsList[index];

            return Column(
              children: [
                if (index == 0) _buildTemporaryRow(),
                GridRow(gridItem: gridItem),
                if (index + 1 == listLength) SizedBox(height: 24.sp),
              ],
            );
          },
        );
      },
    );
  }

  // = = = = = = = = = = = = = = = = = = = = = = =
  // BUILD TEMPORARY ROW

  Widget _buildTemporaryRow() {
    return Observer(
      builder: (_) {
        final gridItem = manageRecordsStore.temporaryItemRecording;
        if (manageRecordsStore.temporaryItemRecording != null) {
          return GridRow(
            gridItem: gridItem!,
            isTemporary: true,
          );
        } else {
          return Container();
        }
      },
    );
  }

  // = = = = = = = = = = = = = = = = = = = = = = =
}

import 'package:flutter/material.dart';
import 'package:task_10_shopping_list/model_provider/model_provider.dart';
import '../const/const.dart';

// Тут модальное окно с выбором сортировок
class BuildBottomSheetWidget extends StatefulWidget {
  const BuildBottomSheetWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  final ModelProvider model;

  @override
  State<BuildBottomSheetWidget> createState() => _BuildBottomSheetWidgetState();
}

class _BuildBottomSheetWidgetState extends State<BuildBottomSheetWidget> {
  void onChanged(String? value) {
    widget.model.selectedOption = value!;
    setState(() {});
  }

  Widget buildRadioListTile({
    required String title,
    required String value,
  }) {
    return RadioListTile(
      activeColor: AppColor.lightGreen,
      title: Text(title),
      value: value,
      groupValue: widget.model.selectedOption,
      onChanged: onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: AppColor.white,
      child: ListView(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Сортировка', style: AppFont.styleBlackSize20Weight700),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close,
                    size: 24,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          buildRadioListTile(title: 'Без сортировки', value: 'No sorting'),
          const Divider(),
          const SizedBox(height: 5),
          Align(
            alignment: Alignment.topLeft,
            child: Text('По имени', style: AppFont.styleBlackSize14Weight400),
          ),
          buildRadioListTile(
            title: 'По имени от А до Я',
            value: 'By name from A to Z',
          ),
          buildRadioListTile(
            title: 'По имени от Я до А',
            value: 'By name from Z to A',
          ),
          const SizedBox(height: 5),
          const Divider(),
          Align(
            alignment: Alignment.topLeft,
            child: Text('По цене', style: AppFont.styleBlackSize14Weight400),
          ),
          buildRadioListTile(title: 'По возрастанию', value: 'Ascending'),
          buildRadioListTile(title: 'По убыванию', value: 'Descending'),
          const Divider(),
          const SizedBox(height: 5),
          Align(
            alignment: Alignment.topLeft,
            child: Text('По типу', style: AppFont.styleBlackSize14Weight400),
          ),
          buildRadioListTile(
            title: 'По типу от А до Я',
            value: 'By type from A to Z',
          ),
          buildRadioListTile(
            title: 'По типу от Я до А',
            value: 'By type from Z to A',
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                widget.model.sort();
                Navigator.pop(context);
              },
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all<Color>(AppColor.lightGreen),
              ),
              child: Text(
                'Готово',
                style: AppFont.styleWhiteSize18Weight700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

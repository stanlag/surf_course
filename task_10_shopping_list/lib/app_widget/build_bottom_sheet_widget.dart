import 'package:flutter/material.dart';
import 'package:task_10_shopping_list/model_provider/model_provider.dart';
import '../const/const.dart';
import '../entity/classes.dart';

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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: ListView(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Сортировка',
                    style: Theme.of(context).textTheme.titleLarge),
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
          CustomRadioListTile(
            title: 'Без сортировки',
            value: SortingSelection.noSorting.name,
            groupValue: widget.model.selectedOption,
            onChanged: onChanged,
          ),
          const Divider(),
          const SizedBox(height: 5),
          Align(
            alignment: Alignment.topLeft,
            child:
                Text('По имени', style: Theme.of(context).textTheme.bodyMedium),
          ),
          CustomRadioListTile(
            title: 'По имени от А до Я',
            value: SortingSelection.byNameFromAToZ.name,
            groupValue: widget.model.selectedOption,
            onChanged: onChanged,
          ),
          CustomRadioListTile(
            title: 'По имени от Я до А',
            value: SortingSelection.byNameFromZToA.name,
            groupValue: widget.model.selectedOption,
            onChanged: onChanged,
          ),
          const SizedBox(height: 5),
          const Divider(),
          Align(
            alignment: Alignment.topLeft,
            child:
                Text('По цене', style: Theme.of(context).textTheme.bodyMedium),
          ),
          CustomRadioListTile(
            title: 'По возрастанию',
            value: SortingSelection.ascending.name,
            groupValue: widget.model.selectedOption,
            onChanged: onChanged,
          ),
          CustomRadioListTile(
            title: 'По убыванию',
            value: SortingSelection.descending.name,
            groupValue: widget.model.selectedOption,
            onChanged: onChanged,
          ),
          const Divider(),
          const SizedBox(height: 5),
          Align(
            alignment: Alignment.topLeft,
            child:
                Text('По типу', style: Theme.of(context).textTheme.bodyMedium),
          ),
          CustomRadioListTile(
            title: 'По типу от А до Я',
            value: SortingSelection.byTypeFromAToZ.name,
            groupValue: widget.model.selectedOption,
            onChanged: onChanged,
          ),
          CustomRadioListTile(
            title: 'По типу от Я до А',
            value: SortingSelection.byTypeFromZToA.name,
            groupValue: widget.model.selectedOption,
            onChanged: onChanged,
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
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomRadioListTile extends StatelessWidget {
  final String title;
  final String value;
  final String groupValue;
  final ValueChanged<String?> onChanged;

  const CustomRadioListTile({
    Key? key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      activeColor: AppColor.lightGreen,
      title: Text(title),
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
    );
  }
}

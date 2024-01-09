import 'package:flutter/material.dart';
import 'package:task_10_shopping_list/model_provider/model_provider.dart';
import 'package:task_10_shopping_list/assets/colors/color_palette.dart';
import 'package:task_10_shopping_list/entity/sorting_selection.dart';

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
  void onChanged(SortingSelection? value) {
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
          RadioListTile(
              title: const Text('Без сортировки'),
              value: SortingSelection.noSorting,
              groupValue: widget.model.selectedOption,
              onChanged: onChanged),
          const Divider(),
          const SizedBox(height: 5),
          Align(
            alignment: Alignment.topLeft,
            child:
                Text('По имени', style: Theme.of(context).textTheme.bodyMedium),
          ),
          RadioListTile(
            title: const Text('По имени от А до Я'),
            value: SortingSelection.byNameFromAToZ,
            groupValue: widget.model.selectedOption,
            onChanged: onChanged,
          ),
          RadioListTile(
            title: const Text('По имени от Я до А'),
            value: SortingSelection.byNameFromZToA,
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
          RadioListTile(
            title: const Text('По возрастанию'),
            value: SortingSelection.ascending,
            groupValue: widget.model.selectedOption,
            onChanged: onChanged,
          ),
          RadioListTile(
            title: const Text('По убыванию'),
            value: SortingSelection.descending,
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
          RadioListTile(
            title: const Text('По типу от А до Я'),
            value: SortingSelection.byTypeFromAToZ,
            groupValue: widget.model.selectedOption,
            onChanged: onChanged,
          ),
          RadioListTile(
            title: const Text('По типу от Я до А'),
            value: SortingSelection.byTypeFromZToA,
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

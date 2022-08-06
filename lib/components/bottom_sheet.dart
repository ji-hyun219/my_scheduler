import 'package:flutter/material.dart';
import 'package:my_scheduler/components/custom_text_field.dart';

class ScheduleBottomSheet extends StatelessWidget {
  const ScheduleBottomSheet({
    Key? key,
    required this.context,
    required this.bottomSheet,
  }) : super(key: key);

  final BuildContext context;
  final double bottomSheet;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2 + bottomSheet,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(bottom: bottomSheet),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Expanded(child: CustomTextField(label: '시작 시간')),
                SizedBox(width: 10),
                Expanded(child: CustomTextField(label: '종료 시간')),
              ],
            ),
            const CustomTextField(label: '할 일'),
            const SizedBox(height: 10),
            const _ColorPicker(),
            const SizedBox(height: 15),
            const _SaveButton()
          ],
        ),
      ),
    );
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          width: MediaQuery.of(context).size.width - 20,
          height: 40,
          child: ElevatedButton(onPressed: () {}, child: const Text('저장'))),
    );
  }
}

class _ColorPicker extends StatelessWidget {
  const _ColorPicker({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      renderColor(Colors.red),
      renderColor(Colors.yellow),
      renderColor(Colors.green),
      renderColor(Colors.blue),
      renderColor(Colors.purple),
      renderColor(Colors.pink),
      renderColor(Colors.red),
      renderColor(Colors.yellow),
      renderColor(Colors.green),
      renderColor(Colors.blue),
      renderColor(Colors.purple),
      renderColor(Colors.pink),
      renderColor(Colors.red),
      renderColor(Colors.yellow),
      renderColor(Colors.green),
      renderColor(Colors.blue),
      renderColor(Colors.purple),
      renderColor(Colors.pink),
      renderColor(Colors.pink),
      renderColor(Colors.red),
      renderColor(Colors.yellow),
      renderColor(Colors.green),
      renderColor(Colors.blue),
      renderColor(Colors.purple),
      renderColor(Colors.pink),
    ]);
  }

  Widget renderColor(color) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}

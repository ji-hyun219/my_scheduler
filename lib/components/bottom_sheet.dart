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
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()), // <-- bottomsheet 안의 여백을 누르면 키보드가 닫히게
      child: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height / 2 + bottomSheet,
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(bottom: bottomSheet),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Expanded(
                        child: CustomTextField(
                      label: '시작 시간',
                      isTime: true,
                    )),
                    SizedBox(width: 10),
                    Expanded(
                        child: CustomTextField(
                      label: '종료 시간',
                      isTime: true,
                    )),
                  ],
                ),
                const Expanded(
                  // expanded 로 감싸도 화면을 다 차지하지 않는 이유
                  // CustomTextField 는 컬럼 위젯이니까..
                  // 그래서 CustomTextFiled 안에 텍스트를 expaned 로 또 감싸줘야 함
                  // 그래도 textfield 가 늘어나지 않는다 .. 이유는
                  // textfield 의 expands 속성을 쓰지 않았기 때문
                  child: CustomTextField(
                    label: '할 일',
                    isTime: false,
                  ),
                ),
                const SizedBox(height: 10),
                const _ColorPicker(),
                const SizedBox(height: 15),
                const _SaveButton()
              ],
            ),
          ),
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

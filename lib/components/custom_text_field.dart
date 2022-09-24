import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool isTime;
  const CustomTextField({Key? key, required this.label, required this.isTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w400,
              fontSize: 10,
            )),
        if (isTime) renderTextField(),
        if (!isTime) Expanded(child: renderTextField()),
      ],
    );
  }

  Widget renderTextField() {
    return TextField(
      maxLines: isTime ? 1 : null, // null 이면 쓰면서 무한정 늘어남
      cursorColor: Colors.grey,
      expands: !isTime,
      keyboardType: isTime ? TextInputType.number : TextInputType.multiline, // number: 키보드 -> 숫자 키보드 나옴
      inputFormatters: isTime
          ? [
              FilteringTextInputFormatter.digitsOnly // 숫자 아닌 글자 써짐을 방지
            ]
          : [],
      decoration: InputDecoration(
        border: InputBorder.none,
        filled: true,
        fillColor: Colors.grey[300],
      ),
    );
  }
}

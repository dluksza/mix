import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

PressableWidgetFn get button => Mix(
      caption(),
      bgColor(cs().primary),
      paddingHorizontal(20),
      paddingVertical(10),
      bold(),
      rounded(5),
    ).pressable;

class ButtonsPreview extends StatelessWidget {
  const ButtonsPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          button(
            child: const TextMix('Details'),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('Pressable', () {
    const attribute1 = MockIntScalarAttribute(1);
    const attribute2 = MockStringScalarAttribute('attribute2');
    const attribute3 = MockBooleanScalarAttribute(true);

    testWidgets('Pressable', (tester) async {
      final firstKey = UniqueKey();
      final secondKey = UniqueKey();
      final thirdKey = UniqueKey();
      await tester.pumpWidget(Column(
        children: [
          Pressable(
            onPress: null,
            enabled: false,
            child: Container(key: firstKey),
          ),
          Pressable(
            enabled: false,
            onPress: null,
            child: Container(key: secondKey),
          ),
          // Test with a onpress function
          Pressable(
            onPress: () {},
            enabled: true,
            child: Container(key: thirdKey),
          ),
        ],
      ));

      final onEnabledAttr = $on.enabled(attribute1, attribute2, attribute3);

      final firstContext = tester.element(find.byKey(firstKey));
      final secondContext = tester.element(find.byKey(secondKey));
      final thirdContext = tester.element(find.byKey(thirdKey));

      final firstNotifier = WidgetStateModel.of(firstContext);
      final secondNotifier = WidgetStateModel.of(secondContext);
      final thirdNotifier = WidgetStateModel.of(thirdContext);

      expect(onEnabledAttr.variant.when(firstContext), false);
      expect(firstNotifier.disabled, true);
      expect(onEnabledAttr.variant.when(secondContext), false);
      expect(secondNotifier.disabled, true);

      expect(onEnabledAttr.variant.when(thirdContext), true);
      expect(thirdNotifier.disabled, false);
    });

    testWidgets(
      'must be clickable when enabled is setted to true',
      (tester) async {
        int counter = 0;

        await tester.pumpWidget(
          Pressable(
            enabled: true,
            onPress: () {
              counter++;
            },
            child: Container(),
          ),
        );

        final pressableFinder = find.byType(Pressable);
        expect(pressableFinder, findsOneWidget);

        await tester.tap(pressableFinder);
        await tester.pumpAndSettle(const Duration(milliseconds: 200));

        expect(counter, 1);
      },
    );

    testWidgets(
      'must be unclickable when enabled is setted to false',
      (tester) async {
        int counter = 0;

        await tester.pumpWidget(
          Pressable(
            enabled: false,
            onPress: () {
              counter++;
            },
            child: Container(),
          ),
        );

        final pressableFinder = find.byType(Pressable);
        expect(pressableFinder, findsOneWidget);

        await tester.tap(pressableFinder);
        await tester.pumpAndSettle();

        expect(counter, 0);
      },
    );

    testWidgets('Pressable responds to keyboard events',
        (WidgetTester tester) async {
      var wasPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Pressable(
              autofocus: true,
              unpressDelay: Duration.zero,
              onPress: () {
                wasPressed = true;
              },
              child: const Text('Tap me'),
            ),
          ),
        ),
      );

      await tester.sendKeyEvent(LogicalKeyboardKey.enter);

      expect(wasPressed, isTrue);
    });
  });

  group('PressableBox', () {
    testWidgets(
      'must be clickable when enable is setted to true',
      (tester) async {
        int counter = 0;

        await tester.pumpWidget(
          PressableBox(
            unpressDelay: Duration.zero,
            onPress: () {
              counter++;
            },
            enabled: true,
            child: Container(),
          ),
        );

        final pressableFinder = find.byType(PressableBox);
        expect(pressableFinder, findsOneWidget);

        await tester.tap(pressableFinder);
        await tester.pumpAndSettle();

        expect(counter, 1);
      },
    );

    testWidgets(
      'must be unclickable when enable is setted to false',
      (tester) async {
        int counter = 0;

        await tester.pumpWidget(
          PressableBox(
            unpressDelay: Duration.zero,
            onPress: () {
              counter++;
            },
            enabled: false,
            child: Container(),
          ),
        );

        final pressableFinder = find.byType(PressableBox);
        expect(pressableFinder, findsOneWidget);

        await tester.tap(pressableFinder);
        await tester.pumpAndSettle();

        expect(counter, 0);
      },
    );

    testWidgets('PressableBox responds to keyboard events',
        (WidgetTester tester) async {
      var wasPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PressableBox(
              autofocus: true,
              unpressDelay: Duration.zero,
              onPress: () {
                wasPressed = true;
              },
              child: const Text('Tap me'),
            ),
          ),
        ),
      );

      await tester.sendKeyEvent(LogicalKeyboardKey.enter);

      expect(wasPressed, isTrue);
    });

    testWidgets(r'must change to attributes in $on.hover variant when hovered',
        (WidgetTester tester) async {
      await pumpTestCase(
        tester: tester,
        condition: $on.hover,
        action: () => tester.hover(find.byType(PressableBox)),
      );
    });

    testWidgets(
        r'must change to attributes inside $on.longPress variant when long pressed',
        (WidgetTester tester) async {
      await pumpTestCase(
        tester: tester,
        condition: $on.longPress,
        action: () => tester.longPress(find.byType(PressableBox)),
      );
    });

    testWidgets(r'must restyle using attributes inside $on.press when pressed',
        (WidgetTester tester) async {
      await pumpTestCase(
        tester: tester,
        duration: const Duration(milliseconds: 250),
        condition: $on.press,
        action: () async {
          await tester.tap(find.byType(PressableBox));
          await tester.pump();
        },
      );
    });

    testWidgets(
        r'must restyle using attributes inside ($on.longPress | $on.hover) when hovered',
        (WidgetTester tester) async {
      await pumpTestCase(
        tester: tester,
        condition: ($on.longPress | $on.hover),
        action: () => tester.hover(find.byType(PressableBox)),
      );
    });

    testWidgets(
        r'must restyle using attributes inside ($on.longPress | $on.hover) when long pressed',
        (WidgetTester tester) async {
      await pumpTestCase(
        tester: tester,
        condition: ($on.longPress | $on.hover),
        action: () => tester.longPress(find.byType(PressableBox)),
      );
    });

    testWidgets(
        r'must NOT restyle using attributes inside ($on.longPress | $on.hover) when Pressed',
        (WidgetTester tester) async {
      await pumpTestCase(
        tester: tester,
        duration: const Duration(milliseconds: 250),
        condition: ($on.longPress | $on.hover),
        action: () async {
          await tester.tap(find.byType(PressableBox));
          await tester.pump();
        },
        finalExpectedOpacity: 0.5,
      );
    });

    testWidgets(
        r'must restyle using attributes inside ($on.hover | $on.press) when pressed',
        (WidgetTester tester) async {
      await pumpTestCase(
        tester: tester,
        duration: const Duration(milliseconds: 250),
        condition: ($on.hover | $on.press),
        action: () async {
          await tester.tap(find.byType(PressableBox));
          await tester.pump();
        },
      );
    });

    testWidgets(
        r'must restyle using attributes inside ($on.hover | $on.press | $on.longPress) when pressed',
        (WidgetTester tester) async {
      await pumpTestCase(
        tester: tester,
        duration: const Duration(milliseconds: 250),
        condition: ($on.press | $on.hover | $on.longPress),
        action: () async {
          await tester.tap(find.byType(PressableBox));
          await tester.pump();
        },
      );
    });

    testWidgets(
        r'must restyle using attributes inside ($on.hover | $on.press) when hovered',
        (WidgetTester tester) async {
      await pumpTestCase(
        tester: tester,
        duration: const Duration(milliseconds: 250),
        condition: ($on.hover | $on.press),
        action: () async {
          await tester.hover(find.byType(PressableBox));
        },
      );
    });

    testWidgets(
        r'must NOT restyle using attributes inside ($on.hover | $on.press) when long pressed',
        (WidgetTester tester) async {
      await pumpTestCase(
        tester: tester,
        duration: const Duration(milliseconds: 250),
        condition: ($on.hover | $on.press),
        action: () async {
          await tester.longPress(find.byType(PressableBox));
        },
        finalExpectedOpacity: 0.5,
      );
    });

    testWidgets(
        r'must restyle using attributes inside ($on.longPress | $on.press) when pressed',
        (WidgetTester tester) async {
      await pumpTestCase(
        tester: tester,
        duration: const Duration(milliseconds: 250),
        condition: ($on.longPress | $on.press),
        action: () async {
          await tester.tap(find.byType(PressableBox));
          await tester.pump();
        },
      );
    });

    testWidgets(
        r'must restyle using attributes inside ($on.longPress | $on.press) when long pressed',
        (WidgetTester tester) async {
      await pumpTestCase(
        tester: tester,
        condition: ($on.longPress | $on.press),
        action: () async {
          await tester.longPress(find.byType(PressableBox));
        },
      );
    });

    testWidgets(
        r'must NOT restyle using attributes inside ($on.longPress | $on.press) when hovered',
        (WidgetTester tester) async {
      await pumpTestCase(
        tester: tester,
        condition: ($on.longPress | $on.press),
        action: () async {
          await tester.hover(find.byType(PressableBox));
        },
        finalExpectedOpacity: 0.5,
      );
    });

    testWidgets(
        r'must restyle using attributes inside ($on.hover & $on.press) when hovered & pressed',
        (WidgetTester tester) async {
      await pumpTestCase(
        tester: tester,
        duration: const Duration(milliseconds: 250),
        condition: ($on.hover & $on.press),
        action: () async {
          await tester.hover(find.byType(PressableBox));
          await tester.pump();
          await tester.tap(find.byType(PressableBox));
          await tester.pump();
        },
      );
    });

    testWidgets(
        r'must restyle using attributes inside ($on.hover & onLongPress) when hovered & longPressed',
        (WidgetTester tester) async {
      await pumpTestCase(
        tester: tester,
        condition: ($on.hover & $on.longPress),
        action: () async {
          await tester.hover(find.byType(PressableBox));
          await tester.pump();

          // Custom way to long press
          final gesture = await tester.createGesture();
          await gesture.addPointer(
            location: tester.getCenter(find.byType(PressableBox)),
          );

          await gesture.down(
            tester.getCenter(find.byType(PressableBox)),
          );
          addTearDown(gesture.removePointer);

          await tester.pump(kLongPressTimeout);
        },
      );
    });
  });
}

extension WidgetTesterExt on WidgetTester {
  Future<void> hover(Finder finder) async {
    FocusManager.instance.highlightStrategy =
        FocusHighlightStrategy.alwaysTraditional;

    final gesture = await createGesture(kind: PointerDeviceKind.mouse);

    await gesture.addPointer(location: Offset.zero);
    await pump();
    await gesture.moveTo(getCenter(finder));

    await pumpAndSettle();

    addTearDown(gesture.removePointer);
  }
}

Future<void> pumpTestCase({
  required WidgetTester tester,
  Duration duration = Duration.zero,
  required condition,
  required Future<void> Function() action,
  double finalExpectedOpacity = 1,
}) async {
  await tester.pumpWidget(
    PressableBox(
      unpressDelay: duration,
      onPress: () {},
      enabled: true,
      style: Style(
        $with.opacity(0.5),
        $box.height(50),
        $box.width(50),
        condition(
          $with.opacity(1),
        ),
      ),
      child: const SizedBox(),
    ),
  );

  final opacityFinder = find.byType(Opacity);
  expect(opacityFinder, findsOneWidget);

  final oldValue = tester.widget<Opacity>(opacityFinder).opacity;
  expect(oldValue, 0.5);

  await action();
  final newValue = tester.widget<Opacity>(opacityFinder).opacity;

  expect(opacityFinder, findsOneWidget);
  expect(newValue, finalExpectedOpacity);

  await tester.pumpAndSettle(const Duration(milliseconds: 250));
}

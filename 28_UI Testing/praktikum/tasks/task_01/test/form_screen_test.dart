import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('testing pada form screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('create new contact'),
          ),
        ),
      ),
    ));

    expect(find.text('create new contact'), findsOneWidget);
  });
  testWidgets('melakukan test pada semua element', (WidgetTester tester) async {
    tester.allElements;
  });
}

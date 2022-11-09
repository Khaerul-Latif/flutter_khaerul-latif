import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    "test widegt",
    (WidgetTester tester) async {
      await tester.pumpWidget(
        Scaffold(
          appBar: AppBar(
            title: Text('Your Task'),
          ),
        ),
      );
    },
  );
}

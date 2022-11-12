import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mini_project/screens/list_todo.dart';

void main() {
  testWidgets(
    "Test Widget",
    (WidgetTester tester) async {
      final String title = 'Your Task';
      await tester
          .pumpWidget(const MaterialApp(home: ListTodoScreen(user: '')));
      expect(find.text(title), findsOneWidget);
    },
  );
}

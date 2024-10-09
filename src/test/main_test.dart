
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_counter/main.dart';

void main() {
	group('MyApp Initialization', () {
		testWidgets('MyApp should load CounterScreen', (WidgetTester tester) async {
			// Arrange & Act
			await tester.pumpWidget(MyApp());

			// Assert
			expect(find.byType(CounterScreen), findsOneWidget);
		});
	});

	group('Cubit Provider', () {
		testWidgets('MyApp should provide CounterCubit', (WidgetTester tester) async {
			// Arrange & Act
			await tester.pumpWidget(MyApp());

			// Assert
			final BuildContext context = tester.element(find.byType(CounterScreen));
			expect(BlocProvider.of<CounterCubit>(context), isA<CounterCubit>());
		});
	});
}

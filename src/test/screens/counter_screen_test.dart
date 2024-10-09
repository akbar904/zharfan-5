
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.example.simple_counter/screens/counter_screen.dart';

// Mock Cubit and State for testing
class MockCounterCubit extends MockCubit<int> implements CounterCubit {}

void main() {
	group('CounterScreen Widget Tests', () {
		late MockCounterCubit mockCounterCubit;

		setUp(() {
			mockCounterCubit = MockCounterCubit();
		});

		testWidgets('CounterScreen displays initial counter value',
				(WidgetTester tester) async {
			when(() => mockCounterCubit.state).thenReturn(0);

			await tester.pumpWidget(
				BlocProvider<CounterCubit>.value(
					value: mockCounterCubit,
					child: MaterialApp(home: CounterScreen()),
				),
			);

			expect(find.text('0'), findsOneWidget);
		});

		testWidgets('CounterScreen displays increment button',
				(WidgetTester tester) async {
			when(() => mockCounterCubit.state).thenReturn(0);

			await tester.pumpWidget(
				BlocProvider<CounterCubit>.value(
					value: mockCounterCubit,
					child: MaterialApp(home: CounterScreen()),
				),
			);

			expect(find.text('Increment'), findsOneWidget);
		});

		testWidgets('CounterScreen displays decrement button',
				(WidgetTester tester) async {
			when(() => mockCounterCubit.state).thenReturn(0);

			await tester.pumpWidget(
				BlocProvider<CounterCubit>.value(
					value: mockCounterCubit,
					child: MaterialApp(home: CounterScreen()),
				),
			);

			expect(find.text('Decrement'), findsOneWidget);
		});

		testWidgets('tapping increment button calls cubit increment method',
				(WidgetTester tester) async {
			when(() => mockCounterCubit.state).thenReturn(0);

			await tester.pumpWidget(
				BlocProvider<CounterCubit>.value(
					value: mockCounterCubit,
					child: MaterialApp(home: CounterScreen()),
				),
			);

			await tester.tap(find.text('Increment'));
			verify(() => mockCounterCubit.increment()).called(1);
		});

		testWidgets('tapping decrement button calls cubit decrement method',
				(WidgetTester tester) async {
			when(() => mockCounterCubit.state).thenReturn(0);

			await tester.pumpWidget(
				BlocProvider<CounterCubit>.value(
					value: mockCounterCubit,
					child: MaterialApp(home: CounterScreen()),
				),
			);

			await tester.tap(find.text('Decrement'));
			verify(() => mockCounterCubit.decrement()).called(1);
		});
	});
}

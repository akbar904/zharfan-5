
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'counter_state.dart';

class MockCounterCubit extends MockCubit<CounterState> {}

void main() {
	group('CounterState', () {
		test('initial state should have counterValue set to 0', () {
			final state = CounterState(counterValue: 0);
			expect(state.counterValue, 0);
		});

		test('should correctly store a given counterValue', () {
			final state = CounterState(counterValue: 5);
			expect(state.counterValue, 5);
		});
	});
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'investing_mx_doc_accept_bloc.freezed.dart';
part 'investing_mx_doc_accept_event.dart';
part 'investing_mx_doc_accept_state.dart';

@injectable
class InvestingMxDocAcceptBloc
    extends Bloc<InvestingMxDocAcceptEvent, InvestingMxDocAcceptState> {
  @override
  InvestingMxDocAcceptState get initialState =>
      InvestingMxDocAcceptState.initial();

  @override
  Stream<InvestingMxDocAcceptState> mapEventToState(
      InvestingMxDocAcceptEvent event) async* {
    yield* event.map(initial: (_) async* {
      yield state;
    }, checkBox1: (_) async* {
      yield state.copyWith(
        checkBox1: !state.checkBox1,
      );
    }, checkBox2: (_) async* {
      yield state.copyWith(
        checkBox2: !state.checkBox2,
      );
    }, checkBox3: (_) async* {
      yield state.copyWith(
        checkBox3: !state.checkBox3,
      );
    }, checkBox4: (_) async* {
      yield state.copyWith(
        checkBox4: !state.checkBox4,
      );
    }, isSubmitting: (e) async* {
      yield state.copyWith(isSubmitting: e.value);
    });
  }

  bool isButtonActivated() {
    return (state.checkBox1 &&
        state.checkBox2 &&
        state.checkBox3 &&
        state.checkBox4);
  }
}

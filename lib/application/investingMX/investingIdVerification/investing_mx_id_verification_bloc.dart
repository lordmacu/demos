import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:ualet/domain/investing/user_id_info.dart';

part 'investing_mx_id_verification_bloc.freezed.dart';
part 'investing_mx_id_verification_event.dart';
part 'investing_mx_id_verification_state.dart';

@injectable
class InvestingMxIdVerificationBloc extends Bloc<InvestingMxIdVerificationEvent,
    InvestingMxIdVerificationState> {
  @override
  InvestingMxIdVerificationState get initialState {
    print("getINitial");
    return InvestingMxIdVerificationState.initial();
  }

  @override
  Stream<InvestingMxIdVerificationState> mapEventToState(
      InvestingMxIdVerificationEvent event) async* {
    event.map(initial: (_) async* {
      print("Initial");
      yield state;
    }, setUserIdInfo: (data) async* {
      print("BLOC setIdInfo");
      yield state.copyWith(idInfo: data.newUserIdInfo);
    });
  }
}

import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:ualet/domain/core/base_failures.dart';
import 'package:ualet/domain/support/i_support_message_repository.dart';
import 'package:ualet/domain/support/support_message.dart';

part 'support_form_event.dart';
part 'support_form_state.dart';

part 'support_form_bloc.freezed.dart';

@injectable
class SupportFormBloc extends Bloc<SupportFormEvent, SupportFormState> {
  final ISupportMessageRepository _supportMessageRepository;
  SupportFormBloc(this._supportMessageRepository);

  @override
  SupportFormState get initialState => SupportFormState.initial();

  @override
  Stream<SupportFormState> mapEventToState(
    SupportFormEvent event,
  ) async* {
    yield* event.map(
    
    supportMessageChanged: (e) async* {
      yield state.copyWith(message: e.message);
    }, 

    postSupportMessage: (e) async* {
      yield state.copyWith(
          postFailureorSuccessOption: none(), isSubmitting: true);

      SupportMessage newMessage = state.message.copyWith(file: state.file);
      yield state.copyWith(message: newMessage);

      final failureOrSuccess =
          await _supportMessageRepository.postSupportMessage(newMessage);
      yield state.copyWith(
          isSubmitting: false,
          postFailureorSuccessOption: some(failureOrSuccess));
    }, 

    fileChanged: (data) async* {
      yield state.copyWith(
        file: data.file,
      );
    },

    fileDeleted: (_) async* {
      yield state.copyWith(
        file: null,
      );
      
    },
    isSubmitting: (e) async* {
      yield state.copyWith(isSubmitting: e.value);
    }
    );
  }
}

import 'package:ualet/domain/investing/i_investing_repository.dart';
import 'package:ualet/domain/sarlaft/i_sarlaft_repository.dart';
import 'package:ualet/domain/sarlaft/ocupation_item.dart';
import 'package:ualet/domain/sarlaft/required_file_item.dart';
import 'package:ualet/domain/user_verification/i_user_verification_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'grandes_montos_watcher_event.dart';
part 'grandes_montos_watcher_state.dart';
part 'grandes_montos_watcher_bloc.freezed.dart';

@injectable
class GrandesMontosWatcherBloc
    extends Bloc<GrandesMontosWatcherEvent, GrandesMontosWatcherState> {
  GrandesMontosWatcherBloc(this._repo, this._verRepo, this._sarlaftRepo);

  @override
  get initialState => GrandesMontosWatcherState.end();

  final IInvestingRepository _repo;
  final IUserVerificationRepository _verRepo;
  final ISarlaftRepository _sarlaftRepo;

  @override
  Stream<GrandesMontosWatcherState> mapEventToState(event) async* {
    print("Event");
    print(event.toString());
    yield* event.map(
      toInfoFinanciera1: (_) async* {
        print("toInfo1");
        yield GrandesMontosWatcherState.loading();
        var response = await _repo.getItems();
        print(response.toString());
        bool error = false;
        String errorMsg = '';
        List<OcupationItem> lst = [];
        response.fold((l) {
          error = true;
          l.map(unexpected: (e) {
            print("Error inesperado");
            errorMsg = "Error inesperado";
          }, fromServer: (e) {
            print("Error: ${e.message}");
            errorMsg = e.message;
          });
        }, (r) {
          print("EXITO");
          lst = r.asList();
        });

        Map<String, String> mapCities = {};
        try {
          mapCities = await _verRepo.getRegions(46.toString());
        } catch (e) {
          error = true;
        }

        Map<String, String> mapCountries = {};
        var responseCountries = await _sarlaftRepo.getCountries();
        responseCountries.fold((l) {
          error = true;
          errorMsg = l.map(
              unexpected: (e) => "Error Inesperado",
              fromServer: (e) => "Error: ${e.message}");
        }, (r) {
          mapCountries = r;
        });

        if (error) {
          yield GrandesMontosWatcherState.error(errorMsg);
        } else {
          yield GrandesMontosWatcherState.infoFinanciera1(
              lst, mapCities, mapCountries);
        }
        print("end");
      },
      toInfoFinanciera2: (_) async* {
        print("toInfo2");
        yield GrandesMontosWatcherState.infoFinanciera2();
      },
      toAdjuntarDocumentos1: (_) async* {
        print("toDocs1");
        var response = await _repo.getRequiredFiles();
        print(response.toString());
        bool error = false;
        String errorMsg = '';
        List<RequiredFileItem> lst = [];
        response.fold((l) {
          error = true;
          l.map(unexpected: (e) {
            print("Error inesperado");
            errorMsg = "Error inesperado";
          }, fromServer: (e) {
            print("Error: ${e.message}");
            errorMsg = e.message;
          });
        }, (r) {
          print("EXITO");
          lst = r.asList();
        });
        yield GrandesMontosWatcherState.loading();
        yield GrandesMontosWatcherState.adjuntarDocumentos1(lst);
      },
    );
  }
}

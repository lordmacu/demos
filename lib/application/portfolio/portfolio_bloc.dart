import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';
import 'package:ualet/domain/core/base_failures.dart';
import 'package:ualet/domain/portfolio/i_portfolio_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ualet/domain/portfolio/portfolio_detail.dart';

part 'portfolio_event.dart';
part 'portfolio_state.dart';

part 'portfolio_bloc.freezed.dart';

@injectable
class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  final IPortfolioRepository _portfolioRepository;

  PortfolioBloc(this._portfolioRepository);

  @override
  PortfolioState get initialState => PortfolioState.initial();
  @override
  Stream<PortfolioState> mapEventToState(PortfolioEvent event) async* {
    Either<BaseFailure, KtList<PortfolioDetail>> fOrDetail;
    yield PortfolioState.loading();

    fOrDetail = await _portfolioRepository.getDetails();

    yield fOrDetail.fold(
      (failure) => PortfolioState.loadFailure(failure), 
      (data) => PortfolioState.loadSuccess(data));
  }
}

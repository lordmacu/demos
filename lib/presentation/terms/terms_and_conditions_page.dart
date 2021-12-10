import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:ualet/application/terms/terms_bloc.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/widgets/loading_in_progress_overlay/loading_in_progress_overlay.dart';

class TermsAndConditions extends HookWidget {
  const TermsAndConditions({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TermsBloc>(
        create: (context) =>
            getIt<TermsBloc>()..add(TermsEvent.getTermsItems()),
        child: BlocBuilder<TermsBloc, TermsState>(
          builder: (context, state) {
            return state.map(
                initial: (_) => Container(),
                loadInProgress: (_) => Stack(
                      children: <Widget>[
                        Container(
                          color: AppColors.backgroundColor,
                        ),
                        LoadingInProgressOverlay(isLoading: true),
                      ],
                    ),
                loadSuccess: (state) {
                  String tyc = state.items.replaceAll("|", "<br>  ");
                  return Scaffold(
                    backgroundColor: AppColors.backgroundColor,
                    body: SafeArea(
                      child: Container(
                        child: ListView(
                          primary: false,
                          children: <Widget>[
                            IconButton(
                              alignment: Alignment.centerLeft,
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: AppColors.primaryColor,
                              ),
                              onPressed: () =>
                                  ExtendedNavigator.rootNavigator.pop(),
                            ),
                            _headerTerms(context),
                            _termsAndConditions(context, tyc),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                loadFailure: (state) {
                  return Container();
                });
          },
        ));
  }

  Widget _headerTerms(context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.0, right: 80.0),
      child: Text(
        S.of(context).termsTitle,
        textAlign: TextAlign.left,
        style: AppTextStyles.title2.copyWith(color: AppColors.g25Color),
      ),
    );
  }

  Widget _termsAndConditions(context, tyc) {
    return Container(
      margin: EdgeInsets.only(
        left: 24.0,
        right: 24.0,
        top: 40.0,
      ),
      padding:
          EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 30.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Html(
        data: tyc,
      ),
    );
  }
}

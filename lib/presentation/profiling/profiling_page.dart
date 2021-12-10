import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ualet/application/profiling/profiling_form/profiling_form_bloc.dart';
import 'package:ualet/application/profiling/profiling_watcher/profiling_watcher_bloc.dart';
import 'package:ualet/domain/profiling/profiling_item.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/misc/toast_helper.dart';
import 'package:ualet/presentation/core/widgets/loading_in_progress_overlay/loading_in_progress_overlay.dart';
import 'package:ualet/presentation/profiling/widgets/multi_check_question.dart';
import 'package:ualet/presentation/profiling/widgets/profiling_progress_indicator.dart';
import 'package:ualet/presentation/profiling/widgets/sarlaft_form_question.dart';
import 'package:ualet/presentation/profiling/widgets/slider_question.dart';
import 'package:ualet/presentation/profiling/widgets/unique_check_question.dart';
import 'package:ualet/router/router.gr.dart';

class ProfilingPage extends HookWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<ProfilingWatcherBloc>(
            create: (context) => getIt<ProfilingWatcherBloc>()
              ..add(ProfilingWatcherEvent.getProfilingItems()),
          ),
          BlocProvider<ProfilingFormBloc>(
            create: (context) => getIt<ProfilingFormBloc>(),
          ),
        ],
        child: this,
      );

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ProfilingFormBloc, ProfilingFormState>(
          listener: (context, state) {
            state.postFailureOrSuccessOption.fold(
                () {},
                (either) => either.fold(
                    (failure) => ToastHelper.createError(
                            message: failure.map(
                                unexpected: (_) => 'Unexpected',
                                fromServer: (failure) => failure.message))
                        .show(context),
                    (result) => ExtendedNavigator.rootNavigator
                        .pushReplacementNamed(Routes.profilingSuccessPage,
                            arguments: ProfilingSuccessPageArguments(
                                result: result))));
          },
        )
      ],
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: ProfilingBody(),
      ),
    );
  }
}

class ProfilingBody extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    Widget _buildQuestion(ProfilingItem currentItem) {
      var question;
      switch (currentItem.type) {
        case '1':
          question = SliderQuestion(
            profilingItem: currentItem,
            type: SliderQuestion.MONEY,
            key: Key(currentItem.type + currentItem.id),
          );
          break;
        case '2':
          question = SliderQuestion(
            profilingItem: currentItem,
            type: SliderQuestion.PERCENT,
            key: Key(currentItem.type + currentItem.id),
          );
          break;
        case '3':
          question = UniqueCheckQuestion(
            profilingItem: currentItem,
            type: UniqueCheckQuestion.WRAP,
            key: Key(currentItem.type + currentItem.id),
          );
          break;
        case '4':
          question = UniqueCheckQuestion(
            profilingItem: currentItem,
            type: UniqueCheckQuestion.LIST,
            key: Key(currentItem.type + currentItem.id),
          );
          break;
        case '5':
          question = UniqueCheckQuestion(
            profilingItem: currentItem,
            type: UniqueCheckQuestion.LIST_FORM,
            key: Key(currentItem.type + currentItem.id),
          );
          break;
        case '6':
          question = MultiCheckQuestion(
            profilingItem: currentItem,
            type: MultiCheckQuestion.LIST_CHECK,
            key: Key(currentItem.type + currentItem.id),
          );
          break;
        case '7':
          question = SarlaftFormQuestion(
            profilingItem: currentItem,
            type: SarlaftFormQuestion.MONEY,
            key: Key(currentItem.type + currentItem.id),
          );
          break;
      }
      return question;
    }

    return BlocBuilder<ProfilingWatcherBloc, ProfilingWatcherState>(
      builder: (context, state) {
        return state.maybeMap(
            initial: (_) => Container(),
            loadInProgress: (_) => Stack(
                  children: <Widget>[
                    Container(
                      color: AppColors.primaryColor,
                    ),
                    LoadingInProgressOverlay(isLoading: true),
                  ],
                ),
            loadSuccess: (state) {
              return BlocBuilder<ProfilingFormBloc, ProfilingFormState>(
                builder: (context, formState) {
                  context
                      .bloc<ProfilingFormBloc>()
                      .add(ProfilingFormEvent.setItems(state.profilingItems));
                  final currentItem = state.profilingItems.get(formState.index);
                  return SafeArea(
                    child: Stack(
                      fit: StackFit.expand,
                      alignment: Alignment.topCenter,
                      children: <Widget>[
                        Scaffold(
                          body: Column(
                            children: <Widget>[
                              Expanded(
                                child: ListView(
                                  shrinkWrap: true,
                                  controller: _scrollController,
                                  padding: EdgeInsets.only(
                                      left: AppDimens.layoutMargin,
                                      right: AppDimens.layoutMargin,
                                      top: AppDimens.layoutMarginM),
                                  children: <Widget>[
                                    Visibility(
                                      visible: formState.index != 0,
                                      child: Container(
                                        width: double.infinity,
                                        alignment: Alignment.topLeft,
                                        child: Column(
                                          children: <Widget>[
                                            GestureDetector(
                                                child: Icon(
                                                  Icons.arrow_back_ios,
                                                  color: AppColors.primaryColor,
                                                  size: AppDimens
                                                      .buttonBack.height,
                                                ),
                                                onTap: () {
                                                  _scrollController.animateTo(0,
                                                      duration: Duration(
                                                          milliseconds: 200),
                                                      curve: Curves.decelerate);
                                                  context
                                                      .bloc<ProfilingFormBloc>()
                                                      .add(ProfilingFormEvent
                                                          .previousQuestion());
                                                }),
                                            const SizedBox(
                                                height:
                                                    AppDimens.layoutSpacerS),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Text(currentItem.title,
                                        style: AppTextStyles.title2.copyWith(
                                            color: AppColors.g25Color)),
                                    Visibility(
                                      visible: currentItem.type != '7',
                                      child: const SizedBox(
                                          height: AppDimens.layoutSpacerL),
                                    ),
                                    Text(currentItem.description,
                                        style: AppTextStyles.subtitle4.copyWith(
                                            color: AppColors.g50Color,
                                            fontSize:
                                                AppDimens.subtitleTextSize)),
                                    const SizedBox(
                                        height: AppDimens.layoutSpacerXs),
                                    Visibility(
                                      visible: currentItem.type == '1' ||
                                          currentItem.type == '2',
                                      child: const SizedBox(
                                          height: AppDimens.layoutSpacerX),
                                    ),
                                    IndexedStack(
                                      index: formState.index,
                                      children: state.profilingItems
                                          .asList()
                                          .map((element) =>
                                              _buildQuestion(element))
                                          .toList(),
                                    ),
                                  ],
                                ),
                              ),
                              ProfilingProgressIndicatorWidget(
                                state.profilingItems.size,
                                scrollController: _scrollController,
                              ),
                            ],
                          ),
                        ),
                        LoadingInProgressOverlay(
                            isLoading: formState.isSubmitting)
                      ],
                    ),
                  );
                },
              );
            },
            loadFailure: (state) {
              return Container();
            },
            orElse: () => Container());
      },
    );
  }
}

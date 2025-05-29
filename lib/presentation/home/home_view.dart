import 'package:chat_bot/core/base/base_states.dart';
import 'package:chat_bot/core/di/di.dart';
import 'package:chat_bot/core/extentions/number_ext.dart';
import 'package:chat_bot/core/l10n/translations/app_localizations.dart';
import 'package:chat_bot/core/providers/app_config_provider.dart';
import 'package:chat_bot/core/theme/app_colors.dart';
import 'package:chat_bot/data/models/subject.dart';
import 'package:chat_bot/presentation/home/view_model/home_states.dart';
import 'package:chat_bot/presentation/home/view_model/home_view_model.dart';
import 'package:chat_bot/presentation/home/widgets/home_drawer_widget.dart';
import 'package:chat_bot/presentation/home/widgets/message_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:lottie/lottie.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeViewModel viewModel = getIt<HomeViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Imagine.Ai"),
          actions: [
            IconButton(
                onPressed: () {
                  showSubjectDialog();
                },
                icon: const Icon(Icons.more_vert_rounded))
          ],
        ),
        drawer: const HomeDrawerWidget(),
        body: SafeArea(
          child: BlocBuilder<HomeViewModel, HomeStates>(
            builder: (context, state) {
              return Column(
                children: [
                  if (viewModel.chat == null ||
                      viewModel.chat?.subject == null ||
                      (viewModel.chat?.messages ?? []).isEmpty)
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset("assets/animations/bot.json"),
                          Text(
                            AppLocalizations.of(context)!.homeScreenMessage,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                    ),
                  if ((viewModel.chat?.messages ?? []).isNotEmpty)
                    Expanded(
                      child: ListView.separated(
                        reverse: false,
                        padding: const EdgeInsets.all(16),
                        itemBuilder: (_, index) => MessageWidget(
                          message: viewModel.chat!.messages![index],
                        ),
                        separatorBuilder: (context, index) => 8.spaceVertical,
                        itemCount: (viewModel.chat?.messages ?? []).length,
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextFormField(
                      controller: viewModel.messageController,
                      style: Theme.of(context).textTheme.titleSmall,
                      decoration: InputDecoration(
                        enabled: state.sendMessageState is! BaseLoadingState,
                        hintText: AppLocalizations.of(context)!.message,
                        filled: true,
                        fillColor: getIt<AppConfigProvider>().isDark()
                            ? AppColors.gray
                            : AppColors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            width: 1,
                            color: getIt<AppConfigProvider>().isDark()
                                ? AppColors.gray
                                : AppColors.blue,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            width: 1,
                            color: getIt<AppConfigProvider>().isDark()
                                ? AppColors.gray
                                : AppColors.blue,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            width: 1,
                            color: getIt<AppConfigProvider>().isDark()
                                ? AppColors.gray
                                : AppColors.blue,
                          ),
                        ),
                        suffixIcon: state.sendMessageState is BaseLoadingState
                            ? const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: SizedBox(
                                    width: 16,
                                    height: 16,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    )),
                              )
                            : GestureDetector(
                                onTap: () {
                                  viewModel.sendMessage();
                                },
                                child: const Icon(
                                  Iconsax.send_1_outline,
                                ),
                              ),
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void showSubjectDialog() async {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 16,
              children: Subject.subjects
                  .map(
                    (e) => FilledButton(
                      onPressed: () {
                        viewModel.changeSubject(e);
                        Navigator.pop(context);
                      },
                      child: Text(
                        getIt<AppLocalizations>().localeName == "ar"
                            ? e.nameAr
                            : e.nameEn,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}

import 'package:chat_bot/core/base/base_states.dart';
import 'package:chat_bot/core/di/di.dart';
import 'package:chat_bot/core/dialog/app_dialogs.dart';
import 'package:chat_bot/core/l10n/translations/app_localizations.dart';
import 'package:chat_bot/core/providers/app_config_provider.dart';
import 'package:chat_bot/data/datasource/history_datasource.dart';
import 'package:chat_bot/data/datasource/images_api_datasource.dart';
import 'package:chat_bot/data/models/chat.dart';
import 'package:chat_bot/data/models/message.dart';
import 'package:chat_bot/data/models/subject.dart';
import 'package:chat_bot/presentation/home/view_model/home_states.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModel extends Cubit<HomeStates> {
  ImagesApiDatasource imagesApiDatasource;
  HistoryDatasource historyDatasource;
  AppLocalizations locale;

  HomeViewModel(this.imagesApiDatasource, this.historyDatasource, this.locale)
      : super(HomeStates());

  Chat? chat;
  int messageCount = 0;
  TextEditingController messageController = TextEditingController();

  Future<void> sendMessage() async {
    if (chat == null || chat?.subject == null) {
      AppDialogs.showErrorToast(locale.youMustSelectSubject);
      return;
    }
    if (messageController.text.trim().isNotEmpty) {
      try {
        (chat?.messages ?? []).add(
          Message(
            id: messageCount++,
            message: messageController.text,
            isResponse: false,
            dateTime: DateTime.now().millisecondsSinceEpoch,
          ),
        );
        emit(state.copyWith(sendMessageState: const BaseLoadingState()));
        var imagesResponse = await imagesApiDatasource.createImage({
          "content": ((chat?.subject?.prompt ?? "") + messageController.text),
          "sizeId": "6361e03bc09cb851c66328a4",
          "templateId": "42c9a54f-8964-4f49-b741-f403d921f2ba"
        });
        await historyDatasource.uploadChat(chat!);
        await Future.delayed(const Duration(seconds: 30));
        var imageLink = await imagesApiDatasource.getImage(
            (imagesResponse.imageResponse?.taskId ?? ""),
            getIt<Dio>().options.headers["Authorization"] ?? "");
        (chat?.messages ?? []).add(
          Message(
            id: messageCount++,
            message: "",
            taskId: (imagesResponse.imageResponse?.taskId ?? ""),
            isResponse: true,
            imageLink: (imageLink.imageResponse?.resultUrl ?? ""),
            dateTime: DateTime.now().millisecondsSinceEpoch,
          ),
        );
        await historyDatasource.uploadChat(chat!);
        messageController.clear();
        emit(state.copyWith(sendMessageState: BaseSuccessState<Chat>(chat)));
      } catch (e) {
        emit(state.copyWith(sendMessageState: BaseFailState(e.toString())));
      }
    }
  }

  void changeSubject(Subject e) {
    if (chat == null) {
      chat = Chat(
          subject: e, uid: getIt<AppConfigProvider>().user?.uid, messages: []);
    } else {
      chat?.subject = e;
    }
  }
}

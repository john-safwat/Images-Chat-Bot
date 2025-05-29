import 'package:chat_bot/core/l10n/translations/app_localizations.dart';
import 'package:chat_bot/core/theme/app_colors.dart';
import 'package:chat_bot/data/models/message.dart';
import 'package:flutter/material.dart';
import 'package:widget_zoom/widget_zoom.dart';

class MessageWidget extends StatefulWidget {
  final Message message;

  const MessageWidget({required this.message, super.key});

  @override
  State<MessageWidget> createState() => _MessageWidgetState();
}

class _MessageWidgetState extends State<MessageWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: widget.message.isResponse == true
          ? MainAxisAlignment.start
          : MainAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(16),
              topRight: const Radius.circular(16),
              bottomLeft: Radius.circular(
                  AppLocalizations.of(context)!.localeName == "ar"
                      ? widget.message.isResponse == true
                          ? 16
                          : 0
                      : widget.message.isResponse == true
                          ? 0
                          : 16),
              bottomRight: Radius.circular(
                AppLocalizations.of(context)!.localeName == "ar"
                    ? widget.message.isResponse == true
                        ? 0
                        : 16
                    : widget.message.isResponse == true
                        ? 16
                        : 0,
              ),
            ),
            color: (widget.message.isResponse == true)
                ? AppColors.gray
                : AppColors.darkGray,
          ),
          child: widget.message.isResponse == true
              ? ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: WidgetZoom(
                  heroAnimationTag: 'tag',
                  zoomWidget: Image.network(
                    widget.message.imageLink ?? "",
                  ),
                ),
              )
              : Text(
                  widget.message.message ?? "",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
        ),
      ],
    );
  }
}

import 'package:animate_do/animate_do.dart';
import 'package:chat_bot/core/extentions/number_ext.dart';
import 'package:chat_bot/core/l10n/translations/app_localizations.dart';
import 'package:flutter/material.dart';

class OptionSelectionWidget<T> extends StatelessWidget {
  final String title;
  final List<(String, T)> options;
  final T? groupValue;
  final Function(T) onOptionSelected;
  final Function() onDonePress;

  const OptionSelectionWidget({
    required this.options,
    required this.groupValue,
    required this.onOptionSelected,
    required this.onDonePress,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ZoomIn(
          child: SlideInUp(
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.22),
                      spreadRadius: 0,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(title , style: Theme.of(context).textTheme.titleLarge , textAlign: TextAlign.center,),
                  16.spaceVertical,
                  ...options.map(
                    (e) => ZoomIn(
                      key: UniqueKey(),
                      child: GestureDetector(
                        onTap: () {
                          onOptionSelected(e.$2);
                        },
                        child: Container(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          margin: const EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          child: Row(
                            children: [
                              8.spaceHorizontal,
                              Expanded(
                                child: Text(
                                  e.$1,
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                              ),
                              Radio<T>(
                                value: e.$2,
                                groupValue: groupValue,
                                onChanged: (value) {
                                  onOptionSelected(value!);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  ZoomIn(
                    key: UniqueKey(),
                    child: FilledButton(
                      onPressed: onDonePress,
                      child: Text(AppLocalizations.of(context)!.done),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

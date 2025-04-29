
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:chat_bot/core/providers/app_config_provider.dart';
import 'package:chat_bot/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<AppConfigProvider>(context);
    return AnimatedToggleSwitch.rolling(
      current: theme.getTheme(),
      values: const [ThemeMode.dark, ThemeMode.light],
      height: 40,
      style: ToggleStyle(
        indicatorColor: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(15),
        backgroundColor: Colors.transparent,
        borderColor: Theme.of(context).colorScheme.primary,
      ),
      spacing:10,
      iconBuilder:(value, foreground){
        var primaryColor = Theme.of(context).colorScheme.primary;
        var onPrimaryColor = Theme.of(context).colorScheme.onPrimary;

        if (value == ThemeMode.dark) {
          return Icon(EvaIcons.moon , color: theme.isDark()? onPrimaryColor : primaryColor);
        } else {
          return Icon(EvaIcons.sun , color: theme.isDark()? primaryColor : onPrimaryColor);
        }
      },
      onChanged: (p0) => theme.changeTheme(theme.isDark()? ThemeMode.light : ThemeMode.dark),
      borderWidth: 1,

    );
  }
}

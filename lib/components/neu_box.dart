import 'package:flutter/material.dart';
import 'package:musica/pages/theme/themeProvider.dart';
import 'package:provider/provider.dart';

class NeuBox extends StatelessWidget {
  final Widget? child;
  const NeuBox({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    //is dark mode
    bool isDarkMode = Provider.of<Themeprovider>(context).isDarkMode;

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.surface,
          boxShadow: [
            // darker shadow on top right
            BoxShadow(
              color: isDarkMode ? Colors.black : Colors.grey.shade500,
              blurRadius: 15,
              offset: Offset(4, 4),
            ),
            // darker shadow on top left
            BoxShadow(
              color: isDarkMode ? Colors.grey.shade800 : Colors.white,
              blurRadius: 15,
              offset: Offset(-4, -4),
            ),
          ]),
      padding: EdgeInsets.all(12),
      child: child,
    );
  }
}

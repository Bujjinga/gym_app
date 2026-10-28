import 'package:flutter/material.dart';

import '../tokens/tokens.dart';

/// Section title with an optional trailing action ("See all").
class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.title, this.actionLabel, this.onAction});

  final String title;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: PulseMetrics.space24, bottom: PulseMetrics.space8),
      child: Row(
        children: [
          Expanded(
            child: Semantics(
              header: true,
              child: Text(title, style: Theme.of(context).textTheme.titleLarge),
            ),
          ),
          if (actionLabel != null && onAction != null)
            // Flexible so large text sizes ellipsize instead of overflowing;
            // Align keeps the button at the right edge of its share.
            Flexible(
              child: Align(
                alignment: AlignmentDirectional.centerEnd,
                child: TextButton(
                  onPressed: onAction,
                  style: TextButton.styleFrom(foregroundColor: context.colors.accentText),
                  child: Text(actionLabel!, overflow: TextOverflow.ellipsis),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

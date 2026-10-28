import 'package:flutter/material.dart';

import '../tokens/tokens.dart';

/// Shows [builder] as a bottom sheet on narrow screens and as a centered
/// dialog on tablets/desktop. Returns the value passed to `Navigator.pop`.
Future<T?> showAdaptiveSheet<T>({
  required BuildContext context,
  required String title,
  required WidgetBuilder builder,
}) {
  final wide = MediaQuery.sizeOf(context).width >= PulseMetrics.compactMax;
  final text = Theme.of(context).textTheme;
  Widget content(BuildContext ctx, {required bool dialog}) => Padding(
        padding: EdgeInsets.fromLTRB(
          PulseMetrics.space24,
          dialog ? PulseMetrics.space24 : 0,
          PulseMetrics.space24,
          PulseMetrics.space24 + MediaQuery.viewInsetsOf(ctx).bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(child: Semantics(header: true, child: Text(title, style: text.titleLarge))),
                if (dialog)
                  IconButton(
                    tooltip: MaterialLocalizations.of(ctx).closeButtonTooltip,
                    icon: const Icon(Icons.close_rounded),
                    onPressed: () => Navigator.of(ctx).pop(),
                  ),
              ],
            ),
            const SizedBox(height: PulseMetrics.space16),
            Flexible(child: SingleChildScrollView(child: builder(ctx))),
          ],
        ),
      );

  if (wide) {
    return showDialog<T>(
      context: context,
      builder: (ctx) => Dialog(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 520),
          child: content(ctx, dialog: true),
        ),
      ),
    );
  }
  return showModalBottomSheet<T>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (ctx) => content(ctx, dialog: false),
  );
}

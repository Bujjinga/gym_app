import 'package:flutter/material.dart';

import '../tokens/tokens.dart';

/// Standard top-level page: large collapsing title, then either a list of
/// [children] or a single [fill] widget (e.g. an EmptyState) centered in the
/// remaining space. Content width is capped for wide desktop windows.
class TabPage extends StatelessWidget {
  const TabPage({super.key, required this.title, this.children = const [], this.fill, this.actions});

  final String title;
  final List<Widget> children;
  final Widget? fill;
  final List<Widget>? actions;

  static const maxContentWidth = 1200.0;

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;
    return CustomScrollView(
      slivers: [
        SliverAppBar.large(title: Text(title), actions: actions, backgroundColor: Colors.transparent),
        if (fill != null)
          SliverFillRemaining(hasScrollBody: false, child: fill)
        else
          SliverPadding(
            padding: EdgeInsets.fromLTRB(PulseMetrics.space16, 0, PulseMetrics.space16, PulseMetrics.space32 + bottom),
            sliver: SliverToBoxAdapter(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: maxContentWidth),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: children),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

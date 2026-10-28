import 'package:flutter/material.dart';

import '../core/design_system/design_system.dart';
import '../l10n/gen/app_localizations.dart';

/// Desktop sidebar (> 1100px). Collapses to an icon rail; hover highlights
/// and tooltips for mouse users, full keyboard focus support.
class PulseSidebar extends StatefulWidget {
  const PulseSidebar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onSelected,
    required this.actionLabel,
    required this.actionIcon,
    required this.onAction,
  });

  final List<PulseNavItem> items;
  final int currentIndex;
  final ValueChanged<int> onSelected;

  /// Primary action button ("Log workout" on desktop).
  final String actionLabel;
  final IconData actionIcon;
  final VoidCallback onAction;

  @override
  State<PulseSidebar> createState() => _PulseSidebarState();
}

class _PulseSidebarState extends State<PulseSidebar> {
  // shortcut: collapse state is per-session; window/state persistence comes in Phase 9.
  bool _collapsed = false;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final l10n = AppLocalizations.of(context);
    final text = Theme.of(context).textTheme;
    return AnimatedContainer(
      duration: context.motion.medium,
      curve: MotionPreset.smooth.curve,
      width: _collapsed ? 88 : 248,
      decoration: BoxDecoration(
        color: c.surface,
        border: Border(right: BorderSide(color: c.glassBorder)),
      ),
      child: ClipRect(
        child: SafeArea(
          right: false,
          child: Padding(
            padding: const EdgeInsets.all(PulseMetrics.space16),
            child: Column(
              crossAxisAlignment: _collapsed ? CrossAxisAlignment.center : CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 40,
                  child: Align(
                    alignment: _collapsed ? Alignment.center : Alignment.centerLeft,
                    child: ShaderMask(
                      shaderCallback: (r) => c.accentGradient.createShader(r),
                      child: Text(
                        _collapsed ? 'P' : l10n.appTitle,
                        style: PulseTypography.number(fontSize: 26, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: PulseMetrics.space24),
                StartWorkoutButton(
                  label: widget.actionLabel,
                  icon: widget.actionIcon,
                  onPressed: widget.onAction,
                  compact: _collapsed,
                ),
                const SizedBox(height: PulseMetrics.space24),
                for (var i = 0; i < widget.items.length; i++)
                  _SidebarItem(
                    item: widget.items[i],
                    selected: i == widget.currentIndex,
                    collapsed: _collapsed,
                    onTap: () => widget.onSelected(i),
                  ),
                const Spacer(),
                Align(
                  alignment: _collapsed ? Alignment.center : Alignment.centerRight,
                  child: IconButton(
                    tooltip: _collapsed ? l10n.expandSidebar : l10n.collapseSidebar,
                    onPressed: () => setState(() => _collapsed = !_collapsed),
                    icon: Icon(
                      _collapsed ? Icons.keyboard_double_arrow_right_rounded : Icons.keyboard_double_arrow_left_rounded,
                      color: c.textSecondary,
                    ),
                  ),
                ),
                if (!_collapsed) Text('⌘/Ctrl + 1–5', style: text.labelSmall, textAlign: TextAlign.right),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SidebarItem extends StatefulWidget {
  const _SidebarItem({required this.item, required this.selected, required this.collapsed, required this.onTap});

  final PulseNavItem item;
  final bool selected;
  final bool collapsed;
  final VoidCallback onTap;

  @override
  State<_SidebarItem> createState() => _SidebarItemState();
}

class _SidebarItemState extends State<_SidebarItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final text = Theme.of(context).textTheme;
    final selected = widget.selected;
    final bg = selected
        ? c.accentStart.withValues(alpha: 0.14)
        : _hovered
            ? c.glassFill
            : Colors.transparent;
    final tile = AnimatedContainer(
      duration: context.motion.fast,
      height: 48,
      margin: const EdgeInsets.only(bottom: PulseMetrics.space4),
      padding: EdgeInsets.symmetric(horizontal: widget.collapsed ? 0 : PulseMetrics.space12),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(context.metrics.radiusMd)),
      child: Row(
        mainAxisAlignment: widget.collapsed ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          Icon(selected ? widget.item.selectedIcon : widget.item.icon,
              color: selected ? c.accentText : c.textSecondary),
          if (!widget.collapsed) ...[
            const SizedBox(width: PulseMetrics.space12),
            Flexible(
              child: Text(
                widget.item.label,
                softWrap: false,
                overflow: TextOverflow.fade,
                style: text.titleSmall?.copyWith(color: selected ? c.textPrimary : c.textSecondary),
              ),
            ),
          ],
        ],
      ),
    );
    return Semantics(
      selected: selected,
      button: true,
      label: widget.item.label,
      excludeSemantics: true,
      child: Tooltip(
        message: widget.collapsed ? widget.item.label : '',
        child: MouseRegion(
          onEnter: (_) => setState(() => _hovered = true),
          onExit: (_) => setState(() => _hovered = false),
          child: InkWell(
            borderRadius: BorderRadius.circular(context.metrics.radiusMd),
            onTap: widget.onTap,
            child: tile,
          ),
        ),
      ),
    );
  }
}

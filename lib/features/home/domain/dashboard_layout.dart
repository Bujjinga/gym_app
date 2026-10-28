/// Cards available on the Home dashboard.
enum DashboardCard { rings, recovery, stats, planned, weekly, streak, records }

/// Order and visibility of dashboard cards, stored on the profile as a list
/// of names where hidden cards are prefixed with `!`.
class DashboardLayout {
  const DashboardLayout(this.order, this.hidden);

  /// Unknown names are dropped; cards missing from storage (added in a later
  /// app version) are appended as visible.
  factory DashboardLayout.fromStored(List<String> stored) {
    final byName = DashboardCard.values.asNameMap();
    final order = <DashboardCard>[];
    final hidden = <DashboardCard>{};
    for (final raw in stored) {
      final isHidden = raw.startsWith('!');
      final card = byName[isHidden ? raw.substring(1) : raw];
      if (card == null || order.contains(card)) continue;
      order.add(card);
      if (isHidden) hidden.add(card);
    }
    order.addAll(DashboardCard.values.where((c) => !order.contains(c)));
    return DashboardLayout(order, hidden);
  }

  final List<DashboardCard> order;
  final Set<DashboardCard> hidden;

  List<DashboardCard> get visible => order.where((c) => !hidden.contains(c)).toList();

  List<String> toStored() => [for (final c in order) hidden.contains(c) ? '!${c.name}' : c.name];

  /// [newIndex] is the final position (already adjusted for the removal).
  DashboardLayout move(int oldIndex, int newIndex) {
    final next = [...order];
    next.insert(newIndex, next.removeAt(oldIndex));
    return DashboardLayout(next, hidden);
  }

  DashboardLayout toggle(DashboardCard card) =>
      DashboardLayout(order, hidden.contains(card) ? ({...hidden}..remove(card)) : {...hidden, card});
}

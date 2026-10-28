// PULSE widget extension: the home screen widget and the workout Live Activity.
// Add this file to a "Widget Extension" target named PulseWidgets (README,
// "Home widgets & Live Activity"). Data comes from the Flutter app through the
// shared App Group: home_widget writes the home keys, live_activities writes
// the activity keys (prefixed with the activity id).

import ActivityKit
import SwiftUI
import WidgetKit

private let appGroup = "group.com.example.gymApp.pulse"
private let shared = UserDefaults(suiteName: appGroup)!

private let moveColor = Color(red: 1.0, green: 0.18, blue: 0.33)
private let exerciseColor = Color(red: 0.65, green: 1.0, blue: 0.0)
private let stepsColor = Color(red: 0.0, green: 0.85, blue: 1.0)

@main
struct PulseWidgetsBundle: WidgetBundle {
  var body: some Widget {
    PulseWidget()
    if #available(iOS 16.1, *) {
      WorkoutLiveActivity()
    }
  }
}

// MARK: - Home screen widget

struct PulseEntry: TimelineEntry {
  let date: Date
  let steps, stepsGoal, move, moveGoal, exercise, exerciseGoal, streak: Int
  let nextWorkout, nextLabel: String

  static func load() -> PulseEntry {
    func int(_ key: String, _ fallback: Int) -> Int { shared.object(forKey: key) as? Int ?? fallback }
    return PulseEntry(
      date: Date(),
      steps: int("steps", 0), stepsGoal: int("steps_goal", 10000),
      move: int("move_kcal", 0), moveGoal: int("move_goal", 500),
      exercise: int("exercise_min", 0), exerciseGoal: int("exercise_goal", 30),
      streak: int("streak", 0),
      nextWorkout: shared.string(forKey: "next_workout") ?? "",
      nextLabel: shared.string(forKey: "next_label") ?? "")
  }
}

struct PulseProvider: TimelineProvider {
  func placeholder(in context: Context) -> PulseEntry { .load() }
  func getSnapshot(in context: Context, completion: @escaping (PulseEntry) -> Void) { completion(.load()) }
  func getTimeline(in context: Context, completion: @escaping (Timeline<PulseEntry>) -> Void) {
    // The app reloads the widget whenever data changes; this is a fallback.
    completion(Timeline(entries: [.load()], policy: .after(Date().addingTimeInterval(30 * 60))))
  }
}

private func fraction(_ value: Int, _ goal: Int) -> Double { goal <= 0 ? 0 : min(Double(value) / Double(goal), 1) }

struct Ring: View {
  let progress: Double
  let color: Color
  let width: CGFloat
  var body: some View {
    ZStack {
      Circle().stroke(color.opacity(0.2), lineWidth: width)
      Circle().trim(from: 0, to: progress)
        .stroke(color, style: StrokeStyle(lineWidth: width, lineCap: .round))
        .rotationEffect(.degrees(-90))
    }
  }
}

struct PulseWidgetView: View {
  let entry: PulseEntry
  @Environment(\.widgetFamily) var family

  var rings: some View {
    ZStack {
      Ring(progress: fraction(entry.move, entry.moveGoal), color: moveColor, width: 9)
      Ring(progress: fraction(entry.exercise, entry.exerciseGoal), color: exerciseColor, width: 9).padding(11)
      Ring(progress: fraction(entry.steps, entry.stepsGoal), color: stepsColor, width: 9).padding(22)
    }
  }

  var body: some View {
    Group {
      if family == .systemSmall {
        VStack(spacing: 6) {
          rings.frame(width: 96, height: 96)
          Text("\(entry.steps.formatted()) steps").font(.caption.bold())
        }
      } else {
        HStack(spacing: 16) {
          rings.frame(width: 112, height: 112)
          VStack(alignment: .leading, spacing: 4) {
            Text("\(entry.move) kcal").foregroundStyle(moveColor)
            Text("\(entry.exercise) min").foregroundStyle(exerciseColor)
            Text("\(entry.steps.formatted()) steps").foregroundStyle(stepsColor)
            Text("🔥 \(entry.streak)").padding(.top, 2)
            if !entry.nextWorkout.isEmpty {
              Text(entry.nextLabel).font(.caption2).foregroundStyle(.secondary)
              Text(entry.nextWorkout).font(.caption.bold()).lineLimit(1)
            }
          }
          .font(.caption.bold())
          Spacer(minLength: 0)
        }
      }
    }
    .containerBackground(for: .widget) { Color(red: 0.04, green: 0.04, blue: 0.06) }
  }
}

struct PulseWidget: Widget {
  var body: some WidgetConfiguration {
    // "PulseWidget" must match iOSName in home_widget_sync.dart.
    StaticConfiguration(kind: "PulseWidget", provider: PulseProvider()) { PulseWidgetView(entry: $0) }
      .configurationDisplayName("PULSE")
      .description("Activity rings, streak and your next workout.")
      .supportedFamilies([.systemSmall, .systemMedium])
  }
}

// MARK: - Live Activity (lock screen + Dynamic Island)

/// Name and shape required by the live_activities plugin.
struct LiveActivitiesAppAttributes: ActivityAttributes, Identifiable {
  public typealias LiveDeliveryData = ContentState
  public struct ContentState: Codable, Hashable {}
  var id = UUID()
}

extension LiveActivitiesAppAttributes {
  func prefixedKey(_ key: String) -> String { "\(id)_\(key)" }
}

@available(iOS 16.1, *)
struct WorkoutState {
  let name, exercise: String
  let done, total: Int
  let startedAt: Date
  let restEndsAt: Date?

  init(_ attributes: LiveActivitiesAppAttributes) {
    func date(_ key: String) -> Date? {
      let ms = shared.double(forKey: attributes.prefixedKey(key))
      return ms > 0 ? Date(timeIntervalSince1970: ms / 1000) : nil
    }
    name = shared.string(forKey: attributes.prefixedKey("name")) ?? "Workout"
    exercise = shared.string(forKey: attributes.prefixedKey("exercise")) ?? ""
    done = shared.integer(forKey: attributes.prefixedKey("done"))
    total = shared.integer(forKey: attributes.prefixedKey("total"))
    startedAt = date("startedAt") ?? Date()
    restEndsAt = date("restEndsAt").flatMap { $0 > Date() ? $0 : nil }
  }

  /// Rest countdown while resting, otherwise elapsed workout time.
  var timer: some View {
    Group {
      if let rest = restEndsAt {
        Text(timerInterval: Date()...rest, countsDown: true)
      } else {
        Text(startedAt, style: .timer)
      }
    }
    .monospacedDigit()
  }
}

@available(iOS 16.1, *)
struct WorkoutLiveActivity: Widget {
  var body: some WidgetConfiguration {
    ActivityConfiguration(for: LiveActivitiesAppAttributes.self) { context in
      let s = WorkoutState(context.attributes)
      HStack {
        VStack(alignment: .leading, spacing: 2) {
          Text(s.name).font(.headline)
          Text(s.restEndsAt != nil ? "Rest" : s.exercise).font(.subheadline).foregroundStyle(.secondary)
          Text("\(s.done)/\(s.total) sets").font(.caption)
        }
        Spacer()
        s.timer.font(.title.bold()).foregroundStyle(s.restEndsAt != nil ? stepsColor : exerciseColor)
          .frame(maxWidth: 120, alignment: .trailing)
      }
      .padding()
      .activityBackgroundTint(Color.black.opacity(0.85))
      .activitySystemActionForegroundColor(.white)
    } dynamicIsland: { context in
      let s = WorkoutState(context.attributes)
      return DynamicIsland {
        DynamicIslandExpandedRegion(.leading) {
          Text(s.name).font(.headline).lineLimit(1)
        }
        DynamicIslandExpandedRegion(.trailing) {
          s.timer.font(.title3.bold()).foregroundStyle(exerciseColor)
        }
        DynamicIslandExpandedRegion(.bottom) {
          Text("\(s.restEndsAt != nil ? "Rest" : s.exercise) · \(s.done)/\(s.total) sets")
            .font(.caption).foregroundStyle(.secondary)
        }
      } compactLeading: {
        Image(systemName: "dumbbell.fill").foregroundStyle(exerciseColor)
      } compactTrailing: {
        s.timer.frame(maxWidth: 52).font(.caption.bold())
      } minimal: {
        Image(systemName: "dumbbell.fill").foregroundStyle(exerciseColor)
      }
    }
  }
}

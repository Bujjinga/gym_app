package com.example.gym_app

import android.appwidget.AppWidgetManager
import android.content.Context
import android.content.SharedPreferences
import android.view.View
import android.widget.RemoteViews
import es.antonborri.home_widget.HomeWidgetLaunchIntent
import es.antonborri.home_widget.HomeWidgetProvider

/** Home screen widget: move / exercise / steps progress, streak and next workout.
 *  Values are written by lib/features/home/application/home_widget_sync.dart. */
class PulseWidgetProvider : HomeWidgetProvider() {
    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray,
        widgetData: SharedPreferences,
    ) {
        fun int(key: String, default: Int = 0) = widgetData.getInt(key, default)
        fun percent(value: Int, goal: Int) = if (goal <= 0) 0 else (value * 100 / goal).coerceIn(0, 100)

        val steps = int("steps")
        val move = int("move_kcal")
        val exercise = int("exercise_min")
        val streak = int("streak")
        val nextLabel = widgetData.getString("next_label", "") ?: ""

        appWidgetIds.forEach { id ->
            val views = RemoteViews(context.packageName, R.layout.pulse_widget).apply {
                setOnClickPendingIntent(R.id.widget_root, HomeWidgetLaunchIntent.getActivity(context, MainActivity::class.java))
                setProgressBar(R.id.move_bar, 100, percent(move, int("move_goal", 500)), false)
                setProgressBar(R.id.exercise_bar, 100, percent(exercise, int("exercise_goal", 30)), false)
                setProgressBar(R.id.steps_bar, 100, percent(steps, int("steps_goal", 10000)), false)
                setTextViewText(R.id.move_value, "$move kcal")
                setTextViewText(R.id.exercise_value, "$exercise min")
                setTextViewText(R.id.steps_value, "%,d steps".format(steps))
                setTextViewText(R.id.streak_value, "🔥 $streak")
                setViewVisibility(R.id.next_label, if (nextLabel.isEmpty()) View.GONE else View.VISIBLE)
                setTextViewText(R.id.next_label, nextLabel)
                setTextViewText(R.id.next_workout, widgetData.getString("next_workout", "") ?: "")
            }
            appWidgetManager.updateAppWidget(id, views)
        }
    }
}

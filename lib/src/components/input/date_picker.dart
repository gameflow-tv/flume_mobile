import 'package:flume/flume.dart';
import 'package:flume/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';

extension Date on DateTime {
  int get daysInMonth {
    return (month < 12)
        ? DateTime(year, month + 1, 0).day
        : DateTime(year + 1, 1, 0).day;
  }
}

class DatePicker extends StatefulWidget {
  const DatePicker({
    super.key,
    required this.date,
    this.onDateSelected,
    this.datesOfInterest,
    this.firstDayOfWeek,
  });

  /// The dates that should show indicators.
  final List<DateTime>? datesOfInterest;

  /// The currently selected date.
  final DateTime date;

  /// Called when a date is selected.
  final ValueChanged<DateTime>? onDateSelected;

  /// The first day of the week. Defaults to the first day of the week for the
  /// locale provided by [MaterialLocalizations].
  final int? firstDayOfWeek;

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  late DateTime currentMonth;

  @override
  void initState() {
    super.initState();
    currentMonth = widget.date;
  }

  void _setNextMonth() {
    setState(() {
      currentMonth = DateTime(
        currentMonth.year,
        currentMonth.month + 1,
        currentMonth.day,
      );
    });
  }

  void _setPreviousMonth() {
    setState(() {
      currentMonth = DateTime(
        currentMonth.year,
        currentMonth.month - 1,
        currentMonth.day,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final localizations = MaterialLocalizations.of(context);
    final startOfWeek = localizations.firstDayOfWeekIndex;

    // First, see how many dates we need to pad in the first week before the first of the month
    final firstDayOfMonth = DateTime(currentMonth.year, currentMonth.month, 1);
    final firstWeekdayOfMonth = firstDayOfMonth.weekday;
    final daysBefore = (firstWeekdayOfMonth - startOfWeek) % 7;

    // Then, see how many dates we need to pad at the end of the last week of the month
    final lastDayOfMonth =
        DateTime(currentMonth.year, currentMonth.month + 1, 0);
    final lastWeekdayOfMonth = lastDayOfMonth.weekday;
    final daysAfter = 7 - ((lastWeekdayOfMonth - startOfWeek) % 7) - 1;

    return SizedBox(
      height: 420, // Fixed height to prevent the calendar clipping
      child: Column(
        children: [
          _Header(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            leading: GestureDetector(
              onTap: _setPreviousMonth,
              child: const Icon(
                FlumeIcons.arrow_left,
              ),
            ),
            title: Text(
              DateFormat('MMMM yyyy').format(currentMonth),
            ),
            trailing: GestureDetector(
              onTap: _setNextMonth,
              child: const Icon(
                FlumeIcons.arrow_right,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(context.theme.spacing.md),
              child: Column(
                children: [
                  Row(
                    children: _generateWeekdays(
                      context,
                      localizations,
                    )
                        .map((w) => Expanded(child: w))
                        .spaced(context.theme.spacing.xs),
                  ),
                  Flexible(
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:
                          currentMonth.daysInMonth + daysBefore + daysAfter,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 7,
                        crossAxisSpacing: context.theme.spacing.xs,
                        mainAxisSpacing: context.theme.spacing.xs,
                      ),
                      itemBuilder: (context, i) {
                        // Don't show any dates from the previous or next month
                        if (i < daysBefore ||
                            i >= currentMonth.daysInMonth + daysBefore) {
                          return const SizedBox();
                        }

                        final day = i - daysBefore + 1;

                        final selected = widget.date.year == widget.date.year &&
                            widget.date.month == currentMonth.month &&
                            widget.date.day == day;

                        final isDateOfInterest = widget.datesOfInterest == null
                            ? false
                            : widget.datesOfInterest!
                                .where((d) =>
                                    d.year == currentMonth.year &&
                                    d.month == currentMonth.month &&
                                    d.day == day)
                                .isNotEmpty;

                        return AnimationConfiguration.staggeredGrid(
                          position: i,
                          duration: context.theme.motion.short,
                          columnCount: 7,
                          child: ScaleAnimation(
                            child: FadeInAnimation(
                              child: GestureDetector(
                                onTap: () {
                                  widget.onDateSelected?.call(
                                    DateTime(currentMonth.year,
                                        currentMonth.month, day),
                                  );
                                },
                                child: Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    AnimatedContainer(
                                      duration: context.theme.motion.short,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          context.theme.shapes.sm,
                                        ),
                                        color: selected
                                            ? context.ambiance.palette.light
                                            : null,
                                      ),
                                      child: AnimatedDefaultTextStyle(
                                        duration: context.theme.motion.short,
                                        style: context.theme.typography.header4
                                            .copyWith(
                                          color: selected
                                              ? context.ambiance.palette.dark
                                              : context.ambiance.palette.light,
                                        ),
                                        child: Center(
                                          child: Text(
                                            day.toString(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    if (isDateOfInterest) ...{
                                      Icon(
                                        FlumeIcons.circle,
                                        size: 12,
                                        color: selected
                                            ? context.ambiance.palette.dark
                                            : context.ambiance.palette.light,
                                      ),
                                    },
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // Generate dates for the current month and split them into rows of weeks. Don't include weeks that don't have any days in the current month, and don't show any dates from the previous or next month
                ].spaced(context.theme.spacing.xs),
              ),
            ),
          ),
        ].divided(1, context.theme.colors.highlight10),
      ),
    );
  }
}

/// Builds widgets showing abbreviated days of week. The first widget in the
/// returned list corresponds to the first day of week for the current locale.
List<Widget> _generateWeekdays(
    BuildContext context, MaterialLocalizations localizations) {
  final List<Widget> result = <Widget>[];
  // Get weekdays in the format of "mo", "tu" etc

  final weekdays = DateFormat.EEEE()
      .dateSymbols
      .STANDALONESHORTWEEKDAYS
      .map((d) => d.substring(0, 2))
      .toList();

  final firstDayOfWeek = localizations.firstDayOfWeekIndex;

  assert(firstDayOfWeek >= 0 && firstDayOfWeek <= 6,
      'firstDayOfWeek must between 0 and 6');

  for (int i = firstDayOfWeek; true; i = (i + 1) % 7) {
    final String weekday = weekdays[i];
    result.add(ExcludeSemantics(
      child: Center(
        child: Text(
          weekday,
          style: context.theme.typography.label1.copyWith(
            color: context.theme.colors.subtitle,
          ),
        ),
      ),
    ));
    if (i == (firstDayOfWeek - 1) % 7) break;
  }

  return result;
}

class _Header extends StatelessWidget {
  const _Header({
    // ignore: unused_element
    super.key,
    required this.title,
    this.leading,
    this.trailing,
    this.mainAxisAlignment = MainAxisAlignment.center,
  });

  final Widget title;
  final Widget? leading;
  final Widget? trailing;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.theme.spacing.md,
        vertical: context.theme.spacing.sm,
      ),
      child: DefaultTextStyle(
        style: context.theme.typography.header5.copyWith(
          color: context.theme.colors.body,
        ),
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          children: [
            if (leading != null) leading!,
            DefaultTextStyle(
              style: context.theme.typography.header5,
              child: title,
            ),
            if (trailing != null) trailing!,
          ].spaced(context.theme.spacing.xs),
        ),
      ),
    );
  }
}

import 'package:flume/flume.dart';
import 'package:flume/material.dart';
import 'package:flutter/services.dart';

/// {@category Components}
/// {@subCategory Bars}
/// A header or navigation bar from the Flume design system.
class TopBar<T> extends StatelessWidget implements PreferredSizeWidget {
  TopBar({
    super.key,
    this.title,
    this.actions,
    this.leading,
    this.bottom,
    this.centerTitle,
    this.automaticallyImplyLeading = true,
    this.usePlatformNavigation = false,
    this.result,
    this.backgroundColor,
    this.leadingLabel,
  }) : preferredSize = Size.fromHeight(
          bottom?.preferredSize.height ?? 0.0 + kToolbarHeight,
        );

  /// {@template flutter.widgets.AppBar.title}
  /// The primary widget displayed in the app bar.
  ///
  /// Typically a [Text] widget that contains a description of the current
  /// contents of the app.
  ///
  /// Becomes the middle component of the [NavigationToolBar] built by this widget.
  /// The [title]'s width is constrained to fit within the remaining space
  /// between the toolbar's [leading] and [actions] widgets. Its height is
  /// _not_ constrained. The [title] is vertically centered and clipped to fit
  /// within the toolbar, whose height is [toolbarHeight]. Typically this
  /// isn't noticeable because a simple [Text] [title] will fit within the
  /// toolbar by default. On the other hand, it is noticeable when a
  /// widget with an intrinsic height that is greater than [toolbarHeight]
  /// is used as the [title]. For example, when the height of an Image used
  /// as the [title] exceeds [toolbarHeight], it will be centered and
  /// clipped (top and bottom), which may be undesirable. In cases like this
  /// the height of the [title] widget can be constrained. For example:
  ///
  /// ```dart
  /// MaterialApp(
  ///   home: Scaffold(
  ///     appBar: AppBar(
  ///        title: SizedBox(
  ///        height: toolbarHeight,
  ///        child: child: Image.asset(logoAsset),
  ///      ),
  ///      toolbarHeight: toolbarHeight,
  ///   ),
  /// )
  /// ```
  /// {@endtemplate}
  final Widget? title;

  /// {@template flutter.widgets.AppBar.actions}
  /// Widgets to display in a row after the [title] widget.
  ///
  /// Typically these widgets are [IconButton]s representing common operations.
  /// For less common operations, consider using a [PopupMenuButton] as the
  /// last action.
  ///
  /// The [actions] become the trailing component of the [NavigationToolBar] built
  /// by this widget. The height of each action is constrained to be no bigger
  /// than the [toolbarHeight].  final List<Widget> actions;
  /// {@endtemplate}
  final List<Widget>? actions;

  /// {@template flutter.widgets.AppBar.leading}
  /// A widget to display before the [title].
  ///
  /// Typically the [leading] widget is an [Icon] or an [IconButton].
  ///
  /// Becomes the leading component of the [NavigationToolBar] built
  /// by this widget. The [leading] widget's width and height are constrained to
  /// be no bigger than [kToolbarHeight] and [toolbarHeight] respectively.
  ///
  /// If this is null and [automaticallyImplyLeading] is set to true, the
  /// [AppBar] will imply an appropriate widget. For example, if the [AppBar] is
  /// in a [Scaffold] that also has a [Drawer], the [Scaffold] will fill this
  /// widget with an [IconButton] that opens the drawer (using [Icons.menu]). If
  /// there's no [Drawer] and the parent [Navigator] can go back, the [AppBar]
  /// will use a [BackButton] that calls [Navigator.maybePop].
  ///
  /// The following code shows how the drawer button could be manually specified
  /// instead of relying on [automaticallyImplyLeading]:
  ///
  /// ```dart
  /// AppBar(
  ///   leading: Builder(
  ///     builder: (BuildContext context) {
  ///       return IconButton(
  ///         icon: const Icon(Icons.menu),
  ///         onPressed: () { ScaffoldMessenger.of(context).openDrawer(); },
  ///         tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
  ///       );
  ///     },
  ///   ),
  /// )
  /// ```
  ///
  /// The [Builder] is used in this example to ensure that the `context` refers
  /// to that part of the subtree. That way this code snippet can be used even
  /// inside the very code that is creating the [Scaffold] (in which case,
  /// without the [Builder], the `context` wouldn't be able to see the
  /// [Scaffold], since it would refer to an ancestor of that widget).
  /// {@endtemplate}
  final Widget? leading;

  /// {@template widgets}
  /// Controls whether we should try to imply the leading widget if null.
  ///
  /// If true and [leading] is null, automatically try to deduce what the leading
  /// widget should be. If false and [leading] is null, leading space is given to [title].
  /// If leading widget is not null, this parameter has no effect.
  /// {@endtemplate}
  final bool automaticallyImplyLeading;

  /// If true and [automaticallyImplyLeading] is true, the TopBar uses the
  /// underlying system's navigator instead of Flutter's navigator.
  final bool usePlatformNavigation;

  /// {@template flutter.widgets.AppBar.centerTitle}
  /// Whether the title should be centered.
  ///
  /// If this property is null, then [ThemeData.appBarTheme.centerTitle] is used,
  /// if that is also null, then value is adapted to the current [TargetPlatform].
  /// {@endtemplate}
  final bool? centerTitle;

  /// {@template flutter.widgets.AppBar.bottom}
  /// This widget appears across the bottom of the app bar.
  ///
  /// Typically a [TabBar]. Only widgets that implement [PreferredSizeWidget] can
  /// be used at the bottom of an app bar.
  ///
  /// See also:
  ///
  ///  * [PreferredSize], which can be used to give an arbitrary widget a preferred size.
  final PreferredSizeWidget? bottom;

  /// The value to pass through the navigator when the page containing this
  /// [TopBar] is popped of the navigation stack.
  final T? result;

  /// The color to use for the app bar's [Material].
  final Color? backgroundColor;

  /// The label to use for the app bar's leading back-button.
  final String? leadingLabel;

  @override
  Widget build(BuildContext context) {
    final theme = Flume.of(context);

    final style = getPlatformDefaultStyle(context).copyWith(
      color: theme.colors.header,
    );

    var icon = leading;

    if (icon == null) {
      if (automaticallyImplyLeading) {
        icon = GestureDetector(
          behavior: HitTestBehavior.opaque,
          child: Padding(
            padding: EdgeInsets.only(left: context.theme.spacing.xs),
            child: Row(
              children: [
                const Icon(FlumeIcons.chevron_left, size: 24.0),
                if (leadingLabel != null)
                  Text(
                    leadingLabel!,
                    style: context.theme.typography.header4
                        .copyWith(color: context.theme.colors.body),
                    overflow: TextOverflow.ellipsis,
                  ),
              ],
            ),
          ),
          onTap: () => usePlatformNavigation
              ? SystemNavigator.pop()
              : Navigator.of(context).pop(result),
        );
      }
    }

    return AppBar(
      backgroundColor: backgroundColor,
      leadingWidth: MediaQuery.of(context).size.width / 3,
      shape: Border(
        bottom: BorderSide(
          color: context.theme.colors.highlight10,
          width: 0.5,
        ),
      ),
      title: DefaultTextStyle(
        style: style,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 80),
          transitionBuilder: (child, animation) => FadeTransition(
            opacity: animation,
            child: child,
          ),
          child: title,
        ),
      ),
      actions: [
        if (actions?.isNotEmpty ?? false) ...{
          Padding(
            padding: EdgeInsets.symmetric(horizontal: theme.spacing.md),
            child: Row(children: actions!),
          ),
        },
      ],
      bottom: bottom,
      centerTitle: centerTitle,
      leading: icon,
      titleSpacing: icon == null ? theme.spacing.md : 0.0,
    );
  }

  @override
  final Size preferredSize;

  TextStyle getPlatformDefaultStyle(BuildContext context) {
    final theme = Flume.of(context);

    switch (Theme.of(context).platform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return theme.typography.header3;
      default:
        return theme.typography.header3;
    }
  }
}

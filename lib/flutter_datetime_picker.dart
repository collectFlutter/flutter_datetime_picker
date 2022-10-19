library flutter_datetime_picker;

import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/painting.dart';
import 'package:flutter_datetime_picker/src/datetime_picker_theme.dart';
import 'package:flutter_datetime_picker/src/date_model.dart';
import 'package:flutter_datetime_picker/src/i18n_model.dart';

export 'package:flutter_datetime_picker/src/datetime_picker_theme.dart';
export 'package:flutter_datetime_picker/src/date_model.dart';
export 'package:flutter_datetime_picker/src/i18n_model.dart';

typedef DateChangedCallback(DateTime time);
typedef DateCancelledCallback();
typedef String? StringAtIndexCallBack(int index);

class DatePicker {
  static Future<DateTime?> showDateHalfHourPicker(
    BuildContext context, {
    bool showTitleActions = true,
    DateTime? minTime,
    DateTime? maxTime,
    DateChangedCallback? onChanged,
    DateChangedCallback? onConfirm,
    DateCancelledCallback? onCancel,
    String? title,
    locale = LocaleType.zh,
    DateTime? currentTime,
    DatePickerTheme? theme,
  }) async {
    return await Navigator.of(context, rootNavigator: true)
        .push(_DatePickerRoute(
      showTitleActions: showTitleActions,
      onChanged: onChanged,
      onConfirm: onConfirm,
      onCancel: onCancel,
      locale: locale,
      theme: theme,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      // barrierColor: CupertinoDynamicColor.resolve(
      //     const CupertinoDynamicColor.withBrightness(
      //       color: Color(0x33000000),
      //       darkColor: Color(0x7A000000),
      //     ),
      //     context),
      pickerModel: DateHalfHourPickerModel(
          currentTime: currentTime,
          maxTime: maxTime,
          minTime: minTime,
          locale: locale),
      title: title ?? '',
    ));
  }


  static Future<DateTime> showDateHourPicker(
      BuildContext context, {
        bool showTitleActions = true,
        DateTime? minTime,
        DateTime? maxTime,
        DateChangedCallback? onChanged,
        DateChangedCallback? onConfirm,
        DateCancelledCallback? onCancel,
        String? title,
        locale = LocaleType.zh,
        DateTime? currentTime,
        DatePickerTheme? theme,
      }) async {
    return await Navigator.of(context, rootNavigator: true)
        .push(_DatePickerRoute(
      showTitleActions: showTitleActions,
      onChanged: onChanged,
      onConfirm: onConfirm,
      onCancel: onCancel,
      locale: locale,
      theme: theme,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      // barrierColor: CupertinoDynamicColor.resolve(
      //     const CupertinoDynamicColor.withBrightness(
      //       color: Color(0x33000000),
      //       darkColor: Color(0x7A000000),
      //     ),
      //     context),
      pickerModel: DateHourPickerModel(
          currentTime: currentTime,
          maxTime: maxTime,
          minTime: minTime,
          locale: locale),
      title: title ?? '',
    ));
  }

  static Future<DateTime> showDateAmPmPicker(
      BuildContext context, {
        bool showTitleActions = true,
        DateTime? minTime,
        DateTime? maxTime,
        bool isAm = true,
        DateChangedCallback? onChanged,
        DateChangedCallback? onConfirm,
        DateCancelledCallback? onCancel,
        String? title,
        locale = LocaleType.en,
        DateTime? currentTime,
        DatePickerTheme? theme,
      }) async {
    return await Navigator.of(context, rootNavigator: true).push(
        _DatePickerRoute(
            showTitleActions: showTitleActions,
            onChanged: onChanged,
            onConfirm: onConfirm,
            onCancel: onCancel,
            locale: locale,
            theme: theme,
            barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
            // barrierColor: CupertinoDynamicColor.resolve(
            //     const CupertinoDynamicColor.withBrightness(
            //       color: Color(0x33000000),
            //       darkColor: Color(0x7A000000),
            //     ),
            //     context),
            pickerModel: DateAmPmPickerModel(
                currentTime: currentTime,
                isAm: isAm,
                maxTime: maxTime,
                minTime: minTime,
                locale: locale),
            title: title ?? ''));
  }

  ///
  /// Display date picker bottom sheet.
  ///
  static Future<DateTime?> showDatePicker(
    BuildContext context, {
    bool showTitleActions: true,
    DateTime? minTime,
    DateTime? maxTime,
    DateChangedCallback? onChanged,
    DateChangedCallback? onConfirm,
    DateCancelledCallback? onCancel,
    locale: LocaleType.en,
    DateTime? currentTime,
    DatePickerTheme? theme,
    required String title,
  }) async {
    return await Navigator.push(
      context,
      _DatePickerRoute(
        showTitleActions: showTitleActions,
        onChanged: onChanged,
        onConfirm: onConfirm,
        onCancel: onCancel,
        locale: locale,
        theme: theme,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        pickerModel: DatePickerModel(
          currentTime: currentTime,
          maxTime: maxTime,
          minTime: minTime,
          locale: locale,
        ),
        title: title,
      ),
    );
  }

  ///
  /// Display time picker bottom sheet.
  ///
  static Future<DateTime?> showTimePicker(
    BuildContext context, {
    bool showTitleActions: true,
    bool showSecondsColumn: true,
    DateChangedCallback? onChanged,
    DateChangedCallback? onConfirm,
    DateCancelledCallback? onCancel,
    locale: LocaleType.en,
    DateTime? currentTime,
    DatePickerTheme? theme,
    required String title,
  }) async {
    return await Navigator.push(
      context,
      _DatePickerRoute(
        showTitleActions: showTitleActions,
        onChanged: onChanged,
        onConfirm: onConfirm,
        onCancel: onCancel,
        locale: locale,
        theme: theme,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        pickerModel: TimePickerModel(
          currentTime: currentTime,
          locale: locale,
          showSecondsColumn: showSecondsColumn,
        ),
        title: title,
      ),
    );
  }

  ///
  /// Display time picker bottom sheet with AM/PM.
  ///
  static Future<DateTime?> showTime12hPicker(
    BuildContext context, {
    bool showTitleActions: true,
    DateChangedCallback? onChanged,
    DateChangedCallback? onConfirm,
    DateCancelledCallback? onCancel,
    locale: LocaleType.en,
    DateTime? currentTime,
    DatePickerTheme? theme,
    required String title,
  }) async {
    return await Navigator.push(
      context,
      _DatePickerRoute(
        showTitleActions: showTitleActions,
        onChanged: onChanged,
        onConfirm: onConfirm,
        onCancel: onCancel,
        locale: locale,
        theme: theme,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        pickerModel: Time12hPickerModel(
          currentTime: currentTime,
          locale: locale,
        ),
        title: title,
      ),
    );
  }

  ///
  /// Display date&time picker bottom sheet.
  ///
  static Future<DateTime?> showDateTimePicker(
    BuildContext context, {
    bool showTitleActions: true,
    DateTime? minTime,
    DateTime? maxTime,
    DateChangedCallback? onChanged,
    DateChangedCallback? onConfirm,
    DateCancelledCallback? onCancel,
    locale: LocaleType.en,
    DateTime? currentTime,
    DatePickerTheme? theme,
    required String title,
  }) async {
    return await Navigator.push(
      context,
      _DatePickerRoute(
        showTitleActions: showTitleActions,
        onChanged: onChanged,
        onConfirm: onConfirm,
        onCancel: onCancel,
        locale: locale,
        theme: theme,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        pickerModel: DateTimePickerModel(
          currentTime: currentTime,
          minTime: minTime,
          maxTime: maxTime,
          locale: locale,
        ),
        title: title,
      ),
    );
  }

  ///
  /// Display date picker bottom sheet witch custom picker model.
  ///
  static Future<DateTime?> showPicker(
    BuildContext context, {
    bool showTitleActions: true,
    DateChangedCallback? onChanged,
    DateChangedCallback? onConfirm,
    DateCancelledCallback? onCancel,
    locale: LocaleType.en,
    BasePickerModel? pickerModel,
    DatePickerTheme? theme,
    required String title,
  }) async {
    return await Navigator.push(
      context,
      _DatePickerRoute(
        showTitleActions: showTitleActions,
        onChanged: onChanged,
        onConfirm: onConfirm,
        onCancel: onCancel,
        locale: locale,
        theme: theme,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        title: title,
        pickerModel: pickerModel,
      ),
    );
  }
}

class _DatePickerRoute<T> extends PopupRoute<T> {
  _DatePickerRoute({
    this.showTitleActions,
    this.onChanged,
    this.onConfirm,
    this.onCancel,
    DatePickerTheme? theme,
    this.barrierLabel,
    this.locale,
    RouteSettings? settings,
    BasePickerModel? pickerModel,
    required this.title,
  })  : this.pickerModel = pickerModel ?? DatePickerModel(),
        this.theme = theme ?? DatePickerTheme(),
        super(settings: settings);

  final bool? showTitleActions;
  final DateChangedCallback? onChanged;
  final DateChangedCallback? onConfirm;
  final DateCancelledCallback? onCancel;
  final LocaleType? locale;
  final DatePickerTheme theme;
  final BasePickerModel pickerModel;
  final String title;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 200);

  @override
  bool get barrierDismissible => true;

  @override
  final String? barrierLabel;

  @override
  Color get barrierColor => Colors.black54;

  AnimationController? _animationController;

  @override
  AnimationController createAnimationController() {
    assert(_animationController == null);
    _animationController =
        BottomSheet.createAnimationController(navigator!.overlay!);
    return _animationController!;
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    Widget bottomSheet = MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: _DatePickerComponent(
        onChanged: onChanged,
        locale: this.locale,
        route: this,
        pickerModel: pickerModel,
        title: title,
      ),
    );
    return InheritedTheme.captureAll(context, bottomSheet);
  }
}

class _DatePickerComponent extends StatefulWidget {
  _DatePickerComponent({
    Key? key,
    required this.route,
    required this.pickerModel,
    this.onChanged,
    this.locale,
    this.title,
  }) : super(key: key);

  final DateChangedCallback? onChanged;

  final _DatePickerRoute route;

  final LocaleType? locale;

  final BasePickerModel pickerModel;
  final String? title;

  @override
  State<StatefulWidget> createState() {
    return _DatePickerState();
  }
}

class _DatePickerState extends State<_DatePickerComponent> {
  late FixedExtentScrollController leftScrollCtrl,
      middleScrollCtrl,
      rightScrollCtrl,
      rightEndScrollCtrl;

  @override
  void initState() {
    super.initState();
    refreshScrollOffset();
  }

  void refreshScrollOffset() {
//    print('refreshScrollOffset ${widget.pickerModel.currentRightIndex()}');
    leftScrollCtrl = FixedExtentScrollController(
        initialItem: widget.pickerModel.currentLeftIndex());
    middleScrollCtrl = FixedExtentScrollController(
        initialItem: widget.pickerModel.currentMiddleIndex());
    rightScrollCtrl = FixedExtentScrollController(
        initialItem: widget.pickerModel.currentRightIndex());
    rightEndScrollCtrl = FixedExtentScrollController(
        initialItem: widget.pickerModel.currentRightEndIndex() ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    DatePickerTheme theme = widget.route.theme;
    return GestureDetector(
      child: AnimatedBuilder(
        animation: widget.route.animation!,
        builder: (BuildContext context, Widget? child) {
          final double bottomPadding = MediaQuery.of(context).padding.bottom;
          return ClipRect(
            child: CustomSingleChildLayout(
              delegate: _BottomPickerLayout(
                widget.route.animation!.value,
                theme,
                showTitleActions: widget.route.showTitleActions!,
                bottomPadding: bottomPadding,
              ),
              child: GestureDetector(
                child: Material(
                  color: theme.backgroundColor,
                  child: _renderPickerView(theme),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _notifyDateChanged() {
    if (widget.onChanged != null) {
      widget.onChanged!(widget.pickerModel.finalTime()!);
    }
  }

  Widget _renderPickerView(DatePickerTheme theme) {
    Widget itemView = _renderItemView(theme);
    if (widget.route.showTitleActions == true) {
      return Column(
        children: <Widget>[
          _renderTitleActionsView(theme, title: widget.title),
          itemView,
        ],
      );
    }
    return itemView;
  }

  Widget _renderColumnView(
    ValueKey key,
    DatePickerTheme theme,
    StringAtIndexCallBack stringAtIndexCB,
    ScrollController scrollController,
    int layoutProportion,
    ValueChanged<int> selectedChangedWhenScrolling,
    ValueChanged<int> selectedChangedWhenScrollEnd,
  ) {
    return Expanded(
      flex: layoutProportion,
      child: Container(
        padding: EdgeInsets.all(8.0),
        height: theme.containerHeight,
        decoration: BoxDecoration(color: theme.backgroundColor),
        child: NotificationListener(
          onNotification: (ScrollNotification notification) {
            if (notification.depth == 0 &&
                notification is ScrollEndNotification &&
                notification.metrics is FixedExtentMetrics) {
              final FixedExtentMetrics metrics =
                  notification.metrics as FixedExtentMetrics;
              final int currentItemIndex = metrics.itemIndex;
              selectedChangedWhenScrollEnd(currentItemIndex);
            }
            return false;
          },
          child: CupertinoPicker.builder(
            key: key,
            backgroundColor: theme.backgroundColor,
            scrollController: scrollController as FixedExtentScrollController,
            itemExtent: theme.itemHeight,
            onSelectedItemChanged: (int index) {
              selectedChangedWhenScrolling(index);
            },
            useMagnifier: true,
            itemBuilder: (BuildContext context, int index) {
              final content = stringAtIndexCB(index);
              if (content == null) {
                return null;
              }
              return Container(
                height: theme.itemHeight,
                alignment: Alignment.center,
                child: Text(
                  content,
                  style: theme.itemStyle,
                  textAlign: TextAlign.start,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _renderItemView(DatePickerTheme theme) {
    return Container(
      color: theme.backgroundColor,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: widget.pickerModel.layoutProportions()[0] > 0
                  ? _renderColumnView(
                      ValueKey(widget.pickerModel.currentLeftIndex()),
                      theme,
                      widget.pickerModel.leftStringAtIndex,
                      leftScrollCtrl,
                      widget.pickerModel.layoutProportions()[0], (index) {
                      widget.pickerModel.setLeftIndex(index);
                    }, (index) {
                      setState(() {
                        refreshScrollOffset();
                        _notifyDateChanged();
                      });
                    })
                  : null,
            ),
            Text(
              widget.pickerModel.leftDivider(),
              style: theme.itemStyle,
            ),
            Container(
              child: widget.pickerModel.layoutProportions()[1] > 0
                  ? _renderColumnView(
                      ValueKey(widget.pickerModel.currentLeftIndex()),
                      theme,
                      widget.pickerModel.middleStringAtIndex,
                      middleScrollCtrl,
                      widget.pickerModel.layoutProportions()[1], (index) {
                      widget.pickerModel.setMiddleIndex(index);
                    }, (index) {
                      setState(() {
                        refreshScrollOffset();
                        _notifyDateChanged();
                      });
                    })
                  : null,
            ),
            Text(
              widget.pickerModel.rightDivider(),
              style: theme.itemStyle,
            ),
            Container(
              child: widget.pickerModel.layoutProportions()[2] > 0
                  ? _renderColumnView(
                      ValueKey(widget.pickerModel.currentMiddleIndex() * 100 +
                          widget.pickerModel.currentLeftIndex()),
                      theme,
                      widget.pickerModel.rightStringAtIndex,
                      rightScrollCtrl,
                      widget.pickerModel.layoutProportions()[2], (index) {
                      widget.pickerModel.setRightIndex(index);
                    }, (index) {
                      setState(() {
                        refreshScrollOffset();
                        _notifyDateChanged();
                      });
                    })
                  : null,
            ),
            if (widget.pickerModel.layoutProportions().length == 4) ...{
              Text(
                widget.pickerModel.rightEndDiver(),
                style: theme.itemStyle,
              ),
              Container(
                child: widget.pickerModel.layoutProportions()[3] > 0
                    ? _renderColumnView(
                        ValueKey(widget.pickerModel.currentLeftIndex() *
                                1000000 +
                            widget.pickerModel.currentMiddleIndex() * 10000 +
                            widget.pickerModel.currentRightIndex() * 100 +
                            widget.pickerModel.currentRightEndIndex()!),
                        theme,
                        widget.pickerModel.rightEndStringAtIndex,
                        rightEndScrollCtrl,
                        widget.pickerModel.layoutProportions()[3], (index) {
                        widget.pickerModel.setRightEndIndex(index);
                        _notifyDateChanged();
                      }, (index) {
                        setState(() {
                          refreshScrollOffset();
                          _notifyDateChanged();
                        });
                      })
                    : null,
              ),
            }
          ],
        ),
      ),
    );
  }

  // Title View
  Widget _renderTitleActionsView(DatePickerTheme theme, {String? title}) {
    final done = _localeDone();
    final cancel = _localeCancel();

    return Container(
      height: theme.titleHeight,
      decoration: BoxDecoration(
        color: theme.headerColor ?? theme.backgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: theme.titleHeight,
            child: CupertinoButton(
              pressedOpacity: 0.3,
              padding: EdgeInsetsDirectional.only(start: 16, top: 0),
              child: Text(
                '$cancel',
                style: theme.cancelStyle,
              ),
              onPressed: () {
                Navigator.pop(context);
                if (widget.route.onCancel != null) {
                  widget.route.onCancel!();
                }
              },
            ),
          ),
          Expanded(
            child: Container(
              height: theme.titleHeight,
              alignment: Alignment.center,
              child: Text(
                title ?? '',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            height: theme.titleHeight,
            child: CupertinoButton(
              pressedOpacity: 0.3,
              padding: EdgeInsetsDirectional.only(end: 16, top: 0),
              child: Text(
                '$done',
                style: theme.doneStyle,
              ),
              onPressed: () {
                if (widget.pickerModel is DatePickerModel ||
                    widget.pickerModel is DateTimePickerModel) {
                  DateTime? minTime;
                  DateTime? maxTime;
                  if (widget.pickerModel is DatePickerModel) {
                    DatePickerModel model =
                        widget.pickerModel as DatePickerModel;
                    minTime = model.minTime;
                    if (minTime.year == 1970 &&
                        minTime.month == 1 &&
                        minTime.day == 1) {
                      minTime = null;
                    }
                    maxTime = model.maxTime;
                    if (maxTime.year == 2049 &&
                        maxTime.month == 12 &&
                        maxTime.day == 31) {
                      maxTime = null;
                    }
                  } else {
                    DateTimePickerModel model =
                        widget.pickerModel as DateTimePickerModel;
                    minTime = model.minTime;
                    maxTime = model.maxTime;
                  }
                  debugPrint(widget.pickerModel.finalTime()?.toString());
                  debugPrint(maxTime?.toString());
                  if (maxTime != null &&
                      widget.pickerModel.finalTime()!.isAfter(maxTime)) {
                    // ToastUtil.showError('你选择的时间超出了范围，请重新选择！');
                    return;
                  }
                  if (minTime != null &&
                      widget.pickerModel.finalTime()!.isBefore(minTime)) {
                    // ToastUtil.showError('你选择的时间超出了范围，请重新选择！');
                    return;
                  }
                }
                Navigator.pop(context, widget.pickerModel.finalTime());
                if (widget.route.onConfirm != null) {
                  widget.route.onConfirm!(widget.pickerModel.finalTime()!);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  String _localeDone() {
    return i18nObjInLocale(widget.locale)['done'] as String;
  }

  String _localeCancel() {
    return i18nObjInLocale(widget.locale)['cancel'] as String;
  }
}

class _BottomPickerLayout extends SingleChildLayoutDelegate {
  _BottomPickerLayout(
    this.progress,
    this.theme, {
    // this.itemCount,
    this.showTitleActions,
    this.bottomPadding = 0,
  });

  final double progress;

  // final int? itemCount;
  final bool? showTitleActions;
  final DatePickerTheme theme;
  final double bottomPadding;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    double maxHeight = theme.containerHeight;
    if (showTitleActions == true) {
      maxHeight += theme.titleHeight;
    }

    return BoxConstraints(
      minWidth: constraints.maxWidth,
      maxWidth: constraints.maxWidth,
      minHeight: 0.0,
      maxHeight: maxHeight + bottomPadding,
    );
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    final height = size.height - childSize.height * progress;
    return Offset(0.0, height);
  }

  @override
  bool shouldRelayout(_BottomPickerLayout oldDelegate) {
    return progress != oldDelegate.progress;
  }
}

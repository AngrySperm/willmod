// Copyright (c) 2021 Simform Solutions. All rights reserved.
// Use of this source code is governed by a MIT-style license
// that can be found in the LICENSE file.

import 'dart:math';

import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:willmod/configs/constant.dart';

class Constants {
  Constants._();

  static final Random _random = Random();
  static final int _maxColor = 256;

  static const int hoursADay = 24;

  static final List<String> weekTitles = ["M", "T", "W", "T", "F", "S", "S"];

  static const Color defaultLiveTimeIndicatorColor = Color(0xff444444);
  static const Color defaultBorderColor = Color(0xffdddddd);
  static const Color black = Color(0xff000000);
  static const Color white = Color(0xffffffff);
  static const Color offWhite = Color(0xfff0f0f0);
  static const Color headerBackground = Color(0xFFDCF0FF);
  static Color get randomColor {
    return Color.fromRGBO(_random.nextInt(_maxColor),
        _random.nextInt(_maxColor), _random.nextInt(_maxColor), 1);
  }
}

class WiljosFilledCell<T extends Object?> extends StatelessWidget {
  /// Date of current cell.
  final DateTime date;

  /// List of events on for current date.
  final List<CalendarEventData<T>> events;

  /// Defines if cell should be highlighted or not.
  /// If true it will display date title in a circle.
  final bool shouldHighlight;

  /// Defines background color of cell.
  final Color backgroundColor;

  /// Defines highlight color.
  final Color highlightColor;

  /// Color for event tile.
  final Color tileColor;

  /// Called when user taps on any event tile.
  final TileTapCallback<T>? onTileTap;

  /// defines that [date] is in current month or not.
  final bool isInMonth;

  /// defines radius of highlighted date.
  final double highlightRadius;

  /// color of cell title
  final Color titleColor;

  /// color of highlighted cell title
  final Color highlightedTitleColor;

  /// This class will defines how cell will be displayed.
  /// This widget will display all the events as tile below date title.
  WiljosFilledCell({
    Key? key,
    required this.date,
    required this.events,
    this.isInMonth = false,
    this.shouldHighlight = false,
    this.backgroundColor = Colors.blue,
    this.highlightColor = Colors.blue,
    this.onTileTap,
    this.tileColor = Colors.blue,
    this.highlightRadius = 11,
    this.titleColor = Constants.black,
    this.highlightedTitleColor = Constants.white,
  }) : super(key: key);
  WiljosConstant constant = Get.put(WiljosConstant());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Column(
        children: [
          const SizedBox(
            height: 5.0,
          ),
          CircleAvatar(
            radius: highlightRadius,
            backgroundColor:
                shouldHighlight ? constant.colorPrimary : Colors.transparent,
            child: Text(
              "${date.day}",
              style: TextStyle(
                color: shouldHighlight
                    ? highlightedTitleColor
                    : isInMonth
                        ? Colors.red
                        : constant.colorTextLight,
                fontSize: 12,
              ),
            ),
          ),
          if (events.isNotEmpty)
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 5.0),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      events.length,
                      (index) => GestureDetector(
                        onTap: () =>
                            onTileTap?.call(events[index], events[index].date),
                        child: Container(
                          decoration: BoxDecoration(
                            color: constant.colorPrimary,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          margin: const EdgeInsets.symmetric(
                              vertical: 2.0, horizontal: 6.0),
                          padding: const EdgeInsets.all(4.0),
                          alignment: Alignment.center,
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  events[index].title,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.clip,
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: events[index].color.accent,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

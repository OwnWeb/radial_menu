import 'dart:math';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// The [RadialMenu] widget you can import and use
class RadialMenu extends StatefulWidget {
  final List<RadialMenuEntry> entries;
  final Color color;
  final double size;
  final double entrySize;

  const RadialMenu(
      {@required this.entries,
      this.color = Colors.orangeAccent,
      this.size = 160,
      this.entrySize = 85});

  @override
  State<StatefulWidget> createState() => _RadialMenuState();
}

/// The [RadialMenuEntry] with icons, callbacks, text and colors
class RadialMenuEntry {
  /// The callback to trigger on an [RadialMenuEntry] tap
  final Function onTap;

  /// The[RadialMenuEntry icon
  final IconData icon;

  /// The [RadialMenuEntry] icon color
  Color iconColor;

  /// The [RadialMenuEntry] color. Defaults to [Colors.black].
  final Color color;

  /// The [RadialMenuEntry] text shown above the icon. Defaults to "".
  final String text;

  /// The [RadialMenuEntry] text color. Defaults to [Colors.black].
  Color textColor;

  /// The [RadialMenuEntry] icon size. Defaults to 24.
  final double iconSize;

  RadialMenuEntry(
      {this.onTap,
      @required this.icon,
      this.color = Colors.black,
      this.text = '',
      textColor,
      iconColor,
      this.iconSize = 24}) {
    this.textColor = textColor ?? color;
    this.iconColor = iconColor ?? color;
  }
}

class _RadialMenuState extends State<RadialMenu> {
  bool open = false;

  @override
  Widget build(BuildContext context) {
    Size subCategorySize = Size(widget.entrySize, widget.entrySize);
    Size mainSize = Size(widget.size, widget.size);

    return Container(
      width: mainSize.width,
      height: mainSize.height,
      decoration: BoxDecoration(
          color:
              open == true ? Colors.white.withOpacity(0.9) : Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(mainSize.width))),
      child: Stack(children: <Widget>[
        Align(
            alignment: Alignment.center,
            child: FloatingActionButton(
                heroTag: 'togglePartners',
                mini: true,
                child: Icon(
                  Icons.more_horiz,
                  color: Colors.white,
                ),
                backgroundColor: widget.color,
                elevation: 0,
                onPressed: () {
                  setState(() {
                    open = !open;
                  });
                })),
        if (open)
          ..._renderWheel(
            widget.entries,
            parentSize: mainSize,
            childSize: subCategorySize,
          ),
      ]),
    );
  }
}

class _CenterRotated extends StatelessWidget {
  final Size parentSize;
  final Size size;
  final double angle;
  final Widget child;

  _CenterRotated(
      {this.angle = 0,
      @required this.size,
      @required this.parentSize,
      this.child});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
        angle: angle,
        origin: Offset(parentSize.width / 2 - size.width / 2,
            parentSize.height / 2 - size.height / 2),
        child: Container(
          width: size.width,
          height: size.height,
          child: Transform.rotate(angle: -angle, child: child),
        ));
  }
}

List<Widget> _renderWheel(List<RadialMenuEntry> entries,
    {Size parentSize, Size childSize, Function onTap}) {
  return entries
      .asMap()
      .map((index, entry) => MapEntry(
          index,
          _CenterRotated(
            angle: pi / 4 + index * pi / (entries.length - 1),
            size: childSize,
            parentSize: parentSize,
            child: GestureDetector(
                onTap: () {
                  onTap is Function
                      ? onTap(entry)
                      : print('entry $index tapped without onTap callback');
                },
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        entry.icon,
                        color: entry.iconColor,
                        size: entry.iconSize,
                      ),
                      Text(
                        entry.text,
                        style: TextStyle(
                          fontSize: 10,
                          color: entry.textColor,
                        ),
                      )
                    ])),
          )))
      .values
      .toList();
}

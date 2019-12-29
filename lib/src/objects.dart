import 'dart:ui';
import './callbacks.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

Axis getAxis(String input) {
  if (input == null || input.isEmpty) {
    return null;
  }

  input = input.toLowerCase();

  if (input == "horizontal") return Axis.horizontal;
  if (input == "vertical") return Axis.vertical;

  return null;
}

TileMode getTileMode(String input) {
  if (input == null || input.isEmpty) {
    return null;
  }

  input = input.toLowerCase();

  if (input == "clamp") return TileMode.clamp;
  if (input == "mirror") return TileMode.mirror;
  if (input == "repeated") return TileMode.repeated;

  return null;
}

TextCapitalization getTextCapitalization(String input) {
  if (input == null || input.isEmpty) {
    return null;
  }

  input = input.toLowerCase();

  if (input == "none") return TextCapitalization.none;
  if (input == "characters") return TextCapitalization.characters;
  if (input == "sentences") return TextCapitalization.sentences;
  if (input == "words") return TextCapitalization.words;

  return null;
}

MaterialTapTargetSize getMaterialTapTargetSize(String input) {
  if (input == null || input.isEmpty) {
    return null;
  }

  input = input.toLowerCase();

  if (input == "padded") return MaterialTapTargetSize.padded;
  if (input == "shrinkwrap") return MaterialTapTargetSize.shrinkWrap;

  return null;
}

Overflow getOverflow(String input) {
  if (input == null || input.isEmpty) {
    return null;
  }

  input = input.toLowerCase();
  if (input == "clip") return Overflow.clip;
  if (input == "visible") return Overflow.visible;

  return null;
}

StackFit getStackFit(String input) {
  if (input == null || input.isEmpty) {
    return null;
  }

  input = input.toLowerCase();

  if (input == "loose") return StackFit.loose;
  if (input == "expand") return StackFit.expand;
  if (input == "passthrough") return StackFit.passthrough;

  return null;
}

TextAlign getTextAlign(String input) {
  if (input == null || input.isEmpty) {
    return null;
  }

  input = input.toLowerCase();

  if (input == "center") return TextAlign.center;
  if (input == "end") return TextAlign.end;
  if (input == "justify") return TextAlign.justify;
  if (input == "left") return TextAlign.left;
  if (input == "right") return TextAlign.right;
  if (input == "start") return TextAlign.start;

  return null;
}

TextBaseline getTextBaseline(String input) {
  if (input == null || input.isEmpty) {
    return null;
  }

  input = input.toLowerCase();

  if (input == "alphabetic") return TextBaseline.alphabetic;
  if (input == "ideographic") return TextBaseline.ideographic;

  return null;
}

ImageRepeat getImageRepeat(String input) {
  if (input == null || input.isEmpty) {
    return null;
  }

  input = input.toLowerCase();

  if (input == "noRepeat") return ImageRepeat.noRepeat;
  if (input == "repeat") return ImageRepeat.repeat;
  if (input == "repeatX") return ImageRepeat.repeatX;
  if (input == "repeatY") return ImageRepeat.repeatY;

  return null;
}

BoxShape getBoxShape(String input) {
  if (input == null || input.isEmpty) {
    return null;
  }

  input = input.toLowerCase();

  if (input == "circle") return BoxShape.circle;
  if (input == "rectangle") return BoxShape.rectangle;

  return null;
}

PlaceholderAlignment getPlaceholderAlignment(String input) {
  if (input == null || input.isEmpty) {
    return null;
  }

  input = input.toLowerCase();

  if (input == "top") return PlaceholderAlignment.top;
  if (input == "middle") return PlaceholderAlignment.middle;
  if (input == "bottom") return PlaceholderAlignment.bottom;
  if (input == "belowbaseline") return PlaceholderAlignment.belowBaseline;
  if (input == "baseline") return PlaceholderAlignment.baseline;
  if (input == "abovebaseline") return PlaceholderAlignment.aboveBaseline;

  return null;
}

FlexFit getFlexFit(String input) {
  if (input == null || input.isEmpty) {
    return null;
  }

  input = input.toLowerCase();

  if (input == "loose") return FlexFit.loose;
  if (input == "tight") return FlexFit.tight;

  return null;
}

TextAlignVertical getTextAlignVertical(String input) {
  if (input == null || input.isEmpty) {
    return null;
  }

  input = input.toLowerCase();

  if (input == "top") return TextAlignVertical.top;
  if (input == "center") return TextAlignVertical.center;
  if (input == "bottom") return TextAlignVertical.bottom;

  return null;
}

DragStartBehavior getDragStartBehavior(String input) {
  if (input == null || input.isEmpty) {
    return null;
  }

  input = input.toLowerCase();
  if (input == "start") return DragStartBehavior.start;
  if (input == "down") return DragStartBehavior.down;

  return null;
}

DismissDirection getDismissDirection(String input) {
  if (input == null || input.isEmpty) {
    return null;
  }

  input = input.toLowerCase();
  if (input == "down") return DismissDirection.down;
  if (input == "endtostart") return DismissDirection.endToStart;
  if (input == "horizontal") return DismissDirection.horizontal;
  if (input == "starttoend") return DismissDirection.startToEnd;
  if (input == "up") return DismissDirection.up;
  if (input == "vertical") return DismissDirection.vertical;

  return null;
}

HitTestBehavior getHitTestBehavior(String input) {
  if (input == null || input.isEmpty) {
    return null;
  }

  input = input.toLowerCase();
  if (input == "defertochild") return HitTestBehavior.deferToChild;
  if (input == "opaque") return HitTestBehavior.opaque;
  if (input == "translucent") return HitTestBehavior.translucent;

  return null;
}

MainAxisSize getMainAxisSize(String input) {
  if (input == null || input.isEmpty) {
    return null;
  }

  input = input.toLowerCase();

  if (input == "min") return MainAxisSize.min;
  if (input == "max") return MainAxisSize.max;

  return null;
}

VerticalDirection getVerticalDirection(String input) {
  if (input == null || input.isEmpty) {
    return null;
  }

  input = input.toLowerCase();

  if (input == "up") return VerticalDirection.up;
  if (input == "down") return VerticalDirection.down;

  return null;
}

BannerLocation getBannerLocation(String input) {
  if (input == null || input.isEmpty) {
    return null;
  }

  input = input.toLowerCase();

  if (input == "bottomend") return BannerLocation.bottomEnd;
  if (input == "bottomstart") return BannerLocation.bottomStart;
  if (input == "topend") return BannerLocation.topEnd;
  if (input == "topstart") return BannerLocation.topStart;

  return null;
}

TextDirection getTextDirection(String input) {
  if (input == null || input.isEmpty) {
    return null;
  }

  input = input.toLowerCase();

  if (input == "ltr") return TextDirection.ltr;
  if (input == "rtl") return TextDirection.rtl;

  return null;
}

TextInputAction getTextInputAction(String input) {
  if (input == null || input.isEmpty) {
    return null;
  }

  input = input.toLowerCase();

  if (input == "continueaction") return TextInputAction.continueAction;
  if (input == "done") return TextInputAction.done;
  if (input == "emergencycall") return TextInputAction.emergencyCall;
  if (input == "go") return TextInputAction.go;
  if (input == "join") return TextInputAction.join;
  if (input == "newline") return TextInputAction.newline;
  if (input == "next") return TextInputAction.next;
  if (input == "none") return TextInputAction.none;
  if (input == "previous") return TextInputAction.previous;
  if (input == "route") return TextInputAction.route;
  if (input == "search") return TextInputAction.search;
  if (input == "send") return TextInputAction.send;
  if (input == "unspecified") return TextInputAction.unspecified;

  return null;
}

TextOverflow getTextOverflow(String input) {
  if (input == null || input.isEmpty) {
    return null;
  }

  input = input.toLowerCase();

  if (input == "clip") return TextOverflow.clip;
  if (input == "ellipsis") return TextOverflow.ellipsis;
  if (input == "fade") return TextOverflow.fade;
  if (input == "visible") return TextOverflow.visible;

  return null;
}

TextWidthBasis getTextWidthBasis(String input) {
  if (input == null || input.isEmpty) {
    return null;
  }

  input = input.toLowerCase();

  if (input == "longestline") return TextWidthBasis.longestLine;
  if (input == "parent") return TextWidthBasis.parent;

  return null;
}

TextDecorationStyle getTextDecorationStyle(String input) {
  if (input == null || input.isEmpty) {
    return null;
  }

  input = input.toLowerCase();

  if (input == "dashed") return TextDecorationStyle.dashed;
  if (input == "dotted") return TextDecorationStyle.dotted;
  if (input == "double") return TextDecorationStyle.double;
  if (input == "solid") return TextDecorationStyle.solid;
  if (input == "wavy") return TextDecorationStyle.wavy;

  return null;
}

FontWeight getFontWeight(String input) {
  if (input == null || input.isEmpty) {
    return null;
  }

  input = input.toLowerCase();

  if (input == "bold") return FontWeight.bold;
  if (input == "normal") return FontWeight.normal;
  if (input == "w100") return FontWeight.w100;
  if (input == "w200") return FontWeight.w200;
  if (input == "w300") return FontWeight.w300;
  if (input == "w400") return FontWeight.w400;
  if (input == "w500") return FontWeight.w500;
  if (input == "w600") return FontWeight.w600;
  if (input == "w700") return FontWeight.w700;
  if (input == "w800") return FontWeight.w800;
  if (input == "w900") return FontWeight.w900;

  return null;
}

CrossAxisAlignment getCrossAxisAlignment(String input) {
  if (input == null || input.isEmpty) {
    return null;
  }

  input = input.toLowerCase();

  if (input == "baseline") return CrossAxisAlignment.baseline;
  if (input == "center") return CrossAxisAlignment.center;
  if (input == "end") return CrossAxisAlignment.end;
  if (input == "start") return CrossAxisAlignment.start;
  if (input == "stretch") return CrossAxisAlignment.stretch;

  return null;
}

WrapCrossAlignment getWrapCrossAxisAlignment(String input) {
  if (input == null || input.isEmpty) {
    return null;
  }

  input = input.toLowerCase();

  if (input == "center") return WrapCrossAlignment.center;
  if (input == "end") return WrapCrossAlignment.end;
  if (input == "start") return WrapCrossAlignment.start;

  return null;
}

MainAxisAlignment getMainAxisAlignment(String input) {
  if (input == null || input.isEmpty) {
    return null;
  }

  input = input.toLowerCase();

  if (input == "spacearound") return MainAxisAlignment.spaceAround;
  if (input == "spacebetween") return MainAxisAlignment.spaceBetween;
  if (input == "spaceevenly") return MainAxisAlignment.spaceEvenly;
  if (input == "center") return MainAxisAlignment.center;
  if (input == "end") return MainAxisAlignment.end;
  if (input == "start") return MainAxisAlignment.start;

  return null;
}

Clip getClip(String input) {
  if (input == null || input.isEmpty) {
    return null;
  }

  input = input.toLowerCase();

  if (input == "none") return Clip.none;
  if (input == "hardedge") return Clip.hardEdge;
  if (input == "antialiaswithsavelayer") return Clip.antiAliasWithSaveLayer;
  if (input == "antialias") return Clip.antiAlias;

  return null;
}

Brightness getBrightness(String input) {
  if (input == null || input.isEmpty) {
    return null;
  }

  input = input.toLowerCase();

  if (input == "dark") return Brightness.dark;
  if (input == "light") return Brightness.light;

  return null;
}

ButtonTextTheme getButtonTextTheme(String input) {
  if (input == null || input.isEmpty) {
    return null;
  }

  input = input.toLowerCase();

  if (input == "accent") return ButtonTextTheme.accent;
  if (input == "normal") return ButtonTextTheme.normal;
  if (input == "primary") return ButtonTextTheme.primary;

  return null;
}

WrapAlignment getWrapAlignment(String input) {
  if (input == null || input.isEmpty) {
    return null;
  }

  input = input.toLowerCase();

  if (input == "spacearound") return WrapAlignment.spaceAround;
  if (input == "spacebetween") return WrapAlignment.spaceBetween;
  if (input == "spaceevenly") return WrapAlignment.spaceEvenly;
  if (input == "center") return WrapAlignment.center;
  if (input == "end") return WrapAlignment.end;
  if (input == "start") return WrapAlignment.start;

  return null;
}

BoxFit getBoxFit(String input) {
  if (input == null || input.isEmpty) {
    return null;
  }

  input = input.toLowerCase();

  if (input == "contain") return BoxFit.contain;
  if (input == "cover") return BoxFit.cover;
  if (input == "fill") return BoxFit.fill;
  if (input == "fitHeight") return BoxFit.fitHeight;
  if (input == "fitWidth") return BoxFit.fitWidth;
  if (input == "none") return BoxFit.none;
  if (input == "scaleDown") return BoxFit.scaleDown;

  return null;
}

EdgeInsetsGeometry getEdgeInsets(dynamic input) {
  if (input == null) {
    return null;
  }
  final String type = input['\$type'];

  if (type == "EdgeInsets.all") {
    return EdgeInsets.all(input['value']);
  }

  if (type == "EdgeInsets.symmetric") {
    return EdgeInsets.symmetric(
        vertical: input['vertical'] ?? 0, horizontal: input['horizontal'] ?? 0);
  }

  if (type == "EdgeInsets.only") {
    return EdgeInsetsDirectional.only(
        start: input['start'] ?? 0,
        top: input['top'] ?? 0,
        end: input['end'] ?? 0,
        bottom: input['bottom'] ?? 0);
  }
  if (type == "EdgeInsets.fromSTEB") {
    return EdgeInsetsDirectional.fromSTEB(
        input['start'], input['top'], input['end'], input['bottom']);
  }

  return null;
}

CrossFadeState getCrossFadeState(String input) {
  if (input == null || input.isEmpty) return null;

  input = input.toLowerCase();

  if (input == "showfirst") return CrossFadeState.showFirst;
  if (input == "showsecond") return CrossFadeState.showSecond;

  return null;
}

AxisDirection getAxisDirection(String input) {
  if (input == null || input.isEmpty) return null;

  input = input.toLowerCase();

  if (input == "down") return AxisDirection.down;
  if (input == "left") return AxisDirection.left;
  if (input == "right") return AxisDirection.right;
  if (input == "up") return AxisDirection.up;

  return null;
}

ViewportOffset getViewportOffset(dynamic i) {
  if (i == null) return null;

  final String type = i['\$type'];

  if (type == "ViewportOffset.fixed") {
    return ViewportOffset.fixed(i['value']);
  }

  if (type == "ViewportOffset.zero") {
    return ViewportOffset.zero();
  }
  return null;
}

TabBarIndicatorSize getTabBarIndicatorSize(String input) {
  if (input == null || input.isEmpty) {
    return null;
  }

  input = input.toLowerCase();
  if (input == "label") return TabBarIndicatorSize.label;
  if (input == "tab") return TabBarIndicatorSize.tab;

  return null;
}

CollapseMode getCollapseMode(String input) {
  if (input == null || input.isEmpty) {
    return null;
  }

  input = input.toLowerCase();
  if (input == "parallax") return CollapseMode.parallax;
  if (input == "none") return CollapseMode.none;
  if (input == "pin") return CollapseMode.pin;

  return null;
}

ListTileControlAffinity getListTileControlAffinity(String input) {
  if (input == null || input.isEmpty) {
    return null;
  }

  input = input.toLowerCase();
  if (input == "leading") return ListTileControlAffinity.leading;
  if (input == "platform") return ListTileControlAffinity.platform;
  if (input == "trailing") return ListTileControlAffinity.trailing;

  return null;
}

RangeLabels getRangeLabels(dynamic i) {
  return RangeLabels(i['start'], i['end']);
}

RangeValues getRangeValues(dynamic i) {
  return RangeValues(i['start'], i['end']);
}

BottomNavigationBarType getBottomNavigationBarType(String input) {
  if (input == null || input.isEmpty) {
    return null;
  }

  input = input.toLowerCase();
  if (input == "fixed") return BottomNavigationBarType.fixed;
  if (input == "shifting") return BottomNavigationBarType.shifting;

  return null;
}

StepperType getStepperType(String input) {
  if (input == null || input.isEmpty) {
    return null;
  }

  input = input.toLowerCase();
  if (input == "horizontal") return StepperType.horizontal;
  if (input == "vertical") return StepperType.vertical;

  return null;
}

StepState getStepState(String input) {
  if (input == null || input.isEmpty) {
    return null;
  }

  input = input.toLowerCase();
  if (input == "complete") return StepState.complete;
  if (input == "disabled") return StepState.disabled;
  if (input == "editing") return StepState.editing;
  if (input == "error") return StepState.error;
  if (input == "indexed") return StepState.indexed;

  return null;
}

DrawerAlignment getDrawerAlignment(String input) {
  if (input == null || input.isEmpty) {
    return null;
  }

  input = input.toLowerCase();
  if (input == "start") return DrawerAlignment.start;
  if (input == "end") return DrawerAlignment.end;

  return null;
}

Duration getDuration(dynamic i) {
  if (i == null) {
    return null;
  }

  return Duration(
      days: i['days'] ?? 0,
      hours: i['hours'] ?? 0,
      minutes: i['minutes'] ?? 0,
      seconds: i[''] ?? 0,
      milliseconds: i['milliseconds'] ?? 0,
      microseconds: i['microseconds'] ?? 0);
}

Radius getRadius(dynamic i) {
  if (i == null) {
    return null;
  }
  final String type = i['\$type'];

  if (type == "Radius.circular") {
    return Radius.circular(i['radius']);
  }

  if (type == "Radius.elliptical") {
    return Radius.elliptical(i['x'], i['y']);
  }

  if (type == "Radius.lerp") {
    return Radius.lerp(getRadius(i['a']), getRadius(i['b']), i['t']);
  }

  if (type == "Radius.zero") {
    return Radius.zero;
  }

  return null;
}

Color getColor(dynamic color) {
  if (color == null) {
    return null;
  }

  if (color is String) {
    //final String str = color;
    return null;
  }

  final int value = color;

  if (value == null) {
    return null;
  }

  return Color(value);
}

BorderRadiusGeometry getBorderRadius(dynamic i) {
  if (i == null) {
    return null;
  }
  final String type = i['\$type'];

  if (type == "BorderRadius.circular") {
    return BorderRadius.circular(i['radius']);
  }
  if (type == "BorderRadius.all") {
    return BorderRadius.all(getRadius(i['radius']));
  }

  if (type == "BorderRadius.horizontal") {
    return BorderRadius.horizontal(
        left: getRadius(i['left']) ?? Radius.zero,
        right: getRadius(i['right']) ?? Radius.zero);
  }

  if (type == "BorderRadiusDirectional.horizontal") {
    return BorderRadiusDirectional.horizontal(
        start: getRadius(i['start']) ?? Radius.zero,
        end: getRadius(i['end']) ?? Radius.zero);
  }

  if (type == "BorderRadius.vertical") {
    return BorderRadiusDirectional.vertical(
        top: getRadius(i['top']) ?? Radius.zero,
        bottom: getRadius(i['bottom']) ?? Radius.zero);
  }

  if (type == "BorderRadius.only") {
    return BorderRadius.only(
      topLeft: getRadius(i['topLeft']) ?? Radius.zero,
      topRight: getRadius(i['topRight']) ?? Radius.zero,
      bottomLeft: getRadius(i['bottomLeft']) ?? Radius.zero,
      bottomRight: getRadius(i['bottomRight']) ?? Radius.zero,
    );
  }

  if (type == "BorderRadiusDirectional.only") {
    return BorderRadiusDirectional.only(
      topStart: getRadius(i['topStart']) ?? Radius.zero,
      topEnd: getRadius(i['topEnd']) ?? Radius.zero,
      bottomStart: getRadius(i['bottomStart']) ?? Radius.zero,
      bottomEnd: getRadius(i['bottomEnd']) ?? Radius.zero,
    );
  }

  if (type == "BorderRadius.zero") {
    return BorderRadius.zero;
  }

  return null;
}

TextStyle getTextStyle(dynamic i) {
  if (i == null) {
    return null;
  }

  var ts = TextStyle(
    inherit: i['inherit'] ?? true,
    fontSize: i['fontSize'],
    fontFamily: i['fontFamily'],
    fontWeight: getFontWeight(i['fontWeight']),
    backgroundColor: getColor(i['backgroundColor']),
    color: getColor(i['color']),
    decoration: getTextDecoration(i['decoration']),
    decorationStyle: getTextDecorationStyle(i['decorationStyle']),
    decorationColor: getColor(i['decorationColor']),
    decorationThickness: i['decorationThickness'],
    height: i['height'],
    letterSpacing: i['letterSpacing'],
    textBaseline: getTextBaseline(i['textBaseline']),
    wordSpacing: i['wordSpacing'],
    package: i['package'],
  );

  return TextStyle(fontFamily: 'Nahid').merge(ts);
}

BorderStyle getBorderStyle(String input) {
  if (input == null || input.isEmpty) {
    return null;
  }

  input = input.toLowerCase();

  if (input == "solid") return BorderStyle.solid;
  if (input == "none") return BorderStyle.none;

  return null;
}

BoxShadow getBoxShadow(dynamic i) {
  if (i == null) {
    return null;
  }

  return BoxShadow(
    blurRadius: i['blurRadius'] ?? 0,
    color: getColor(i['color']) ?? Colors.black,
    offset: getOffset(i['offset']) ?? Offset.zero,
    spreadRadius: i['spreadRadius'] ?? 0,
  );
}

Offset getOffset(dynamic i) {
  if (i == null) {
    return null;
  }

  return Offset(i['dx'], i['dy']);
}

BoxConstraints getBoxConstraints(dynamic i) {
  if (i == null) {
    return null;
  }

  return BoxConstraints(
    maxWidth: i['maxWidth'] ?? double.infinity,
    maxHeight: i['maxHeight'] ?? double.infinity,
    minWidth: i['minWidth'] ?? 0,
    minHeight: i['minHeight'] ?? 0,
  );
}

TextTheme getTextTheme(dynamic i) {
  if (i == null) {
    return null;
  }

  return TextTheme(
    body1: getTextStyle(i['body1']),
    body2: getTextStyle(i['body2']),
    button: getTextStyle(i['button']),
    caption: getTextStyle(i['caption']),
    display1: getTextStyle(i['display1']),
    display2: getTextStyle(i['display2']),
    display3: getTextStyle(i['display3']),
    display4: getTextStyle(i['display4']),
    headline: getTextStyle(i['headline']),
    overline: getTextStyle(i['overline']),
    subhead: getTextStyle(i['subhead']),
    subtitle: getTextStyle(i['subtitle']),
    title: getTextStyle(i['title']),
  );
}

IconThemeData getIconThemeData(dynamic i) {
  if (i == null) {
    return null;
  }

  return IconThemeData(
    color: getColor(i['color']),
    opacity: i['opacity'],
    size: i['size'],
  );
}

Border getBorder(dynamic i) {
  if (i == null) {
    return null;
  }
  final String type = i['\$type'];

  if (type == "Border.all") {
    return Border.all(
      color: getColor(i['color']) ?? Colors.black,
      width: i['width'] ?? 1,
      style: getBorderStyle(i['style']) ?? BorderStyle.solid,
    );
  }

  if (type == "Border.merge") {
    return Border.merge(getBorder(i['a']), getBorder(i['b']));
  }

  if (type == "Border.lerp") {
    return Border.lerp(getBorder(i['a']), getBorder(i['b']), i['t']);
  }

  if (type == "Border.fromBorderSide") {
    return Border.fromBorderSide(getBorderSide(i['side']));
  }

  return null;
}

BorderSide getBorderSide(dynamic i) {
  if (i == null) return null;

  return BorderSide(
    color: getColor(i['color']) ?? Colors.black,
    width: i['width'] ?? 1,
    style: getBorderStyle(i['style']) ?? BorderStyle.solid,
  );
}

ScrollPhysics getScrollPhysics(dynamic i) {
  if (i == null) return null;
  final String type = i['\$type'];

  if (type == "AlwaysScrollableScrollPhysics") {
    return AlwaysScrollableScrollPhysics(parent: getScrollPhysics(i['parent']));
  } else if (type == "BouncingScrollPhysics") {
    return BouncingScrollPhysics(parent: getScrollPhysics(i['parent']));
  } else if (type == "ClampingScrollPhysics") {
    return ClampingScrollPhysics(parent: getScrollPhysics(i['parent']));
  } else if (type == "FixedExtentScrollPhysics") {
    return FixedExtentScrollPhysics(parent: getScrollPhysics(i['parent']));
  } else if (type == "NeverScrollableScrollPhysics") {
    return NeverScrollableScrollPhysics(parent: getScrollPhysics(i['parent']));
  } else if (type == "PageScrollPhysics") {
    return PageScrollPhysics(parent: getScrollPhysics(i['parent']));
  }
  return null;
}

TextDecoration getTextDecoration(dynamic i) {
  if (i == null) return null;
  final String type = i['\$type'];

  if (type == "TextDecoration.lineThrough") return TextDecoration.lineThrough;
  if (type == "TextDecoration.none") return TextDecoration.none;
  if (type == "TextDecoration.overline") return TextDecoration.overline;
  if (type == "TextDecoration.underline") return TextDecoration.underline;
  if (type == "TextDecoration.combine")
    return TextDecoration.combine(
        (i['decorations'] as List)?.map(getTextDecoration)?.toList() ?? []);
  return null;
}

TextInputType getTextInputType(dynamic i) {
  if (i == null) return null;
  final String type = i['\$type'];

  if (type == "TextInputType.datetime") return TextInputType.datetime;
  if (type == "TextInputType.emailAddress") return TextInputType.emailAddress;
  if (type == "TextInputType.multiline") return TextInputType.multiline;
  if (type == "TextInputType.number") return TextInputType.number;
  if (type == "TextInputType.numberWithOptions")
    return TextInputType.numberWithOptions(
      signed: i['signed'] ?? false,
      decimal: i['decimal'] ?? false,
    );
  if (type == "TextInputType.phone") return TextInputType.phone;
  if (type == "TextInputType.text") return TextInputType.text;
  if (type == "TextInputType.url") return TextInputType.url;
  if (type == "TextInputType.visiblePassword")
    return TextInputType.visiblePassword;

  return null;
}

FontStyle getFontStyle(String input) {
  if (input == null || input.isEmpty) {
    return null;
  }

  input = input.toLowerCase();

  if (input == "italic") return FontStyle.italic;
  if (input == "normal") return FontStyle.normal;

  return null;
}

StrutStyle getStrutStyle(dynamic i) {
  if (i == null) return null;
  return StrutStyle(
    debugLabel: i['debugLabel'],
    fontFamily: i['fontFamily'],
    fontFamilyFallback:
        (i['fontFamilyFallback'] as List)?.cast<String>()?.toList(),
    fontSize: i['fontSize'],
    fontStyle: getFontStyle(i['fontStyle']),
    fontWeight: getFontWeight(i['fontWeight']),
    forceStrutHeight: i['forceStrutHeight'],
    height: i['height'],
    leading: i['leading'],
    package: i['package'],
  );
}

ToolbarOptions getToolbarOptions(dynamic i) {
  if (i == null) return null;
  return ToolbarOptions(
    copy: i['copy'] ?? false,
    cut: i['cut'] ?? false,
    paste: i['paste'] ?? false,
    selectAll: i['selectAll'] ?? false,
  );
}

Size getSize(dynamic i) {
  if (i == null) return null;
  final String type = i['\$type'];
  if (type == "Size") {
    return Size(i['width'], i['height']);
  } else if (type == "Size.fromHeight") {
    return Size.fromHeight(i['height']);
  } else if (type == "Size.fromWidth") {
    return Size.fromWidth(i['width']);
  } else if (type == "Size.fromRadius") {
    return Size.fromRadius(i['radius']);
  } else if (type == "Size.infinite") {
    return Size.infinite;
  } else if (type == "Size.zero") {
    return Size.zero;
  } else if (type == "Size.square") {
    return Size.square(i['dimension']);
  } else if (type == "Size.lerp") {
    return Size.lerp(getSize(i['a']), getSize(i['b']), i['t']);
  }

  return null;
}

Matrix4 getMatrix4(dynamic i) {
  if (i == null) {
    return null;
  }

  final type = i['\$type'];

  if (type == "Matrix4.zero") {
    return Matrix4.zero();
  } else if (type == "Matrix4.identity") {
    return Matrix4.identity();
  } else if (type == "Matrix4.inverted") {
    return Matrix4.inverted(getMatrix4(i['other']));
  } else if (type == "Matrix4.diagonal3Values") {
    return Matrix4.diagonal3Values(i['x'], i['y'], i['z']);
  } else if (type == "Matrix4.rotationX") {
    return Matrix4.rotationX(i['radians']);
  } else if (type == "Matrix4.rotationY") {
    return Matrix4.rotationY(i['radians']);
  } else if (type == "Matrix4.rotationZ") {
    return Matrix4.rotationZ(i['radians']);
  } else if (type == "Matrix4.skewX") {
    return Matrix4.skewX(i['alpha']);
  } else if (type == "Matrix4.skewY") {
    return Matrix4.skewY(i['beta']);
  } else if (type == "Matrix4.skew") {
    return Matrix4.skew(i['alpha'], i['beta']);
  } else if (type == "Matrix4.translationValues") {
    return Matrix4.translationValues(i['x'], i['y'], i['z']);
  }
  return null;
}


FocusNode getFocusNode(dynamic i) {
  if (i == null) return null;
  return FocusNode(
    canRequestFocus: i['canRequestFocus'] ?? true,
    debugLabel: i['debugLabel'],
    skipTraversal: i['skipTraversal'] ?? false,
    onKey: buildFocusOnKeyCallback(i['onKey']),
  );
}
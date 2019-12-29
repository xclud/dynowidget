import './objectbuilder.dart';
import './objects.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


Rect getRect(dynamic i) {
  if (i == null) return null;

  return null;
  //
}

ColorFilter getColorFilter(String i) {
  if (i == null) {
    return null;
  }

  return null;
  //return ColorFilter.srgbToLinearGamma();
}

Animation<T> getAnimation<T>(dynamic i) {
  return null;
}

CustomClipper<T> getClipper<T>(dynamic i) {
  return null;
}

ImageProvider getImageProvider(dynamic i) {
  if (i == null) {
    return null;
  }

  final type = i['\$type'];

  if (type == 'NetworkImage') {
    return NetworkImage(i['url'], scale: 1);
  }

  if (type == 'FileImage') {
    return FileImage(i['file']);
  }

  return null;
}

DecorationImage getDecorationImage(
    ObjectBuildContext objectcontext, dynamic i) {
  if (i == null) {
    return null;
  }

  return DecorationImage(
      alignment:
          objectcontext.alignment.build(i['alignment']) ?? Alignment.center,
      fit: getBoxFit(i['fit']),
      image: getImageProvider(i['image']),
      matchTextDirection: i['matchTextDirection'] ?? false,
      repeat: getImageRepeat(i['repeat']) ?? ImageRepeat.noRepeat,
      colorFilter: getColorFilter(i['colorFilter']),
      centerSlice: getRect(i['centerSlice']));
}

Decoration getDecoration(ObjectBuildContext objectcontext, dynamic i) {
  if (i == null) {
    return null;
  }

  final String type = i['\$type'];

  if (type == null || type.isEmpty) return null;

  if (type == "BoxDecoration") {
    return BoxDecoration(
      boxShadow: (i['boxShadow'] as List)
          ?.map(getBoxShadow)
          ?.where((box) => box != null)
          ?.toList(),
      image: getDecorationImage(objectcontext, i['image']),
      gradient: objectcontext.gradient.build(i['gradient']),
      shape: getBoxShape(i['shape']) ?? BoxShape.rectangle,
      border: getBorder(i['border']),
      borderRadius: getBorderRadius(i['borderRadius']),
      color: getColor(i['color']),
    );
  }

  return null;
}

InputBorder getInputBorder(dynamic i) {
  if (i == null) {
    return null;
  }
  final String type = i['\$type'];

  if (type == "OutlineInputBorder") {
    return OutlineInputBorder(
        borderRadius: getBorderRadius(i['borderRadius']) ??
            BorderRadius.all(Radius.circular(4)));
  }

  if (type == "UnderlineInputBorder") {
    return UnderlineInputBorder(
        borderRadius: getBorderRadius(i['borderRadius']) ??
            BorderRadius.only(
                topLeft: Radius.circular(4), bottomRight: Radius.circular(4)));
  }

  return null;
}

ShapeBorder getShapeBorder(dynamic i) {
  if (i == null) {
    return null;
  }
  final String type = i['\$type'];

  if (type == "RoundedRectangleBorder") {
    return RoundedRectangleBorder(
        borderRadius: getBorderRadius(i['borderRadius']) ?? BorderRadius.zero);
  }

  if (type == "OutlineInputBorder") {
    return OutlineInputBorder(
        borderRadius: getBorderRadius(i['borderRadius']) ?? BorderRadius.zero);
  }

  if (type == "UnderlineInputBorder") {
    return UnderlineInputBorder(
        borderRadius: getBorderRadius(i['borderRadius']));
  }

  return null;
}

TextInputFormatter getTextInputFormatter(dynamic i) {
  if (i == null) {
    return null;
  }

  final String type = i['\$type'];

  if (type == "WhitelistingTextInputFormatter.digitsOnly")
    return WhitelistingTextInputFormatter.digitsOnly;
  if (type == "BlacklistingTextInputFormatter.singleLineFormatter")
    return BlacklistingTextInputFormatter.singleLineFormatter;

  //TODO: Implement.
  if (type == "BlacklistingTextInputFormatter")
    return BlacklistingTextInputFormatter(
      RegExp(i['blacklistedPattern']),
      replacementString: i['replacementString'] ?? '',
    );
  //if(type == "WhitelistingTextInputFormatter") return WhitelistingTextInputFormatter();
  if (type == "LengthLimitingTextInputFormatter")
    return LengthLimitingTextInputFormatter(i['maxLength']);

  return null;
}

NotchedShape getNotchedShape(dynamic i) {
  if (i == null) return null;
  final String type = i['\$type'];
  if (type == null || type.isEmpty) return null;

  if (type == "AutomaticNotchedShape") {
    return AutomaticNotchedShape(
        getShapeBorder(i['host']), getShapeBorder(i['guest']));
  }

  if (type == "CircularNotchedRectangle") {
    return CircularNotchedRectangle();
  }
  return null;
}

FloatingActionButtonLocation getFloatingActionButtonLocation(dynamic i) {
  if (i == null) return null;
  String type = i['\$type'];

  if (type == null || type.isEmpty) return null;

  if (type == "FloatingActionButtonLocation.centerDocked")
    return FloatingActionButtonLocation.centerDocked;
  if (type == "FloatingActionButtonLocation.centerFloat")
    return FloatingActionButtonLocation.centerFloat;
  if (type == "FloatingActionButtonLocation.endDocked")
    return FloatingActionButtonLocation.endDocked;
  if (type == "FloatingActionButtonLocation.endFloat")
    return FloatingActionButtonLocation.endFloat;
  if (type == "FloatingActionButtonLocation.endTop")
    return FloatingActionButtonLocation.endTop;
  if (type == "FloatingActionButtonLocation.miniStartTop")
    return FloatingActionButtonLocation.miniStartTop;
  if (type == "FloatingActionButtonLocation.startTop")
    return FloatingActionButtonLocation.startTop;

  return null;
}

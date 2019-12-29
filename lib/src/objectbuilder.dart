//import 'package:cached_network_image/cached_network_image.dart';
import 'dart:ui';
import './objects.dart';
import './unfinished.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';

typedef _ObjectBuilder<T> = T Function(dynamic);

class ObjectBuildContext {
  ObjectBuilder<Gradient> _gradient;
  ObjectBuilder<Widget> _widget;
  ObjectBuilder<AlignmentGeometry> _alignment;
  ObjectBuilder<Curve> _curves;
  ObjectBuilder<Function> _functions;

  ObjectBuilder<Widget> get widget => _widget;
  ObjectBuilder<AlignmentGeometry> get alignment => _alignment;
  ObjectBuilder<Gradient> get gradient => _gradient;
  ObjectBuilder<Curve> get curves => _curves;
  _FunctionBuilder get functions => _functions;

  ObjectBuildContext(_ObjectBuilder events) {
    this._widget = _WidgetBuilder(this);
    this._alignment = _AlignmentBuilder(this);
    this._gradient = _GradientBuilder(this);
    this._curves = _CurveBuilder(this);
    this._functions = _FunctionBuilder(this, events);
  }

  InputDecoration getInputDecoration(dynamic i) {
    if (i == null) {
      return null;
    }

    final border = getInputBorder(i['border']);

    return InputDecoration(
      border: border,
      labelText: i['labelText'],
      hintText: i['hintText'],
      helperText: i['helperText'],
      errorText: i['errorText'],
      prefixText: i['prefixText'],
      prefix: _widget.build(i['prefix']),
      prefixIcon: _widget.build(i['prefixIcon']),
      suffixText: i['suffixText'],
      suffix: _widget.build(i['suffix']),
      suffixIcon: _widget.build(i['suffixIcon']),
      contentPadding: getEdgeInsets(i['contentPadding']),
      isDense: i['isDense'],
    );
  }

  PageController getPageController(dynamic i) {
    if (i == null) {
      return null;
    }

    return PageController(
      initialPage: i['initialPage'] ?? 0,
      keepPage: i['keepPage'] ?? true,
      viewportFraction: i['viewportFraction'] ?? 1.0,
    );
  }

  ScrollController getScrollController(dynamic i) {
    if (i == null) {
      return null;
    }

    return ScrollController(
      initialScrollOffset: i['initialScrollOffset'] ?? 0,
      keepScrollOffset: i['keepScrollOffset'] ?? true,
      debugLabel: i['debugLabel'],
    );
  }

  TabController getTabController(dynamic i) {
    if (i == null) {
      return null;
    }

    return TabController(
      initialIndex: i['initialIndex'] ?? 0,
      length: i['length'],
      vsync: null, //TODO: Fix this.
    );
  }

  TextEditingController getTextEditingController(dynamic i) {
    if (i == null) {
      return null;
    }

    return TextEditingController(text: i['text']);
  }
}

class ObjectBuilder<T> {
  final Map<String, _ObjectBuilder<T>> builders = {};
  final ObjectBuildContext objectcontext;

  ObjectBuilder(this.objectcontext);

  T build(dynamic i) {
    if (i == null) {
      return null;
    }

    final String type = i['type'] ?? i['\$type'];

    if (type == null) {
      return null;
    }
    final _ObjectBuilder builder = builders[type];

    if (builder != null) {
      return builder(i);
    }

    return null;
  }
}

class _WidgetBuilder extends ObjectBuilder<Widget> {
  _WidgetBuilder(ObjectBuildContext objectcontext) : super(objectcontext) {
    builders["AbsorbPointer"] = _buildAbsorbPointer;
    //ActionChip
    builders["AlertDialog"] = _buildAlertDialog;
    builders["Align"] = _buildAlign;
    builders["AnimatedCrossFade"] = _buildAnimatedCrossFade;
    //AnimatedIcon
    builders["AnimatedPadding"] = _buildAnimatedPadding;
    builders["AnimatedPositioned"] = _buildAnimatedPositioned;
    builders["AnimatedPositionedDirectional"] =
        _buildAnimatedPositionedDirectional;
    builders["AnimatedSwitcher"] = _buildAnimatedSwitcher;
    builders["AppBar"] = _buildAppBar;
    builders["AspectRatio"] = _buildAspectRatio;
    //BackButton
    //BackButtonIcon
    builders["BackdropFilter"] = _buildBackdropFilter;
    builders["Banner"] = _buildBanner;
    builders["Baseline"] = _buildBaseline;
    builders["BottomAppBar"] = _buildBottomAppBar;
    builders["BottomNavigationBar"] = _buildBottomNavigationBar;
    builders["Card"] = _buildCard;
    builders["Center"] = _buildCenter;
    builders["Checkbox"] = _buildCheckbox;
    builders["CheckboxListTile"] = _buildCheckboxListTile;
    //CheckedModeBanner
    builders["Chip"] = _buildChip;
    builders["ChoiceChip"] = _buildChoiceChip;
    builders["CircleAvatar"] = _buildCircleAvatar;
    builders["CircularProgressIndicator"] = _buildCircularProgressIndicator;
    builders["ClipOval"] = _buildClipOval;
    builders["ClipPath"] = _buildClipPath;
    builders["ClipRect"] = _buildClipRect;
    builders["ClipRRect"] = _buildClipRRect;
    //CloseButton
    builders["ColorFiltered"] = _buildColorFiltered;
    builders["Column"] = _buildColumn;
    builders["ConstrainedBox"] = _buildConstrainedBox;
    builders["Container"] = _buildContainer;
    builders["CustomScrollView"] = _buildCustomScrollView;
    builders["DataTable"] = _buildDataTable;
    //DayPicker
    builders["DefaultTabController"] = _buildDefaultTabController;
    builders["DefaultTextStyle"] = _buildDefaultTextStyle;
    builders["Dialog"] = _buildDialog;
    builders["Directionality"] = _buildDirectionality;
    builders["Dismissible"] = _buildDismissible;
    builders["Divider"] = _buildDivider;
    builders["Draggable"] = _buildDraggable;
    //DraggableScrollableActuator
    builders["Drawer"] = _buildDrawer;
    builders["DrawerController"] = _buildDrawerController;
    builders["DrawerHeader"] = _buildDrawerHeader;
    builders["DropdownButton"] = _buildDropdownButton;
    builders["DropdownMenuItem"] = _buildDropdownMenuItem;
    builders["Expanded"] = _buildExpanded;
    builders["ExpandIcon"] = _buildExpandIcon;
    //widgets["ExpansionPanelList"] = _buildExpansionPanelList;
    builders["ExpansionTile"] = _buildExpansionTile;
    //FadeInImage
    builders["FlatButton"] = _buildFlatButton;
    builders["FlatButton.icon"] = _buildFlatButtonIcon;
    builders["FilterChip"] = _buildFilterChip;
    builders["FittedBox"] = _buildFittedBox;
    builders["Flex"] = _buildFlex;
    builders["Flexible"] = _buildFlexible;
    builders["FlexibleSpaceBar"] = _buildFlexibleSpaceBar;
    builders["FloatingActionButton"] = _buildFloatingActionButton;
    builders["FloatingActionButton.extended"] = _buildFABExtended;
    //widgets["Flow"] = _buildFlow;
    builders["Form"] = _buildForm;
    builders["FractionallySizedBox"] = _buildFractionallySizedBox;
    builders["GestureDetector"] = _buildGestureDetector;
    builders["GridPaper"] = _buildGridPaper;
    builders["GridTile"] = _buildGridTile;
    builders["GridTileBar"] = _buildGridTileBar;
    builders["GridView.count"] = _buildGridViewCount;
    builders["GridView.extent"] = _buildGridViewExtent;
    builders["Hero"] = _buildHero;
    builders["Icon"] = _buildIcon;
    builders["IconButton"] = _buildIconButton;
    builders["IgnorePointer"] = _buildIgnorePointer;
    builders["Image.asset"] = _buildImageAsset;
    builders["Image.network"] = _buildImageNetwork;
    //ImageIcon
    builders["IndexedStack"] = _buildIndexedStack;
    builders["InkWell"] = _buildInkWell;
    //InputChip
    builders["LinearProgressIndicator"] = _buildLinearProgressIndicator;
    builders["ListBody"] = _buildListBody;
    builders["ListTile"] = _buildListTile;
    builders["ListView"] = _buildListView;
    builders["MaterialBanner"] = _buildMaterialBanner;
    //ModalBarrier
    builders["NavigationToolbar"] = _buildNavigationToolbar;
    //NotificationListener
    builders["Opacity"] = _buildOpacity;
    builders["OverflowBox"] = _buildOverflowBox;
    builders["Padding"] = _buildPadding;
    //PageStorage
    builders["PageView"] = _buildPageView;
    builders["Positioned"] = _buildPositioned;
    builders["Positioned.directional"] = _buildPositionedDotDirectional;
    builders["PositionedDirectional"] = _buildPositionedDirectional;
    builders["Radio"] = _buildRadio;
    builders["RadioListTile"] = _buildRadioListTile;
    builders["RaisedButton"] = _buildRaisedButton;
    builders["RangeSlider"] = _buildRangeSlider;
    builders["RefreshIndicator"] = _buildRefreshIndicator;
    builders["ReorderableListView"] = _buildReorderableListView;
    builders["RichText"] = _buildRichText;
    builders["Row"] = _buildRow;
    builders["SafeArea"] = _buildSafeArea;
    builders["Scaffold"] = _buildScaffold;
    builders["ScaleTransition"] = _buildScaleTransition;
    builders["SelectableText"] = _buildSelectableText;
    builders["SelectableText.rich"] = _buildSelectableTextRich;
    builders["Semantics"] = _buildSemantics;
    builders["SimpleDialog"] = _buildSimpleDialog;
    //SimpleDialogOption
    builders["SingleChildScrollView"] = _buildSingleChildScrollView;
    builders["SizedBox"] = _buildSizedBox;
    builders["SizedBox.expand"] = _buildSizedBoxExpand;
    builders["SizedBox.fromSize"] = _buildSizedBoxFromSize;
    builders["SizedBox.shrink"] = _buildSizedBoxShrink;
    builders["SizedOverflowBox"] = _buildSizedOverflowBox;
    builders["Slider"] = _buildSlider;
    builders["Slider.adaptive"] = _buildSliderAdaptive;
    builders["SliverAppBar"] = _buildSliverAppBar;
    builders["SliverGrid.extent"] = _buildSliverGridExtent;
    //widgets["SliverList"] = _buildSliverList;
    builders["SliverPadding"] = _buildSliverPadding;
    //SliverPersistentHeader
    //SliverSafeArea
    builders["SliverToBoxAdapter"] = _buildSliverToBoxAdapter;
    //SnackBar
    builders["Stack"] = _buildStack;
    builders["Stepper"] = _buildStepper;
    builders["Switch"] = _buildSwitch;
    builders["Switch.adaptive"] = _buildSwitchAdaptive;
    builders["SwitchListTile"] = _buildSwitchListTile;
    builders["SwitchListTile.adaptive"] = _buildSwitchListTileAdaptive;
    builders["Tab"] = _buildTab;
    builders["TabBar"] = _buildTabBar;
    builders["TabBarView"] = _buildTabBarView;
    //TabPageSelector
    //TabPageSelectorIndicator
    builders["Text"] = _buildText;
    builders["Text.rich"] = _buildTextRich;
    builders["TextField"] = _buildTextField;
    builders["TextFormField"] = _buildTextFormField;
    //Title
    //ToggleButtons
    builders["Tooltip"] = _buildTooltip;
    builders["Transform"] = _buildTransform;
    builders["UnconstrainedBox"] = _buildUnconstrainedBox;
    builders["UserAccountsDrawerHeader"] = _buildUserAccountsDrawerHeader;
    builders["VerticalDivider"] = _buildVerticalDivider;
    builders["Viewport"] = _buildViewport;
    //Visibility
    builders["WillPopScope"] = _buildWillPopScope;
    builders["Wrap"] = _buildWrap;
  }

  Widget _build(dynamic i) {
    if (i == null) {
      return null;
    }

    final String type = i['\$type'] ?? i['type'];

    if (type == null) {
      return null;
    }
    final object = objectcontext.widget.build(i);

    if (object != null) {
      return object;
    }

    print('Dummy: $type');
    return Text('Dummy: $type');
  }

  AbsorbPointer _buildAbsorbPointer(dynamic i) {
    return AbsorbPointer(
      absorbing: i['absorbing'] ?? true,
      ignoringSemantics: i['ignoringSemantics'],
      child: _build(i['child']),
    );
  }

  AlertDialog _buildAlertDialog(dynamic i) {
    return AlertDialog(
      actions:
          (i['actions'] as List<dynamic>)?.map((ii) => _build(ii))?.toList(),
      backgroundColor: getColor(i['backgroundColor']),
      content: _build(i['content']),
      contentPadding: getEdgeInsets(i['contentPadding']) ??
          const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
      contentTextStyle: getTextStyle(i['contentTextStyle']),
      elevation: i['elevation'],
      semanticLabel: i['semanticLabel'],
      shape: getShapeBorder(i['shape']),
      title: _build(i['title']),
      titlePadding: getEdgeInsets(i['titlePadding']),
      titleTextStyle: getTextStyle(i['titleTextStyle']),
    );
  }

  AnimatedPadding _buildAnimatedPadding(dynamic i) {
    return AnimatedPadding(
      duration: getDuration(i['duration']),
      padding: getEdgeInsets(i['padding']),
      child: _build(i['child']),
      curve: objectcontext.curves.build(i['curve']) ?? Curves.linear,
      onEnd: objectcontext.functions.buildVoidCallback(i['onEnd']),
    );
  }

  AnimatedPositioned _buildAnimatedPositioned(dynamic i) {
    return AnimatedPositioned(
      child: _build(i['child']),
      duration: getDuration(i['duration']),
      bottom: i['bottom'],
      curve: objectcontext.curves.build(i['curve']) ?? Curves.linear,
      height: i['height'],
      left: i['left'],
      right: i['right'],
      top: i['top'],
      width: i['width'],
      onEnd: objectcontext.functions.buildVoidCallback(i['onEnd']),
    );
  }

  AnimatedPositionedDirectional _buildAnimatedPositionedDirectional(dynamic i) {
    return AnimatedPositionedDirectional(
      child: _build(i['child']),
      duration: getDuration(i['duration']),
      bottom: i['bottom'],
      curve: objectcontext.curves.build(i['curve']) ?? Curves.linear,
      height: i['height'],
      start: i['left'],
      end: i['right'],
      top: i['top'],
      width: i['width'],
      onEnd: objectcontext.functions.buildVoidCallback(i['onEnd']),
    );
  }

  AnimatedSwitcher _buildAnimatedSwitcher(dynamic i) {
    return AnimatedSwitcher(
      duration: getDuration(i['duration']),
      child: _build(i['child']),
      reverseDuration: getDuration(i['reverseDuration']),
      //layoutBuilder:
      switchInCurve:
          objectcontext.curves.build(i['switchInCurve']) ?? Curves.linear,
      switchOutCurve:
          objectcontext.curves.build(i['switchOutCurve']) ?? Curves.linear,
      //transitionBuilder:
    );
  }

  BackdropFilter _buildBackdropFilter(dynamic i) {
    return BackdropFilter(
      child: _build(i['child']),
      filter: null,
      //filter: i[''],
    );
  }

  Baseline _buildBaseline(dynamic i) {
    return Baseline(
      baseline: i['baseline'],
      baselineType: getTextBaseline(i['baselineType']),
      child: _build(i['child']),
    );
  }

  ChoiceChip _buildChoiceChip(dynamic i) {
    return ChoiceChip(
      label: _build(i['label']),
      selected: i['selected'],
      autofocus: i['autofocus'] ?? false,
      avatar: _build(i['avatar']),
      avatarBorder: getShapeBorder(i['avatarBorder']) ?? const CircleBorder(),
      backgroundColor: getColor(i['backgroundColor']),
      clipBehavior: getClip(i['clipBehavior']) ?? Clip.none,
      disabledColor: getColor(i['disabledColor']),
      elevation: i['elevation'],
      focusNode: getFocusNode(i['focusNode']),
      labelPadding: getEdgeInsets(i['labelPadding']),
      labelStyle: getTextStyle(i['labelStyle']),
      materialTapTargetSize:
          getMaterialTapTargetSize(i['materialTapTargetSize']),
      onSelected: objectcontext.functions.buildValueChanged(i['onSelected']),
      padding: getEdgeInsets(i['padding']),
      pressElevation: i['pressElevation'],
      selectedColor: getColor(i['selectedColor']),
      selectedShadowColor: getColor(i['selectedShadowColor']),
      shadowColor: getColor(i['shadowColor']),
      shape: getShapeBorder(i['shape']),
      tooltip: i['tooltip'],
    );
  }

  CircularProgressIndicator _buildCircularProgressIndicator(dynamic i) {
    return CircularProgressIndicator(
      backgroundColor: getColor(i['backgroundColor']),
      semanticsLabel: i['semanticsLabel'],
      semanticsValue: i['semanticsValue'],
      strokeWidth: i['strokeWidth'] ?? 4,
      value: i['value'],
      valueColor: getAnimation(i['valueColor']),
    );
  }

  ColorFiltered _buildColorFiltered(dynamic i) {
    return ColorFiltered(
      //colorFilter: ,
      colorFilter: null,
      child: _build(i['child']),
    );
  }

  // DataTable _buildDataTable(dynamic i) {
  //   return DataTable();
  // }

  Dialog _buildDialog(dynamic i) {
    return Dialog(
      child: _build(i['child']),
      backgroundColor: getColor(i['backgroundColor']),
      elevation: i['elevation'],
      insetAnimationCurve:
          objectcontext.curves.build(i['insetAnimationCurve']) ??
              Curves.decelerate,
      insetAnimationDuration: getDuration(i['insetAnimationDuration']) ??
          const Duration(milliseconds: 100),
      shape: getShapeBorder(i['shape']),
    );
  }

  Directionality _buildDirectionality(dynamic i) {
    return Directionality(
      child: _build(i['child']),
      textDirection: getTextDirection(i['textDirection']),
    );
  }

  Dismissible _buildDismissible(dynamic i) {
    return Dismissible(
      key: null, //TODO: Add key.
      child: _build(i['child']),
      background: _build(i['background']),
      //confirmDismiss: ,
      crossAxisEndOffset: i['crossAxisEndOffset'] ?? 0.0,
      direction: getDismissDirection(i['direction']),
      //dismissThresholds: ,
      dragStartBehavior: getDragStartBehavior(i['dragStartBehavior']) ??
          DragStartBehavior.start,
      movementDuration: getDuration(i['movementDuration']) ??
          const Duration(milliseconds: 200),
      onDismissed: objectcontext.functions.buildValueChanged(i['onDismissed']),
      onResize: objectcontext.functions.buildVoidCallback(i['onResize']),
      resizeDuration:
          getDuration(i['resizeDuration']) ?? const Duration(milliseconds: 300),
      secondaryBackground: _build(i['secondaryBackground']),
    );
  }

  Draggable _buildDraggable(dynamic i) {
    //TODO: Complete.
    return Draggable(
      child: _build(i['child']),
      feedback: _build(i['feedback']),
    );
  }

  Drawer _buildDrawer(dynamic i) {
    return Drawer(
      child: _build(i['child']),
      elevation: i['elevation'] ?? 16.0,
      semanticLabel: i['semanticLabel'],
    );
  }

  DrawerController _buildDrawerController(dynamic i) {
    return DrawerController(
      alignment: getDrawerAlignment(i['alignment']),
      child: _build(i['child']),
      dragStartBehavior: getDragStartBehavior(i['dragStartBehavior']) ??
          DragStartBehavior.start,
      drawerCallback:
          objectcontext.functions.buildValueChanged(i['drawerCallback']),
      edgeDragWidth: i['edgeDragWidth'],
      scrimColor: getColor(i['scrimColor']),
    );
  }

  DrawerHeader _buildDrawerHeader(dynamic i) {
    return DrawerHeader(
      child: _build(i['child']),
      curve: objectcontext.curves.build(i['curve']) ?? Curves.fastOutSlowIn,
      decoration: getDecoration(objectcontext, i['decoration']),
      duration: getDuration(i['duration']) ?? const Duration(milliseconds: 250),
      margin: getEdgeInsets(i['margin']) ?? const EdgeInsets.only(bottom: 8),
      padding: getEdgeInsets(i['padding']) ??
          const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
    );
  }

  ExpandIcon _buildExpandIcon(dynamic i) {
    return ExpandIcon(
      color: getColor(i['color']),
      disabledColor: getColor(i['disabledColor']),
      expandedColor: getColor(i['expandedColor']),
      isExpanded: i['isExpanded'] ?? false,
      size: i['size'] ?? 24,
      onPressed: objectcontext.functions.buildValueChanged(i['onPressed']),
      padding: getEdgeInsets(i['padding']) ?? const EdgeInsets.all(8),
    );
  }
//  ExpansionPanelCallback _buildExpansionPanelCallback(dynamic args)
//   {
// return null;
//   }
//   ExpansionPanel _buildExpansionPanel(dynamic i) {
//     return ExpansionPanel(
//       animationDuration: _getDuration(i['animationDuration'])??const Duration(milliseconds: 200),
//       expansionCallback: _buildExpansionPanelCallback(i['expansionCallback']),
//       children: ,
//     );
//   }

//   ExpansionPanelList _buildExpansionPanelList(dynamic i) {
//     return ExpansionPanelList(
//       animationDuration: _getDuration(i['animationDuration'])??const Duration(milliseconds: 200),
//       expansionCallback: _buildExpansionPanelCallback(i['expansionCallback']),
//       children: ,
//     );
//   }

  ExpansionTile _buildExpansionTile(dynamic i) {
    return ExpansionTile(
      leading: _build(i['leading']),
      title: _build(i['title']),
      backgroundColor: i['backgroundColor'],
      children:
          (i['children'] as List<dynamic>)?.map((ii) => _build(ii))?.toList() ??
              const <Widget>[],
      initiallyExpanded: i['initiallyExpanded'] ?? false,
      onExpansionChanged:
          objectcontext.functions.buildValueChanged(i['onExpansionChanged']),
      trailing: _build(i['trailing']),
    );
  }

  FlatButton _buildFlatButton(dynamic i) {
    return FlatButton(
      child: _build(i['child']),
      onPressed: objectcontext.functions.buildVoidCallback(i['onPressed']),
      autofocus: i['autofocus'] ?? false,
      clipBehavior: i['clipBehavior'] ?? Clip.none,
      color: getColor(i['color']),
      colorBrightness: getBrightness(i['colorBrightness']),
      disabledColor: getColor(i['disabledColor']),
      disabledTextColor: getColor(i['disabledTextColor']),
      focusColor: getColor(i['focusColor']),
      focusNode: getFocusNode(i['focusNode']),
      highlightColor: getColor(i['highlightColor']),
      hoverColor: getColor(i['hoverColor']),
      onHighlightChanged:
          objectcontext.functions.buildValueChanged(i['onHighlightChanged']),
      padding: getEdgeInsets(i['padding']),
      shape: getShapeBorder(i['shape']),
      splashColor: getColor(i['splashColor']),
      textColor: getColor(i['textColor']),
      textTheme: getButtonTextTheme(i['textTheme']),
      materialTapTargetSize:
          getMaterialTapTargetSize(i['materialTapTargetSize']),
    );
  }

  FlatButton _buildFlatButtonIcon(dynamic i) {
    return FlatButton.icon(
      label: _build(i['label']),
      icon: _build(i['icon']),
      onPressed: objectcontext.functions.buildVoidCallback(i['onPressed']),
      autofocus: i['autofocus'] ?? false,
      clipBehavior: i['clipBehavior'] ?? Clip.none,
      color: getColor(i['color']),
      colorBrightness: getBrightness(i['colorBrightness']),
      disabledColor: getColor(i['disabledColor']),
      disabledTextColor: getColor(i['disabledTextColor']),
      focusColor: getColor(i['focusColor']),
      focusNode: getFocusNode(i['focusNode']),
      highlightColor: getColor(i['highlightColor']),
      hoverColor: getColor(i['hoverColor']),
      onHighlightChanged:
          objectcontext.functions.buildValueChanged(i['onHighlightChanged']),
      padding: getEdgeInsets(i['padding']),
      shape: getShapeBorder(i['shape']),
      splashColor: getColor(i['splashColor']),
      textColor: getColor(i['textColor']),
      textTheme: getButtonTextTheme(i['textTheme']),
      materialTapTargetSize:
          getMaterialTapTargetSize(i['materialTapTargetSize']),
    );
  }

  // Flow _buildFlow(dynamic i) {
  //   return Flow();
  // }

  GridPaper _buildGridPaper(dynamic i) {
    return GridPaper(
      child: _build(i['child']),
      divisions: i['divisions'] ?? 2,
      color: getColor(i['color']) ?? Color(0x7FC3E8F3),
      interval: i['interval'] ?? 100.0,
      subdivisions: i['subdivisions'] ?? 5,
    );
  }

  InkWell _buildInkWell(dynamic i) {
    return InkWell(
      child: _build(i['child']),
      borderRadius: getBorderRadius(i['borderRadius']),
      customBorder: getShapeBorder(i['customBorder']),
      enableFeedback: i['enableFeedback'] ?? true,
      excludeFromSemantics: i['excludeFromSemantics'] ?? false,
      focusColor: getColor(i['focusColor']),
      highlightColor: getColor(i['highlightColor']),
      hoverColor: getColor(i['hoverColor']),
      onDoubleTap: objectcontext.functions.buildVoidCallback(i['onDoubleTap']),
      onHighlightChanged:
          objectcontext.functions.buildValueChanged(i['onHighlightChanged']),
      onHover: objectcontext.functions.buildValueChanged(i['onHover']),
      onLongPress: objectcontext.functions.buildVoidCallback(i['onLongPress']),
      onTap: objectcontext.functions.buildVoidCallback(i['onTap']),
      onTapCancel: objectcontext.functions.buildVoidCallback(i['onTapCancel']),
      onTapDown: objectcontext.functions.buildValueChanged(i['onTapDown']),
      radius: i['radius'],
      splashColor: getColor(i['splashColor']),
      //splashFactory: ,
    );
  }

  LinearProgressIndicator _buildLinearProgressIndicator(dynamic i) {
    return LinearProgressIndicator(
      backgroundColor: getColor(i['backgroundColor']),
      semanticsLabel: i['semanticsLabel'],
      semanticsValue: i['semanticsValue'],
      value: i['value'],
      valueColor: getAnimation<Color>(i['valueColor']),
    );
  }

  ListBody _buildListBody(dynamic i) {
    return ListBody(
      children:
          (i['children'] as List<dynamic>)?.map((ii) => _build(ii))?.toList() ??
              const <Widget>[],
      mainAxis: getAxis(i['mainAxis']) ?? Axis.vertical,
      reverse: i['reverse'] ?? false,
    );
  }

  MaterialBanner _buildMaterialBanner(dynamic i) {
    return MaterialBanner(
      actions:
          (i['actions'] as List<dynamic>)?.map((ii) => _build(ii))?.toList(),
      backgroundColor: getColor(i['backgroundColor']),
      content: _build(i['content']),
      contentTextStyle: getTextStyle(i['contentTextStyle']),
      forceActionsBelow: i['forceActionsBelow'] ?? false,
      leading: _build(i['leading']),
      leadingPadding: getEdgeInsets(i['leadingPadding']),
      padding: getEdgeInsets(i['padding']),
    );
  }

  NavigationToolbar _buildNavigationToolbar(dynamic i) {
    return NavigationToolbar(
      centerMiddle: i['centerMiddle'] ?? true,
      leading: _build(i['leading']),
      middle: _build(i['middle']),
      middleSpacing: i['middleSpacing'] ?? 16,
      trailing: _build(i['trailing']),
    );
  }

  Radio _buildRadio(dynamic i) {
    return Radio(
      activeColor: getColor(i['activeColor']),
      groupValue: i['groupValue'],
      onChanged: objectcontext.functions.buildValueChanged(i['onChanged']),
      value: i['value'],
      materialTapTargetSize:
          getMaterialTapTargetSize(i['materialTapTargetSize']),
    );
  }

  RadioListTile _buildRadioListTile(dynamic i) {
    return RadioListTile(
      activeColor: getColor(i['activeColor']),
      groupValue: i['groupValue'],
      onChanged: objectcontext.functions.buildValueChanged(i['onChanged']),
      value: i['value'],
      controlAffinity: getListTileControlAffinity(i['controlAffinity']) ??
          ListTileControlAffinity.platform,
      title: _build(i['title']),
      dense: i['dense'],
      isThreeLine: i['isThreeLine'] ?? false,
      secondary: _build(i['secondary']),
      selected: i['selected'] ?? false,
      subtitle: _build(i['subtitle']),
    );
  }

  RangeSlider _buildRangeSlider(dynamic i) {
    return RangeSlider(
      activeColor: getColor(i['activeColor']),
      inactiveColor: getColor(i['inactiveColor']),
      values: getRangeValues(i['values']),
      labels: getRangeLabels(i['labels']),
      divisions: i['divisions'],
      max: i['max'] ?? 1,
      min: i['min'] ?? 0,
      onChanged: objectcontext.functions.buildValueChanged(i['onChanged']),
      onChangeEnd: objectcontext.functions.buildValueChanged(i['onChangeEnd']),
      onChangeStart:
          objectcontext.functions.buildValueChanged(i['onChangeStart']),
      //semanticFormatterCallback: ,
    );
  }

  ReorderableListView _buildReorderableListView(dynamic i) {
    return ReorderableListView(
      onReorder: objectcontext.functions.buildOnReorder(i['onReorder']),
      header: _build(i['header']),
      children:
          (i['children'] as List<dynamic>)?.map((ii) => _build(ii))?.toList(),
      padding: getEdgeInsets(i['padding']),
      reverse: i['reverse'] ?? false,
      scrollDirection: getAxis(i['scrollDirection']) ?? Axis.vertical,
    );
  }

  ScaleTransition _buildScaleTransition(dynamic i) {
    return ScaleTransition(
      scale: getAnimation(i['scale']),
      alignment:
          objectcontext.alignment.build(i['alignment']) ?? Alignment.center,
      child: _build(i['child']),
    );
  }

  SelectableText _buildSelectableText(dynamic i) {
    return SelectableText(
      i['data'] ?? '',
      autofocus: i['autofocus'] ?? false,
      cursorColor: getColor(i['cursorColor']),
      cursorRadius: getRadius(i['cursorRadius']),
      cursorWidth: i['cursorWidth'] ?? 2,
      dragStartBehavior: getDragStartBehavior(i['dragStartBehavior']) ??
          DragStartBehavior.start,
      enableInteractiveSelection: i['enableInteractiveSelection'] ?? true,
      focusNode: getFocusNode(i['focusNode']),
      maxLines: i['maxLines'],
      onTap: objectcontext.functions.buildVoidCallback(i['onTap']),
      scrollPhysics: getScrollPhysics(i['scrollPhysics']),
      showCursor: i['showCursor'] ?? false,
      strutStyle: getStrutStyle(i['strutStyle']),
      style: getTextStyle(i['style']),
      textAlign: getTextAlign(i['textAlign']),
      textDirection: getTextDirection(i['textDirection']),
      textWidthBasis: getTextWidthBasis(i['textWidthBasis']),
      toolbarOptions: getToolbarOptions(i['toolbarOptions']),
    );
  }

  SelectableText _buildSelectableTextRich(dynamic i) {
    return SelectableText.rich(
      _buildInlineSpan(i['textSpan']),
      autofocus: i['autofocus'] ?? false,
      cursorColor: getColor(i['cursorColor']),
      cursorRadius: getRadius(i['cursorRadius']),
      cursorWidth: i['cursorWidth'] ?? 2,
      dragStartBehavior: getDragStartBehavior(i['dragStartBehavior']) ??
          DragStartBehavior.start,
      enableInteractiveSelection: i['enableInteractiveSelection'] ?? true,
      focusNode: getFocusNode(i['focusNode']),
      maxLines: i['maxLines'],
      onTap: objectcontext.functions.buildVoidCallback(i['onTap']),
      scrollPhysics: getScrollPhysics(i['scrollPhysics']),
      showCursor: i['showCursor'] ?? false,
      strutStyle: getStrutStyle(i['strutStyle']),
      style: getTextStyle(i['style']),
      textAlign: getTextAlign(i['textAlign']),
      textDirection: getTextDirection(i['textDirection']),
      textWidthBasis: getTextWidthBasis(i['textWidthBasis']),
      toolbarOptions: getToolbarOptions(i['toolbarOptions']),
    );
  }

  Semantics _buildSemantics(dynamic i) {
    return Semantics();
  }

  SimpleDialog _buildSimpleDialog(dynamic i) {
    return SimpleDialog();
  }

  Slider _buildSlider(dynamic i) {
    return Slider(
      onChanged: objectcontext.functions.buildValueChanged(i['onChanged']),
      value: i['value'],
      activeColor: getColor(i['activeColor']),
      divisions: i['divisions'],
      inactiveColor: getColor(i['inactiveColor']),
      label: i['label'],
      max: i['max'] ?? 1,
      min: i['min'] ?? 0,
      onChangeEnd: objectcontext.functions.buildValueChanged(i['onChangeEnd']),
      onChangeStart:
          objectcontext.functions.buildValueChanged(i['onChangeStart']),
      //semanticFormatterCallback: ,
    );
  }

  Slider _buildSliderAdaptive(dynamic i) {
    return Slider.adaptive(
      onChanged: objectcontext.functions.buildValueChanged(i['onChanged']),
      value: i['value'],
      activeColor: getColor(i['activeColor']),
      divisions: i['divisions'],
      inactiveColor: getColor(i['inactiveColor']),
      label: i['label'],
      max: i['max'] ?? 1,
      min: i['min'] ?? 0,
      onChangeEnd: objectcontext.functions.buildValueChanged(i['onChangeEnd']),
      onChangeStart:
          objectcontext.functions.buildValueChanged(i['onChangeStart']),
      //semanticFormatterCallback: ,
    );
  }

  // SliverList _buildSliverList(dynamic i) {
  //   return SliverList();
  // }

  Stepper _buildStepper(dynamic i) {
    return Stepper(
      steps:
          (i['steps'] as List<dynamic>)?.map((ii) => _buildStep(ii))?.toList(),
      onStepCancel:
          objectcontext.functions.buildVoidCallback(i['onStepCancel']),
      currentStep: i['currentStep'] ?? 0,
      type: getStepperType(i['type']) ?? StepperType.vertical,
      onStepContinue:
          objectcontext.functions.buildVoidCallback(i['onStepContinue']),
      onStepTapped:
          objectcontext.functions.buildValueChanged(i['onStepTapped']),
      physics: getScrollPhysics(i['physics']),
    );
  }

  Step _buildStep(dynamic i) {
    return Step(
      content: _build(i['content']),
      title: _build(i['title']),
      subtitle: _build(i['subtitle']),
      state: getStepState(i['state']) ?? StepState.indexed,
      isActive: i['isActive'] ?? false,
    );
  }

  Switch _buildSwitch(dynamic i) {
    return Switch(
      activeColor: getColor(i['activeColor']),
      activeThumbImage: getImageProvider(i['activeThumbImage']),
      activeTrackColor: getColor(i['activeTrackColor']),
      dragStartBehavior: getDragStartBehavior(i['dragStartBehavior']) ??
          DragStartBehavior.start,
      inactiveThumbColor: getColor(i['inactiveThumbColor']),
      inactiveThumbImage: getImageProvider(i['inactiveThumbImage']),
      inactiveTrackColor: getColor(i['inactiveTrackColor']),
      materialTapTargetSize:
          getMaterialTapTargetSize(i['materialTapTargetSize']),
      onChanged: objectcontext.functions.buildValueChanged(i['onChanged']),
      value: i['value'],
    );
  }

  Switch _buildSwitchAdaptive(dynamic i) {
    return Switch.adaptive(
      activeColor: getColor(i['activeColor']),
      activeThumbImage: getImageProvider(i['activeThumbImage']),
      activeTrackColor: getColor(i['activeTrackColor']),
      dragStartBehavior: getDragStartBehavior(i['dragStartBehavior']) ??
          DragStartBehavior.start,
      inactiveThumbColor: getColor(i['inactiveThumbColor']),
      inactiveThumbImage: getImageProvider(i['inactiveThumbImage']),
      inactiveTrackColor: getColor(i['inactiveTrackColor']),
      materialTapTargetSize:
          getMaterialTapTargetSize(i['materialTapTargetSize']),
      onChanged: objectcontext.functions.buildValueChanged(i['onChanged']),
      value: i['value'],
    );
  }

  Transform _buildTransform(dynamic i) {
    return Transform(
      alignment: objectcontext.alignment.build(i['alignment']),
      child: _build(i['child']),
      origin: getOffset(i['origin']),
      transformHitTests: i['transformHitTests'] ?? true,
      transform: getMatrix4(i['transform']) ?? Matrix4.identity(),
    );
  }

  UserAccountsDrawerHeader _buildUserAccountsDrawerHeader(dynamic i) {
    return UserAccountsDrawerHeader(
      accountName: _build(i['accountName']),
      accountEmail: _build(i['accountEmail']),
      arrowColor: getColor(i['arrowColor']),
      currentAccountPicture: _build(i['currentAccountPicture']),
      decoration: getDecoration(objectcontext, i['decoration']),
      margin: getEdgeInsets(i['margin']) ?? const EdgeInsets.only(bottom: 8),
      onDetailsPressed:
          objectcontext.functions.buildVoidCallback(i['onDetailsPressed']),
      otherAccountsPictures: (i['otherAccountsPictures'] as List<dynamic>)
          ?.map((ii) => _build(ii))
          ?.toList(),
    );
  }

  VerticalDivider _buildVerticalDivider(dynamic i) {
    return VerticalDivider(
      color: getColor(i['color']),
      width: i['width'],
      endIndent: i['endIndent'],
      indent: i['indent'],
      thickness: i['thickness'],
    );
  }

  Viewport _buildViewport(dynamic i) {
    return Viewport(
      anchor: i['anchor' ?? 0],
      axisDirection: getAxisDirection(i['axisDirection']),
      cacheExtent: i['cacheExtent'],
      //center: ,
      crossAxisDirection: getAxisDirection(i['crossAxisDirection']),
      slivers:
          (i['slivers'] as List<dynamic>)?.map((ii) => _build(ii))?.toList() ??
              const <Widget>[],

      offset: getViewportOffset(i['offset']),
    );
  }

  Align _buildAlign(dynamic i) {
    return Align(
      child: _build(i['child']),
      alignment:
          objectcontext.alignment.build(i['alignment']) ?? Alignment.center,
      widthFactor: i['widthFactor'],
      heightFactor: i['heightFactor'],
    );
  }

  AnimatedCrossFade _buildAnimatedCrossFade(dynamic i) {
    return AnimatedCrossFade(
      firstChild: _build(i['firstChild']),
      secondChild: _build(i['secondChild']),
      duration: Duration(seconds: i['duration']),
      reverseDuration: Duration(seconds: i['reverseDuration']),
      crossFadeState: getCrossFadeState(i['crossFadeState']),
      alignment:
          objectcontext.alignment.build(i['alignment']) ?? Alignment.topCenter,

      firstCurve: objectcontext.curves.build(i['firstCurve']) ?? Curves.linear,
      secondCurve:
          objectcontext.curves.build(i['secondCurve']) ?? Curves.linear,
      sizeCurve: objectcontext.curves.build(i['sizeCurve']) ?? Curves.linear,
      //layoutBuilder: ,
    );
  }

  AppBar _buildAppBar(dynamic i) {
    return AppBar(
      actions:
          (i['actions'] as List<dynamic>)?.map((ii) => _build(ii))?.toList(),
      title: _build(i['title']),
      bottom: _build(i['bottom']),
      bottomOpacity: i['bottomOpacity'] ?? 1,
      primary: i['primary'] ?? true,
      brightness: getBrightness(i['brightness']),
      titleSpacing: i['titleSpacing'] ?? NavigationToolbar.kMiddleSpacing,
      toolbarOpacity: i['toolbarOpacity'] ?? 1,
      shape: getShapeBorder(i['shape']),
      automaticallyImplyLeading: i['automaticallyImplyLeading'] ?? true,
      textTheme: getTextTheme(i['textTheme']),
      leading: _build(i['leading']),
      flexibleSpace: _build(i['flexibleSpace']),
      centerTitle: i['centerTitle'],
      elevation: i['elevation'],
      backgroundColor: getColor(i['backgroundColor']),
      actionsIconTheme: getIconThemeData(i['actionsIconTheme']),
      iconTheme: getIconThemeData(i['iconTheme']),
    );
  }

  AspectRatio _buildAspectRatio(dynamic i) {
    return AspectRatio(
      aspectRatio: i['aspectRatio'],
      child: _build(i['child']),
    );
  }

  Banner _buildBanner(dynamic i) {
    return Banner(
      message: i['message'],
      child: _build(i['child']),
      color: getColor(i['color']) ?? Color(0xA0B71C1C),
      location: getBannerLocation(i['location']),
      layoutDirection: getTextDirection(i['layoutDirection']),
      textDirection: getTextDirection(i['textDirection']),
      textStyle: getTextStyle(i['textStyle']) ??
          const TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 12 * 0.85,
            fontWeight: FontWeight.w900,
            height: 1.0,
          ),
    );
  }

  BottomAppBar _buildBottomAppBar(dynamic i) {
    return BottomAppBar(
      child: _build(i['child']),
      color: getColor(i['color']),
      elevation: i['elevation'],
      notchMargin: i['notchMargin'] ?? 4,
      shape: getNotchedShape(i['shape']),
      clipBehavior: getClip(i['clipBehavior']) ?? Clip.none,
    );
  }

  BottomNavigationBar _buildBottomNavigationBar(dynamic i) {
    return BottomNavigationBar(
      backgroundColor: getColor(i['backgroundColor']),
      currentIndex: i['currentIndex'] ?? 0,
      elevation: i['elevation'] ?? 8,
      fixedColor: getColor(i['fixedColor']),
      iconSize: i['iconSize'] ?? 24,
      onTap: objectcontext.functions.buildValueChanged(i['onTap']),
      selectedFontSize: i['selectedFontSize'] ?? 14,
      selectedIconTheme:
          getIconThemeData(i['selectedIconTheme']) ?? const IconThemeData(),
      selectedItemColor: getColor(i['selectedItemColor']),
      selectedLabelStyle: getTextStyle(i['selectedLabelStyle']),
      showSelectedLabels: i['showSelectedLabels'] ?? true,
      showUnselectedLabels: i['showUnselectedLabels'],
      type: getBottomNavigationBarType(i['type']),
      unselectedFontSize: i['unselectedFontSize'] ?? 12,
      unselectedIconTheme:
          getIconThemeData(i['unselectedIconTheme']) ?? const IconThemeData(),
      unselectedItemColor: getColor(i['unselectedItemColor']),
      unselectedLabelStyle: getTextStyle(i['unselectedLabelStyle']),
      items: (i['items'] as List<dynamic>)
          .map(
            (f) => BottomNavigationBarItem(
                icon: _build(f['icon']),
                title: _build(f['title']),
                activeIcon: _build(f['activeIcon']),
                backgroundColor: getColor(f['backgroundColor'])),
          )
          .toList(),
    );
  }

  Card _buildCard(dynamic i) {
    return Card(
      clipBehavior: getClip(i['clipBehavior']),
      shape: getShapeBorder(i['shape']),
      child: _build(i['child']),
      color: getColor(i['color']),
      margin: getEdgeInsets(i['margin']),
      semanticContainer: i['semanticContainer'] ?? true,
      borderOnForeground: i['borderOnForeground'] ?? true,
      elevation: i['elevation'],
    );
  }

  Center _buildCenter(dynamic i) {
    return Center(
      child: _build(i['child']),
      widthFactor: i['widthFactor'],
      heightFactor: i['heightFactor'],
    );
  }

  Checkbox _buildCheckbox(dynamic i) {
    return Checkbox(
      value: i['value'],
      tristate: i['tristate'] ?? false,
      activeColor: getColor(i['activeColor']),
      checkColor: getColor(i['checkColor']),
      onChanged: objectcontext.functions.buildValueChanged(i['onChanged']),
      materialTapTargetSize:
          getMaterialTapTargetSize(i['materialTapTargetSize']),
    );
  }

  CheckboxListTile _buildCheckboxListTile(dynamic i) {
    return CheckboxListTile(
      onChanged: objectcontext.functions.buildValueChanged(i['onChanged']),
      value: i['value'],
      activeColor: getColor(i['activeColor']),
      checkColor: getColor(i['checkColor']),
      dense: i['dense'],
      isThreeLine: i['isThreeLine'] ?? false,
      secondary: _build(i['secondary']),
      selected: i['selected'] ?? false,
      subtitle: _build(i['subtitle']),
      title: _build(i['title']),
      controlAffinity: getListTileControlAffinity(i['controlAffinity']) ??
          ListTileControlAffinity.platform,
    );
  }

  CircleAvatar _buildCircleAvatar(dynamic i) {
    return CircleAvatar(
      child: _build(i['child']),
      backgroundColor: getColor(i['backgroundColor']),
      backgroundImage: getImageProvider(i['backgroundImage']),
      foregroundColor: getColor(i['foregroundColor']),
      maxRadius: i['maxRadius'],
      minRadius: i['minRadius'],
      radius: i['radius'],
    );
  }

  Chip _buildChip(dynamic i) {
    return Chip(
      avatar: _build(i['avatar']),
      autofocus: i['autofocus'] ?? false,
      label: _build(i['label']),
      backgroundColor: getColor(i['backgroundColor']),
      clipBehavior: getClip(i['clipBehavior']) ?? Clip.none,
      deleteButtonTooltipMessage: i['deleteButtonTooltipMessage'],
      deleteIcon: _build(i['deleteIcon']),
      deleteIconColor: getColor(i['deleteIconColor']),
      elevation: i['elevation'],
      labelPadding: getEdgeInsets(i['labelPadding']),
      labelStyle: getTextStyle(i['labelStyle']),
      onDeleted: objectcontext.functions.buildVoidCallback(i['onDeleted']),
      padding: getEdgeInsets(i['padding']),
      shadowColor: getColor(i['shadowColor']),
      shape: getShapeBorder(i['shape']),
      focusNode: getFocusNode(i['focusNode']),
      materialTapTargetSize:
          getMaterialTapTargetSize(i['materialTapTargetSize']),
    );
  }

  ClipOval _buildClipOval(dynamic i) {
    return ClipOval(
      child: _build(i['child']),
      clipBehavior: getClip(i['clipBehavior']) ?? Clip.antiAlias,
      clipper: getClipper(i['clipper']),
    );
  }

  ClipPath _buildClipPath(dynamic i) {
    return ClipPath(
      child: _build(i['child']),
      clipBehavior: getClip(i['clipBehavior']) ?? Clip.antiAlias,
      clipper: null,//TODO: SvgClipper(i['clipper']['data']),
    );
  }

  ClipRect _buildClipRect(dynamic i) {
    return ClipRect(
      child: _build(i['child']),
      clipBehavior: getClip(i['clipBehavior']) ?? Clip.hardEdge,
      clipper: getClipper<Rect>(i['clipper']),
    );
  }

  ClipRRect _buildClipRRect(dynamic i) {
    return ClipRRect(
      child: _build(i['child']),
      borderRadius: getBorderRadius(i['borderRadius']),
      clipBehavior: getClip(i['clipBehavior']) ?? Clip.antiAlias,
      clipper: getClipper<RRect>(i['clipper']),
    );
  }

  Column _buildColumn(dynamic i) {
    return Column(
      crossAxisAlignment: getCrossAxisAlignment(i['crossAxisAlignment']) ??
          CrossAxisAlignment.center,
      mainAxisAlignment: getMainAxisAlignment(i['mainAxisAlignment']) ??
          MainAxisAlignment.start,
      textDirection: getTextDirection(i['textDirection']),
      mainAxisSize: getMainAxisSize(i['mainAxisSize']) ?? MainAxisSize.max,
      textBaseline: getTextBaseline(i['textBaseline']),
      verticalDirection: getVerticalDirection(i['verticalDirection']) ??
          VerticalDirection.down,
      children:
          (i['children'] as List<dynamic>)?.map((ii) => _build(ii))?.toList(),
    );
  }

  ConstrainedBox _buildConstrainedBox(dynamic i) {
    return ConstrainedBox(
      child: _build(i['child']),
      constraints: getBoxConstraints(i['constraints']),
    );
  }

  Container _buildContainer(dynamic i) {
    return Container(
      child: _build(i['child']),
      color: getColor(i['color']),
      width: i['width'],
      height: i['height'],
      margin: getEdgeInsets(i['margin']),
      padding: getEdgeInsets(i['padding']),
      constraints: getBoxConstraints(i['constraints']),
      decoration: getDecoration(objectcontext, i['decoration']),
      foregroundDecoration:
          getDecoration(objectcontext, i['foregroundDecoration']),
      alignment: objectcontext.alignment.build(i['alignment']),
      transform: getMatrix4(i['transform']),
    );
  }

  CustomScrollView _buildCustomScrollView(dynamic i) {
    return CustomScrollView(
      anchor: i['anchor'] ?? 0.0,
      cacheExtent: i['cacheExtent'],
      dragStartBehavior: getDragStartBehavior(i['dragStartBehavior']) ??
          DragStartBehavior.start,
      physics: getScrollPhysics(i['physics']),
      primary: i['primary'],
      reverse: i['reverse'] ?? false,
      semanticChildCount: i['semanticChildCount'],
      controller: objectcontext.getScrollController(i['controller']),
      shrinkWrap: i['shrinkWrap'] ?? false,
      scrollDirection: getAxis(i['scrollDirection']) ?? Axis.vertical,
      //center: ,
      slivers: (i['slivers'] as List<dynamic>).map((ii) => _build(ii)).toList(),
    );
  }

  FractionallySizedBox _buildFractionallySizedBox(dynamic i) {
    return FractionallySizedBox(
      child: _build(i['child']),
      alignment:
          objectcontext.alignment.build(i['alignment']) ?? Alignment.center,
      heightFactor: i['heightFactor'],
      widthFactor: i['heightFactor'],
    );
  }

  GestureDetector _buildGestureDetector(dynamic i) {
    return GestureDetector(
      onDoubleTap: objectcontext.functions.buildVoidCallback(i['onDoubleTap']),
      onForcePressStart:
          objectcontext.functions.buildValueChanged(i['onForcePressStart']),
      onForcePressEnd:
          objectcontext.functions.buildValueChanged(i['onForcePressEnd']),
      onForcePressPeak:
          objectcontext.functions.buildValueChanged(i['onForcePressPeak']),
      onForcePressUpdate:
          objectcontext.functions.buildValueChanged(i['onForcePressUpdate']),
      onHorizontalDragCancel: objectcontext.functions
          .buildVoidCallback(i['onHorizontalDragCancel']),
      onHorizontalDragDown:
          objectcontext.functions.buildValueChanged(i['onHorizontalDragDown']),
      onHorizontalDragEnd:
          objectcontext.functions.buildValueChanged(i['onHorizontalDragEnd']),
      onHorizontalDragStart:
          objectcontext.functions.buildValueChanged(i['onHorizontalDragStart']),
      onHorizontalDragUpdate: objectcontext.functions
          .buildValueChanged(i['onHorizontalDragUpdate']),
      onLongPressEnd:
          objectcontext.functions.buildValueChanged(i['onLongPressEnd']),
      onLongPressMoveUpdate:
          objectcontext.functions.buildValueChanged(i['onLongPressMoveUpdate']),
      onLongPressStart:
          objectcontext.functions.buildValueChanged(i['onLongPressStart']),
      onLongPressUp:
          objectcontext.functions.buildVoidCallback(i['onLongPressUp']),
      onPanCancel: objectcontext.functions.buildVoidCallback(i['onPanCancel']),
      onPanDown: objectcontext.functions.buildValueChanged(i['onPanDown']),
      onPanEnd: objectcontext.functions.buildValueChanged(i['onPanEnd']),
      onPanStart: objectcontext.functions.buildValueChanged(i['onPanStart']),
      onPanUpdate: objectcontext.functions.buildValueChanged(i['onPanUpdate']),
      onScaleEnd: objectcontext.functions.buildValueChanged(i['onScaleEnd']),
      onScaleStart:
          objectcontext.functions.buildValueChanged(i['onScaleStart']),
      onScaleUpdate:
          objectcontext.functions.buildValueChanged(i['onScaleUpdate']),
      onSecondaryTapCancel:
          objectcontext.functions.buildVoidCallback(i['onSecondaryTapCancel']),
      onSecondaryTapDown:
          objectcontext.functions.buildValueChanged(i['onSecondaryTapDown']),
      onSecondaryTapUp:
          objectcontext.functions.buildValueChanged(i['onSecondaryTapUp']),
      onTap: objectcontext.functions.buildVoidCallback(i['onTap']),
      onTapCancel: objectcontext.functions.buildVoidCallback(i['onTapCancel']),
      onTapDown: objectcontext.functions.buildValueChanged(i['onTapDown']),
      onTapUp: objectcontext.functions.buildValueChanged(i['onTapUp']),
      onVerticalDragCancel:
          objectcontext.functions.buildVoidCallback(i['onVerticalDragCancel']),
      onVerticalDragDown:
          objectcontext.functions.buildValueChanged(i['onVerticalDragDown']),
      onVerticalDragEnd:
          objectcontext.functions.buildValueChanged(i['onVerticalDragEnd']),
      onVerticalDragStart:
          objectcontext.functions.buildValueChanged(i['onVerticalDragStart']),
      onVerticalDragUpdate:
          objectcontext.functions.buildValueChanged(i['onVerticalDragUpdate']),
      onLongPress: objectcontext.functions.buildVoidCallback(i['onLongPress']),
      dragStartBehavior: getDragStartBehavior(i['dragStartBehavior']) ??
          DragStartBehavior.start,
      excludeFromSemantics: i['excludeFromSemantics'] ?? false,
      behavior: getHitTestBehavior(i['behavior']),
      child: _build(i['child']),
    );
  }

  GridTile _buildGridTile(dynamic i) {
    return GridTile(
      header: _build(i['header']),
      footer: _build(i['footer']),
      child: _build(i['child']),
    );
  }

  GridTileBar _buildGridTileBar(dynamic i) {
    return GridTileBar(
      backgroundColor: getColor(i['backgroundColor']),
      title: _build(i['title']),
      trailing: _build(i['trailing']),
      leading: _build(i['leading']),
      subtitle: _build(i['subtitle']),
    );
  }

  GridView _buildGridViewCount(dynamic i) {
    return GridView.count(
      crossAxisCount: i['crossAxisCount'],
      scrollDirection: getAxis(i['scrollDirection']) ?? Axis.vertical,
      childAspectRatio: i['childAspectRatio'] ?? 1,
      mainAxisSpacing: i['mainAxisSpacing'] ?? 0,
      crossAxisSpacing: i['crossAxisSpacing'] ?? 0,
      addAutomaticKeepAlives: i['addAutomaticKeepAlives'] ?? true,
      addRepaintBoundaries: i['addRepaintBoundaries'] ?? true,
      addSemanticIndexes: i['addSemanticIndexes'] ?? true,
      cacheExtent: i['cacheExtent'],
      dragStartBehavior: getDragStartBehavior(i['dragStartBehavior']) ??
          DragStartBehavior.start,
      padding: getEdgeInsets(i['padding']),
      primary: i['primary'],
      reverse: i['reverse'] ?? false,
      shrinkWrap: i['shrinkWrap'] ?? false,
      semanticChildCount: i['semanticChildCount'],
      controller: objectcontext.getScrollController(i['controller']),
      physics: getScrollPhysics(i['physics']),
      children:
          (i['children'] as List<dynamic>)?.map((ii) => _build(ii))?.toList(),
    );
  }

  DefaultTextStyle _buildDefaultTextStyle(dynamic i) {
    return DefaultTextStyle(
      maxLines: i['maxLines'],
      overflow: getTextOverflow(i['overflow']) ?? TextOverflow.clip,
      softWrap: i['softWrap'] ?? true,
      textAlign: getTextAlign(i['textAlign']),
      textWidthBasis:
          getTextWidthBasis(i['textWidthBasis']) ?? TextWidthBasis.parent,
      style: getTextStyle(i['style']),
      child: _build(i['child']),
    );
  }

  DataTable _buildDataTable(dynamic i) {
    return DataTable(
      rows: (i['rows'] as List<dynamic>)
          ?.map((ii) => _buildDataRow(ii))
          ?.toList(),
      columns: (i['columns'] as List<dynamic>)
          ?.map((ii) => _buildDataColumn(ii))
          ?.toList(),
      columnSpacing: i['columnSpacing'] ?? 56,
      dataRowHeight: i['dataRowHeight'] ?? kMinInteractiveDimension,
      headingRowHeight: i['headingRowHeight'] ?? 56,
      horizontalMargin: i['horizontalMargin'] ?? 24,
      onSelectAll:
          this.objectcontext.functions.buildValueChanged(i['onSelectAll']),
      sortAscending: i['sortAscending'] ?? true,
      sortColumnIndex: i['sortColumnIndex'],
    );
  }

  DataColumn _buildDataColumn(dynamic i) {
    return DataColumn(
      label: _build(i['label']),
      numeric: i['numeric'] ?? false,
      tooltip: i['tooltip'],
      onSort: objectcontext.functions.buildOnSoft(i['onSort']),
    );
  }

  DataRow _buildDataRow(dynamic i) {
    return DataRow(
      cells: (i['cells'] as List<dynamic>)
          ?.map((ii) => _buildDataCell(ii))
          ?.toList(),
      selected: i['selected'] ?? false,
      onSelectChanged:
          objectcontext.functions.buildValueChanged(i['onSelectChanged']),
    );
  }

  DataCell _buildDataCell(dynamic i) {
    return DataCell(_build(i['child']),
        placeholder: i['placeholder'] ?? false,
        onTap: objectcontext.functions.buildVoidCallback(i['onTap']),
        showEditIcon: i['showEditIcon'] ?? false);
  }

  DefaultTabController _buildDefaultTabController(dynamic i) {
    return DefaultTabController(
      length: i['length'],
      child: _build(i['child']),
      initialIndex: i['initialIndex'] ?? 0,
    );
  }

  Divider _buildDivider(dynamic i) {
    return Divider(
      color: getColor(i['color']),
      height: i['height'],
      endIndent: i['endIndent'],
      indent: i['indent'],
      thickness: i['thickness'],
    );
  }

  GridView _buildGridViewExtent(dynamic i) {
    return GridView.extent(
      maxCrossAxisExtent: i['maxCrossAxisExtent'],
      scrollDirection: getAxis(i['scrollDirection']) ?? Axis.vertical,
      childAspectRatio: i['childAspectRatio'] ?? 1,
      mainAxisSpacing: i['mainAxisSpacing'] ?? 0,
      crossAxisSpacing: i['crossAxisSpacing'] ?? 0,
      addAutomaticKeepAlives: i['addAutomaticKeepAlives'] ?? true,
      addRepaintBoundaries: i['addRepaintBoundaries'] ?? true,
      addSemanticIndexes: i['addSemanticIndexes'] ?? true,
      dragStartBehavior: getDragStartBehavior(i['dragStartBehavior']) ??
          DragStartBehavior.start,
      padding: getEdgeInsets(i['padding']),
      primary: i['primary'],
      controller: objectcontext.getScrollController(i['controller']),
      reverse: i['reverse'] ?? false,
      shrinkWrap: i['shrinkWrap'] ?? false,
      semanticChildCount: i['semanticChildCount'],
      physics: getScrollPhysics(i['physics']),
      children:
          (i['children'] as List<dynamic>)?.map((ii) => _build(ii))?.toList(),
    );
  }

  Hero _buildHero(dynamic i) {
    return Hero(
      child: _build(i['child']),
      tag: i['tag'],
      transitionOnUserGestures: i['transitionOnUserGestures'] ?? false,
    );
  }

  Icon _buildIcon(dynamic i) {
    return Icon(
      IconData(i['icon']['codePoint'],
          fontFamily: i['icon']['fontFamily'] ?? 'MaterialIcons'),
      color: getColor(i['color']),
      size: i['size'],
      semanticLabel: i['semanticLabel'],
      textDirection: getTextDirection(i['textDirection']),
    );
  }

  IconButton _buildIconButton(dynamic i) {
    return IconButton(
      icon: _build(i['icon']),
      alignment:
          objectcontext.alignment.build(i['alignment']) ?? Alignment.center,
      color: getColor(i['color']),
      focusColor: getColor(i['focusColor']),
      autofocus: i['autofocus'] ?? false,
      disabledColor: getColor(i['disabledColor']),
      focusNode: getFocusNode(i['focusNode']),
      highlightColor: getColor(i['highlightColor']),
      hoverColor: getColor(i['hoverColor']),
      iconSize: i['iconSize'] ?? 24.0,
      padding: getEdgeInsets(i['padding']) ?? const EdgeInsets.all(8),
      splashColor: getColor(i['splashColor']),
      tooltip: i['tooltip'],
      onPressed: objectcontext.functions
          .buildVoidCallback(i['onPressed'], nullable: false),
    );
  }

  IgnorePointer _buildIgnorePointer(dynamic i) {
    return IgnorePointer(
      ignoring: i['ignoring'] ?? true,
      ignoringSemantics: i['ignoringSemantics'],
      child: _build(i['child']),
    );
  }

  Image _buildImageNetwork(dynamic i) {
    return Image.network(
      i['source'],
      fit: getBoxFit(i['fit']),
    );
  }

  Image _buildImageAsset(dynamic i) {
    return Image.asset(
      i['source'],
      fit: getBoxFit(i['fit']),
    );
  }

  IndexedStack _buildIndexedStack(dynamic i) {
    return IndexedStack(
      alignment: objectcontext.alignment.build(i['alignment']) ??
          AlignmentDirectional.topStart,
      textDirection: getTextDirection(i['textDirection']),
      index: i['index'] ?? 0,
      sizing: getStackFit(i['sizing']) ?? StackFit.loose,
      children:
          (i['children'] as List<dynamic>)?.map((ii) => _build(ii))?.toList(),
    );
  }

  ListTile _buildListTile(dynamic i) {
    return ListTile(
      leading: _build(i['leading']),
      trailing: _build(i['trailing']),
      title: _build(i['title']),
      subtitle: _build(i['subtitle']),
      isThreeLine: i['isThreeLine'] ?? false,
      dense: i['dense'],
      contentPadding: getEdgeInsets(i['contentPadding']),
      enabled: i['enabled'] ?? true,
      selected: i['selected'] ?? false,
      onTap: objectcontext.functions.buildVoidCallback(i['onTap']),
      onLongPress: objectcontext.functions.buildVoidCallback(i['onLongPress']),
    );
  }

  Opacity _buildOpacity(dynamic i) {
    return Opacity(
      alwaysIncludeSemantics: i['alwaysIncludeSemantics'] ?? false,
      opacity: i['opacity'] ?? 1,
      child: _build(i['child']),
    );
  }

  OverflowBox _buildOverflowBox(dynamic i) {
    return OverflowBox(
      alignment: objectcontext.alignment.build(i['alignment']),
      child: _build(i['child']),
      maxHeight: i['maxHeight'],
      maxWidth: i['maxWidth'],
      minHeight: i['minHeight'],
      minWidth: i['minWidth'],
    );
  }

  Padding _buildPadding(dynamic i) {
    return Padding(
      padding: getEdgeInsets(i['padding']),
      child: _build(i['child']),
    );
  }

  PageView _buildPageView(dynamic i) {
    return PageView(
      dragStartBehavior: getDragStartBehavior(i['dragStartBehavior']) ??
          DragStartBehavior.start,
      onPageChanged:
          objectcontext.functions.buildValueChanged(i['onPageChanged']),
      pageSnapping: i['pageSnapping'] ?? true,
      reverse: i['reverse'] ?? false,
      scrollDirection: getAxis(i['scrollDirection']) ?? Axis.horizontal,
      physics: getScrollPhysics(i['physics']),
      controller: objectcontext.getPageController(i['controller']),
      children:
          (i['children'] as List<dynamic>)?.map((ii) => _build(ii))?.toList(),
    );
  }

  Tab _buildTab(dynamic i) {
    return Tab(
      text: i['text'],
      child: _build(i['child']),
      icon: _build(i['icon']),
    );
  }

  TabBar _buildTabBar(dynamic i) {
    return TabBar(
      controller: objectcontext.getTabController(i['controller']),
      dragStartBehavior: getDragStartBehavior(i['dragStartBehavior']) ??
          DragStartBehavior.start,
      indicator: getDecoration(objectcontext, i['indicator']),
      indicatorColor: getColor(i['indicatorColor']),
      indicatorPadding: getEdgeInsets(i['indicatorPadding']) ?? EdgeInsets.zero,
      indicatorSize: getTabBarIndicatorSize(i['indicatorSize']),
      indicatorWeight: i['indicatorWeight'] ?? 2,
      isScrollable: i['isScrollable'] ?? false,
      labelColor: getColor(i['labelColor']),
      labelPadding: getEdgeInsets(i['labelPadding']),
      labelStyle: getTextStyle(i['labelStyle']),
      unselectedLabelColor: getColor(i['unselectedLabelColor']),
      unselectedLabelStyle: getTextStyle(i['unselectedLabelStyle']),
      onTap: objectcontext.functions.buildValueChanged(i['onTap']),
      tabs: (i['tabs'] as List<dynamic>).map((ii) => _build(ii)).toList(),
    );
  }

  TabBarView _buildTabBarView(dynamic i) {
    return TabBarView(
      dragStartBehavior: getDragStartBehavior(i['dragStartBehavior']) ??
          DragStartBehavior.start,
      physics: getScrollPhysics(i['physics']),
      controller: objectcontext.getTabController(i['controller']),
      children:
          (i['children'] as List<dynamic>)?.map((ii) => _build(ii))?.toList(),
    );
  }

  Text _buildText(dynamic i) {
    return Text(
      i['data'] ?? '',
      textAlign: getTextAlign(i['textAlign']),
      textDirection: getTextDirection(i['textDirection']),
      textWidthBasis: getTextWidthBasis(i['textWidthBasis']),
      overflow: getTextOverflow(i['overflow']),
      maxLines: i['maxLines'],
      textScaleFactor: i['textScaleFactor'],
      semanticsLabel: i['semanticsLabel'],
      softWrap: i['softWrap'],
      style: getTextStyle(i['style']),
      strutStyle: getStrutStyle(i['strutStyle']),
      //locale: ,
    );
  }

  Text _buildTextRich(dynamic i) {
    return Text.rich(
      _buildInlineSpan(i['textSpan']),
      textAlign: getTextAlign(i['textAlign']),
      textDirection: getTextDirection(i['textDirection']),
      textWidthBasis: getTextWidthBasis(i['textWidthBasis']),
      overflow: getTextOverflow(i['overflow']),
      maxLines: i['maxLines'],
      strutStyle: getStrutStyle(i['strutStyle']),
      textScaleFactor: i['textScaleFactor'],
      semanticsLabel: i['semanticsLabel'],
      softWrap: i['softWrap'],
      style: getTextStyle(i['style']),
      //locale: ,
    );
  }

  TextField _buildTextField(dynamic i) {
    return TextField(
      controller: objectcontext.getTextEditingController(i['controller']),
      autocorrect: i['autocorrect'] ?? true,
      autofocus: i['autofocus'] ?? false,
      cursorColor: getColor(i['cursorColor']),
      cursorRadius: getRadius(i['cursorRadius']),
      cursorWidth: i['cursorWidth'] ?? 2,
      decoration: objectcontext.getInputDecoration(i['decoration']) ??
          const InputDecoration(),
      enabled: i['enabled'] ?? true,
      enableInteractiveSelection: i['enableInteractiveSelection'] ?? true,
      expands: i['expands'] ?? false,
      maxLength: i['maxLength'],
      keyboardAppearance: getBrightness(i['keyboardAppearance']),
      maxLengthEnforced: i['maxLengthEnforced'] ?? true,
      maxLines: i['maxLines'] ?? 1,
      minLines: i['minLines'],
      obscureText: i['obscureText'] ?? false,
      style: getTextStyle(i['style']),
      textAlign: getTextAlign(i['textAlign']) ?? TextAlign.start,
      textDirection: getTextDirection(i['textDirection']),
      keyboardType: getTextInputType(i['keyboardType']),
      textInputAction: getTextInputAction(i['textInputAction']),
      inputFormatters: (i['inputFormatters'] as List<dynamic>)
          ?.map((ii) => getTextInputFormatter(ii))
          ?.toList(),
      onChanged: objectcontext.functions.buildValueChanged(i['onChanged']),
      onEditingComplete:
          objectcontext.functions.buildVoidCallback(i['onEditingComplete']),
      onSubmitted: objectcontext.functions.buildValueChanged(i['onSubmitted']),
      onTap: objectcontext.functions.buildVoidCallback(i['onTap']),
      strutStyle: getStrutStyle(i['strutStyle']),
      textCapitalization: getTextCapitalization(i['textCapitalization']) ??
          TextCapitalization.none,
      focusNode: getFocusNode(i['focusNode']),
      textAlignVertical: getTextAlignVertical(i['textAlignVertical']),
      toolbarOptions: getToolbarOptions(i['toolbarOptions']),
      scrollPadding:
          getEdgeInsets(i['scrollPadding']) ?? const EdgeInsets.all(20.0),
      readOnly: i['readOnly'] ?? false,
      showCursor: i['showCursor'],
      dragStartBehavior: getDragStartBehavior(i['dragStartBehavior']) ??
          DragStartBehavior.start,
      scrollPhysics: getScrollPhysics(i['scrollPhysics']),
      scrollController:
          objectcontext.getScrollController(i['scrollController']),

      //buildCounter: ,
    );
  }

  TextFormField _buildTextFormField(dynamic i) {
    return TextFormField(
      controller: objectcontext.getTextEditingController(i['controller']),
      initialValue: i['initialValue'],
      autocorrect: i['autocorrect'] ?? true,
      autofocus: i['autofocus'] ?? false,
      autovalidate: i['autovalidate'] ?? false,
      cursorColor: getColor(i['cursorColor']),
      cursorRadius: getRadius(i['cursorRadius']),
      cursorWidth: i['cursorWidth'] ?? 2,
      decoration: objectcontext.getInputDecoration(i['decoration']) ??
          const InputDecoration(),
      enabled: i['enabled'] ?? true,
      enableInteractiveSelection: i['enableInteractiveSelection'] ?? true,
      expands: i['expands'] ?? false,
      maxLength: i['maxLength'],
      keyboardAppearance: getBrightness(i['keyboardAppearance']),
      maxLengthEnforced: i['maxLengthEnforced'] ?? true,
      maxLines: i['maxLines'] ?? 1,
      minLines: i['minLines'],
      obscureText: i['obscureText'] ?? false,
      style: getTextStyle(i['style']),
      textAlign: getTextAlign(i['textAlign']) ?? TextAlign.start,
      textDirection: getTextDirection(i['textDirection']),
      keyboardType: getTextInputType(i['keyboardType']),
      textInputAction: getTextInputAction(i['textInputAction']),
      inputFormatters: (i['inputFormatters'] as List<dynamic>)
          ?.map((ii) => getTextInputFormatter(ii))
          ?.toList(),
      onChanged: objectcontext.functions.buildValueChanged(i['onChanged']),
      onEditingComplete:
          objectcontext.functions.buildVoidCallback(i['onEditingComplete']),
      onFieldSubmitted:
          objectcontext.functions.buildValueChanged(i['onFieldSubmitted']),
      onSaved: objectcontext.functions.buildValueChanged(i['onSaved']),
      onTap: objectcontext.functions.buildVoidCallback(i['onTap']),
      strutStyle: getStrutStyle(i['strutStyle']),
      textCapitalization: getTextCapitalization(i['textCapitalization']) ??
          TextCapitalization.none,
      focusNode: getFocusNode(i['focusNode']),
      textAlignVertical: getTextAlignVertical(i['textAlignVertical']),
      toolbarOptions: getToolbarOptions(i['toolbarOptions']),
      scrollPadding:
          getEdgeInsets(i['scrollPadding']) ?? const EdgeInsets.all(20.0),
      readOnly: i['readOnly'] ?? false,
      showCursor: i['showCursor'],
      //buildCounter: ,
      //validator: ,
    );
  }

  Positioned _buildPositioned(dynamic i) {
    return Positioned(
      bottom: i['bottom'],
      top: i['top'],
      left: i['left'],
      right: i['right'],
      width: i['width'],
      height: i['height'],
      child: _build(i['child']),
    );
  }

  Positioned _buildPositionedDotDirectional(dynamic i) {
    return Positioned.directional(
      textDirection: getTextDirection(i['textDirection']),
      bottom: i['bottom'],
      top: i['top'],
      start: i['start'],
      end: i['end'],
      width: i['width'],
      height: i['height'],
      child: _build(i['child']),
    );
  }

  PositionedDirectional _buildPositionedDirectional(dynamic i) {
    return PositionedDirectional(
      bottom: i['bottom'],
      top: i['top'],
      start: i['start'],
      end: i['end'],
      width: i['width'],
      height: i['height'],
      child: _build(i['child']),
    );
  }

  RaisedButton _buildRaisedButton(dynamic i) {
    return RaisedButton(
      onPressed: objectcontext.functions.buildVoidCallback(i['onPressed']),
      color: getColor(i['color']),
      textColor: getColor(i['textColor']),
      disabledColor: getColor(i['disabledColor']),
      elevation: i['elevation'],
      child: _build(i['child']),
      padding: getEdgeInsets(i['padding']),
      autofocus: i['autofocus'] ?? false,
      clipBehavior: getClip(i['clipBehavior']) ?? Clip.none,
      colorBrightness: getBrightness(i['colorBrightness']),
      disabledElevation: i['disabledElevation'],
      disabledTextColor: getColor(i['disabledTextColor']),
      focusColor: getColor(i['focusColor']),
      focusElevation: i['focusElevation'],
      focusNode: getFocusNode(i['focusNode']),
      highlightColor: getColor(i['highlightColor']),
      highlightElevation: i['highlightElevation'],
      hoverColor: getColor(i['hoverColor']),
      hoverElevation: i['hoverElevation'],
      materialTapTargetSize:
          getMaterialTapTargetSize(i['materialTapTargetSize']),
      onHighlightChanged:
          objectcontext.functions.buildValueChanged(i['onHighlightChanged']),
      shape: getShapeBorder(i['shape']),
      splashColor: getColor(i['splashColor']),
      textTheme: getButtonTextTheme(i['textTheme']),
      animationDuration: getDuration(i['animationDuration']),
    );
  }

  RefreshIndicator _buildRefreshIndicator(dynamic i) {
    return RefreshIndicator(
      child: _build(i['child']),
      onRefresh: objectcontext.functions.buildVoidCallback(i['onRefresh']),
      backgroundColor: getColor(i['backgroundColor']),
      color: getColor(i['color']),
      displacement: i['displacement'] ?? 40,
      semanticsLabel: i['semanticsLabel'],
      semanticsValue: i['semanticsValue'],
    );
  }

  RichText _buildRichText(dynamic i) {
    return RichText(
      text: _buildInlineSpan(i['text']),
      textAlign: getTextAlign(i['textAlign']) ?? TextAlign.start,
      textDirection: getTextDirection(i['textDirection']),
      textWidthBasis:
          getTextWidthBasis(i['textWidthBasis']) ?? TextWidthBasis.parent,
      overflow: getTextOverflow(i['overflow']) ?? TextOverflow.clip,
      maxLines: i['maxLines'],
      strutStyle: getStrutStyle(i['strutStyle']),
      textScaleFactor: i['textScaleFactor'] ?? 1.0,
      softWrap: i['softWrap'] ?? true,

      //locale: ,
    );
  }

  Row _buildRow(dynamic i) {
    return Row(
      crossAxisAlignment: getCrossAxisAlignment(i['crossAxisAlignment']) ??
          CrossAxisAlignment.center,
      mainAxisAlignment: getMainAxisAlignment(i['mainAxisAlignment']) ??
          MainAxisAlignment.start,
      textDirection: getTextDirection(i['textDirection']),
      mainAxisSize: getMainAxisSize(i['mainAxisSize']) ?? MainAxisSize.max,
      textBaseline: getTextBaseline(i['textBaseline']),
      verticalDirection: getVerticalDirection(i['verticalDirection']) ??
          VerticalDirection.down,
      children:
          (i['children'] as List<dynamic>)?.map((ii) => _build(ii))?.toList(),
    );
  }

  DropdownButton _buildDropdownButton(dynamic i) {
    return DropdownButton(
      onChanged: objectcontext.functions.buildValueChanged(i['onChanged']),
      disabledHint: _build(i['disabledHint']),
      elevation: i['elevation'],
      items: (i['items'] as List<dynamic>)
          ?.map((ii) => _buildDropdownMenuItem(ii))
          ?.toList(),
      hint: _build(i['hint']),
      icon: _build(i['icon']),
      iconDisabledColor: getColor(i['iconDisabledColor']),
      iconEnabledColor: getColor(i['iconEnabledColor']),
      iconSize: i['iconSize'],
      isDense: i['isDense'],
      isExpanded: i['isExpanded'],
      underline: _build(i['underline']),
      value: i['value'],
      style: getTextStyle(i['style']),
      //selectedItemBuilder: ,
    );
  }

  DropdownMenuItem _buildDropdownMenuItem(dynamic i) {
    return DropdownMenuItem(
      child: _build(i['disabledHint']),
      value: i['value'],
    );
  }

  Expanded _buildExpanded(dynamic i) {
    return Expanded(
      child: _build(i['child']),
      flex: i['flex'] ?? 1,
    );
  }

  Flex _buildFlex(dynamic i) {
    return Flex(
      direction: getAxis(i['direction']),
      crossAxisAlignment: getCrossAxisAlignment(i['crossAxisAlignment']) ??
          CrossAxisAlignment.center,
      mainAxisAlignment: getMainAxisAlignment(i['mainAxisAlignment']) ??
          MainAxisAlignment.start,
      mainAxisSize: getMainAxisSize(i['mainAxisSize']) ?? MainAxisSize.max,
      textBaseline: getTextBaseline(i['textBaseline']),
      textDirection: getTextDirection(i['textDirection']),
      verticalDirection: getVerticalDirection(i['verticalDirection']) ??
          VerticalDirection.down,
      children:
          (i['children'] as List<dynamic>)?.map((ii) => _build(ii))?.toList(),
    );
  }

  Flexible _buildFlexible(dynamic i) {
    return Flexible(
      child: _build(i['child']),
      flex: i['flex'] ?? 1,
      fit: getFlexFit(i['fit']) ?? FlexFit.loose,
    );
  }

  FlexibleSpaceBar _buildFlexibleSpaceBar(dynamic i) {
    return FlexibleSpaceBar(
      background: _build(i['background']),
      title: _build(i['title']),
      centerTitle: i['centerTitle'],
      titlePadding: getEdgeInsets(i['titlePadding']),
      collapseMode: getCollapseMode(i['collapseMode']) ?? CollapseMode.parallax,
    );
  }

  FilterChip _buildFilterChip(dynamic i) {
    return FilterChip(
      onSelected: objectcontext.functions.buildValueChanged(i['onSelected']),
      autofocus: i['autofocus'] ?? false,
      avatar: _build(i['avatar']),
      avatarBorder: getShapeBorder(i['avatarBorder']) ?? const CircleBorder(),
      backgroundColor: getColor(i['backgroundColor']),
      checkmarkColor: getColor(i['checkmarkColor']),
      clipBehavior: getClip(i['clipBehavior']) ?? Clip.none,
      disabledColor: getColor(i['disabledColor']),
      elevation: i['elevation'],
      focusNode: getFocusNode(i['focusNode']),
      label: _build(i['label']),
      labelPadding: getEdgeInsets(i['labelPadding']),
      labelStyle: getTextStyle(i['labelStyle']),
      materialTapTargetSize:
          getMaterialTapTargetSize(i['materialTapTargetSize']),
      padding: getEdgeInsets(i['padding']),
      pressElevation: i['pressElevation'],
      selected: i['selected'] ?? false,
      selectedColor: getColor(i['selectedColor']),
      selectedShadowColor: getColor(i['selectedShadowColor']),
      shadowColor: getColor(i['shadowColor']),
      shape: getShapeBorder(i['shape']),
      showCheckmark: i['showCheckmark'],
      tooltip: i['tooltip'],
    );
  }

  FittedBox _buildFittedBox(dynamic i) {
    return FittedBox(
      alignment:
          objectcontext.alignment.build(i['alignment']) ?? Alignment.center,
      child: _build(i['child']),
      fit: getBoxFit(i['fit']) ?? BoxFit.contain,
    );
  }

  Form _buildForm(dynamic i) {
    return Form(
      child: _build(i['child']),
      autovalidate: i['autovalidate'] ?? false,
      onChanged: objectcontext.functions.buildVoidCallback(i['onChanged']),
      onWillPop: objectcontext.functions.buildWillPopCallback(i['onWillPop']),
    );
  }

  FloatingActionButton _buildFloatingActionButton(dynamic i) {
    return FloatingActionButton(
      child: _build(i['child']),
      tooltip: i['tooltip'],
      autofocus: i['autofocus'] ?? false,
      backgroundColor: getColor(i['backgroundColor']),
      disabledElevation: i['disabledElevation'],
      elevation: i['elevation'],
      focusElevation: i['focusElevation'],
      focusColor: getColor(i['focusColor']),
      foregroundColor: getColor(i['foregroundColor']),
      //heroTag: i['heroTag'],
      highlightElevation: i['highlightElevation'],
      hoverColor: getColor(i['hoverColor']),
      hoverElevation: i['hoverElevation'],
      isExtended: i['isExtended'] ?? false,
      mini: i['mini'] ?? false,
      splashColor: getColor(i['splashColor']),
      onPressed: objectcontext.functions
          .buildVoidCallback(i['onPressed'], nullable: false),
      clipBehavior: getClip(i['clipBehavior']) ?? Clip.none,
      focusNode: getFocusNode(i['focusNode']),
      materialTapTargetSize:
          getMaterialTapTargetSize(i['materialTapTargetSize']),
      shape: getShapeBorder(i['shape']),
    );
  }

  FloatingActionButton _buildFABExtended(dynamic i) {
    return FloatingActionButton.extended(
      label: _build(i['label']),
      icon: _build(i['icon']),
      tooltip: i['tooltip'],
      autofocus: i['autofocus'] ?? false,
      backgroundColor: getColor(i['backgroundColor']),
      disabledElevation: i['disabledElevation'],
      elevation: i['elevation'],
      focusElevation: i['focusElevation'],
      focusColor: getColor(i['focusColor']),
      foregroundColor: getColor(i['foregroundColor']),
      //heroTag: i['heroTag'],
      highlightElevation: i['highlightElevation'],
      hoverColor: getColor(i['hoverColor']),
      hoverElevation: i['hoverElevation'],
      isExtended: i['isExtended'] ?? true,
      splashColor: getColor(i['splashColor']),
      onPressed: objectcontext.functions
          .buildVoidCallback(i['onPressed'], nullable: false),
      clipBehavior: getClip(i['clipBehavior']) ?? Clip.none,
      focusNode: getFocusNode(i['focusNode']),
      materialTapTargetSize:
          getMaterialTapTargetSize(i['materialTapTargetSize']),
      shape: getShapeBorder(i['shape']),
    );
  }

  ListView _buildListView(dynamic i) {
    return ListView(
      padding: getEdgeInsets(i['padding']),
      controller: objectcontext.getScrollController(i['controller']),
      dragStartBehavior: getDragStartBehavior(i['dragStartBehavior']) ??
          DragStartBehavior.start,
      physics: getScrollPhysics(i['physics']),
      shrinkWrap: i['shrinkWrap'] ?? false,
      primary: i['primary'],
      reverse: i['reverse'] ?? false,
      itemExtent: i['itemExtent'],
      scrollDirection: getAxis(i['scrollDirection']) ?? Axis.vertical,
      cacheExtent: i['cacheExtent'],
      semanticChildCount: i['semanticChildCount'],
      addAutomaticKeepAlives: i['addAutomaticKeepAlives'] ?? true,
      addRepaintBoundaries: i['addRepaintBoundaries'] ?? true,
      addSemanticIndexes: i['addSemanticIndexes'] ?? true,
      children:
          (i['children'] as List<dynamic>)?.map((ii) => _build(ii))?.toList(),
    );
  }

  Tooltip _buildTooltip(dynamic i) {
    return Tooltip(
      child: _build(i['child']),
      message: i['message'] ?? '',
      decoration: getDecoration(objectcontext, i['decoration']),
      excludeFromSemantics: i['excludeFromSemantics'],
      height: i['height'],
      margin: getEdgeInsets(i['margin']),
      padding: getEdgeInsets(i['padding']),
      preferBelow: i['preferBelow'],
      showDuration: getDuration(i['showDuration']),
      textStyle: getTextStyle(i['textStyle']),
      verticalOffset: i['verticalOffset'],
      waitDuration: getDuration(i['waitDuration']),
    );
  }

  UnconstrainedBox _buildUnconstrainedBox(dynamic i) {
    return UnconstrainedBox(
      alignment: objectcontext.alignment.build(i['alignment']),
      child: _build(i['child']),
      constrainedAxis: getAxis(i['constrainedAxis']),
      textDirection: getTextDirection(i['textDirection']),
    );
  }

  WillPopScope _buildWillPopScope(dynamic i) {
    return WillPopScope(
      child: _build(i['child']),
      onWillPop: objectcontext.functions.buildWillPopCallback(i['onWillPop']),
    );
  }

  Wrap _buildWrap(dynamic i) {
    return Wrap(
      direction: getAxis(i['direction']) ?? Axis.horizontal,
      alignment: getWrapAlignment(i['alignment']) ?? WrapAlignment.start,
      crossAxisAlignment: getWrapCrossAxisAlignment(i['crossAxisAlignment']) ??
          WrapCrossAlignment.start,
      runAlignment: getWrapAlignment(i['runAlignment']) ?? WrapAlignment.start,
      runSpacing: i['runSpacing'] ?? 0,
      spacing: i['spacing'] ?? 0,
      textDirection: getTextDirection(i['textDirection']),
      verticalDirection: getVerticalDirection(i['verticalDirection']) ??
          VerticalDirection.down,
      children:
          (i['children'] as List<dynamic>)?.map((ii) => _build(ii))?.toList(),
    );
  }

  SafeArea _buildSafeArea(dynamic i) {
    return SafeArea(
      top: i['top'] ?? true,
      bottom: i['bottom'] ?? true,
      left: i['left'] ?? true,
      right: i['right'] ?? true,
      minimum: getEdgeInsets(i['minimum']),
      maintainBottomViewPadding: i['maintainBottomViewPadding'] ?? false,
      child: _build(i['child']),
    );
  }

  Scaffold _buildScaffold(dynamic i) {
    return Scaffold(
      appBar: _build(i['appBar']),
      body: _build(i['body']),
      bottomSheet: _build(i['bottomSheet']),
      drawer: _build(i['drawer']),
      floatingActionButton: _build(i['floatingActionButton']),
      floatingActionButtonLocation:
          getFloatingActionButtonLocation(i['floatingActionButtonLocation']),
      bottomNavigationBar: _build(i['bottomNavigationBar']),
      endDrawer: _build(i['endDrawer']),
      extendBody: i['extendBody'] ?? false,
      backgroundColor: getColor(i['backgroundColor']),
      drawerDragStartBehavior:
          getDragStartBehavior(i['drawerDragStartBehavior']) ??
              DragStartBehavior.start,
      drawerEdgeDragWidth: i['drawerEdgeDragWidth'],
      drawerScrimColor: getColor(i['drawerScrimColor']),
      extendBodyBehindAppBar: i['extendBodyBehindAppBar'] ?? false,
      //floatingActionButtonAnimator: ,
      persistentFooterButtons: (i['persistentFooterButtons'] as List<dynamic>)
          ?.map((ii) => _build(ii))
          ?.toList(),
      primary: i['primary'] ?? true,
      resizeToAvoidBottomInset: i['resizeToAvoidBottomInset'],
    );
  }

  SingleChildScrollView _buildSingleChildScrollView(dynamic i) {
    return SingleChildScrollView(
      padding: getEdgeInsets(i['padding']),
      primary: i['primary'],
      reverse: i['reverse'] ?? false,
      scrollDirection: getAxis(i['scrollDirection']) ?? Axis.vertical,
      controller: objectcontext.getScrollController(i['controller']),
      dragStartBehavior: getDragStartBehavior(i['dragStartBehavior']) ??
          DragStartBehavior.start,
      child: _build(i['child']),
      physics: getScrollPhysics(i['physics']),
    );
  }

  SizedBox _buildSizedBox(dynamic i) {
    return SizedBox(
      width: i['width'],
      height: i['height'],
      child: _build(i['child']),
    );
  }

  SizedBox _buildSizedBoxExpand(dynamic i) {
    return SizedBox.expand(
      child: _build(i['child']),
    );
  }

  SizedBox _buildSizedBoxFromSize(dynamic i) {
    return SizedBox.fromSize(
      size: getSize(i['size']),
      child: _build(i['child']),
    );
  }

  SizedBox _buildSizedBoxShrink(dynamic i) {
    return SizedBox.shrink(
      child: _build(i['child']),
    );
  }

  SizedOverflowBox _buildSizedOverflowBox(dynamic i) {
    return SizedOverflowBox(
      alignment: objectcontext.alignment.build(i['alignment']),
      child: _build(i['child']),
      size: getSize(i['size']),
    );
  }

  SliverAppBar _buildSliverAppBar(dynamic i) {
    return SliverAppBar(
      actions:
          (i['actions'] as List<dynamic>)?.map((ii) => _build(ii))?.toList(),
      actionsIconTheme: getIconThemeData(i['actionsIconTheme']),
      automaticallyImplyLeading: i['automaticallyImplyLeading'] ?? true,
      bottom: _build(i['bottom']),
      brightness: getBrightness(i['brightness']),
      forceElevated: i['forceElevated'] ?? false,
      iconTheme: getIconThemeData(i['iconTheme']),
      primary: i['primary'] ?? true,
      shape: getShapeBorder(i['shape']),
      textTheme: getTextTheme(i['textTheme']),
      titleSpacing: i['titleSpacing'] ?? NavigationToolbar.kMiddleSpacing,
      title: _build(i['title']),
      leading: _build(i['leading']),
      flexibleSpace: _build(i['flexibleSpace']),
      expandedHeight: i['expandedHeight'],
      floating: i['floating'] ?? false,
      pinned: i['pinned'] ?? false,
      snap: i['snap'] ?? false,
      centerTitle: i['centerTitle'],
      elevation: i['elevation'],
      backgroundColor: getColor(i['backgroundColor']),
    );
  }

  SliverGrid _buildSliverGridExtent(dynamic i) {
    return SliverGrid.extent(
      maxCrossAxisExtent: i['maxCrossAxisExtent'],
      childAspectRatio: i['childAspectRatio'] ?? 1,
      mainAxisSpacing: i['mainAxisSpacing'] ?? 0,
      crossAxisSpacing: i['crossAxisSpacing'] ?? 0,
      children:
          (i['children'] as List<dynamic>)?.map((ii) => _build(ii))?.toList(),
    );
  }

  SliverPadding _buildSliverPadding(dynamic i) {
    return SliverPadding(
      padding: getEdgeInsets(i['padding']),
      sliver: _build(i['sliver']),
    );
  }

  SliverToBoxAdapter _buildSliverToBoxAdapter(dynamic i) {
    return SliverToBoxAdapter(
      child: _build(i['child']),
    );
  }

  Stack _buildStack(dynamic i) {
    return Stack(
      fit: getStackFit(i['fit']) ?? StackFit.loose,
      alignment: objectcontext.alignment.build(i['alignment']) ??
          AlignmentDirectional.topStart,
      overflow: getOverflow(i['overflow']) ?? Overflow.clip,
      textDirection: getTextDirection(i['textDirection']),
      children:
          (i['children'] as List<dynamic>)?.map((ii) => _build(ii))?.toList(),
    );
  }

  SwitchListTile _buildSwitchListTile(dynamic i) {
    return SwitchListTile(
      value: i['value'],
      activeColor: getColor(i['activeColor']),
      activeThumbImage: getImageProvider(i['activeThumbImage']),
      activeTrackColor: getColor(i['activeTrackColor']),
      inactiveThumbColor: getColor(i['inactiveThumbColor']),
      inactiveThumbImage: getImageProvider(i['inactiveThumbImage']),
      inactiveTrackColor: getColor(i['inactiveTrackColor']),
      secondary: _build(i['secondary']),
      title: _build(i['title']),
      subtitle: _build(i['subtitle']),
      isThreeLine: i['isThreeLine'] ?? false,
      dense: i['dense'],
      contentPadding: getEdgeInsets(i['contentPadding']),
      selected: i['selected'] ?? false,
      onChanged: objectcontext.functions.buildValueChanged(i['onChanged']),
    );
  }

  SwitchListTile _buildSwitchListTileAdaptive(dynamic i) {
    return SwitchListTile.adaptive(
      value: i['value'],
      activeColor: getColor(i['activeColor']),
      activeThumbImage: getImageProvider(i['activeThumbImage']),
      activeTrackColor: getColor(i['activeTrackColor']),
      inactiveThumbColor: getColor(i['inactiveThumbColor']),
      inactiveThumbImage: getImageProvider(i['inactiveThumbImage']),
      inactiveTrackColor: getColor(i['inactiveTrackColor']),
      secondary: _build(i['secondary']),
      title: _build(i['title']),
      subtitle: _build(i['subtitle']),
      isThreeLine: i['isThreeLine'] ?? false,
      dense: i['dense'],
      contentPadding: getEdgeInsets(i['contentPadding']),
      selected: i['selected'] ?? false,
      onChanged: objectcontext.functions.buildValueChanged(i['onChanged']),
    );
  }

  InlineSpan _buildInlineSpan(dynamic i) {
    if (i == null) return null;

    final String type = i['\$type'];

    if (type == null || type.isEmpty) return null;

    if (type == "TextSpan") {
      var children = i['children'] as List<dynamic>;

      return TextSpan(
          text: i['text'],
          style: getTextStyle(i['style']),
          children: children != null
              ? children.map((x) => _buildInlineSpan(x)).toList()
              : null,
          semanticsLabel: i['semanticsLabel']);
    }

    if (type == "WidgetSpan") {
      return WidgetSpan(
          child: _build(i['child']),
          style: getTextStyle(i['style']),
          alignment: getPlaceholderAlignment(i['alignment']),
          baseline: getTextBaseline(i['baseline']));
    }

    return null;
  }
}

class _GradientBuilder extends ObjectBuilder<Gradient> {
  _GradientBuilder(ObjectBuildContext objectcontext) : super(objectcontext) {
    builders["LinearGradient"] = (i) => buildLinearGradient(i);
    builders["RadialGradient"] = (i) => buildRadialGradient(i);
    builders["SweepGradient"] = (i) => buildSweepGradient(i);
  }

  LinearGradient buildLinearGradient(dynamic i) {
    return LinearGradient(
      begin: objectcontext.alignment.build(i['begin']) ??
          AlignmentDirectional.centerStart,
      end: objectcontext.alignment.build(i['end']) ??
          AlignmentDirectional.centerEnd,
      stops: (i['stops'] as List<dynamic>)?.map((ii) => ii as double)?.toList(),
      colors:
          (i['colors'] as List<dynamic>)?.map((ii) => getColor(ii))?.toList(),
      tileMode: getTileMode(i['tileMode']) ?? TileMode.clamp,
    );
  }

  RadialGradient buildRadialGradient(dynamic i) {
    return RadialGradient(
      center: objectcontext.alignment.build(i['center']) ?? Alignment.center,
      focal: objectcontext.alignment.build(i['focal']),
      focalRadius: i['focalRadius'] ?? 0,
      radius: i['radius'] ?? 0.5,
      stops: (i['stops'] as List<dynamic>)?.map((ii) => ii as double)?.toList(),
      colors:
          (i['colors'] as List<dynamic>)?.map((ii) => getColor(ii))?.toList(),
      tileMode: getTileMode(i['tileMode']) ?? TileMode.clamp,
    );
  }

  SweepGradient buildSweepGradient(dynamic i) {
    return SweepGradient(
      center: objectcontext.alignment.build(i['center']) ?? Alignment.center,
      startAngle: i['startAngle'] ?? 0.0,
      endAngle: i['endAngle'] ?? 3.1415926535897932 * 2,
      stops: (i['stops'] as List<dynamic>)?.map((ii) => ii as double)?.toList(),
      colors:
          (i['colors'] as List<dynamic>)?.map((ii) => getColor(ii))?.toList(),
      tileMode: getTileMode(i['tileMode']) ?? TileMode.clamp,
    );
  }
}

class _AlignmentBuilder extends ObjectBuilder<AlignmentGeometry> {
  _AlignmentBuilder(ObjectBuildContext objectcontext) : super(objectcontext) {
    builders["Alignment.bottomCenter"] = (i) => Alignment.bottomCenter;
    builders["Alignment.bottomLeft"] = (i) => Alignment.bottomLeft;
    builders["Alignment.bottomRight"] = (i) => Alignment.bottomRight;
    builders["Alignment.center"] = (i) => Alignment.center;
    builders["Alignment.centerLeft"] = (i) => Alignment.centerLeft;
    builders["Alignment.centerRight"] = (i) => Alignment.centerRight;
    builders["Alignment.topCenter"] = (i) => Alignment.topCenter;
    builders["Alignment.topLeft"] = (i) => Alignment.topLeft;
    builders["Alignment.topRight"] = (i) => Alignment.topRight;
    builders["AlignmentDirectional.bottomCenter"] =
        (i) => AlignmentDirectional.bottomCenter;
    builders["AlignmentDirectional.bottomStart"] =
        (i) => AlignmentDirectional.bottomStart;
    builders["AlignmentDirectional.bottomEnd"] =
        (i) => AlignmentDirectional.bottomEnd;
    builders["AlignmentDirectional.center"] =
        (i) => AlignmentDirectional.center;
    builders["AlignmentDirectional.centerStart"] =
        (i) => AlignmentDirectional.centerStart;
    builders["AlignmentDirectional.centerEnd"] =
        (i) => AlignmentDirectional.centerEnd;
    builders["AlignmentDirectional.topCenter"] =
        (i) => AlignmentDirectional.topCenter;
    builders["AlignmentDirectional.topStart"] =
        (i) => AlignmentDirectional.topStart;
    builders["AlignmentDirectional.topEnd"] =
        (i) => AlignmentDirectional.topEnd;
    builders["Alignment"] = (i) => Alignment(i['x'], i['y']);
    builders["AlignmentDirectional"] =
        (i) => AlignmentDirectional(i['x'], i['y']);
    builders["FractionalOffset"] = (i) => FractionalOffset(i['dx'], i['dy']);
  }
}

class _CurveBuilder extends ObjectBuilder<Curve> {
  _CurveBuilder(ObjectBuildContext objectcontext) : super(objectcontext) {
    builders["Curves.linear"] = (i) => Curves.linear;
    builders["Curves.decelerate"] = (i) => Curves.decelerate;
    builders["Curves.fastLinearToSlowEaseIn"] =
        (i) => Curves.fastLinearToSlowEaseIn;
    builders["Curves.ease"] = (i) => Curves.ease;
    builders["Curves.easeIn"] = (i) => Curves.easeIn;
    builders["Curves.easeInToLinear"] = (i) => Curves.easeInToLinear;
    builders["Curves.easeInSine"] = (i) => Curves.easeInSine;
    builders["Curves.easeInQuad"] = (i) => Curves.easeInQuad;
    builders["Curves.easeInCubic"] = (i) => Curves.easeInCubic;
    builders["Curves.easeInQuart"] = (i) => Curves.easeInQuart;
    builders["Curves.easeInQuint"] = (i) => Curves.easeInQuint;
    builders["Curves.easeInExpo"] = (i) => Curves.easeInExpo;
    builders["Curves.easeInCirc"] = (i) => Curves.easeInCirc;
    builders["Curves.easeInBack"] = (i) => Curves.easeInBack;
    builders["Curves.easeOut"] = (i) => Curves.easeOut;
    builders["Curves.linearToEaseOut"] = (i) => Curves.linearToEaseOut;
    builders["Curves.easeOutSine"] = (i) => Curves.easeOutSine;
    builders["Curves.easeOutQuad"] = (i) => Curves.easeOutQuad;
    builders["Curves.easeOutCubic"] = (i) => Curves.easeOutCubic;
    builders["Curves.easeOutQuart"] = (i) => Curves.easeOutQuart;
    builders["Curves.easeOutQuint"] = (i) => Curves.easeOutQuint;
    builders["Curves.easeOutExpo"] = (i) => Curves.easeOutExpo;
    builders["Curves.easeOutCirc"] = (i) => Curves.easeOutCirc;
    builders["Curves.easeOutBack"] = (i) => Curves.easeOutBack;
    builders["Curves.easeInOut"] = (i) => Curves.easeInOut;
    builders["Curves.easeInOutSine"] = (i) => Curves.easeInOutSine;
    builders["Curves.easeInOutQuad"] = (i) => Curves.easeInOutQuad;
    builders["Curves.easeInOutCubic"] = (i) => Curves.easeInOutCubic;
    builders["Curves.easeInOutQuart"] = (i) => Curves.easeInOutQuart;
    builders["Curves.easeInOutQuint"] = (i) => Curves.easeInOutQuint;
    builders["Curves.easeInOutExpo"] = (i) => Curves.easeInOutExpo;
    builders["Curves.easeInOutCirc"] = (i) => Curves.easeInOutCirc;
    builders["Curves.easeInOutBack"] = (i) => Curves.easeInOutBack;
    builders["Curves.fastOutSlowIn"] = (i) => Curves.fastOutSlowIn;
    builders["Curves.slowMiddle"] = (i) => Curves.slowMiddle;
    builders["Curves.bounceIn"] = (i) => Curves.bounceIn;
    builders["Curves.bounceOut"] = (i) => Curves.bounceOut;
    builders["Curves.bounceInOut"] = (i) => Curves.bounceInOut;
    builders["Curves.elasticIn"] = (i) => Curves.elasticIn;
    builders["Curves.elasticOut"] = (i) => Curves.elasticOut;
    builders["Curves.elasticInOut"] = (i) => Curves.elasticInOut;
  }
}

class _FunctionBuilder extends ObjectBuilder<Function> {
  final _ObjectBuilder<dynamic> events;
  _FunctionBuilder(ObjectBuildContext objectcontext, this.events)
      : super(objectcontext);

  VoidCallback buildVoidCallback(dynamic args, {bool nullable: true}) {
    if (args == null) {
      return nullable ? null : () {};
    }

    return () {
      if (events != null) {
        events(args);
      }
    };
  }

  ValueChanged<T> buildValueChanged<T>(dynamic args, {bool nullable: true}) {
    if (args == null) {
      return nullable ? null : ((v) {});
    }

    return (v) {
      if (events != null) {
        final m = Map.of(args);
        m['\$value'] = v;
        events(m);
      }
    };
  }

  WillPopCallback buildWillPopCallback(dynamic args, {bool nullable: true}) {
    if (args == null) {
      return nullable
          ? null
          : () async {
              return true;
            };
    }

    return () async {
      if (events != null) {
        return events(args);
      }

      return true;
    };
  }

  ReorderCallback buildOnReorder(dynamic args, {bool nullable: true}) {
    if (args == null) {
      return nullable ? null : (oldIndex, newIndex) async {};
    }

    return (oldIndex, newIndex) async {
      if (events != null) {
        events(args);
      }
    };
  }

  DataColumnSortCallback buildOnSoft(dynamic args, {bool nullable: true}) {
    if (args == null) {
      return nullable ? null : (columnIndex, ascending) async {};
    }

    return (columnIndex, ascending) async {
      if (events != null) {
        events(args);
      }
    };
  }
}

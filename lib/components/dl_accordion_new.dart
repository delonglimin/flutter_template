library ms_accordion;

import 'package:flutter/material.dart';

class MsAccordion extends StatefulWidget {
  /// An accordion is used to show (and hide) content. Use [showAccordion] to hide & show the accordion content.
  const MsAccordion(
      {Key? key,
        this.titleChild,
        this.content,
        this.collapsedTitleBackgroundColor = MsColors.WHITE,
        this.expandedTitleBackgroundColor = const Color(0xFFE0E0E0),
        this.collapsedIcon = const Icon(Icons.keyboard_arrow_down),
        this.expandedIcon = const Icon(Icons.keyboard_arrow_up),
        this.title='',
        this.textStyle = const TextStyle(color: Colors.black, fontSize: 16),
        this.titlePadding = const EdgeInsets.all(10),
        this.contentBackgroundColor,
        this.contentPadding = const EdgeInsets.all(10),
        this.contentChild,
        this.titleBorder = const Border(),
        this.contentBorder = const Border(),
        this.margin,
        this.showAccordion = false,
        this.onToggleCollapsed,
        this.titleBorderRadius = const BorderRadius.all(Radius.circular(0)),
        this.contentBorderRadius = const BorderRadius.all(Radius.circular(0))})
      : super(key: key);

  /// controls if the accordion should be collapsed or not making it possible to be controlled from outside
  final bool showAccordion;

  /// child of  type [Widget]is alternative to title key. title will get priority over titleChild
  final Widget? titleChild;

  /// content of type[String] which shows the messages after the [MsAccordion] is expanded
  final String? content;

  /// contentChild of  type [Widget]is alternative to content key. content will get priority over contentChild
  final Widget? contentChild;

  /// type of [Color] or [MsColors] which is used to change the background color of the [MsAccordion] title when it is collapsed
  final Color collapsedTitleBackgroundColor;

  /// type of [Color] or [MsColors] which is used to change the background color of the [MsAccordion] title when it is expanded
  final Color expandedTitleBackgroundColor;

  /// collapsedIcon of type [Widget] which is used to show when the [MsAccordion] is collapsed
  final Widget collapsedIcon;

  /// expandedIcon of type[Widget] which is used when the [MsAccordion] is expanded
  final Widget expandedIcon;

  /// text of type [String] is alternative to child. text will get priority over titleChild
  final String title;

  /// textStyle of type [textStyle] will be applicable to text only and not for the child
  final TextStyle textStyle;

  /// titlePadding of type [EdgeInsets] which is used to set the padding of the [MsAccordion] title
  final EdgeInsets titlePadding;

  /// descriptionPadding of type [EdgeInsets] which is used to set the padding of the [MsAccordion] description
  final EdgeInsets contentPadding;

  /// type of [Color] or [MsColors] which is used to change the background color of the [MsAccordion] description
  final Color? contentBackgroundColor;

  /// margin of type [EdgeInsets] which is used to set the margin of the [MsAccordion]
  final EdgeInsets? margin;

  /// titleBorderColor of type  [Color] or [MsAccordion] which is used to change the border color of title
  final Border titleBorder;

  /// contentBorderColor of type  [Color] or [MsAccordion] which is used to change the border color of content
  final Border contentBorder;

  /// titleBorderRadius of type  [Radius]  which is used to change the border radius of title
  final BorderRadius titleBorderRadius;

  /// contentBorderRadius of type  [Radius]  which is used to change the border radius of content
  final BorderRadius contentBorderRadius;

  /// function called when the content body collapsed
  final Function(bool)? onToggleCollapsed;

  @override
  _MsAccordionState createState() => _MsAccordionState();
}

class _MsAccordionState extends State<MsAccordion>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late AnimationController controller;
  late Animation<Offset> offset;
  late bool showAccordion;

  @override
  void initState() {
    showAccordion = widget.showAccordion;
    animationController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    controller = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    offset = Tween(
      begin: const Offset(0, -0.06),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.fastOutSlowIn,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Container(
    margin: widget.margin ?? const EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        InkWell(
          onTap: _toggleCollapsed,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: widget.titleBorderRadius,
              border: widget.titleBorder,
              color: showAccordion
                  ? widget.expandedTitleBackgroundColor
                  : widget.collapsedTitleBackgroundColor,
            ),
            padding: widget.titlePadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: widget.title != null
                      ? Text(widget.title, style: widget.textStyle)
                      : (widget.titleChild ?? Container()),
                ),
                showAccordion ? widget.expandedIcon : widget.collapsedIcon
              ],
            ),
          ),
        ),
        showAccordion
            ? Container(
            decoration: BoxDecoration(
              borderRadius: widget.contentBorderRadius,
              border: widget.contentBorder,
              color: widget.contentBackgroundColor ?? Colors.white70,
            ),
            width: MediaQuery.of(context).size.width,
            padding: widget.contentPadding,
            child: SlideTransition(
              position: offset,
              child: widget.content != null
                  ? Text(widget.content!)
                  : (widget.contentChild ?? Container()),
            ))
            : Container()
      ],
    ),
  );

  void _toggleCollapsed() {
    setState(() {
      switch (controller.status) {
        case AnimationStatus.completed:
          controller.forward(from: 0);
          break;
        case AnimationStatus.dismissed:
          controller.forward();
          break;
        default:
      }
      showAccordion = !showAccordion;
      if (widget.onToggleCollapsed != null) {
        widget.onToggleCollapsed!(showAccordion);
      }
    });
  }
}


class MsColors {
  static const Color PRIMARY = Color(0xff3880FF);
  static const Color SECONDARY = Color(0xffAA66CC);
  static const Color SUCCESS = Color(0xff10DC60);
  static const Color INFO = Color(0xff33B5E5);
  static const Color WARNING = Color(0xffFFBB33);
  static const Color DANGER = Color(0xffF04141);
  static const Color LIGHT = Color(0xffE0E0E0);
  static const Color DARK = Color(0xff222428);
  static const Color WHITE = Color(0xffffffff);
  static const Color FOCUS = Color(0xff434054);
  static const Color ALT = Color(0xff794c8a);
  static const Color TRANSPARENT = Colors.transparent;
}
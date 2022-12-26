import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

/// itemBuilder   selectBuilder   itemCount

typedef DLItemBuilder<T> = Widget Function(int index);
typedef DLSelectBuilder<T> = Widget Function(int index);

class DLDropdownSelect<T> extends StatefulWidget {
  final List<T> items;
  final DLItemBuilder<T> itemBuilder;
  final DLSelectBuilder<T> selectBuilder;
  const DLDropdownSelect(
      {Key? key,
      required this.items,
      required this.itemBuilder,
      required this.selectBuilder})
      : super(key: key);

  @override
  State<DLDropdownSelect> createState() => _DLDropdownSelectState();
}

class _DLDropdownSelectState extends State<DLDropdownSelect> {
  // final LayerLink _layerLink = LayerLink();
  OverlayEntry? overlaySelectContainer;
  int curIndex = -1;
  double _height = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _getRowItem(widget)),
    );
  }

  List<Widget> _getRowItem(DLDropdownSelect widget) {
    return List.generate(widget.items.length, (index) {
      return GestureDetector(
        onTap: () {
          if (curIndex == index && overlaySelectContainer != null) {
            overlaySelectContainer!.remove();
            overlaySelectContainer = null;
            curIndex = -1;
            _height = 0;
            return;
          }
          curIndex = index;
          showSelectContainer();
        },
        child: widget.itemBuilder(index),
      );
    });
  }

  void showSelectContainer() async {
    if (overlaySelectContainer != null) {
      overlaySelectContainer!.markNeedsBuild();
      return;
    }
    final RenderBox itemBuilderBox = context.findRenderObject() as RenderBox;

    Offset pos = itemBuilderBox.localToGlobal(Offset.zero);
    double top = pos.dy + itemBuilderBox.size.height;
    overlaySelectContainer = OverlayEntry(
        builder: (context) => Positioned(
              left: 0,
              top: top,
              width: Get.width,
              child: AnimatedContainer(
                  height: _height,
                  alignment: Alignment.topLeft,
                  width: double.infinity,
                  color: Colors.blue,
                  duration: const Duration(milliseconds: 100),
                  child:  widget.selectBuilder(curIndex)
                ),
            ));
    Overlay.of(context)?.insert(overlaySelectContainer!);
    await Future.delayed(Duration(milliseconds: 50));

    _height = Get.height - top;
    overlaySelectContainer?.markNeedsBuild();
  }
}

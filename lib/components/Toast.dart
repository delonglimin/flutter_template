import 'package:flutter/material.dart';

class Toast {
  static final int LENGTH_SHORT = 0;
  static final int LENGTH_LONG = 1;
  static final int SHORT = 2000;
  static final int LONG = 4000;
  // 默认显示时间
  static int _milliseconds = 2000;
  //toast靠它加到屏幕上
  static OverlayEntry? _overlayEntry;
  //toast是否正在showing
  static bool _showing = false;
  //开启一个新toast的当前时间，用于对比是否已经展示了足够时间
  static late DateTime? _startedTime;

  static late BuildContext _context;
  // 显示文本内容
  static String? _content;
  static TextStyle? _style;
  // 字体颜色
  static Color _contentColor = Colors.white;
  // 背景颜色
  static Color _backgroundColor = Colors.black54;
  //上边的 边距
  static double _top = -1;
  // 动画
  static int _animated = 0;
  // 执行动画时间
  static int _millisecondsShow = 200;
  static int _millisecondsHide = 800;

  static var _toastWidget;

  static Toast makeText({
    required BuildContext context,
    required String content, //文本内容
    Color? contentColor, //字体颜色
    int duration = -1, // 显示时间
    Color? backgroundColor, //背景
    double? top, // 与上边  边距 距离
  }) {
    //清除原有的 Toast
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }

    _context = context;
    _content = content;
    if (contentColor != null) {
      _contentColor = contentColor;
    }
    _milliseconds = duration <= LENGTH_SHORT ? SHORT : LONG;
    if (backgroundColor != null) {
      _backgroundColor = backgroundColor;
    }
    if (_top < 0) {
      _top = MediaQuery.of(context).size.height * 2 / 3;
    }

    _toastWidget = _defaultToastLayout();
    return Toast();
  }

  void show() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    _startedTime = DateTime.now();
    _showing = false;
    _makeTextShowMovementBTB();
  }


  static void _makeTextShowMovementBTB() async {
    double _x = 0;
    double _y = 1;

    //创建OverlayEntry
    _overlayEntry = OverlayEntry(
        builder: (BuildContext context) => Positioned(
              top: _top,
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - _top,
                child: AnimatedAlign(
                    // xy坐标 是决定组件再父容器中的位置。 修改坐标即可完成组件平移
                    alignment: Alignment(_x, _y),
                    duration: _showing
                        ? Duration(milliseconds: _millisecondsShow)
                        : Duration(milliseconds: _millisecondsHide),
                    child: _toastWidget,
                  ),
              ),
            ));
    //显示到屏幕上
    Overlay.of(_context)!.insert(_overlayEntry!);
    //等待(先加载 后平移 一个缓冲)
    await Future.delayed(Duration(milliseconds: 50));
    _showing = true;
    //平移到显示位置
    _x = 0;
    _y = -1;
    //重新绘制UI，类似setState
    _overlayEntry!.markNeedsBuild();
    //等待
    await Future.delayed(Duration(milliseconds: _milliseconds));
    //2秒后 到底消失不消失
    if (DateTime.now().difference(_startedTime!).inMilliseconds >=
        _milliseconds) {
      _showing = false;
      _x = 0;
      _y = 1;
      _overlayEntry!.markNeedsBuild();
      //等待动画执行
      await Future.delayed(Duration(milliseconds: _millisecondsHide));
      if (!_showing) {
        _overlayEntry!.remove();
        _overlayEntry = null;
      }
    }
  }

  //toast绘制
  static _defaultToastLayout() {
    return ConstrainedBox(
      constraints: BoxConstraints(
        //限制 最大宽度
        maxWidth: MediaQuery.of(_context).size.width / 5 * 4,
      ),
      child: Card(
        color: _backgroundColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
          child: Text(_content!,
              style: TextStyle(
                fontSize: 14.0,
                color: _contentColor,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis),
        ),
      ),
    );
  }
}



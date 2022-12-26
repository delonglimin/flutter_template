// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// Animated widget that automatically transitions its size over a given
/// duration whenever the given child's size changes.
///
/// {@tool dartpad}
/// This example makes a [Container] react to being touched, causing the child
/// of the [DLAnimatedSize] widget, here a [FlutterLogo], to animate.
///
/// ** See code in examples/api/lib/widgets/animated_size/animated_size.0.dart **
/// {@end-tool}
///
/// See also:
///
///  * [SizeTransition], which changes its size based on an [Animation].
class DLAnimatedSize extends StatefulWidget {
  /// Creates a widget that animates its size to match that of its child.
  ///
  /// The [curve] and [duration] arguments must not be null.
  const DLAnimatedSize({
    this.child,
    this.alignment = Alignment.center,
    this.curve = Curves.linear,
    required this.duration,
    this.reverseDuration,
    @Deprecated('This field is now ignored. '
        'This feature was deprecated after v2.2.0-10.1.pre.')
        TickerProvider? vsync,
    this.clipBehavior = Clip.hardEdge,
  }) : assert(clipBehavior != null);

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.ProxyWidget.child}
  final Widget? child;

  /// The alignment of the child within the parent when the parent is not yet
  /// the same size as the child.
  ///
  /// The x and y values of the alignment control the horizontal and vertical
  /// alignment, respectively. An x value of -1.0 means that the left edge of
  /// the child is aligned with the left edge of the parent whereas an x value
  /// of 1.0 means that the right edge of the child is aligned with the right
  /// edge of the parent. Other values interpolate (and extrapolate) linearly.
  /// For example, a value of 0.0 means that the center of the child is aligned
  /// with the center of the parent.
  ///
  /// Defaults to [Alignment.center].
  ///
  /// See also:
  ///
  ///  * [Alignment], a class with convenient constants typically used to
  ///    specify an [AlignmentGeometry].
  ///  * [AlignmentDirectional], like [Alignment] for specifying alignments
  ///    relative to text direction.
  final AlignmentGeometry alignment;

  /// The animation curve when transitioning this widget's size to match the
  /// child's size.
  final Curve curve;

  /// The duration when transitioning this widget's size to match the child's
  /// size.
  final Duration duration;

  /// The duration when transitioning this widget's size to match the child's
  /// size when going in reverse.
  ///
  /// If not specified, defaults to [duration].
  final Duration? reverseDuration;

  /// {@macro flutter.material.Material.clipBehavior}
  ///
  /// Defaults to [Clip.hardEdge], and must not be null.
  final Clip clipBehavior;

  @override
  State<DLAnimatedSize> createState() => _DLAnimatedSizeState();
}

class _DLAnimatedSizeState extends State<DLAnimatedSize>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return _DLAnimatedSize(
      alignment: widget.alignment,
      curve: widget.curve,
      duration: widget.duration,
      reverseDuration: widget.reverseDuration,
      vsync: this,
      clipBehavior: widget.clipBehavior,
      child: widget.child,
    );
  }
}

class _DLAnimatedSize extends SingleChildRenderObjectWidget {
  const _DLAnimatedSize({
    this.child,
    this.alignment = Alignment.center,
    this.curve = Curves.linear,
    required this.duration,
    this.reverseDuration,
    required this.vsync,
    this.clipBehavior = Clip.hardEdge,
  }) : assert(clipBehavior != null);

  final Widget? child;
  final AlignmentGeometry alignment;
  final Curve curve;
  final Duration duration;
  final Duration? reverseDuration;

  /// The [TickerProvider] for this widget.
  final TickerProvider vsync;

  final Clip clipBehavior;

  @override
  RenderAnimatedSize createRenderObject(BuildContext context) {
    return RenderAnimatedSize(
      alignment: alignment,
      duration: duration,
      reverseDuration: reverseDuration,
      curve: curve,
      vsync: vsync,
      textDirection: Directionality.maybeOf(context),
      clipBehavior: clipBehavior,
    );
  }

  
}

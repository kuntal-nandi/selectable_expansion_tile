import 'package:flutter/material.dart';
class ExpansionController extends ValueNotifier<bool> {
  /// Returns [true] if the state is expanded, [false] if collapsed.
  bool get expanded => value;

  ExpansionController({
    bool? initialExpanded,
  }) : super(initialExpanded ?? false);

  /// Sets the expanded state.
  set expanded(bool exp) {
    value = exp;
  }

  /// Sets the expanded state to the opposite of the current state.
  void toggle() {
    expanded = !expanded;
  }

  /// expand the tile
  void expand() {
    expanded = true;
  }

  /// collapse the tile
  void collapse() {
    expanded = false;
  }
}

class SelectableExpansionTile extends StatelessWidget {
  const SelectableExpansionTile(
      {Key? key,
        required this.header,
        required this.body,
        required this.controller,
        this.value,
        this.groupValue,
        required this.onChanged})
      : super(key: key);
  final Widget header;

  /// The widget to show when expanded
  final Widget body;

  /// If the controller is not specified, it will be retrieved from the context
  final ExpansionController controller;
  final dynamic value;
  final dynamic groupValue;
  final ValueChanged<dynamic> onChanged;

  @override
  Widget build(BuildContext context) {
    if (groupValue != null) {
      controller.expanded = (value == groupValue);
    }
    return InkWell(
      onTap: () => onChanged(value),
      child: AnimatedCrossFade(
        firstChild: header,
        secondChild: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            header,
            body,
          ],
        ),
        crossFadeState: controller.expanded
            ? CrossFadeState.showSecond
            : CrossFadeState.showFirst,
        duration: const Duration(milliseconds: 300),
      ),
    );
  }
}
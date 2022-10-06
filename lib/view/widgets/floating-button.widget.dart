import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promdifarm_app/view/bloc/button/button.cubit.dart';

class FloatingButton extends StatelessWidget {
  final void Function() onPressed;
  final Icon icon;
  final Color color;

  FloatingButton({
    required this.onPressed,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ButtonCubit, ButtonState>(
      listener: (context, state) {},
      buildWhen: (context, state) {
        return FloatingButtonActive() == state ||
            FloatingButtonInActive() == state;
      },
      builder: (context, state) {
        bool isVisible = FloatingButtonActive() == state;

        return Visibility(
          visible: isVisible,
          child: FloatingActionButton(
            onPressed: onPressed,
            backgroundColor: color,
            child: icon,
          ),
        );
      },
    );
  }
}

class RefreshFloatingButton extends FloatingButton {
  final void Function() onPressed;
  final Color color;

  RefreshFloatingButton({required this.onPressed, required this.color})
      : super(
          onPressed: onPressed,
          icon: const Icon(Icons.refresh_rounded),
          color: color,
        );
}

class GreenFloatingButton extends FloatingButton {
  final void Function() onPressed;
  final Icon icon;

  GreenFloatingButton({required this.onPressed, required this.icon})
      : super(
          onPressed: onPressed,
          icon: icon,
          color: Colors.green,
        );
}

class RefreshGreenFloatingButton extends RefreshFloatingButton {
  final void Function() onPressed;

  RefreshGreenFloatingButton({required this.onPressed})
      : super(
          onPressed: onPressed,
          color: Colors.green,
        );
}

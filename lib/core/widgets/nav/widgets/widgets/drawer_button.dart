import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

Widget customDrawerButton({
  required Widget page,
  required BuildContext context,
  required String text,
  required IconData icon,
  bool selected = false,
}) =>
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        onPressed: () {
          context.pushTransition(child: page, type: PageTransitionType.fade);
        },
        color: selected ? Colors.white.withOpacity(0.2) : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 36,
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: 200,
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );

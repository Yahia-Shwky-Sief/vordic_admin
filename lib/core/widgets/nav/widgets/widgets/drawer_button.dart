import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

Widget customDrawerButton({
  required Widget page,
  required BuildContext context,
  required String textEn,
  required IconData icon,
}) =>
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        onPressed: () {
          context.pushTransition(child: page, type: PageTransitionType.fade);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 36,
            ),
            const SizedBox(width: 20),
            SizedBox(
              width: 200,
              child: Text(
                textEn,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );

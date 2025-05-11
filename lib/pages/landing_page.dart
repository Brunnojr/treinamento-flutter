import 'package:filme_flix_bruno.rodrigues/components/buttons/PrimaryButton.dart';
import 'package:filme_flix_bruno.rodrigues/components/buttons/SecondaryButton.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/the_last_jedi.png",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: size.height * .33,
            width: size.width,
            padding: const EdgeInsetsDirectional.symmetric(
              vertical: 29,
              horizontal: 19,
            ),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(.9),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Watch movies anytime anywhere",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const Text(
                  "Explore a vast collection ...",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                ),
                PrimaryButton(
                  onPressed: () => context.go('/home'),
                  text: "Login",
                ),
                SecondaryButton(onPressed: () {}, text: "Sign Up"),
              ],
            ),
          ),
        ],
      ),
    );
    // throw UnimplementedError();
  }
}

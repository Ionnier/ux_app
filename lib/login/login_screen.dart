import 'package:flutter/material.dart';
import 'package:ux_app/main.dart';
import 'package:ux_app/sessions/session_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final textEditingController = TextEditingController();
  int? currentStep;
  int? totalSteps;
  LoginScreenState loginScreenState = LoginScreenState.starting;
  bool trustSensitive = true;
  bool error = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: loginScreenState == LoginScreenState.loading
            ? const Scaffold(
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: double.infinity,
                    ),
                    Spacer(),
                    CircularProgressIndicator(),
                    Spacer(),
                  ],
                ),
              )
            : Scaffold(
                appBar: AppBar(),
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 130,
                      child: Placeholder(),
                    ).wrapInPadding(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            loginScreenState.textFieldText,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          if (loginScreenState.isSensitiveInformation)
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    trustSensitive = !trustSensitive;
                                  });
                                },
                                icon: const Icon(Icons.elderly)),
                          Expanded(
                            child: TextField(
                              controller: textEditingController,
                              obscureText:
                                  loginScreenState.isSensitiveInformation &&
                                      trustSensitive,
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                final value = textEditingController.text;
                                setState(() {
                                  trustSensitive = true;
                                });
                                switch (loginScreenState) {
                                  case LoginScreenState.starting:
                                    textEditingController.clear();
                                    if (value == "hey") {
                                      setState(() {
                                        loginScreenState =
                                            LoginScreenState.signinIn;
                                      });
                                    } else {
                                      setState(() {
                                        loginScreenState =
                                            LoginScreenState.signinUp;
                                        currentStep = 2;
                                        totalSteps = 3;
                                      });
                                    }
                                  case LoginScreenState.signinIn:
                                    if (value == "hey") {
                                      goNext(context);
                                    } else {
                                      setState(() {
                                        error = true;
                                      });
                                    }
                                  case LoginScreenState.signinUp:
                                    textEditingController.clear();
                                    setState(() {
                                      loginScreenState =
                                          LoginScreenState.moreInfo;
                                      currentStep = 3;
                                    });
                                  default:
                                    goNext(context);
                                }
                                ;
                              },
                              icon: const Icon(Icons.arrow_forward_ios))
                        ],
                      ),
                    ),
                    if (error)
                      const Text(
                        "Incorrect information provided",
                        style: TextStyle(color: Colors.red),
                      ),
                    const Spacer(),
                    if (totalSteps != null)
                      LinearProgressIndicatorWithSteps(
                          totalSteps: totalSteps!, currentStep: currentStep!),
                  ],
                ).wrapInPadding(),
              ));
  }

  void goNext(BuildContext context) {
    setState(() {
      loginScreenState = LoginScreenState.loading;
    });
    Future.delayed(const Duration(milliseconds: 500), () {
      if (context.mounted) {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const SessionsScreen()),
        );
      }
    });
  }
}

class LinearProgressIndicatorWithSteps extends StatelessWidget {
  const LinearProgressIndicatorWithSteps(
      {super.key, required this.totalSteps, required this.currentStep});
  final int totalSteps;
  final int currentStep;

  @override
  Widget build(BuildContext context) {
    var totalSteps2 = totalSteps - 1;
    var currentStep2 = currentStep - 1;
    final value = currentStep2.toDouble() / totalSteps2.toDouble();
    var dots = <Widget>[];
    for (int i = 0; i <= totalSteps2; i++) {
      dots.add(Container(
        width: (i == currentStep2) ? 22 : 16,
        height: (i == currentStep2) ? 22 : 16,
        decoration: BoxDecoration(
            color: (i <= currentStep2)
                ? CustomColors.fluorCyan
                : CustomColors.rust,
            shape: BoxShape.circle,
            border: (i == currentStep2)
                ? Border.all(color: Colors.black, width: 2)
                : null),
      ));
    }

    return Stack(alignment: AlignmentDirectional.centerStart, children: [
      LinearProgressIndicator(
        value: value,
        minHeight: 20,
        backgroundColor: CustomColors.fluorCyan,
        color: CustomColors.rust,
      ),
      Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: dots),
    ]);
  }
}

enum LoginScreenState { starting, signinUp, signinIn, moreInfo, loading }

extension LoginScreenStateExtension on LoginScreenState {
  String get textFieldText {
    switch (this) {
      case LoginScreenState.starting:
        return 'Email';
      case LoginScreenState.signinUp:
        return 'Password';
      case LoginScreenState.signinIn:
        return 'Password';
      case LoginScreenState.moreInfo:
        return 'More information';
      default:
        throw Exception();
    }
  }

  bool get isSensitiveInformation {
    switch (this) {
      case LoginScreenState.signinUp:
        return true;
      case LoginScreenState.signinIn:
        return true;
      default:
        return false;
    }
  }
}

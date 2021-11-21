import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vetcall/services/auth_service.dart';
import 'package:flutter/scheduler.dart';
import 'package:vetcall/models/firebase.dart';

class UserReg extends StatefulWidget {
  @override
  _UserRegState createState() => _UserRegState();
}

class _UserRegState extends State<UserReg> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.horizontal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 80),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              child: const Text(
                  "Register "
                  "User",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xff88d9de),
                      fontWeight: FontWeight.w500,
                      fontFamily: "HelveticaNeue",
                      fontStyle: FontStyle.normal,
                      fontSize: 50.0)),
            ),
            Expanded(
              child: Theme(
                data: ThemeData(
                    colorScheme: ColorScheme.light(primary: Color(0xff88d9de)),
                    shadowColor: Colors.transparent),
                child: Stepper(
                  type: stepperType,
                  physics: ScrollPhysics(),
                  currentStep: _currentStep,
                  controlsBuilder: (BuildContext context,
                      {VoidCallback? onStepContinue,
                      VoidCallback? onStepCancel}) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(top: 40.0),
                          width: 275,
                          height: 46,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(22)),
                              border: Border.all(
                                  color: const Color(0xff7a67fe), width: 1),
                              color: const Color(0xff7a67fe)),
                          child: TextButton(
                            onPressed: _currentStep == 3
                                ? registerUser()
                                : onStepContinue,
                            child: _currentStep == 2
                                ? Text('Register',
                                    style: TextStyle(
                                        color: Color(0xfffbfeff),
                                        fontSize: 20,
                                        fontStyle: FontStyle.normal,
                                        fontFamily: 'HelveticaNeue',
                                        fontWeight: FontWeight.w700))
                                : Text('Next',
                                    style: TextStyle(
                                        color: Color(0xfffbfeff),
                                        fontSize: 20,
                                        fontStyle: FontStyle.normal,
                                        fontFamily: 'HelveticaNeue',
                                        fontWeight: FontWeight.w700)),
                          ),
                        ),
                      ],
                    );
                  },
                  onStepTapped: (step) => tapped(step),
                  onStepContinue: continued,
                  onStepCancel: cancel,
                  steps: <Step>[
                    Step(
                      title: new Text(''),
                      content: _NameForm(),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 0
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                    Step(
                      title: new Text(''),
                      content: _EmailForm(),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 1
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                    Step(
                      title: new Text(''),
                      content: _PassWordForm(),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 2
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                    Step(
                      title: new Text(''),
                      content: _registerForm(),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 3
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  registerUser() {
    final authService = Provider.of<AuthService>(context);

    String email = _EmailForm.emailController.text;
    String password = _PassWordForm.passwordController.text;
    String firstName = _NameForm.firstNameController.text;
    String lastName = _NameForm.lastNameController.text;

    //authService.createUserWithEmailAndPassword(email, password);

    userSetup(firstName, lastName, email, password);
    _EmailForm.emailController.clear();
    _PassWordForm.passwordController.clear();
    _NameForm.firstNameController.clear();
    _NameForm.lastNameController.clear();
    _currentStep = 0;

    return;
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < 3 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }
}

class _NameForm extends StatelessWidget {
  const _NameForm({Key? key}) : super(key: key);

  static final TextEditingController firstNameController =
      TextEditingController();
  static final TextEditingController lastNameController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: firstNameController,
          decoration: const InputDecoration(
              border: OutlineInputBorder(), labelText: 'First name'),
        ),
        SizedBox(height: 20),
        TextFormField(
          controller: lastNameController,
          decoration: const InputDecoration(
              border: OutlineInputBorder(), labelText: 'Last name'),
        ),
      ],
    );
  }
}

class _EmailForm extends StatelessWidget {
  const _EmailForm({Key? key}) : super(key: key);
  static final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: emailController,
          decoration: const InputDecoration(
              border: OutlineInputBorder(), labelText: 'Email'),
        ),
      ],
    );
  }
}

class _PassWordForm extends StatelessWidget {
  const _PassWordForm({Key? key}) : super(key: key);
  static final TextEditingController passwordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: passwordController,
          decoration: const InputDecoration(
              border: OutlineInputBorder(), labelText: 'Password'),
        ),
        SizedBox(height: 20),
        TextFormField(
          decoration: const InputDecoration(
              border: OutlineInputBorder(), labelText: 'Confirm Password'),
        ),
      ],
    );
  }
}

class _registerForm extends StatelessWidget {
  const _registerForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      Navigator.of(context).pushNamed("/");
    });
    return (Text("Processing"));
  }
}

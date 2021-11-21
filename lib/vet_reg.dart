import 'package:flutter/material.dart';
import 'package:vetcall/models/firebase.dart';
import 'package:vetcall/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter/scheduler.dart';

class VetReg extends StatefulWidget {
  @override
  _VetRegState createState() => _VetRegState();
}

class _VetRegState extends State<VetReg> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.horizontal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              child: const Text(
                  "Register "
                  "Veterinarian",
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
                            onPressed: _currentStep == 7
                                ? registerUser()
                                : onStepContinue,
                            child: Text('Next',
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
                      content: _CompanyForm(),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 1
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                    Step(
                      title: new Text(''),
                      content: _AddressForm(),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 2
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                    Step(
                      title: new Text(''),
                      content: _BillingForm(),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 3
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                    Step(
                      title: new Text(''),
                      content: _HourlyFeeForm(),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 4
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                    Step(
                      title: new Text(''),
                      content: _EmailForm(),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 5
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                    Step(
                      title: new Text(''),
                      content: _PassWordForm(),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 6
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                    Step(
                      title: new Text(''),
                      content: _registerForm(),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 7
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
    String address = _AddressForm.addressController.text;
    String country = _AddressForm.countryController.text;
    String regNo = _BillingForm.regNoController.text;
    String accountNumber = _BillingForm.accountNoController.text;
    String companyName = _CompanyForm.companyNameController.text;
    String cvr = _CompanyForm.cvrController.text;
    String hourlyFee = _HourlyFeeForm.hourlyFeeController.text;

    //authService.createUserWithEmailAndPassword(email, password);
    vetSetup(firstName, lastName, companyName, cvr, address, country, regNo,
        accountNumber, hourlyFee, email, password);
    _EmailForm.emailController.clear();
    _PassWordForm.passwordController.clear();
    _NameForm.firstNameController.clear();
    _NameForm.lastNameController.clear();
    _AddressForm.addressController.clear();
    _AddressForm.countryController.clear();
    _BillingForm.regNoController.clear();
    _BillingForm.accountNoController.clear();
    _CompanyForm.companyNameController.clear();
    _CompanyForm.cvrController.clear();
    _HourlyFeeForm.hourlyFeeController.clear();

    _currentStep = 0;

    return;
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < 7 ? setState(() => _currentStep += 1) : null;
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

class _CompanyForm extends StatelessWidget {
  const _CompanyForm({Key? key}) : super(key: key);

  static final TextEditingController companyNameController =
      TextEditingController();

  static final TextEditingController cvrController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: companyNameController,
          decoration: const InputDecoration(
              border: OutlineInputBorder(), labelText: 'Company name'),
        ),
        SizedBox(height: 20),
        TextFormField(
          controller: cvrController,
          decoration: const InputDecoration(
              border: OutlineInputBorder(), labelText: 'CVR'),
        ),
      ],
    );
  }
}

class _AddressForm extends StatelessWidget {
  const _AddressForm({Key? key}) : super(key: key);
  static final TextEditingController addressController =
      TextEditingController();
  static final TextEditingController countryController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: addressController,
          decoration: const InputDecoration(
              border: OutlineInputBorder(), labelText: 'Address'),
        ),
        SizedBox(height: 20),
        TextFormField(
          controller: countryController,
          decoration: const InputDecoration(
              border: OutlineInputBorder(), labelText: 'Country'),
        ),
      ],
    );
  }
}

class _BillingForm extends StatelessWidget {
  const _BillingForm({Key? key}) : super(key: key);

  static final TextEditingController regNoController = TextEditingController();

  static final TextEditingController accountNoController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: regNoController,
          decoration: const InputDecoration(
              border: OutlineInputBorder(), labelText: 'Reg no'),
        ),
        SizedBox(height: 20),
        TextFormField(
          controller: accountNoController,
          decoration: const InputDecoration(
              border: OutlineInputBorder(), labelText: 'Account no'),
        ),
      ],
    );
  }
}

class _HourlyFeeForm extends StatelessWidget {
  const _HourlyFeeForm({Key? key}) : super(key: key);
  static final TextEditingController hourlyFeeController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: double.infinity,
            child: Text("Hourly fee",
                textAlign: TextAlign.left,
                style: const TextStyle(
                    color: const Color(0xffaaadad),
                    fontWeight: FontWeight.w300,
                    fontFamily: "HelveticaNeue",
                    fontStyle: FontStyle.normal,
                    fontSize: 17.0))),
        TextFormField(
          controller: hourlyFeeController,
          decoration: const InputDecoration(
              border: OutlineInputBorder(), labelText: 'DKK'),
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

import 'package:flutter/material.dart';

class VetReg extends StatefulWidget {
  @override
  _VetRegState createState() => _VetRegState();
}

class _VetRegState extends State<VetReg> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.horizontal;


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  Container(
        margin: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Container(width: double.infinity, height: 200,
            child: const Text("Register "
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
              child:
              Theme( data: ThemeData(
                  colorScheme: ColorScheme.light(
                  primary: Color(0xff88d9de)),
                  shadowColor: Colors.transparent),
              child: Stepper(
                type: stepperType,
                physics: ScrollPhysics(),
                currentStep: _currentStep,
                controlsBuilder: (BuildContext context,
                  {VoidCallback? onStepContinue, VoidCallback? onStepCancel}){
                  return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(top: 40.0),
                    width: 275,
                    height: 46,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(22)
                        ),
                        border: Border.all(
                            color: const Color(0xff7a67fe),
                            width: 1
                        ),
                        color: const Color(0xff7a67fe)
                    ),
                      child: TextButton(
                        onPressed: onStepContinue,
                        child: Text('Next',
                            style: TextStyle(
                            color: Color(0xfffbfeff),
                            fontSize: 20,
                            fontStyle: FontStyle.normal,
                            fontFamily: 'HelveticaNeue',
                            fontWeight: FontWeight.w700)
                      ),
                      ),
                    ),
                    ],
                  );
                },
                onStepTapped: (step) => tapped(step),
                onStepContinue:  continued,
                onStepCancel: cancel,
                steps: <Step>[
                  Step(
                    title: new Text(''),
                    content: _NameForm(),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 0 ?
                    StepState.complete : StepState.disabled,
                  ),
                  Step(
                    title: new Text(''),
                    content: _CompanyForm(),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 1 ?
                    StepState.complete : StepState.disabled,
                  ),
                  Step(
                    title: new Text(''),
                    content: _AddressForm(),
                    isActive:_currentStep >= 0,
                    state: _currentStep >= 2 ?
                    StepState.complete : StepState.disabled,
                  ),
                  Step(
                    title: new Text(''),
                    content: _BillingForm(),
                    isActive:_currentStep >= 0,
                    state: _currentStep >= 3 ?
                    StepState.complete : StepState.disabled,
                  ),
                  Step(
                    title: new Text(''),
                    content: _HourlyFeeForm(),
                    isActive:_currentStep >= 0,
                    state: _currentStep >= 4 ?
                    StepState.complete : StepState.disabled,
                  ),
                  Step(
                    title: new Text(''),
                    content: _PassWordForm(),
                    isActive:_currentStep >= 0,
                    state: _currentStep >= 5 ?
                    StepState.complete : StepState.disabled,
                  ),
                ],
              ),
            ),),
          ],
        ),
      ),
    );
  }


  tapped(int step){
    setState(() => _currentStep = step);
  }

  continued(){
    _currentStep < 5 ?
    setState(() => _currentStep += 1): null;
  }
  cancel(){
    _currentStep > 0 ?
    setState(() => _currentStep -= 1) : null;
  }
}

class _NameForm extends StatelessWidget {
  const _NameForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(
              border: OutlineInputBorder(), labelText: 'First name'),
        ),
        SizedBox(height: 20),
        TextFormField(
          decoration: const InputDecoration(
              border: OutlineInputBorder(), labelText: 'Last name'),
        ),
      ],
    );
  }
}
class _CompanyForm extends StatelessWidget {
  const _CompanyForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(border:OutlineInputBorder(), labelText: 'Company name'),
        ),
        SizedBox(height: 20),
        TextFormField(
          decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'CVR'),
        ),
      ],
    );
  }
}
class _AddressForm extends StatelessWidget {
  const _AddressForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(border:OutlineInputBorder(), labelText: 'Address'),
        ),
        SizedBox(height: 20),
        TextFormField(
          decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Country'),
        ),
      ],
    );
  }
}
class _BillingForm extends StatelessWidget {
  const _BillingForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(border:OutlineInputBorder(), labelText: 'Reg nr'),
        ),
        SizedBox(height: 20),
        TextFormField(
          decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Konto nr'),
        ),
      ],
    );
  }
}
class _HourlyFeeForm extends StatelessWidget {
  const _HourlyFeeForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(width: double.infinity,
            child: Text(
            "Hourly fee",
        textAlign: TextAlign.left,
            style: const TextStyle(
                color:  const Color(0xffaaadad),
                fontWeight: FontWeight.w300,
                fontFamily: "HelveticaNeue",
                fontStyle:  FontStyle.normal,
                fontSize: 17.0
            )
        )),
        TextFormField(
          decoration: const InputDecoration(border:OutlineInputBorder(), labelText: 'DKK'),
        ),
      ],
    );
  }
}
class _PassWordForm extends StatelessWidget {
  const _PassWordForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(border:OutlineInputBorder(), labelText: 'Password'),
        ),
        SizedBox(height: 20),
        TextFormField(
          decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Confirm Password'),
        ),
      ],
    );
  }
}
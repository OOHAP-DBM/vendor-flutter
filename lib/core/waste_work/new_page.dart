
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oohapp/core/waste_work/drop_down_function.dart';


class MyDropdown extends StatefulWidget {
  @override
  _MyDropdownState createState() => _MyDropdownState();
}

class _MyDropdownState extends State<MyDropdown> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: BlocBuilder<DropdownCubit, DropdownState>(
            builder: (context, state) {
              return Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownButtonFormField<String>(
                      value: state.countryDropdown,
                      items: [
                        DropdownMenuItem(
                          value: 'Option 1',
                          child: Text('Option 1'),
                        ),
                        DropdownMenuItem(
                          value: 'Option 2',
                          child: Text('Option 2'),
                        ),
                        DropdownMenuItem(
                          value: 'Option 3',
                          child: Text('Option 3'),
                        ),
                      ],
                      onChanged: (value) {
                        context.read<DropdownCubit>().onChangedCountryDropdown(value!);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a value';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Validation passed, perform further actions
                          print('Selected Value: ${state.countryDropdown.toString()}');
                        }
                      },
                      child: Text('Submit'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
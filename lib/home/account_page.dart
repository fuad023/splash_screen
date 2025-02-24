import 'package:flutter/material.dart';
import 'package:splash_screen/home/components/my_input_theme.dart';
import 'package:splash_screen/home/components/string_extentions.dart';

class AccountManagePage extends StatefulWidget {
  const AccountManagePage({super.key});

  @override
  State<AccountManagePage> createState() => _AccountManagePageState();
}

class Field {
  TextEditingController controller = TextEditingController();
}

class _AccountManagePageState extends State<AccountManagePage> {
  final inputTheme = MyInputTheme().theme();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(12.0),
          margin: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                // spreadRadius: 2,
                blurRadius: 2,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: Text(
                    "Welcome to Squid Game",
                    style: TextStyle(
                      color: Colors.pink,
                      fontSize: 24.0,
                      // letterSpacing: 2.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 32.0),
                  child: Icon(
                    Icons.gamepad_outlined,
                    size: 20.0,
                    color: Colors.pink,
                  ),
                ),
                _singleTextField(
                  label: 'NAME',
                  field: _nameField(),
                ),
          
                _singleTextField(
                  label: 'EMAIL',
                  field: _emailField(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _singleTextField({
    required String label,
    required Widget field,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        field,
      ],
    );
  }

  Widget _nameField() {
    return _buildEditableField(
      hint: "Alex Clerk",
      label: "NAME",
      controller: nameController,
      textCapitalization: TextCapitalization.words,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value == null || value.isWhitespace()) {
          return "Enter a valid name!";
        } return null;
      },
      onSave: (newField) {
        setState(() {});
      },
    );
  }

  Widget _emailField() {
    return _buildEditableField(
      hint: "help@aust.edu",
      label: "EMAIL",
      controller: emailController,
      textCapitalization: TextCapitalization.none,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isWhitespace() || !value.isValidEmail()) {
          return "Enter a valid email!";
        } return null;
      },
      onSave: (newField) {
        setState(() {});
      },
    );
  }

  Widget _buildEditableField({
    required String hint,
    required String? label,
    required TextEditingController controller,
    required TextCapitalization textCapitalization,
    required TextInputType? keyboardType,
    required String? Function(String?) validator,
    required void Function(String) onSave,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Theme(
              data: Theme.of(context).copyWith(
                textSelectionTheme: TextSelectionThemeData(
                  cursorColor: Colors.pink,
                  selectionColor: Colors.pink[200],
                  selectionHandleColor: Colors.pink,
                ),
              ),
              child: TextFormField(
                controller: controller,
                textCapitalization: textCapitalization,
                // autofocus: true,
                keyboardType: keyboardType,
                decoration: InputDecoration(
                  labelText: label,
                  hintText: hint,
                  filled: true,
                  fillColor: Colors.white
                ).applyDefaults(inputTheme),
                validator: validator,
              ),
            ),
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.chevron_right_rounded,
            color: Colors.pink[200],
          ),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              onSave(controller.text);
            }
          }
        )
      ],
    );
  }
}
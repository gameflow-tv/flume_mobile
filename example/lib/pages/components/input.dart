import 'package:flume/flume.dart';
import 'package:flume_example/widgets/blueprint.dart';
import 'package:flume/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  late bool _switchValue;
  late bool _checkboxValue;
  late TextEditingController _validationController;

  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }

    return null;
  }

  @override
  void initState() {
    super.initState();

    _switchValue = true;
    _checkboxValue = true;
    _validationController = TextEditingController();
  }

  @override
  void dispose() {
    _validationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Ambiance(
      builder: (context, ambiance) {
        return Scaffold(
          backgroundColor: ambiance.color,
          appBar: TopBar(
            title: const Text('Inputs'),
          ),
          body: Blueprint(
            child: ScrollableList(
              padding: EdgeInsets.all(context.theme.spacing.md),
              children: [
                const FormGroup(
                  label: Text('Input field'),
                  child: InputField(),
                ),
                const FormGroup(
                  label: Text('Obscured input field'),
                  child: InputField(
                    obscureText: true,
                  ),
                ),
                FormGroup(
                  label: const Text('Field with validator'),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: InputField(
                              controller: _validationController,
                              onChanged: (_) {
                                setState(() {});
                              },
                            ),
                          ),
                        ].spaced(context.theme.spacing.sm),
                      ),
                      if (mounted &&
                          validate(_validationController.text) != null)
                        ValidationMessage(
                          state: ValidationState.error,
                          child: Text(
                            validate(_validationController.text)!,
                          ),
                        ),
                    ].spaced(context.theme.spacing.xs),
                  ),
                ),
                const FormGroup(
                  label: Text('Search bar'),
                  child: SearchBar(
                    cancelText: 'Cancel',
                  ),
                ),
                const FormGroup(
                  label: Text('Multiline input field w/ counter'),
                  child: InputField(
                    multiline: true,
                    maxLines: 5,
                    counter: true,
                    maxLength: 200,
                  ),
                ),
                const FormGroup(
                  label: Text('Expanded input field'),
                  child: SizedBox(
                    height: 200,
                    child: InputField(
                      expands: true,
                    ),
                  ),
                ),
                FormGroup(
                  label: const Text('Switch'),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TonalSwitch(
                        value: _switchValue,
                        onChanged: (value) {
                          setState(() {
                            _switchValue = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                FormGroup(
                  label: const Text('Checkbox'),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: _checkboxValue,
                        onChanged: (value) {
                          setState(() {
                            _checkboxValue = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'package:flume/flume.dart';
import 'package:flume_example/utils/show_sheet.dart';
import 'package:flume_example/widgets/blueprint.dart';
import 'package:flume/material.dart';
import 'package:flume_example/widgets/card_grid.dart';
import 'package:flume_example/widgets/component_card.dart';
import 'package:flume_example/widgets/layout.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  late bool _cupertinoSwitchValue;
  late bool _materialSwitchValue;
  late bool _checkboxValue;
  late TextEditingController _validationController;
  late DateTime _date;

  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }

    return null;
  }

  @override
  void initState() {
    super.initState();

    _cupertinoSwitchValue = true;
    _materialSwitchValue = true;
    _checkboxValue = true;
    _validationController = TextEditingController();
    _date = DateTime.now();
  }

  @override
  void dispose() {
    _validationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      builder: (context, ambiance) {
        return Blueprint(
          child: CardGrid(
            children: [
              ComponentCard(
                title: 'Input field',
                subtitle: 'Default',
                banner: InputField(
                  controller: TextEditingController(text: 'Hello world'),
                ),
              ),
              ComponentCard(
                title: 'Input field',
                subtitle: 'Obscured',
                banner: InputField(
                  controller: TextEditingController(text: 'Hello world'),
                  obscureText: true,
                ),
              ),
              ComponentCard(
                title: 'Input field',
                subtitle: 'With validator',
                banner: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                    if (mounted && validate(_validationController.text) != null)
                      ValidationMessage(
                        state: ValidationState.error,
                        child: Text(
                          validate(_validationController.text)!,
                        ),
                      ),
                  ].spaced(context.theme.spacing.xs),
                ),
              ),
              ComponentCard(
                title: 'Search bar',
                subtitle: 'A variant of the input field',
                banner: SearchBar(
                  cancelText: 'Cancel',
                  controller: TextEditingController(text: 'Hello world'),
                ),
              ),
              const ComponentCard(
                subtitle: 'Multiline w/ counter',
                title: 'Input field',
                banner: InputField(
                  multiline: true,
                  maxLines: 5,
                  counter: true,
                  maxLength: 200,
                ),
              ),
              const ComponentCard(
                title: 'Input field',
                subtitle: 'Expanded',
                banner: InputField(
                  expands: true,
                ),
              ),
              ComponentCard(
                title: 'Switch',
                subtitle: 'Cupertino',
                banner: TonalSwitch(
                  value: _cupertinoSwitchValue,
                  onChanged: (value) {
                    setState(() {
                      _cupertinoSwitchValue = value;
                    });
                  },
                ),
              ),
              ComponentCard(
                title: 'Switch',
                subtitle: 'Material',
                banner: Theme(
                  data: context.materialTheme.copyWith(
                    platform: TargetPlatform.android,
                  ),
                  child: TonalSwitch(
                    value: _materialSwitchValue,
                    onChanged: (value) {
                      setState(() {
                        _materialSwitchValue = value;
                      });
                    },
                  ),
                ),
              ),
              ComponentCard(
                title: 'Checkbox',
                subtitle: 'Default',
                banner: Checkbox(
                  value: _checkboxValue,
                  onChanged: (value) {
                    setState(() {
                      _checkboxValue = value;
                    });
                  },
                ),
              ),
              ComponentCard(
                title: 'DatePicker',
                subtitle: 'Modal',
                banner: Button(
                  variant: ButtonVariant.light,
                  size: ButtonSize.medium,
                  child: const Text('Open DatePicker'),
                  onPressed: () {
                    showSheet(
                      context: context,
                      initialChildSize: 0.4,
                      builder: (context, _) => DatePickerSheet(
                        date: _date,
                        onChanged: (date) => setState(() => _date = date),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class DatePickerSheet extends StatefulWidget {
  const DatePickerSheet({
    super.key,
    required this.date,
    required this.onChanged,
  });

  final DateTime date;
  final ValueChanged<DateTime> onChanged;

  @override
  State<DatePickerSheet> createState() => _DatePickerSheetState();
}

class _DatePickerSheetState extends State<DatePickerSheet> {
  late DateTime _date;

  @override
  void initState() {
    super.initState();
    _date = widget.date;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _date = widget.date;
  }

  @override
  Widget build(BuildContext context) {
    return Ambiance(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: context.ambiance.palette.dark,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(context.theme.shapes.lg),
            topRight: Radius.circular(context.theme.shapes.lg),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: context.theme.spacing.xs,
              ),
              child: Container(
                height: 5,
                width: 36,
                decoration: BoxDecoration(
                  color: context.theme.colors.highlight30,
                  borderRadius: BorderRadius.circular(
                    context.theme.shapes.lg,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: context.theme.spacing.sm,
                ),
                child: DatePicker(
                  date: _date,
                  onDateSelected: (value) {
                    setState(() {
                      _date = value;
                    });

                    widget.onChanged(value);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dieta_mobile/app/modules/informacoes/controllers/informacoes_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CustomTextFormFieldAit extends StatefulWidget {
  final TextStyle? textStyle;
  GetxController? controller;
  final Widget? icon;
  final Widget? sufixicon;
  final Widget? label;
  final String? labelText;
  final String? hintText;
  final bool? staticlabel;
  Widget? labelFinal;

  final double? height;
  final double? borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  bool isObscure;
  bool? hasBorder;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? inputType;
  final String? initialValue;
  final int? maxLines;
  void Function(String)? onFieldSubmitted;
  void Function()? onEditingComplete;
  void Function(String)? onChanged;

  bool readOnly;
  TextEditingController customTextFormController = TextEditingController();
  String? Function(String?)? validator;

  CustomTextFormFieldAit({
    Key? key,
    this.textStyle,
    this.controller,
    this.icon,
    this.sufixicon,
    this.label,
    this.labelText,
    this.hintText,
    this.staticlabel,
    this.labelFinal,
    this.height,
    this.borderRadius,
    required this.customTextFormController,
    this.contentPadding,
    required this.isObscure,
    this.hasBorder,
    this.inputFormatters,
    this.inputType,
    this.initialValue,
    this.maxLines,
    required this.readOnly,
    this.validator,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.onChanged,
  }) : super(key: key);

  @override
  State<CustomTextFormFieldAit> createState() => _CustomTextFormField();
}

class _CustomTextFormField extends State<CustomTextFormFieldAit> {
  final FocusNode _focus = FocusNode();

  @override
  void initState() {
    super.initState();
    widget.labelFinal = widget.label;
    _focus.addListener(_onFocusChange);
    widget.customTextFormController.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
    widget.customTextFormController.removeListener(_onFocusChange);
    //widget.customTextFormController.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    if (_focus.hasFocus) {
      setState(() {
        widget.staticlabel == true ? null : widget.labelFinal = null;
      });
      if (widget.controller is InformacoesController) {
        InformacoesController cInfoController = Get.find();
        final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
        final sizeTela = Get.size.height;
        //print("keyboardHeight: $keyboardHeight");
        //print(sizeTela - keyboardHeight);
        final textFieldPosition = _focus.rect.top;
        // print(textFieldPosition);
        if (textFieldPosition > (sizeTela - keyboardHeight)) {
          cInfoController.scrollinformacoesAitController
              .jumpTo(cInfoController.scrollinformacoesAitController.position.maxScrollExtent);
        }
      }
    } else {
      setState(() {
        widget.labelFinal = widget.label;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    RxBool obscureText = widget.isObscure.obs;

    return Center(
      child: Obx(
        () => TextFormField(
          onChanged: widget.onChanged ?? (value) {},
          onFieldSubmitted: (d) {
            try {
              Get.focusScope!.nextFocus();
            } catch (e) {
              debugPrint(e.toString());
            }
          },
          onEditingComplete: widget.onEditingComplete ?? () {},
          cursorColor: Theme.of(context).primaryColor /* AppConfig.of(context)!.configs.colorPrimaryLight */,
          maxLines: widget.maxLines ?? 1,
          focusNode: _focus,
          validator: widget.validator,
          controller: widget.customTextFormController,
          readOnly: widget.readOnly,
          initialValue: widget.initialValue,
          keyboardType: widget.inputType,
          inputFormatters: widget.inputFormatters,
          obscureText: obscureText.value,
          style: widget.textStyle ?? const TextStyle(color: Colors.black54, fontSize: 18),
          decoration: InputDecoration(
              hintText: widget.hintText,
              contentPadding: widget.contentPadding,
              floatingLabelBehavior: widget.staticlabel == true && widget.customTextFormController.text != ""
                  ? FloatingLabelBehavior.always
                  : null,
              constraints: BoxConstraints(maxHeight: widget.height ?? 60, minHeight: widget.height ?? 60),
              isDense: false,
              border: widget.hasBorder != null
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Colors.blue /* AppConfig.of(context)!.configs.textColorSecondaryLight */, width: 2),
                    )
                  : const UnderlineInputBorder(),
              focusedBorder: widget.hasBorder != null
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Colors.blue /* AppConfig.of(context)!.configs.colorPrimaryLight */, width: 2),
                    )
                  : const UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blue /* AppConfig.of(context)!.configs.colorPrimaryLight) */)),
              focusedErrorBorder: widget.hasBorder != null
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: Colors.red /* AppConfig.of(context)!.configs.errorColor */, width: 2),
                    )
                  : const UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.red /* AppConfig.of(context)!.configs.errorColor */, width: 2),
                    ),
              errorBorder: widget.hasBorder != null
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: Colors.red /* AppConfig.of(context)!.configs.errorColor */, width: 2),
                    )
                  : const UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.red /* AppConfig.of(context)!.configs.errorColor */, width: 2),
                    ),
              errorStyle: const TextStyle(
                fontSize: 12,
              ),
              prefixIcon: widget.icon,
              suffixIcon: widget.sufixicon ??
                  (widget.isObscure == true
                      ? IconButton(
                          onPressed: () {
                            obscureText.value = !obscureText.value;
                          },
                          icon: obscureText.value == true
                              ? const Icon(Icons.visibility,
                                  color: Colors.green /* AppConfig.of(context)!.configs.colorPrimaryLight */)
                              : const Icon(Icons.visibility_off,
                                  color: Colors.green /* AppConfig.of(context)!.configs.colorPrimaryLight */))
                      : null),
              label: widget.staticlabel == true
                  ? widget.label
                  : widget.customTextFormController.text == ""
                      ? widget.labelFinal
                      : null,
              labelText: widget.labelText),
        ),
      ),
    );
  }
}

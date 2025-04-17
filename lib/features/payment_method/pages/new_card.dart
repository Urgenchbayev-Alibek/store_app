import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/features/common/store_app_bar.dart';

class NewCardView extends StatefulWidget {
  NewCardView({super.key});

  @override
  State<NewCardView> createState() => _NewCardViewState();
}

class _NewCardViewState extends State<NewCardView> {
  final _cardController = MaskedCardController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var cardMask = MaskTextInputFormatter(
      mask: '#### #### #### ####',
      filter: {"#": RegExp(r'[0-9]')},
    );

    return Scaffold(
      appBar: StoreAppBar(
        title: "New Card",
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(25),
          child: Divider(
            color: Color(0xffE6E6E6),
            thickness: 2,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 20),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Add Debit or Credit Card",
                style: TextStyle(
                  color: Color(0xff1A1A1A),
                  fontFamily: "General Sans",
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 15),
              Text(
                "Card number",
                style: TextStyle(
                  color: Color(0xff1A1A1A),
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: TextFormField(
                  onChanged: (value) {
                    final rawText = value.replaceAll(' ', '');

                    if (rawText.length > 16) {
                      _cardController.text = rawText.substring(0, 16);
                    }
                  },
                  controller: _cardController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    cardMask,
                  ],
                  decoration: InputDecoration(
                    hintText: "Enter your card number",
                    hintStyle: const TextStyle(
                      color: Color(0xff1A1A1A),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                        width: 1.2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.black, width: 1.5),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Expiry Date",
                          style: TextStyle(
                            fontFamily: "General Sans",
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff1A1A1A),
                          ),
                        ),
                        SizedBox(height: 8),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            MaskTextInputFormatter(mask: '##/##'),
                          ],
                          decoration: InputDecoration(
                            hintText: "MM/YY",
                            hintStyle: TextStyle(
                              color: Color(0xff1A1A1A),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 14,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.grey.shade400,
                                width: 1.2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.black, width: 1.5),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Security Code",
                          style: TextStyle(
                            fontFamily: "General Sans",
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff1A1A1A),
                          ),
                        ),
                        SizedBox(height: 8),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(4),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: InputDecoration(
                            hintText: "CVV",
                            hintStyle: TextStyle(
                              color: Color(0xff1A1A1A),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 14,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.grey.shade400,
                                width: 1.2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.black, width: 1.5),
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: SvgPicture.asset(
                                'assets/icons/question_mark.svg',
                                height: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(child: SizedBox()),

            ],
          ),
        ),
      ),
    );
  }
}

class MaskedCardController extends TextEditingController {
  @override
  TextSpan buildTextSpan({
    required BuildContext context,
    TextStyle? style,
    required bool withComposing,
  }) {
    final text = this.text.replaceAll(' ', '');
    final buffer = StringBuffer();

    for (int i = 0; i < text.length; i++) {
      if (i < text.length - 4) {
        buffer.write('*');
      } else {
        buffer.write(text[i]);
      }

      // Add space every 4 digits
      if ((i + 1) % 4 == 0 && i != text.length - 1) {
        buffer.write(' ');
      }
    }

    return TextSpan(
      text: buffer.toString(),
      style: style,
    );
  }
}

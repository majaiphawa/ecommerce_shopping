import 'package:flutter/material.dart';
import 'package:ecommerce_shopping/screens/shipping_address_screen.dart';
import 'package:ecommerce_shopping/widgets/container_button_model.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({Key? key}) : super(key: key);

  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  int _type = 1;

  void _handleRadio(int? e) {
    setState(() {
      _type = e!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Overview"),
        leading: BackButton(),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 40),
                  buildPaymentMethodContainer(1, "Amazon Pay", "amazonpay.png"),
                  SizedBox(height: 15),
                  buildPaymentMethodContainer(
                      2, "Credit Card", "visa.png", "mastercard.png"),
                  SizedBox(height: 15),
                  buildPaymentMethodContainer(3, "Paypal", "paypal.png"),
                  SizedBox(height: 40),
                  buildPaymentMethodContainer(4, "Google Pay", "icon2.png"),
                  SizedBox(
                    height: 100,
                  ),
                  buildPaymentRow("Sub-Total", "\$300.50"),
                  SizedBox(
                    height: 100,
                  ),
                  buildPaymentRow("Shipping Fee", "\$15.00"),
                  Divider(
                    height: 15,
                    color: Colors.black,
                  ),
                  buildPaymentRow("Total Payment", "\$315.00",
                      fontWeight: FontWeight.w700, color: Colors.redAccent),
                  SizedBox(
                    height: 70,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShippingAddress(),
                        ),
                      );
                    },
                    child: ContainerButtonModel(
                      bgColor: Color(0xFFDB3022),
                      containerWidth: 480,
                      itext: "Confirm Payment",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPaymentMethodContainer(int value, String text, String image1,
      [String? image2]) {
    return Container(
      width: 600,
      height: 55,
      decoration: BoxDecoration(
        border: _type == value
            ? Border.all(
                width: 1,
                color: Color(0xFFDB3022),
              )
            : Border.all(width: 0.3, color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
        color: Colors.transparent,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Radio(
                value: value,
                groupValue: _type,
                onChanged: _handleRadio,
                activeColor: Color(0xFFDB3022),
              ),
              Text(
                text,
                style: _type == value
                    ? TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      )
                    : TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
              ),
              if (image2 != null) ...[
                Image.asset(
                  "assets/images/$image1",
                ),
                Image.asset(
                  "assets/images/$image2",
                ),
              ] else ...[
                Image.asset(
                  "assets/images/$image1",
                  height: 70,
                  fit: BoxFit.contain,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPaymentRow(String leftText, String rightText,
      {FontWeight? fontWeight, Color? color}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leftText,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
        ),
        Text(
          rightText,
          style: TextStyle(
            fontSize: 15,
            fontWeight: fontWeight ?? FontWeight.w400,
            color: color ?? Colors.black,
          ),
        ),
      ],
    );
  }
}

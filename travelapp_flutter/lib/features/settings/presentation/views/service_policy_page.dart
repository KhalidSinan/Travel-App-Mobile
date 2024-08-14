import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';

class ServicePolicyPage extends StatelessWidget {
  const ServicePolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(" Service Policy ",
              style: TextStyle(
                  color: Themes.primary, fontWeight: FontWeight.bold)),
          leading: const CustomBackButton(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              Center(
                  child: Text(
                'Service Policy for Journy Joy ',
                style: Styles.heading.copyWith(fontSize: 24),
              )),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Introduction ',
                style: headStyle(),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Welcome to Journy Joy, your trusted partner in seamless travel planning and reservations. Our application is designed to provide users with comprehensive information on flight and hotel reservations, allowing for easy organization of individual trips or participation in pre-organized tours. This Service Policy outlines the terms and conditions governing the use of our services. By using Journy Joy, you agree to comply with this policy.',
                style: contentStyle(),
              ),
              const SizedBox(
                height: 25,
              ),
              Text('1. User Account', style: headStyle()),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8),
                child: Text(
                  '1.1. Registration  ',
                  style: head2Style(),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                ),
                child: Text(
                    'To access our services, users must create an account. Users are responsible for maintaining the confidentiality of their account information and for all activities that occur under their account.',
                    style: contentStyle()),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                ),
                child: Text(
                  '1.2. Personal Information  ',
                  style: head2Style(),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                ),
                child: Text(
                  'Users must provide accurate and complete information during registration and update their information as necessary. We are committed to protecting your privacy and handling your personal information in accordance with our Privacy Policy.',
                  style: contentStyle(),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                '2. Services Provided',
                style: headStyle(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8),
                child: Text(
                  '2.1. Flight Reservations  ',
                  style: head2Style(),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                ),
                child: Text(
                  'Journy Joy provides information on available flights from various airlines, including schedules, fares, and booking options. Users can search for, compare, and book flights through our platform.',
                  style: contentStyle(),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                ),
                child: Text(
                  '2.2. Hotel Reservations  ',
                  style: head2Style(),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                ),
                child: Text(
                  'Our app offers a comprehensive database of hotels worldwide. Users can search for hotels based on their preferences, view detailed information, and make reservations directly through our platform.',
                  style: contentStyle(),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                ),
                child: Text(
                  '2.3. Trip Organization  ',
                  style: head2Style(),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                ),
                child: Text(
                  'Users can organize their own individual trips by selecting flights, hotels, and other travel services. Additionally, users have the option to join pre-organized trips arranged by travel organizers.',
                  style: contentStyle(),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                '3. Booking and Payments',
                style: headStyle(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8),
                child: Text(
                  '3.1. Booking Process  ',
                  style: head2Style(),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                ),
                child: Text(
                  'All bookings made through Journy Joy are subject to availability and confirmation from the service providers (airlines, hotels, etc.). Users will receive a confirmation email with their booking details.',
                  style: contentStyle(),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                ),
                child: Text(
                  '3.2. Payment  ',
                  style: head2Style(),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                ),
                child: Text(
                  'Payments for bookings can be made through the secure payment options provided in the app. Users must ensure that they have sufficient funds or credit to complete the transaction.',
                  style: contentStyle(),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                ),
                child: Text(
                  '3.3. Cancellation and Refunds  ',
                  style: head2Style(),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                ),
                child: Text(
                    'Cancellation and refund policies vary depending on the service provider. Users are advised to review the specific terms and conditions of the airline, hotel, or travel organizer before making a booking.',
                    style: contentStyle()),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                '4. User Responsibilities',
                style: headStyle(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8),
                child: Text(
                  '4.1. Accurate Information  ',
                  style: head2Style(),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                ),
                child: Text(
                  'Users must provide accurate information during bookings and comply with the requirements of service providers.',
                  style: contentStyle(),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                ),
                child: Text(
                  '4.2. Compliance with Laws  ',
                  style: head2Style(),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                ),
                child: Text(
                  'Users must comply with all applicable laws and regulations while using our services.',
                  style: contentStyle(),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                ),
                child: Text(
                  '4.3. Respect for Other Users  ',
                  style: head2Style(),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                ),
                child: Text(
                  'Users must respect the rights and privacy of other users. Harassment, abusive behavior, and violation of others’ rights are strictly prohibited.',
                  style: contentStyle(),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                '5. Limitations of Liability',
                style: headStyle(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8),
                child: Text(
                  '5.1. Service Accuracy  ',
                  style: head2Style(),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                ),
                child: Text(
                  'While we strive to provide accurate and up-to-date information, Journy Joy does not guarantee the completeness or accuracy of the information provided. Users are advised to verify details directly with service providers.',
                  style: contentStyle(),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                ),
                child: Text(
                  '5.2. Third-Party Services  ',
                  style: head2Style(),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                ),
                child: Text(
                  'Journy Joy acts as an intermediary between users and service providers. We are not liable for any issues arising from services provided by third parties, including airlines, hotels, and travel organizers.',
                  style: contentStyle(),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                ),
                child: Text(
                  '5.3. Technical Issues  ',
                  style: head2Style(),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                ),
                child: Text(
                  'We are not responsible for any technical issues, including but not limited to, app downtime, data loss, or unauthorized access to user accounts.',
                  style: contentStyle(),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                ),
                child: Text(
                  '6. Amendments to the Policy',
                  style: headStyle(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                ),
                child: Text(
                  'Journy Joy reserves the right to amend this Service Policy at any time. Users will be notified of any significant changes through the app or via email. Continued use of the app after such changes constitutes acceptance of the new terms.',
                  style: contentStyle(),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                ),
                child: Text(
                  '7. Contact Us',
                  style: headStyle(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                ),
                child: Text(
                  'For any questions or concerns regarding this Service Policy or our services, please contact our customer support team at [support email] or [support phone number].',
                  style: contentStyle(),
                ),
              ),
            ],
          ),
        ));
  }

  TextStyle headStyle() {
    return const TextStyle(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20);
  }

  TextStyle head2Style() {
    return Styles.content.copyWith(fontSize: 16);
  }

  TextStyle contentStyle() {
    return const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey);
  }
}

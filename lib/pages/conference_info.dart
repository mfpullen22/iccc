// ignore_for_file: use_build_context_synchronously, no_leading_underscores_for_local_identifiers

//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:iccc_app/pages/auth/sign_in_page.dart';
//import 'package:iccc_app/services/firestore_service.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:iccc_app/models/faq.dart';
import 'package:iccc_app/providers.dart';
import 'package:iccc_app/widgets/bottom_navbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class ConferenceInfo extends ConsumerWidget {
  const ConferenceInfo({Key? key}) : super(key: key);

  final _headerStyle = const TextStyle(
      color: Color(0xffffffff), fontSize: 15, fontWeight: FontWeight.bold);
  //final _contentStyleHeader = const TextStyle(
  //color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.w700);
  final _contentStyle = const TextStyle(
      color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.normal);

  @override
  Widget build(BuildContext context, ref) {
    var user = FirebaseAuth.instance.currentUser!;
    deleteAccount() {
      final Email email = Email(
              body: 'PLEASE DELETE MESSAGES FOR: ${user.displayName}, ${user.email}, ${user.uid})',
              subject: 'ACCOUNT DELETED',
              recipients: ['matthew.pullen@gmail.com'],
              isHTML: false,
            );

      FlutterEmailSender.send(email);
      FirebaseAuth.instance.currentUser!.delete();

      Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const SignInPage()));
      }

    Future<void> _showAlertDialog() {
      return showDialog<void>(
        context :context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("DELETE ACCOUNT?"),
            content: SingleChildScrollView(
              child: ListBody(
                children: const [
                  Text("Click DELETE to delete your account."),
                  Text("This will also automatically send an e-mail to our team, who will delete all your messages (sent and received) within 24 hours and send a confirmation e-mail to the address you registered with."),
              ],
            ),
          ),
            actions: [
              ElevatedButton(onPressed: deleteAccount, child: const Text("DELETE")),
              ElevatedButton(onPressed: () {Navigator.of(context).pop();}, child: const Text("CANCEL"))
            ]);
        }
         );
    }


    //FirebaseFirestore firestore = FirebaseFirestore.instance;
   /*  deleteDocuments() async {
      
      final query = await firestore.collection("chats");
      //.where("myName" == user.displayName || "otherName" == user.displayName);

      //final documents = await query.get();
      
      //documents.documents.forEach((doc) => doc.reference.delete());
      final chats = await FirestoreService(uid: user.uid).getChats();
      final lenChat = await chats.length;

      for(var i = 0; i < lenChat; i++) {
        if chats[i]
      }
    } */

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Conference Info"),
          centerTitle: true,
        ),
        extendBody: true,
        bottomNavigationBar: const BottomNavBarFb5(
          pageIndex: 5,
        ),
        body: StreamBuilder<List<FAQ>>(
          stream: ref.read(databaseProvider)!.getFAQ(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text(
                    "Something went wrong! Are you connected to the internet?"),
              );
            }
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final allQuestions = snapshot.data ?? [];
            List<Map<String, dynamic>> travelQuestions = [];
            List<Map<String, dynamic>> conferenceQuestions = [];
            List<Map<String, dynamic>> venueQuestions = [];
            List<Map<String, dynamic>> mealsQuestions = [];
            List<Map<String, dynamic>> speakersQuestions = [];
            List<Map<String, dynamic>> postersQuestions = [];
            for (var i = 0; i < allQuestions.length; i++) {
              var item = allQuestions[i].toMap();
              if (item["topic"] == "travel") {
                travelQuestions.add(item);
              }
              if (item["topic"] == "conference") {
                conferenceQuestions.add(item);
              }
              if (item["topic"] == "venue") {
                venueQuestions.add(item);
              }
              if (item["topic"] == "meals") {
                mealsQuestions.add(item);
              }
              if (item["topic"] == "speakers") {
                speakersQuestions.add(item);
              }
              if (item["topic"] == "posters") {
                postersQuestions.add(item);
              }
            }
            return SingleChildScrollView(
              child: Accordion(
                disableScrolling: true,
                maxOpenSections: 2,
                headerBackgroundColorOpened: Colors.black54,
                scaleWhenAnimating: true,
                openAndCloseAnimation: true,
                headerPadding:
                    const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
                sectionClosingHapticFeedback: SectionHapticFeedback.light,
                children: [
                  AccordionSection(
                    isOpen: false,
                    leftIcon: const Icon(
                      Icons.insights_rounded,
                      color: Colors.white,
                    ),
                    headerBackgroundColor: Colors.black,
                    headerBackgroundColorOpened: Colors.blueAccent,
                    header: Text("Travel Questions", style: _headerStyle),
                    contentHorizontalPadding: 20,
                    contentBorderWidth: 1,
                    content: Accordion(
                      maxOpenSections: 1,
                      headerBackgroundColorOpened: Colors.blueGrey,
                      headerPadding: const EdgeInsets.symmetric(
                          vertical: 7, horizontal: 15),
                      children: List.generate(
                        travelQuestions.length,
                        (index) {
                          return AccordionSection(
                              isOpen: false,
                              leftIcon: const Icon(Icons.insights_rounded,
                                  color: Colors.white),
                              headerBackgroundColor: Colors.black38,
                              headerBackgroundColorOpened: Colors.black54,
                              header: Text(travelQuestions[index]["question"],
                                  style: _headerStyle),
                              content: Text(travelQuestions[index]["answer"],
                                  style: _contentStyle));
                        },
                      ),
                    ),
                  ),
                  AccordionSection(
                    isOpen: false,
                    leftIcon: const Icon(
                      Icons.insights_rounded,
                      color: Colors.white,
                    ),
                    headerBackgroundColor: Colors.black,
                    headerBackgroundColorOpened: Colors.blueAccent,
                    header: Text("Conference Questions", style: _headerStyle),
                    contentHorizontalPadding: 20,
                    contentBorderWidth: 1,
                    content: Accordion(
                      maxOpenSections: 1,
                      headerBackgroundColorOpened: Colors.blueGrey,
                      headerPadding: const EdgeInsets.symmetric(
                          vertical: 7, horizontal: 15),
                      children: List.generate(
                        conferenceQuestions.length,
                        (index) {
                          return AccordionSection(
                              isOpen: false,
                              leftIcon: const Icon(Icons.insights_rounded,
                                  color: Colors.white),
                              headerBackgroundColor: Colors.black38,
                              headerBackgroundColorOpened: Colors.black54,
                              header: Text(
                                  conferenceQuestions[index]["question"],
                                  style: _headerStyle),
                              content: Text(
                                  conferenceQuestions[index]["answer"],
                                  style: _contentStyle));
                        },
                      ),
                    ),
                  ),
                  AccordionSection(
                    isOpen: false,
                    leftIcon: const Icon(
                      Icons.insights_rounded,
                      color: Colors.white,
                    ),
                    headerBackgroundColor: Colors.black,
                    headerBackgroundColorOpened: Colors.blueAccent,
                    header: Text("Venue Questions", style: _headerStyle),
                    contentHorizontalPadding: 20,
                    contentBorderWidth: 1,
                    content: Accordion(
                      maxOpenSections: 1,
                      headerBackgroundColorOpened: Colors.blueGrey,
                      headerPadding: const EdgeInsets.symmetric(
                          vertical: 7, horizontal: 15),
                      children: List.generate(
                        venueQuestions.length,
                        (index) {
                          return AccordionSection(
                              isOpen: false,
                              leftIcon: const Icon(Icons.insights_rounded,
                                  color: Colors.white),
                              headerBackgroundColor: Colors.black38,
                              headerBackgroundColorOpened: Colors.black54,
                              header: Text(venueQuestions[index]["question"],
                                  style: _headerStyle),
                              content: Text(venueQuestions[index]["answer"],
                                  style: _contentStyle));
                        },
                      ),
                    ),
                  ),
                  AccordionSection(
                    isOpen: false,
                    leftIcon: const Icon(
                      Icons.insights_rounded,
                      color: Colors.white,
                    ),
                    headerBackgroundColor: Colors.black,
                    headerBackgroundColorOpened: Colors.blueAccent,
                    header: Text("Meal Questions", style: _headerStyle),
                    contentHorizontalPadding: 20,
                    contentBorderWidth: 1,
                    content: Accordion(
                      maxOpenSections: 1,
                      headerBackgroundColorOpened: Colors.blueGrey,
                      headerPadding: const EdgeInsets.symmetric(
                          vertical: 7, horizontal: 15),
                      children: List.generate(
                        mealsQuestions.length,
                        (index) {
                          return AccordionSection(
                              isOpen: false,
                              leftIcon: const Icon(Icons.insights_rounded,
                                  color: Colors.white),
                              headerBackgroundColor: Colors.black38,
                              headerBackgroundColorOpened: Colors.black54,
                              header: Text(mealsQuestions[index]["question"],
                                  style: _headerStyle),
                              content: Text(mealsQuestions[index]["answer"],
                                  style: _contentStyle));
                        },
                      ),
                    ),
                  ),
                  AccordionSection(
                    isOpen: false,
                    leftIcon: const Icon(
                      Icons.insights_rounded,
                      color: Colors.white,
                    ),
                    headerBackgroundColor: Colors.black,
                    headerBackgroundColorOpened: Colors.blueAccent,
                    header: Text("Speaker Questions", style: _headerStyle),
                    contentHorizontalPadding: 20,
                    contentBorderWidth: 1,
                    content: Accordion(
                      maxOpenSections: 1,
                      headerBackgroundColorOpened: Colors.blueGrey,
                      headerPadding: const EdgeInsets.symmetric(
                          vertical: 7, horizontal: 15),
                      children: List.generate(
                        speakersQuestions.length,
                        (index) {
                          return AccordionSection(
                              isOpen: false,
                              leftIcon: const Icon(Icons.insights_rounded,
                                  color: Colors.white),
                              headerBackgroundColor: Colors.black38,
                              headerBackgroundColorOpened: Colors.black54,
                              header: Text(speakersQuestions[index]["question"],
                                  style: _headerStyle),
                              content: Text(speakersQuestions[index]["answer"],
                                  style: _contentStyle));
                        },
                      ),
                    ),
                  ),
                  AccordionSection(
                    isOpen: false,
                    leftIcon: const Icon(
                      Icons.insights_rounded,
                      color: Colors.white,
                    ),
                    headerBackgroundColor: Colors.black,
                    headerBackgroundColorOpened: Colors.blueAccent,
                    header: Text("Poster Questions", style: _headerStyle),
                    contentHorizontalPadding: 20,
                    contentBorderWidth: 1,
                    content: Accordion(
                      maxOpenSections: 1,
                      headerBackgroundColorOpened: Colors.blueGrey,
                      headerPadding: const EdgeInsets.symmetric(
                          vertical: 7, horizontal: 15),
                      children: List.generate(
                        postersQuestions.length,
                        (index) {
                          return AccordionSection(
                              isOpen: false,
                              leftIcon: const Icon(Icons.insights_rounded,
                                  color: Colors.white),
                              headerBackgroundColor: Colors.black38,
                              headerBackgroundColorOpened: Colors.black54,
                              header: Text(postersQuestions[index]["question"],
                                  style: _headerStyle),
                              content: Text(postersQuestions[index]["answer"],
                                  style: _contentStyle));
                        },
                      ),
                    ),
                  ),
                  AccordionSection(
                    isOpen: false,
                    leftIcon: const Icon(
                      Icons.insights_rounded,
                      color: Colors.white,
                    ),
                    headerBackgroundColor: Colors.black,
                    headerBackgroundColorOpened: Colors.blueAccent,
                    header: Text("Account Privacy and Deletion", style: _headerStyle),
                    contentHorizontalPadding: 20,
                    contentBorderWidth: 1,
                    content: Accordion(
                      maxOpenSections: 1,
                      headerBackgroundColorOpened: Colors.blueGrey,
                      headerPadding: const EdgeInsets.symmetric(
                          vertical: 7, horizontal: 15),
                      children: [
                        AccordionSection(
                            isOpen: false,
                            leftIcon: const Icon(Icons.insights_rounded,
                                color: Colors.white),
                            headerBackgroundColor: Colors.black38,
                            headerBackgroundColorOpened: Colors.black54,
                            header: Text("How can I delete my account?",
                                style: _headerStyle),
                            content: Column(
                              children: [
                                Text(
                                    "To delete your account, please email your request to matthew.pullen@gmail.com. Your account, along with messages sent/received, will be deleted within 48 hours and you will receive a confirmation email once this is completed.",
                                    style: _contentStyle),
                                const SizedBox(height: 10),
                                ElevatedButton(
                                  onPressed: _showAlertDialog, 
                                  child: const Text("DELETE ACCOUNT"))
                              ],
                            ),
                            contentHorizontalPadding: 20,
                            contentBorderWidth: 1),
                        AccordionSection(
                          isOpen: false,
                          leftIcon: const Icon(Icons.insights_rounded,
                              color: Colors.white),
                          headerBackgroundColor: Colors.black38,
                          headerBackgroundColorOpened: Colors.black54,
                          header: Text("What is this app's privacy policy?",
                              style: _headerStyle),
                          content: Column(
                            children: [
                              Text(
                                "Privacy Policy",
                                style: GoogleFonts.raleway(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              Text(''' 
Matthew Pullen built the ICCC 2023 app as a Free app. This SERVICE is provided by Matthew Pullen at no cost and is intended for use as is.

This page is used to inform visitors regarding my policies with the collection, use, and disclosure of Personal Information if anyone decided to use my Service.

If you choose to use my Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that I collect is used for providing and improving the Service. I will not use or share your information with anyone except as described in this Privacy Policy.

The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which are accessible at ICCC 2023 unless otherwise defined in this Privacy Policy. 
                                  ''',
                                  style: GoogleFonts.raleway(fontSize: 13)),
                              Text("Information Collection and Use",
                                  style: GoogleFonts.raleway(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              Text('''
For a better experience, while using our Service, I may require you to provide us with certain personally identifiable information, including but not limited to First name, last name, email address. The information that I request will be retained on your device and is not collected by me in any way.

The app does use third-party services that may collect information used to identify you.

Link to the privacy policy of third-party service providers used by the app 
''', style: GoogleFonts.raleway(fontSize: 13)),
                              InkWell(
                                  onTap: () => launchUrl(Uri.parse(
                                      'https://policies.google.com/privacy')),
                                  child: Text("- Google Play Service",
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.raleway(
                                          fontSize: 13, color: Colors.blue))),
                              InkWell(
                                  onTap: () => launchUrl(Uri.parse(
                                      'https://firebase.google.com/policies/analytics')),
                                  child: Text("- Google Analytics for Firebase",
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.raleway(
                                          fontSize: 13, color: Colors.blue))),
                              InkWell(
                                  onTap: () => launchUrl(Uri.parse(
                                      'https://firebase.google.com/support/privacy/')),
                                  child: Text("- Firebase Crashlytics",
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.raleway(
                                          fontSize: 13, color: Colors.blue))),
                              const SizedBox(height: 10),
                              Text("Log Data",
                                  style: GoogleFonts.raleway(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              Text('''
I want to inform you that whenever you use my Service, in a case of an error in the app I collect data and information (through third-party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing my Service, the time and date of your use of the Service, and other statistics. 
''', style: GoogleFonts.raleway(fontSize: 13)),
                              Text("Cookies",
                                  style: GoogleFonts.raleway(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              Text('''
Cookies are files with a small amount of data that are commonly used as anonymous unique identifiers. These are sent to your browser from the websites that you visit and are stored on your device's internal memory.

This Service does not use these “cookies” explicitly. However, the app may use third-party code and libraries that use “cookies” to collect information and improve their services. You have the option to either accept or refuse these cookies and know when a cookie is being sent to your device. If you choose to refuse our cookies, you may not be able to use some portions of this Service. 
''', style: GoogleFonts.raleway(fontSize: 13)),
                              Text("Service Providers",
                                  style: GoogleFonts.raleway(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              Text('''
 I may employ third-party companies and individuals due to the following reasons:

    To facilitate our Service;
    To provide the Service on our behalf;
    To perform Service-related services; or
    To assist us in analyzing how our Service is used.

I want to inform users of this Service that these third parties have access to their Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose. 
''', style: GoogleFonts.raleway(fontSize: 13)),
                              Text("Security",
                                  style: GoogleFonts.raleway(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                  '''I value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and I cannot guarantee its absolute security.
                                      ''',
                                  style: GoogleFonts.raleway(fontSize: 13)),
                              Text("Links to Other Sites",
                                  style: GoogleFonts.raleway(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                  '''This Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by me. Therefore, I strongly advise you to review the Privacy Policy of these websites. I have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services. 
                                      ''',
                                  style: GoogleFonts.raleway(fontSize: 13)),
                              Text("Children's Privacy",
                                  style: GoogleFonts.raleway(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                  '''These Services do not address anyone under the age of 13. I do not knowingly collect personally identifiable information from children under 13 years of age. In the case I discover that a child under 13 has provided me with personal information, I immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact me so that I will be able to do the necessary actions.
''',
                                  style: GoogleFonts.raleway(fontSize: 13)),
                              Text("Changes to this Privacy Policy",
                                  style: GoogleFonts.raleway(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                  '''I may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. I will notify you of any changes by posting the new Privacy Policy on this page.

This policy is effective as of 2022-12-22
                                      ''',
                                  style: GoogleFonts.raleway(fontSize: 13)),
                              Text("Contact Us",
                                  style: GoogleFonts.raleway(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                  '''If you have any questions or suggestions about my Privacy Policy, do not hesitate to contact me at matthew.pullen@gmail.com.

This privacy policy page was created at privacypolicytemplate.net and modified/generated by App Privacy Policy Generator''',
                                  style: GoogleFonts.raleway(fontSize: 13)),
                            ],
                          ),
                        ),
                        AccordionSection(
                          isOpen: false,
                          leftIcon: const Icon(Icons.insights_rounded,
                              color: Colors.white),
                          headerBackgroundColor: Colors.black38,
                          headerBackgroundColorOpened: Colors.black54,
                          header:
                              Text("Terms and Conditions", style: _headerStyle),
                          content: Column(children: [
                            Text("Terms & Conditions",
                                style: GoogleFonts.raleway(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                            Text(
                                '''By downloading or using the app, these terms will automatically apply to you – you should make sure therefore that you read them carefully before using the app. You’re not allowed to copy or modify the app, any part of the app, or our trademarks in any way. You’re not allowed to attempt to extract the source code of the app, and you also shouldn’t try to translate the app into other languages or make derivative versions. The app itself, and all the trademarks, copyright, database rights, and other intellectual property rights related to it, still belong to Matthew Pullen.

Matthew Pullen is committed to ensuring that the app is as useful and efficient as possible. For that reason, we reserve the right to make changes to the app or to charge for its services, at any time and for any reason. We will never charge you for the app or its services without making it very clear to you exactly what you’re paying for.

The ICCC 2023 app stores and processes personal data that you have provided to us, to provide my Service. It’s your responsibility to keep your phone and access to the app secure. We therefore recommend that you do not jailbreak or root your phone, which is the process of removing software restrictions and limitations imposed by the official operating system of your device. It could make your phone vulnerable to malware/viruses/malicious programs, compromise your phone’s security features and it could mean that the ICCC 2023 app won’t work properly or at all.

The app does use third-party services that declare their Terms and Conditions.

Link to Terms and Conditions of third-party service providers used by the app''',
                                style: GoogleFonts.raleway(fontSize: 13)),
                            InkWell(
                                onTap: () => launchUrl(Uri.parse(
                                    'https://policies.google.com/privacy')),
                                child: Text("- Google Play Service",
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.raleway(
                                        fontSize: 13, color: Colors.blue))),
                            InkWell(
                                onTap: () => launchUrl(Uri.parse(
                                    'https://firebase.google.com/policies/analytics')),
                                child: Text("- Google Analytics for Firebase",
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.raleway(
                                        fontSize: 13, color: Colors.blue))),
                            InkWell(
                                onTap: () => launchUrl(Uri.parse(
                                    'https://firebase.google.com/support/privacy/')),
                                child: Text("- Firebase Crashlytics",
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.raleway(
                                        fontSize: 13, color: Colors.blue))),
                            const SizedBox(height: 10),
                            Text(
                                ''' You should be aware that there are certain things that Matthew Pullen will not take responsibility for. Certain functions of the app will require the app to have an active internet connection. The connection can be Wi-Fi or provided by your mobile network provider, but Matthew Pullen cannot take responsibility for the app not working at full functionality if you don’t have access to Wi-Fi, and you don’t have any of your data allowance left.

If you’re using the app outside of an area with Wi-Fi, you should remember that the terms of the agreement with your mobile network provider will still apply. As a result, you may be charged by your mobile provider for the cost of data for the duration of the connection while accessing the app, or other third-party charges. In using the app, you’re accepting responsibility for any such charges, including roaming data charges if you use the app outside of your home territory (i.e. region or country) without turning off data roaming. If you are not the bill payer for the device on which you’re using the app, please be aware that we assume that you have received permission from the bill payer for using the app.

Along the same lines, Matthew Pullen cannot always take responsibility for the way you use the app i.e. You need to make sure that your device stays charged – if it runs out of battery and you can’t turn it on to avail the Service, Matthew Pullen cannot accept responsibility.

With respect to Matthew Pullen’s responsibility for your use of the app, when you’re using the app, it’s important to bear in mind that although we endeavor to ensure that it is updated and correct at all times, we do rely on third parties to provide information to us so that we can make it available to you. Matthew Pullen accepts no liability for any loss, direct or indirect, you experience as a result of relying wholly on this functionality of the app.

At some point, we may wish to update the app. The app is currently available on Android & iOS – the requirements for the both systems(and for any additional systems we decide to extend the availability of the app to) may change, and you’ll need to download the updates if you want to keep using the app. Matthew Pullen does not promise that it will always update the app so that it is relevant to you and/or works with the Android & iOS version that you have installed on your device. However, you promise to always accept updates to the application when offered to you, We may also wish to stop providing the app, and may terminate use of it at any time without giving notice of termination to you. Unless we tell you otherwise, upon any termination, (a) the rights and licenses granted to you in these terms will end; (b) you must stop using the app, and (if needed) delete it from your device.''',
                                style: GoogleFonts.raleway(fontSize: 13)),
                            const SizedBox(height: 10),
                            Text("Changes to these Terms & Conditions",
                                style: GoogleFonts.raleway(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                            Text(
                                '''I may update our Terms and Conditions from time to time. Thus, you are advised to review this page periodically for any changes. I will notify you of any changes by posting the new Terms and Conditions on this page.

These terms and conditions are effective as of 2022-12-22 ''',
                                style: GoogleFonts.raleway(fontSize: 13)),
                            const SizedBox(height: 10),
                            Text("Changes to these Terms & Conditions",
                                style: GoogleFonts.raleway(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                            Text(
                                ''' If you have any questions or suggestions about my Terms and Conditions, do not hesitate to contact me at matthew.pullen@gmail.com.

This Terms and Conditions page was generated by App Privacy Policy Generator''',
                                style: GoogleFonts.raleway(fontSize: 13))
                          ]),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/privacypolicyteacher/bloc/privacy_policy_teacher_bloc.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/privacypolicyteacher/bloc/privacy_policy_teacher_event.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/privacypolicyteacher/bloc/privacy_policy_teacher_state.dart';

class PrivacyPolicyTeacherView extends StatelessWidget {
  const PrivacyPolicyTeacherView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            PrivacyPolicyTeacherBloc()..add(LoadPrivacyPolicyTeacher()),
        child: BlocBuilder<PrivacyPolicyTeacherBloc, PrivacyPolicyTeacherState>(
            builder: (context, state) {
          return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              GoRouter.of(context)
                                  .go('/navbar_teacher');
                            },
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.grey[300],
                              child: const Icon(Icons.arrow_back,
                                  color: Colors.black),
                            ),
                          ),
                          const Expanded(
                              child: Text(
                            'Kebijakan Privasi',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w900),
                            textAlign: TextAlign.center,
                          ))
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "Sekolahku\n",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "Last updated: March 14, 2024\nThis Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your information when You use the Service and tells You about Your privacy rights and how the law protects You.\n\nWe use Your Personal data to provide and improve the Service. By using the Service, You agree to the collection and use of information in accordance with this Privacy Policy. This Privacy Policy has been created with the help of the Privacy Policy Generator.\n",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const Text(
                        "Interpretations and Definitions\n\nInterpretation\n",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "The words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.\n",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const Text(
                        "Definitions\n",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'For the purposes of this Privacy Policy:\n\nAccount means a unique account created for You to access our Service or parts of our Service.\n\nAffiliate means an entity that controls, is controlled by or is under common control with a party, where "control" means ownership of 50% or more of the shares, equity interest or other securities entitled to vote for election of directors or other managing authority.\n\nApplication refers to KelasKita, the software program provided by the Company.\n\nCompany (referred to as either "the Company", "We", "Us" or "Our" in this Agreement) refers to Kelasikan, Kudus, Besito.\n\nCountry refers to: Indonesia\n\nDevice means any device that can access the Service such as a computer, a cellphone or a digital tablet.\n\nPersonal Data is any information that relates to an identified or identifiable individual.\n\nService refers to the Application.\n\nService Provider means any natural or legal person who processes the data on behalf of the Company. It refers to third-party companies or individuals employed by the Company to facilitate the Service, to provide the Service on behalf of the Company, to perform services related to the Service or to assist the Company in analyzing how the Service is used.\n\nThird-party Social Media Service refers to any website or any social network website through which a User can log in or create an account to use the Service.\n\nUsage Data refers to data collected automatically, either generated by the use of the Service or from the Service infrastructure itself (for example, the duration of a page visit).\n\nYou means the individual accessing or using the Service, or the company, or other legal entity on behalf of which such individual is accessing or using the Service, as applicable.',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      )
                    ]),
              ));
        }),
      ),
    );
  }
}

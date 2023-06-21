// import 'package:flutter/material.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:manda_aquela/color_schemes.g.dart';
// import 'package:manda_aquela/presenter/common/assets.dart';
// import 'package:manda_aquela/presenter/common/text_styles.dart';
// import 'package:manda_aquela/presenter/profile/widgets/description_widget.dart';
// import 'package:manda_aquela/presenter/profile/widgets/profile_action_button.dart';
// import 'package:manda_aquela/presenter/widgets/bottom_sheets/contacts_bottom_sheet.dart';
// import 'package:manda_aquela/presenter/widgets/bottom_sheets/establishment_bottom_sheet.dart';
// import 'package:manda_aquela/presenter/widgets/bottom_sheets/skills_bottom_sheet.dart';
// import 'package:manda_aquela/presenter/widgets/common_dialog/signup_dialog.dart';
// import 'package:manda_aquela/presenter/widgets/rate/rate_notes.dart';

// class MusicianProfilePage extends StatefulWidget {
//   const MusicianProfilePage({super.key});

//   @override
//   State<MusicianProfilePage> createState() => _MusicianProfilePageState();
// }

// class _MusicianProfilePageState extends State<MusicianProfilePage> {
//   final _controller = Modular.get<MusicianProfilePageController>();

//   @override
//   void initState() {
//     _controller.getUserModel();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => Scaffold(
//         body: Stack(
//           children: [
//             Container(
//               height: MediaQuery.of(context).size.height * 0.45,
//               width: double.infinity,
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [
//                     Color(0xFFAE2706),
//                     AppColors.primary,
//                   ],
//                   begin: Alignment.bottomLeft,
//                   end: Alignment.topRight,
//                 ),
//               ),
//             ),
//             SafeArea(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Row(
//                     children: [
//                       IconButton(
//                           onPressed: () {
//                             Modular.to.pop();
//                           },
//                           icon: const Icon(
//                             Icons.chevron_left,
//                             color: Colors.white,
//                           )),
//                       const Spacer(),
//                       IconButton(
//                           onPressed: () {
//                             showDialog(
//                               context: context,
//                               builder: (context) => SignUpDialog(
//                                 title: 'Deseja sair do app?',
//                                 bodyText:
//                                     'Tem certeza que deseja sair do Manda Aquela?',
//                                 labelButtonLeft: 'cancelar',
//                                 labelButtonRight: 'sair',
//                                 onTapButtonLeft: () {
//                                   Modular.to.pop();
//                                 },
//                                 onTapButtonRight: () {
//                                   _controller.logout();
//                                 },
//                               ),
//                             );
//                           },
//                           icon: const Icon(
//                             Icons.logout,
//                             color: Colors.white,
//                           )),
//                     ],
//                   ),
//                   buildHeader(),
//                   const SizedBox(
//                     height: 75,
//                   ),
//                   getActionButtons(),
//                   const SizedBox(
//                     height: 16,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 24.0),
//                     child: DescriptionWidget(
//                       description: _controller.userModel?.description ?? '',
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget getActionButtons() {
//     if (_controller.userModel?.type == 'musician') {
//       return Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           ProfileActionButton(
//             onTap: () async {
//               showModalBottomSheet(
//                 shape: const RoundedRectangleBorder(
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(24),
//                     topRight: Radius.circular(24),
//                   ),
//                 ),
//                 isScrollControlled: true,
//                 context: context,
//                 builder: (context) {
//                   return ContactsBottomSheet(
//                     socialMedias: _controller.userModel?.socialMedia ?? [],
//                   );
//                 },
//               );
//             },
//             text: 'Contato',
//             icon: const Icon(
//               Icons.contact_emergency_outlined,
//               color: AppColors.primary,
//             ),
//           ),
//           ProfileActionButton(
//             onTap: () {
//               showModalBottomSheet(
//                 shape: const RoundedRectangleBorder(
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(24),
//                     topRight: Radius.circular(24),
//                   ),
//                 ),
//                 isScrollControlled: true,
//                 context: context,
//                 builder: (context) {
//                   return SkillsBottomSheet(
//                     skills: _controller.skills,
//                   );
//                 },
//               );
//             },
//             text: 'Habilidades',
//             icon: SvgPicture.asset(
//               Assets.musicalNoteIcon.path,
//               colorFilter:
//                   const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
//             ),
//           ),
//         ],
//       );
//     }
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         ProfileActionButton(
//           onTap: () {
//             showModalBottomSheet(
//               shape: const RoundedRectangleBorder(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(24),
//                   topRight: Radius.circular(24),
//                 ),
//               ),
//               isScrollControlled: true,
//               context: context,
//               builder: (context) {
//                 return ContactsBottomSheet(
//                   socialMedias: _controller.userModel?.socialMedia ?? [],
//                 );
//               },
//             );
//           },
//           text: 'Contato',
//           icon: const Icon(
//             Icons.contact_emergency_outlined,
//             color: AppColors.primary,
//           ),
//         ),
//         ProfileActionButton(
//           onTap: () {
//             showModalBottomSheet(
//               shape: const RoundedRectangleBorder(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(24),
//                   topRight: Radius.circular(24),
//                 ),
//               ),
//               isScrollControlled: true,
//               context: context,
//               builder: (context) {
//                 return EstablishmentBottomSheet(
//                   establishments: _controller.establishments,
//                 );
//               },
//             );
//           },
//           text: 'Estabelecimentos',
//           icon: const Icon(
//             Icons.cabin_outlined,
//             color: AppColors.primary,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget buildHeader() {
//     return Padding(
//       padding: const EdgeInsets.only(left: 24.0),
//       child: Row(
//         children: [
//           Container(
//             height: 200,
//             width: 100,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(24),
//               image: _controller.userModel?.photoUrl != null
//                   ? DecorationImage(
//                       image: NetworkImage(
//                         _controller.userModel!.photoUrl!,
//                       ),
//                     )
//                   : null,
//             ),
//           ),
//           const SizedBox(
//             width: 24,
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 _controller.userModel?.name ?? 'Seu nome',
//                 style: TextStyles.outfit18px700w.copyWith(color: Colors.white),
//               ),
//               Row(
//                 children: [
//                   Text(
//                     _controller.userModel?.rate.toString() ?? '',
//                     style:
//                         TextStyles.outfit18px700w.copyWith(color: Colors.white),
//                   ),
//                   const SizedBox(
//                     width: 4,
//                   ),
//                   RateNotes(rate: _controller.userModel?.rate ?? 0),
//                 ],
//               ),
//               _controller.userModel?.fee != null
//                   ? Text(
//                       'R\$ ${_controller.userModel?.fee!}',
//                       style: TextStyles.outfit18px700w
//                           .copyWith(color: AppColors.success),
//                     )
//                   : Text(
//                       'Contratante',
//                       style: TextStyles.outfit18px700w
//                           .copyWith(color: Colors.grey),
//                     ),
//               _controller.userModel?.skills != null
//                   ? Text(
//                       _controller.getSkillsStrings,
//                       style: TextStyles.outfit15px400w
//                           .copyWith(color: Colors.grey),
//                     )
//                   : const SizedBox.shrink(),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

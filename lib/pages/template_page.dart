import 'package:flutter/material.dart';
import 'package:retrospective/core/code_generator.dart';
import 'package:retrospective/localization/retrospective_localization.dart';
import 'package:retrospective/model/retro_page_params.dart';
import 'package:retrospective/template/abstract_base_template.dart';
import 'package:retrospective/template/lean_coffee.dart';
import 'package:retrospective/template/mad_glad_sad.dart';
import 'package:retrospective/template/sailorboat.dart';
import 'package:retrospective/template/starfish.dart';
import 'package:retrospective/template/fourls.dart';
import 'package:retrospective/template/stop_start_continue.dart';
import 'package:retrospective/template/what_went_well.dart';
import 'package:retrospective/template/wrap.dart';

class TemplatePage extends StatelessWidget {
  final AbstractBaseTemplate madGladSadTemplate = MadGladSad();
  final AbstractBaseTemplate starfishTemplate = Starfish();
  final AbstractBaseTemplate sailorboatTemplate = Sailorboat();
  final AbstractBaseTemplate fourLsTemplate = FourLs();
  final AbstractBaseTemplate stopStartContinueTemplate = StopStartContinue();
  final AbstractBaseTemplate whatWentWellTemplate = WhatWentWell();
  final AbstractBaseTemplate leanCoffeeTemplate = LeanCoffee();
  final AbstractBaseTemplate wrapTemplate = WrapTechnique();
  final CodeGenerator _codeGenerator = CodeGenerator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(RetrospectiveLocalization.of(context).chooseTemplate),
        ),
        body: GridView.count(
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          crossAxisCount: 2,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/retro",arguments: RetroPageParams(madGladSadTemplate,roomCodeGenerate(madGladSadTemplate.getTemplateTypeId())));
              },
              child: Container(
                color: Theme.of(context).primaryColorDark,
                padding: const EdgeInsets.all(8),
                child: madGladSadTemplate.getTemplateWidget(context),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/retro",arguments: RetroPageParams(starfishTemplate,roomCodeGenerate(starfishTemplate.getTemplateTypeId())));
              },
              child: Container(
                color: Theme.of(context).primaryColorDark,
                padding: const EdgeInsets.all(8),
                child: starfishTemplate.getTemplateWidget(context),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/retro",arguments: RetroPageParams(sailorboatTemplate,roomCodeGenerate(sailorboatTemplate.getTemplateTypeId())));
              },
              child: Container(
                color: Theme.of(context).primaryColorDark,
                padding: const EdgeInsets.all(8),
                child: sailorboatTemplate.getTemplateWidget(context),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/retro",arguments: RetroPageParams(fourLsTemplate,roomCodeGenerate(fourLsTemplate.getTemplateTypeId())));
              },
              child: Container(
                color: Theme.of(context).primaryColorDark,
                padding: const EdgeInsets.all(8),
                child: fourLsTemplate.getTemplateWidget(context),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/retro",arguments: RetroPageParams(stopStartContinueTemplate,roomCodeGenerate(stopStartContinueTemplate.getTemplateTypeId())));
              },
              child: Container(
                color: Theme.of(context).primaryColorDark,
                padding: const EdgeInsets.all(8),
                child: stopStartContinueTemplate.getTemplateWidget(context),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/retro",arguments: RetroPageParams(whatWentWellTemplate,roomCodeGenerate(whatWentWellTemplate.getTemplateTypeId())));
              },
              child: Container(
                color: Theme.of(context).primaryColorDark,
                padding: const EdgeInsets.all(8),
                child: whatWentWellTemplate.getTemplateWidget(context),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/retro",arguments: RetroPageParams(leanCoffeeTemplate,roomCodeGenerate(leanCoffeeTemplate.getTemplateTypeId())));
              },
              child: Container(
                color: Theme.of(context).primaryColorDark,
                padding: const EdgeInsets.all(8),
                child: leanCoffeeTemplate.getTemplateWidget(context),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/retro",arguments: RetroPageParams(wrapTemplate,roomCodeGenerate(wrapTemplate.getTemplateTypeId())));
              },
              child: Container(
                color: Theme.of(context).primaryColorDark,
                padding: const EdgeInsets.all(8),
                child: wrapTemplate.getTemplateWidget(context),
              ),
            ),
          ],
        ));
  }
  String roomCodeGenerate(int templateId){
    return _codeGenerator.generateRoomCode(templateId);
  }
}

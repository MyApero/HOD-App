import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hod/models/werewolf_role_model.dart';

const List<WerewolfRoleModel> roleList = [
  WerewolfRoleModel(
      name: "Loup-garou",
      icon: FontAwesomeIcons.wolfPackBattalion,
      message:
          """Les Loups-Garous sont des villageois qui se transforment en loups et se concertent pour tuer un autre joueur chaque nuit.

Leur objectif est d'éliminer tous les autres joueurs sans se faire découvrir."""),
  WerewolfRoleModel(
      name: "Villageois",
      message:
          """Les Villageois sont des habitants du village qui n'ont pas de pouvoir spécial.

Leur objectif est de découvrir et d'éliminer tous les Loups-Garous.""",
      icon: FontAwesomeIcons.person),
  WerewolfRoleModel(
      name: "Sorcière",
      message:
          """La Sorcière est un joueur qui a deux potions à usage unique : une pour guérir et une autre pour tuer un joueur.

Elle peut utiliser une de ces potions ou pas chaque nuit.""",
      icon: FontAwesomeIcons.broom),
  WerewolfRoleModel(
      name: "Cupidon",
      message:
          """Cupidon est un joueur qui a le pouvoir de faire tomber deux joueurs amoureux au début de la partie.

Les Amoureux doivent se protéger mutuellement et gagner ensemble. Si l'un des deux amants meurt, l'autre meurt aussi.""",
      icon: FontAwesomeIcons.heart),
  WerewolfRoleModel(
      name: "Voleur",
      message:
          """Le Voleur est un joueur qui a le pouvoir de voler le rôle d'un autre joueur lors de la première nuit. 
          
Il prendra alors le rôle de la personne avec qui elle a échangé et la personne volée deviendra un villageois.""",
      icon: FontAwesomeIcons.mask),
  WerewolfRoleModel(
      name: "Chasseur",
      message:
          """Le Chasseur est un joueur qui a le pouvoir de tuer un autre joueur lorsqu'il est éliminé.

Il fait partie des villageois.""",
      icon: FontAwesomeIcons.personRifle),
  WerewolfRoleModel(
      name: "Voyante",
      message:
          """La Voyante est un joueur qui a la capacité de voir l'identité d'un autre joueur chaque nuit.

Elle doit aider les Villageois à trouver les Loups-Garous.""",
      icon: FontAwesomeIcons.eye),
  WerewolfRoleModel(
      name: "Petite fille",
      message:
          """La Petite Fille est un joueur qui a le pouvoir de se réveiller la nuit et d'espionner les Loups-Garous, mais elle doit faire attention à ne pas se faire attraper.

Elle fait partie des villageois.""",
      icon: FontAwesomeIcons.childDress)
];

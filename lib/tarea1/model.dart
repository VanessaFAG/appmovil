//import 'package:flutter/material.dart';

class HeroModel {
  final String name;
  final String image;
  final double health, attack;

  HeroModel({
    required this.name,
    required this.image,
    required this.health,
    required this.attack,
  });
}

final List<HeroModel> heroes = [
  HeroModel(
    name: 'Godzilla',
    image: '/assets/tarea1/g.jpg',
    health: 100.0,
    attack: 90.0,
  ),
  HeroModel(
    name: 'SpaceGodzilla',
    image: '/assets/tarea1/sp.png',
    health: 100.0,
    attack: 85.0,
  ),
  HeroModel(
    name: 'King Ghidorah',
    image: '/assets/tarea1/kg.jpg',
    health: 150.0,
    attack: 110.0,
  ),
  HeroModel(
    name: 'Mechagodzilla',
    image: '/assets/tarea1/mg.jpg',
    health: 100.0,
    attack: 90.0,
  ),
  HeroModel(
    name: 'Mothra',
    image: '/assets/tarea1/m.jpg',
    health: 80.0,
    attack: 50.0,
  ),
];
puts 'Cleaning database...'

Fighter.destroy_all
Equipement.destroy_all

puts 'Creating equipements...'

Equipement.create(
  name: 'Cactus',
  photo: open(),
  attack_points: 5,
  hands: 1
  )

Equipement.create(
  name: 'Keyboard',
  photo: open(),
  defense_points: 5,
  hands: 1
  )

Equipement.create(
  name: 'Paperboard',
  photo: open(),
  defense_points: 5,
  hands: 1
  )

Equipement.create(
  name: 'Pen',
  photo: open(),
  attack_points: 5,
  hands: 1
  )

Equipement.create(
  name: 'Chair',
  photo: open(),
  attack_points: 5,
  defense_points: 5,
  hands: 2
  )

Equipement.create(
  name: 'Stapler',
  photo: open(),
  attack_points: 10,
  hands: 2
  )

Equipement.create(
  name: 'Negociation Skills',
  photo: open(),
  defense_points: 10,
  hands: 2
  )

puts 'Finished creating equipements'

puts 'Creating fighters...'

Fighter.create(
  name: 'Maxime Wagner',
  photo: open("https://www.captaincontrat.com/hs-fs/hubfs/Max-%C3%A9quipe.png?width=400&height=400&name=Max-%C3%A9quipe.png"),
  life_points: 14,
  attack_points: 86
  )

Fighter.create(
  name: 'Philippe Wagner',
  photo: open("https://www.captaincontrat.com/hs-fs/hubfs/Phil-%C3%A9quipe.png?width=400&height=400&name=Phil-%C3%A9quipe.png"),
  life_points: 50,
  attack_points: 50
  )

Fighter.create(
  name: 'Pierre Gallon',
  photo: open("https://www.captaincontrat.com/hs-fs/hubfs/Pierrot-e%CC%81quipe%20(1).png?width=400&height=400&name=Pierrot-e%CC%81quipe%20(1).png"),
  life_points: 98,
  attack_points: 2
  )

Fighter.create(
  name: 'Martin Salles',
  photo: open("https://www.captaincontrat.com/hs-fs/hubfs/photo%20(1).jpg?width=400&height=400&name=photo%20(1).jpg"),
  life_points: 42,
  attack_points: 58
  )

Fighter.create(
  name: 'Camille Pinard',
  photo: open("https://www.captaincontrat.com/hs-fs/hubfs/Cam-%C3%A9quipe.png?width=267&height=267&name=Cam-%C3%A9quipe.png"),
  life_points: 21,
  attack_points: 79
  )

Fighter.create(
  name: 'Elodie Diaw',
  photo: open("https://www.captaincontrat.com/hs-fs/hubfs/Elodie-1.jpg?width=199&height=217&name=Elodie-1.jpg"),
  life_points: 45,
  attack_points: 55
  )

Fighter.create(
  name: 'Teddy Cocat',
  photo: open("https://www.captaincontrat.com/hs-fs/hubfs/Team%20Captain/teddy.jpg?width=400&height=399&name=teddy.jpg"),
  life_points: 29,
  attack_points: 71
  )

Fighter.create(
  name: 'Thomas Carpentier',
  photo: open("https://www.captaincontrat.com/hs-fs/hubfs/Thomas-7.png?width=400&height=400&name=Thomas-7.png"),
  life_points: 34,
  attack_points: 66
  )

Fighter.create(
  name: 'Flore Villemot',
  photo: open("https://www.captaincontrat.com/hs-fs/hubfs/Flore.png?width=400&height=400&name=Flore.png"),
  life_points: 92,
  attack_points: 8
  )

Fighter.create(
  name: 'Amelie Certin',
  photo: open("https://www.captaincontrat.com/hs-fs/hubfs/Team%20Captain/amelie-certin-ps.jpg?width=320&height=320&name=amelie-certin-ps.jpg"),
  life_points: 15,
  attack_points: 85
  )

puts 'Finished creating fighters'

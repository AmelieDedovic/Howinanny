# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'Cleaning database...'
User.destroy_all
Nanny.destroy_all
Reservation.destroy_all
Conversation.destroy_all
Message.destroy_all

puts 'Creating data...'

nanny1 = Nanny.new(
  first_name: 'Léa',
  last_name: 'Burdin',
  city: 'Marseille',
  email: 'lea.burdin@gmail.com',
  password: 'password',
  description: "Je suis une assistante maternelle agrée et diplômée. J'ai 9 ans d'expérience dans la petite enfance. Habituée à accompagner les familles au cours de leurs vacances, je me tiens à votre disposition pour m'occuper de vos enfants pour le prochain départ. Je pratique de nombreuses activités telles que la peinture, les gommettes, le dessin, la pâte à modeler.Au plaisir de rencontrer votre famille.",
  moving_area: 'France',
  birth_date: '1992-01-01',
  price_per_day_cents: 36,
  experience: 'Confirmed'
)
nanny1.remote_photo_url = 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&auto=format&fit=crop&w=1834&q=80'
nanny1.save!

nanny2 = Nanny.new(
  first_name: 'Garance',
  last_name: 'Aguillon',
  city: 'La Rochelle',
  email: 'garance.aguillon@gmail.com',
  password: 'password',
  description: "Etudiante en école de commerce et nounou le week-end, je suis disponible pour accompagner votre famille et faire en sorte que vos enfants passent de superbes vacances. J'ai déjà eu l'occasion de partir avec une première famille l'été dernier en Espagne. Je serais ravie de leur faire partager ma passion pour la lecture.",
  moving_area: 'Monde',
  birth_date: '2001-01-01',
  price_per_day_cents: 28,
  experience: 'Started'
)
nanny2.remote_photo_url = 'https://images.unsplash.com/photo-1566807810030-3eaa60f3e670?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1834&q=80'
nanny2.save!

nanny3 = Nanny.new(
  first_name: 'Aminata',
  last_name: 'Traoré',
  city: 'Paris',
  email: 'aminata.traore@gmail.com',
  password: 'password',
  description: "Vous recherchez une personne de confiance qui permettrait à vos enfants de pouvoir partager d'excellents moments en vacances ?  Je suis disponible pour m'envoler avec vous ! Je pourrais faire découvrir à vos enfants différentes musiques et des chorégraphies associées car j'adore la danse. Pour davantage d'informations n'hésitez à me contacter.",
  moving_area: 'Monde',
  birth_date: '1986-01-01',
  price_per_day_cents: 37,
  experience: 'Confirmed'
)
nanny3.remote_photo_url = 'https://images.unsplash.com/photo-1566938472928-1dcb0b58a7bb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1834&q=80'
nanny3.save!

nanny4 = Nanny.new(
  first_name: 'Nathalie',
  last_name: 'Bertani',
  city: 'Nantes',
  email: 'nathalie.bertani@gmail.com',
  password: 'password',
  description: "Je suis assistante maternelle agrée ayant plus de 20 ans d'expérience. J'adorerais faire découvrir à vos enfants les activités manuelles que j'ai crée et par ailleurs, je pratique le chant dans un groupe.",
  moving_area: 'Europe',
  birth_date: '1973-01-01',
  price_per_day_cents: 40,
  experience: 'Expert'
)
nanny4.remote_photo_url = 'https://images.unsplash.com/photo-1546107174-aafb685235a9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80'
nanny4.save!

nanny5 = Nanny.new(
  first_name: 'Salima',
  last_name: 'Zaïd',
  city: 'Périgueux',
  email: 'salima.zaid@gmail.com',
  password: 'password',
  description: "Assistante maternelle agrée pour 3 enfants depuis 1996, je suis à votre disposition pour vous accompagner en France ou à l'étranger. Habituée à vivre avec les familles le temps des vacances, j'adore m'occuper des enfants et faire en sorte qu'ils rentrent avec de magnifiques souvenirs. Nous pourrons préparer de délicieux gâteaux.",
  moving_area: 'Monde',
  birth_date: '1979-01-01',
  price_per_day_cents: 38,
  experience: 'Expert'
)
nanny5.remote_photo_url = 'https://images.unsplash.com/photo-1525879000488-bff3b1c387cf?ixlib=rb-1.2.1&auto=format&fit=crop&w=1834&q=80'
nanny5.save!

nanny6 = Nanny.new(
  first_name: 'Chloé',
  last_name: 'Picard',
  city: 'Montauban',
  email: 'chloe.picard@gmail.com',
  password: 'password',
  description: "Je suis Chloé, j'ai toujours travaillé dans des écoles avec les touts petits. Me savoir utile dans l'épanouissement d'un enfant, le voir évolué au fil du temps, passer des moments agréables et surtout être là quand il faut reste des moments inoubliables. Je suis dévouée à l'écoute des enfants comme des parents. J'aime bien lire des histoires ou en inventer selon l'environnement, à partir d'un objet ou d'une situation.",
  moving_area: 'Monde',
  birth_date: '1991-01-01',
  price_per_day_cents: 36,
  experience: 'Confirmed'
)
nanny6.remote_photo_url = 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80'
nanny6.save!

nanny7 = Nanny.new(
  first_name: 'Camille',
  last_name: 'Strippoli',
  city: 'Aix-en-Provence',
  email: 'camille.strippoli@gmail.com',
  password: 'password',
  description: "Etudiante en psychologie à Aix-en-Provence, j'ai pu faire des baby-sittings en périscolaire ainsi qu'en soirée pendant deux ans.
                Je suis disponible pour vous accompagner pendant vos vacances Jusqu'au 8 septembre, avant ma rentrée. 
                Mon expérience a été variée auprès de plusieurs familles. J'ai pu accompagner des enfants entre 1 et 10 ans. Je suis consciencieuse et je m'adapte selon les attentes des parents (repas à faire, rituels du coucher, règles à respecter, horaires etc). J'aime découvrir la personnalité de l'enfant et je m'intéresse à ses envies pour y répondre au mieux. Je vise son bien être, c'est pourquoi je sais aussi mettre des limites (notamment pour les plus jeunes). Enfin, cela ne me dérange pas de garder plusieurs enfants à la fois.
                N'hésitez donc pas à me contacter, je répondrai le plus vite possible et j'espère à bientôt !",
  moving_area: 'Europe',
  birth_date: '1996-01-01',
  price_per_day_cents: 32,
  experience: 'Started'
)
nanny7.remote_photo_url = 'https://images.unsplash.com/photo-1510520434124-5bc7e642b61d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1834&q=80'
nanny7.save!

nanny8 = Nanny.new(
  first_name: 'Paula',
  last_name: 'Lopez',
  city: 'Versailles',
  email: 'paula.lopez@gmail.com',
  password: 'password',
  description: "Je m'appelle Paula, j'ai eu l'occasion de faire des baby-sitting en Australie, de manière occasionnelle. Je serais très heureuse de pouvoir vous accompagner et partager vos vacances en famille notamment en prenant de jolis clichés. N'hésitez pas à me contacter pour qu'on en discute.",
  moving_area: 'Monde',
  birth_date: '1998-01-01',
  price_per_day_cents: 32,
  experience: 'Started'
)
nanny8.remote_photo_url = 'https://images.unsplash.com/photo-1438109491414-7198515b166b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80'
nanny8.save!

nanny9 = Nanny.new(
  first_name: 'Hannah',
  last_name: 'Blum',
  city: 'Lyon',
  email: 'hannah.blum@gmail.com',
  password: 'password',
  description: "Je suis étudiante en master 1 à l'IAE de Toulouse et je recherche une famille ayant des enfants à divertir pendant les vacances. Fiable et sérieuse, j'ai un petit frère que j'ai eu l'habitude de garder auparavant. J'ai aussi une expérience de baby-sitting avec une petite fille de 2 ans. Ma passion étant la natation, je dispose du Brevet national de sécurité et de sauvetage aquatique (BNSSA).",
  moving_area: 'Monde',
  birth_date: '1993-01-01',
  price_per_day_cents: 36,
  experience: 'Confirmed'
)
nanny9.remote_photo_url = 'https://images.unsplash.com/photo-1563306406-e66174fa3787?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1834&q=80'
nanny9.save!

nanny10 = Nanny.new(
  first_name: 'Clara',
  last_name: 'Fabre',
  city: 'Bordeaux',
  email: 'clara.fabre@gmail.com',
  password: 'password',
  description: "Je suis Clara, étudiante en deuxième année à l'université de Bordeaux. Je suis en cours d'obtention de mon BAFA, j'ai réalisé des babysitting et travailler dans un centre aéré. Je suis disponible au cours des vacances scolaires pour partir avec vous et faire en sorte que les vacances soient inoubliables pour toute la famille.",
  moving_area: 'Monde',
  birth_date: '2000-01-01',
  price_per_day_cents: 32,
  experience: 'Started'
)
nanny10.remote_photo_url = 'https://images.unsplash.com/photo-1472849676747-48a51c0c30b6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80'
nanny10.save!

nanny11 = Nanny.new(
  first_name: 'Yaelle',
  last_name: 'Benamou',
  city: 'Grenoble',
  email: 'yaelle.benamou@gmail.com',
  password: 'password',
  description: "Je suis l'aînée d'une famille de 3 enfants et j'ai comme expérience la garde de mes frères et soeurs et aussi, les enfants des amis de mes parents.J'ai également fait un stage dans un centre aéré. J'attends avec impatience vos propositions.",
  moving_area: 'France',
  birth_date: '2001-01-01',
  price_per_day_cents: 28,
  experience: 'Started'
)
nanny11.remote_photo_url = 'https://images.unsplash.com/photo-1484328861630-cf73b7d34ea3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1652&q=80'
nanny11.save!

nanny12 = Nanny.new(
  first_name: 'Solmaz',
  last_name: 'Khazen',
  city: 'Montpellier',
  email: 'solmaz.khazen@gmail.com',
  password: 'password',
  description: "Nounou diplômée CAP petite enfance et 1ers secours je recherche un enfant à garder pendant les vacances scolaires. 
              Je garde des enfants depuis septembre 2012. Je suis douce et patiente, attentive à leur sécurité. Au plaisir d'échanger avec vous.",
  moving_area: 'Monde',
  birth_date: '1988-01-01',
  price_per_day_cents: 37,
  experience: 'Expert'
)
nanny12.remote_photo_url = 'https://images.unsplash.com/photo-1468011749792-10026eb12caf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80'
nanny12.save!

user1 = User.new(
  first_name: 'Amélie',
  last_name: 'Dedovic',
  city: 'Aix-en-Provence',
  email: 'amelie.dedovic@gmail.com',
  password: 'password',
  description: "Bonjour, nous recherchons une nanny sympathique pour partager nos vacances en Italie, à Rome ! Nous avons deux enfants en bas âge, Arthur a 1 an et Léa son aînée est agée de 6 ans. Les enfants adorent pratiquer des activités physiques alors que les parents privilégient les visites (expo, musée). A bientôt !",
)
user1.remote_photo_url = 'https://res.cloudinary.com/dljfsfpna/image/upload/v1575971137/photo_cv_o68bsj.png'
user1.save!

user2 = User.new(
  first_name: 'Yasmina',
  last_name: 'Bokobza',
  city: 'Neuilly sur Seine',
  email: 'yasmina.bokobza@gmail.com',
  password: 'password',
  description: "Bonjour les Howinanny, après avoir beaucoup entendu parler du site, nous souhaitons à notre tour passer de superbes vacances en famille avec une personne de confiance qui saura être à l'écoute des besoins de la famille. Nos jumeaux sont agés de 6 ans et possèdent beaucoup d'énergie. Notre prochaine destination sera à Tel Aviv. Au plaisir de rencontrer notre future nannie de vacances.",
)
user2.remote_photo_url = 'https://images.unsplash.com/photo-1527070315420-2953657c98dc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80'
user2.save!

user3 = User.new(
  first_name: 'Baptiste',
  last_name: 'Leroux',
  city: 'St Martin de Ré',
  email: 'baptiste.leroux@gmail.com',
  password: 'password',
  description: "Nous sommes une famille avec un garçon de deux ans et notre aînée Charlotte qui elle a 10 ans. Nous sommes à la recherche d'une nounou qui sera disponible et intéressée pour partir avec nous en Grèce. Nous aimerions que Charlotte puisse profiter pour s'initier à la planche à voile. A bientôt !"
)
user3.remote_photo_url = 'https://images.unsplash.com/photo-1575304339466-6233e97d7247?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80'
user3.save!

user4 = User.new(
  first_name: 'Gregory',
  last_name: 'Kindel',
  city: 'Paris',
  email: 'gregory.kindel@gmail.com',
  password: 'password',
  description: "Recherchons nounous pour deux familles qui partent en vacances en Corse cet été. Les enfants adorent se baigner et les parents siroter en les regardant s'amuser. A très vite pour faire connaissance.",
)
user4.remote_photo_url = 'https://images.unsplash.com/photo-1498150590586-ee95c39abf96?ixlib=rb-1.2.1&auto=format&fit=crop&w=1650&q=80'
user4.save!

user5 = User.new(
  first_name: 'Orlane',
  last_name: 'Fincato',
  city: 'La Rochelle',
  email: 'orlane.fincato@gmail.com',
  password: 'password',
  description: "Bonjour, nous partons pendant les vacances d'hier en Guadeloupe. Nous avons deux enfants, Alain et Mia (6 ans) qui adorerait pouvoir profiter d'activités pendant que papa et maman partent en randonnée, à très vite !",
)
user5.remote_photo_url = 'https://images.unsplash.com/photo-1466358233012-14413ad4e76f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1649&q=80'
user5.save!

reservation_garance = Reservation.new(
  start_date: '2019-08-15',
  end_date: '2019-08-30',
  state: 'payé',
  user: user1,
  nanny: nanny2
)
reservation_garance.save!

puts 'Database created !!'

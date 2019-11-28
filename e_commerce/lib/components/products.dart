import 'package:flutter/material.dart';
import '../product_details.dart';


class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
    {
        "name": "Déguisement",
        "picture": "images/products/blazer1.jpeg",
        "price": 85,
        "quantity": 0,
        "tag": "vente flash",
        "description": "Tout seul, il met son déguisement de tigre. Comme c'est une combinaison, elle est facile à enfiler au-dessus de ses vêtements. La capuche est la tête du félin. Une fois entré dans la peau de son animal ..."
    },
    {
        "name": "Sac",
        "picture": "images/products/dress1.jpeg",
        "price": 50,
        "quantity": 0,
        "description": "Sac à main avec éléments détachables et interchangeables. 2 poignées amovibles. Corps avec trous et logo devant. Rebord amovible. Poche intérieure. Doublure amovible. Fermeture zippée."
    },
    {
        "name": "TV",
        "picture": "images/products/LGOLED.jpeg",
        "price": 1290,
        "quantity": 0,
        "description": "La qualité d’image est optimisée : Les couleurs sont plus riches et les scènes plus détaillées.4K Cinema HDRGrâce à la multi compatibilité HDR 10, HLG, HDR Dolby Vision et Advanced HDR by Technicolor, tous les contenus sont affichés avec la meilleure qualité possible, un contraste et une luminosité renforcésDolby AtmosLe Dolby"
    },
    {
        "name": "PC",
        "picture": "images/products/PC.jpeg",
        "price": 775,
        "quantity": 0,
        "description": "Megaport PC Gamer Warrior Intel Core i7-9700 8X 3,00 GHz • GeForce RTX2060 6Go • 16Go DDR4 • 480Go SSD • 1To • Windows 10 Unité Centrale Ordinateur de Bureau PC Gaming PC Ordinateur"
    },
    {
        "name": "Switch",
        "picture": "images/products/switch.jpeg",
        "price": 300,
        "quantity": 0,
        "description": "Après ses consoles de salon Wii et Wii U, Nintendo présente sa nouvelle console : la Switch. Entièrement modulaire, cette console d'un nouveau genre permet à la fois de jouer sur son téléviseur dans un salon, mais également en mobilité, comme une tablette tactile ! Seul ou avec des amis, la Nintendo Switch vous permet de jouer quand vous voulez, où vous voulez !"
    },
    {
        "name": "switch Lite",
        "picture": "images/products/switchlite.jpeg",
        "price": 180,
        "quantity": 0,
        "description": "Dédié au jeu portable La console pour les joueurs sur le pouceLa console Nintendo Switch Lite est spécialement créée pour le jeu portable – vous pouvez donc jouer à vos jeux favoris n’importe où.Compacte et légère Avec son design léger et fin, la console est prête pour la route quand vous l’êtes.Manettes intégrées Les manettes sont intégrées dans la console pour le jeu portable, et sur le côté gauche on retrouve une manette+"
    },
    {
        "name": "Playstation4",
        "picture": "images/products/ps4.jpeg",
        "price": 300,
        "quantity": 0,
        "description": "Un nouveau look, une PS4 plus fine. Découvrez des couleurs vivantes et brillantes avec des graphismes HDR à couper le souffle. - Organisez vos jeux et applications, et partagez avec vos amis à l'aide d'une nouvelle interface très intuitive. - Stockez vos jeux, applications, captures d'écran et vidéos avec les options 500 Go et 1 To. - Les plus grands films, les plus grandes séries télé, et toutes vos applications préférées pour le divertissement."
    },
    {
        "name": "Pack xBox one X",
        "picture": "images/products/xbox.jpeg",
        "price": 320,
        "quantity": 0,
        "description": "Achetez le pack Xbox One X + Star Wars Jedi: Fallen Order™ et vivez le frisson du défi pour devenir Jedi. Endossez le rôle d'un Padawan qui a échappé de justesse à la purge de l'Ordre 66. Participez à une aventure innovante à travers la galaxie où vous combattez avec un sabre laser et la Force, tout en gardant une longueur d'avance sur l'Empire et ses inquisiteurs mortels."
    },
    {
        "name": "Iphone11 Pro",
        "picture": "images/products/iphone.jpeg",
        "price": 1250,
        "quantity": 0,
        "description": "Un triple appareil photo visionnaire qui démultiplie vos possibilités sans ajouter la moindre complexité. Une autonomie qui fait un bond en avant sans précédent. Une puce surpuissante qui va deux fois plus loin en matière d’apprentissage automatique et repousse les limites de ce qu’un smart­phone peut faire. Les capacités de cet iPhone sont telles qu’il est le premier à décrocher l’appellation Pro. Et il la mérite."
    },
    {
        "name": "Souris Gamer",
        "picture": "images/products/corsair.jpeg",
        "price": 75,
        "quantity": 0,
        "description": "La résolution native de 18 000 DPI avec des paliers de résolution d’1 DPI vous permet de personnaliser entièrement la sensibilité et vous offre un déplacement de souris ultra-précis, faisant de la M65 RGB Elite la souris gaming FPS idéale."
    },
    {
        "name": "Clavier gaming",
        "picture": "images/products/razer.jpeg",
        "price": 110,
        "quantity": 0,
        "description": "L’Apex Pro représente le plus grand bond en avant en matière de claviers mécaniques depuis l’invention du switch mécanique il y a 35 ans. Chaque touche peut être réglée en fonction de votre niveau de sensibilité préféré, que ce soit pour le gaming, le travail ou autre chose."
    },
    {
        "name": "Casque gamer",
        "picture": "images/products/asus.jpeg",
        "price": 100,
        "quantity": 0,
        "description": "Avec le casque audio ASUS ROG Strix Fusion 300, profitez de performances audio haut de gamme et d'un port confortable. Doté d'une chambre acoustique hermétique et de transducteurs ASUS Essence de 50 mm pour son gaming des plus purs avec des basses puissantes."
    },
    {
        "name": "Ecran gamer",
        "picture": "images/products/asusVG.jpeg",
        "price": 279,
        "quantity": 0,
        "description": "L'écran gamer Asus VG248QE place la barre très haut avec ce 24 pouces qui a une fréquence de balayage de 144 Hz ! Certifié LightBoost, compatible avec la technologie NVIDIA® Geforce® 3D Vision™ 2, il vous fait vivre une expérience 3D encore améliorée grâce à la touche GamePlus !"
    },
    {
        "name": "MacBook pro",
        "picture": "images/products/mac.jpeg",
        "price": 1515,
        "quantity": 0,
        "description": "Conçu pour ceux qui repoussent les limites du possible, le nouveau MacBook Pro est de loin l’ordinateur portable le plus puissant que nous ayons jamais créé. Avec un écran Retina de 16 pouces immersif, des processeurs ultra‑rapides, des cartes graphiques de nouvelle génération, la plus grande capacité de batterie jamais vue sur un MacBook Pro, un nouveau Magic Keyboard et une capacité de stockage considérable, c’est le portable pro par excellence."
    },
    {
        "name": " Imac",
        "picture": "images/products/imac.jpeg",
        "price": 1275,
        "quantity": 0,
        "description": "L’iMac, un monstre ? De puissance, c’est certain. De beauté, aussi. C’est d’ailleurs toute l’idée sur laquelle il repose depuis le début : transformer l’utilisation d’un ordinateur de bureau en une fabuleuse expérience, en intégrant des technologies puissantes et faciles à utiliser dans un élégant design tout‑en‑un. Et cette fois, le nouvel iMac va encore plus loin."
    },
    {
        "name": "Four Beko",
        "picture": "images/products/beko.jpeg",
        "price": 399,
        "quantity": 0,
        "description": "Avec le four BEKO BCE16300X 45 cm, prenez plaisir à cuisiner au quotidien pour votre famille et vos amis. Multifonctionnel et simple à entretenir, c'est votre allié en cuisine. Un four multifonctions pratique Le four BEKO BCE16300X 45 cm possède un volume de 48 litres pour enfourner tous vos plats, même les plus grands."
    },
    {
        "name": "Lave vaiselle \n Siemens ",
        "picture": "images/products/vaiselle.jpeg",
        "price": 599,
        "quantity": 0,
        "description": "Gagnez du temps, gagnez en consommation d'eau... Pour vos corvées de vaisselle, optez pour le Siemmens SN236I02GE. Ce lave-vaisselle 12 couverts, discret et économe sera l'allié parfait de votre quotidien. Discret et économique Lave-vaisselle pose libre, cet équipement SIEMENS en coloris inox se mariera avec tous vos équipements sans jurer.Gagnez du temps, gagnez en consommation d'eau... Pour vos corvées de vaisselle, optez pour le Siemmens SN236I02GE. Ce lave-vaisselle 12 couverts, discret et économe sera l'allié parfait de votre quotidien. Discret et économique Lave-vaisselle pose libre, cet équipement SIEMENS en coloris inox se mariera avec tous vos équipements sans jurer."
    },
    {
        "name": "Lave linge \n Whirlpool",
        "picture": "images/products/whirlpool.jpeg",
        "price": 359,
        "quantity": 0,
        "description": "Avec le lave-linge frontal FWF81283W2FR de Whirlpool, votre linge est lavé efficacement et dans les meilleures conditions. La technologie Fresh Care préserve la fraîcheur du linge une fois le cycle terminé et limite le froissage. Ce modèle intègre un moteur induction robuste et durable pour une meilleure durée de vie de votre lave-linge."
    },
    {
        "name": "Sèche linge \n Bosch",
        "picture": "images/products/bosh.jpeg",
        "price": 589,
        "quantity": 0,
        "description": "Le sèche-linge Front BOSCH WTR85V02FF dispose de nombreuses technologies et options pour s'adapter à tous les types de linge, et même aux personnes allergiques ou sensibles. Dans le respect de votre linge et de votre confort d'utilisation, il reste facile d'entretien."
    },
    {
        "name": "Frigo \n congélateur",
        "picture": "images/products/frigo.jpeg",
        "price": 1850,
        "quantity": 0,
        "description": "Économisez en énergie en évitant toute perte de froid inutile avec un appareil pratique et performant : le réfrigérateur combiné LG LSR100 Signature. Un compartiment secret accessible à tout moment Le réfrigérateur combiné LSR100 Signature va révolutionner votre quotidien. Il est doté de 4 portes pour un accès plus facile et une meilleure conservation du froid."
    },
    {
        "name": "Hotte Candy",
        "picture": "images/products/hotte.jpeg",
        "price": 139,
        "quantity": 0,
        "description": "L'éclairage LED permet une meilleure visibilité de la zone de cuisson et aide à la préparation des aliments. De plus, nous économisez jusqu'à 90 % d'énergie comparé à un éclairage classique."
    },
    {
        "name": "Dyson v11",
        "picture": "images/products/dyson.jpeg",
        "price": 399,
        "quantity": 0,
        "description": "L'aspirateur sans fil Dyson le plus puissant et intelligent. Conçu pour nettoyer partout en profondeur. Jusqu'à 60 minutes d'autonomie. 10 accessoires inclus."
    },
    {
        "name": "Trottinette \n Xiaomi",
        "picture": "images/products/xiaomi.jpeg",
        "price": 349,
        "quantity": 0,
        "description": "Modèle pliable et portable. Composé d’un système de frein à disque et d’un système de freinage antiblocage eABS par récupération offrant une distance de freinage efficace et réactive de seulement 4 mètres. Les feux arrière rouges s’allument dès que vous freinez pour prévenir les autres piétons et véhicules sur la route."
    },
    {
        "name": "Cuisine \n companion \nMoulinex",
        "picture": "images/products/robot.jpeg",
        "price": 479,
        "quantity": 0,
        "description": "Avec le robot I-Companion XL de Moulinex, cuisiner devient un jeu d'enfant. Ce robot cuiseur connecté va vous permettre de réaliser facilement et rapidement des recettes pour toute la famille. Cuire, rissoler, mijoter... il sait tout faire, même à distance grâce à sa fonction Bluetooth."
    },
    {
        "name": "Balancelle bébé",
        "picture": "images/products/bebe.jpeg",
        "price": 169,
        "quantity": 0,
        "description": "éritable petit nid douillet grâce à ses matières douces, la Swoon Motion s'adapte aux tout-petits grâce à son coussin réducteur pour nouveau-né et son détecteur de mouvement intégré. Conçue pour vous simplifier la vie, elle dispose d'une assise rotative à 360° qui vous permet de garder un oeil en toutes circonstances sur bébé."
    },
    {
        "name": "Central vapeur\nCalor",
        "picture": "images/products/calor.jpeg",
        "price": 199,
        "quantity": 0,
        "description": "Centrale vapeur avec double protection anti-calcaire : la technologie Protect System transforme les gouttelettes de calcaire en vapeur tandis que le collecteur de calcaire offre des performances vapeur durables."
    },
    {
        "name": "Chaise gaming \n Dxracer",
        "picture": "images/products/chaise.jpeg",
        "price": 298,
        "quantity": 0,
        "description": "La Formula F11 de DXRacer ! Son dossier profilé inspiré des sièges des voitures de course suit la courbe de ton dos, de la tête aux lombaires, pour un confort parfait. Ce siège gaming dispose d’un revêtement en tissu et simili-cuir ! "
    },
  ];
  @override
  Widget build(BuildContext context) {


    return GridView.builder(
      itemCount: product_list.length,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2),
       itemBuilder: (BuildContext context, int index){
         return Single_prod( 
           prod_name: product_list[index]['name'],
           prod_picture: product_list[index]['picture'],
           prod_price: product_list[index]['price'],
           prod_description: product_list[index]['description'],
           prod_tag: product_list[index]['tag'],
         );
       }
     );
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_price;
  final prod_description;
  final prod_tag;

  Single_prod( {
    this.prod_name,
    this.prod_picture,
    this.prod_price,
    this.prod_description,
    this.prod_tag,
  }
  );

  @override
  Widget build(BuildContext context) {

    return Card(
      child: Hero(
        tag: Text("hero 1"), 
        child: Material( 
          child: InkWell(
            onTap: ()=> 
            Navigator.of(context).push(
               MaterialPageRoute(
                // Passage des valeurs a details des produits
                builder: (context) => ProductDetails( 
                  product_detail_name: prod_name,
                  product_detail_picture: prod_picture,
                  product_detail_price: prod_price,
                  product_detail_description: prod_description,
                  product_detail_tag: prod_tag,
                ))),
          child: GridTile( 
            footer: Container( 
              color: Colors.white70,
              child: ListTile( 
                leading: Text(
                  prod_name,
                   style: TextStyle(
                  fontWeight: FontWeight.bold ),
                  ),
                  title: Text(
                    "\$$prod_price", 
                  style: TextStyle(
                    color: Colors.black, 
                    fontWeight: FontWeight.w800),),
              ),
            ),
            child: Image.asset(prod_picture,
            fit: BoxFit.cover,),
          ),
          ),
        ),
      ),
    );
  }
}


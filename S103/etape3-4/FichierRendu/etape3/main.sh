#!/bin/bash

# Definition des chemins
WORKING_DIR="$(pwd)"
MEDALS_XLSX="Tableau des médailles v2.xlsx"
OUTPUT_DIR="output"
HTML_FILE="tableau_medailles.html"
DIR_TEXTE1="$OUTPUT_DIR/JO_Paris/"
DIR_TEXTE2="$OUTPUT_DIR/Sports_emblématiques/"

# Creation du dossier de sortie
mkdir -p "$OUTPUT_DIR"

# 1. Traitement des images
echo "Traitement des images..."

for script in "aviron" "beach-volley" "départ-triathlon" "cyclisme1" "podium" "teddy-riner"
do
    chmod +x "$script.sh"
    bash ./"$script.sh"
done

clear 
echo "Traitement des images..."
echo "Traitement des images terminé."

# 1.1 Traitement des textes
echo "Traitement des images..."
echo "Traitement des images terminé."
echo "Traitement des textes..."

mkdir -p $DIR_TEXTE1
mkdir -p $DIR_TEXTE2

for fic in T1 T2 T3 T4 T5 T6
do
    touch -f $DIR_TEXTE1/$fic
done

for fic2 in T1 T2 T3 T4 
do
    touch $DIR_TEXTE2/$fic2
done

echo "Les Jeux Olympiques de Paris 2024 : Une célébration mondiale du sport" > $DIR_TEXTE1/T1

echo "Les Jeux Olympiques de Paris 2024 marquent un moment historique pour la France et le monde du sport. Près de cent ans après les JO de 1924, Paris accueille à nouveau cet événement prestigieux, rassemblant des athlètes de plus de 200 nations dans une compétition où l’excellence, le respect et l’amitié sont les maîtres mots. Les préparatifs pour ces jeux ont été soigneusement planifiés pour offrir un spectacle exceptionnel, combinant tradition et innovation. Le choix de Paris s’est imposé comme une évidence, la ville incarnant l’élégance et l’histoire tout en se projetant vers un avenir durable. La devise de ces jeux, « Ouvrons grand les Jeux », reflète un engagement à rendre l’événement plus inclusif et accessible que jamais." > $DIR_TEXTE1/T2
echo "L’organisation des JO de Paris 2024 a été pensée dans une optique écologique et durable. Près de 95 % des infrastructures utilisées sont déjà existantes ou temporaires, minimisant ainsi l’impact environnemental. Parmi les projets emblématiques, le village olympique est un modèle de durabilité, conçu pour être réutilisé en logements après les jeux. Les sites iconiques, tels que le Stade de France, le Grand Palais et même la Seine, serviront de cadres à des compétitions mémorables. Paris a également mis l’accent sur une mobilité verte, avec des transports publics renforcés et des parcours cyclables pour les spectateurs. Ces initiatives soulignent l’ambition de faire des JO 2024 un modèle pour les événements futurs." > $DIR_TEXTE1/T3
echo "Sur le plan sportif, les JO de Paris 2024 promettent des moments inoubliables. Parmi les 32 sports représentés, de nouvelles disciplines telles que le breakdance feront leur entrée, attirant une jeune génération de spectateurs. Les épreuves emblématiques comme l’athlétisme, la natation et la gymnastique continueront de captiver le public. Les athlètes français auront à cœur de briller devant leur public, espérant dépasser les performances de Tokyo 2020. Par ailleurs, des événements inédits, comme le marathon ouvert aux amateurs, offriront une expérience unique aux passionnés du monde entier. Ce mélange d’innovation et de tradition garantit un spectacle sportif de premier ordre." > $DIR_TEXTE1/T4
echo "Les JO de Paris 2024 ne se limitent pas à la compétition sportive. Ils incarnent également un moment de célébration culturelle et d’unité mondiale. Des événements artistiques et musicaux accompagneront les compétitions, mettant en valeur la richesse culturelle française. La cérémonie d’ouverture, prévue le long de la Seine, sera un spectacle grandiose accessible à des millions de spectateurs. Ce choix audacieux reflète une volonté d’ouvrir les jeux à tous, en dépassant les frontières des stades traditionnels. En parallèle, l’accent sera mis sur l’éducation et l’inclusion, avec des initiatives pour sensibiliser aux valeurs olympiques." > $DIR_TEXTE1/T5
echo "Enfin, les Jeux Olympiques de Paris 2024 laisseront un héritage durable. Sur le plan sportif, ils renforceront l’engouement pour le sport en France, notamment auprès des jeunes générations. Sur le plan économique, ils créeront des emplois et dynamiseront le tourisme. Sur le plan sociétal, ils rappelleront l’importance de la solidarité et de la coopération internationale. Paris, ville lumière, brillera une fois de plus sur la scène mondiale, offrant un événement qui marquera les mémoires et servira de modèle pour les futures éditions. Les JO 2024 seront bien plus qu’une compétition : ils seront une célébration de l’humanité et de l’esprit sportif." > $DIR_TEXTE1/T6

echo "L’athlétisme : un pilier des Jeux Olympiques depuis leur création" > $DIR_TEXTE2/T1
echo "" >> $DIR_TEXTE2/T1
echo "L’athlétisme est l’une des disciplines les plus anciennes et emblématiques des Jeux Olympiques modernes. Dès les premiers Jeux Olympiques de 1896 à Athènes, l’athlétisme occupait une place centrale dans le programme, avec des épreuves inspirées des compétitions de la Grèce antique. Ces premières éditions comprenaient des courses de sprint, des épreuves de fond, ainsi que des concours comme le lancer du disque et le saut en longueur. Au fil des années, de nouvelles disciplines ont été ajoutées, reflétant l’évolution du sport et son internationalisation. Les Jeux Olympiques sont devenus la scène mondiale où les meilleurs athlètes se mesurent dans des épreuves alliant vitesse, force et endurance.|L’histoire de l’athlétisme aux Jeux Olympiques est jalonnée de moments mémorables et de performances légendaires. Des exploits comme ceux de Jesse Owens, qui a remporté quatre médailles d’or à Berlin en 1936, symbolisent la puissance de l’athlétisme pour transcender les barrières sociales et politiques. De même, des figures comme Carl Lewis, Wilma Rudolph ou Usain Bolt ont marqué les esprits par leur domination dans leurs disciplines respectives. Les records battus dans des stades mythiques, comme le record du monde du 100 mètres de Bolt à Pékin en 2008, continuent de captiver les spectateurs et d’inspirer les générations futures. Ces exploits soulignent le rôle de l’athlétisme comme l’essence même des Jeux Olympiques.|Au-delà des performances individuelles, l’athlétisme olympique incarne les valeurs fondamentales du sport : le dépassement de soi, l’équité et l’esprit d’équipe. Les épreuves collectives comme les relais illustrent la coopération et la coordination, tandis que les épreuves de marathon symbolisent la persévérance et la résilience humaine. L’athlétisme est également un miroir des évolutions sociétales : l’inclusion des femmes, la diversité des nations participantes et les innovations techniques témoignent de l’impact croissant des Jeux sur le monde. Aujourd’hui, l’athlétisme reste le cœur battant des Jeux Olympiques, attirant des millions de spectateurs et célébrant la beauté universelle du sport." >> $DIR_TEXTE2/T1
echo "Le cyclisme : un sport emblématique des Jeux Olympiques" > $DIR_TEXTE2/T2
echo "" >> $DIR_TEXTE2/T2
echo "Le cyclisme est l’un des sports présents depuis les tout premiers Jeux Olympiques modernes en 1896, à Athènes. Les compétitions de cyclisme sur piste et sur route faisaient déjà partie du programme, reflétant la popularité croissante de ce sport à l’époque. Les épreuves sur piste étaient disputées dans des vélodromes, tandis que les courses sur route parcouraient des itinéraires exigeants. Au fil des décennies, le cyclisme olympique s’est diversifié, intégrant des disciplines comme le BMX en 2008 et le VTT dès 1996. Ce sport est devenu une vitrine mondiale où les meilleurs cyclistes, qu’ils soient sprinteurs, grimpeurs ou descendeurs, rivalisent pour décrocher l’or olympique.|L’histoire du cyclisme aux Jeux Olympiques est marquée par des exploits légendaires et des athlètes emblématiques. L’Italien Gino Bartali, l’Allemande Kristina Vogel ou le Britannique Chris Hoy sont des noms indélébiles dans l’histoire de ce sport. Le Tour de France a souvent servi de tremplin aux performances olympiques, illustrant le lien étroit entre ces deux grandes scènes du cyclisme. Les JO ont également été le théâtre d’innovations techniques, notamment dans la conception des vélos et des stratégies d’équipe. Des moments comme la victoire de l’équipe britannique sur piste à Londres en 2012 ont montré à quel point le cyclisme peut captiver les foules et générer un sentiment national intense.|Au-delà des performances individuelles et collectives, le cyclisme olympique incarne des valeurs telles que la persévérance, l’endurance et l’esprit d’aventure. Les courses sur route, souvent organisées dans des paysages magnifiques, symbolisent le dépassement de soi face à des défis naturels et humains. En parallèle, des disciplines comme le BMX et le VTT apportent une touche de modernité et séduisent les jeunes générations. Le cyclisme reste un sport universel, accessible à tous, et les Jeux Olympiques offrent une occasion unique de célébrer son impact à l’échelle mondiale. À chaque édition, le cyclisme olympique réaffirme son rôle de sport incontournable, mêlant tradition, innovation et passion." >> $DIR_TEXTE2/T2
echo "Les sports collectifs : une tradition olympique qui unit les nations" > $DIR_TEXTE2/T3
echo "" >> $DIR_TEXTE2/T3
echo "Les sports collectifs occupent une place particulière dans l’histoire des Jeux Olympiques modernes. Depuis l’introduction du football aux Jeux de 1900 à Paris et du hockey sur gazon en 1908 à Londres, ces disciplines ont su captiver les foules grâce à leur intensité, leur stratégie et leur esprit d’équipe. Les sports collectifs ont progressivement élargi leur présence avec l’ajout du basketball en 1936, du volleyball en 1964 et plus récemment du rugby à 7 en 2016. Ces disciplines incarnent la coopération et la compétition entre nations, tout en offrant un spectacle palpitant où chaque match peut changer le cours de l’histoire olympique.|L’histoire des sports collectifs aux Jeux Olympiques est marquée par des rivalités légendaires et des moments de gloire inoubliables. Les duels entre les équipes de basketball des États-Unis et de l’Union soviétique, notamment la finale controversée de 1972, restent gravés dans les mémoires. En football, la victoire du Cameroun en 2000 a illustré la montée en puissance des nations africaines sur la scène internationale. Les équipes féminines ont également marqué l’histoire, comme les basketteuses américaines qui dominent leur discipline depuis plusieurs décennies. Chaque médaille d’or est l’aboutissement d’années de travail collectif et symbolise la force de l’unité et de la cohésion.|Au-delà des performances sur le terrain, les sports collectifs incarnent les valeurs fondamentales de l’olympisme : le respect, la solidarité et l’esprit d’équipe. Ils réunissent des athlètes d’horizons divers qui partagent un objectif commun, transcendant les différences culturelles et linguistiques. Ces disciplines jouent également un rôle clé dans la popularisation des Jeux Olympiques, attirant des millions de spectateurs à travers le monde. Que ce soit sur un terrain de football, un court de basketball ou un stade de volleyball, les sports collectifs continuent de rassembler les nations et d’illustrer la beauté du sport comme vecteur de paix et d’amitié." >> $DIR_TEXTE2/T3
echo "Les sports aquatiques : une tradition olympique entre puissance et grâce" > $DIR_TEXTE2/T4
echo "" >> $DIR_TEXTE2/T4
echo "Les sports aquatiques occupent une place centrale dans l’histoire des Jeux Olympiques, incarnant à la fois la force, la technique et la beauté du mouvement humain dans l’eau. Dès les premiers Jeux modernes en 1896 à Athènes, la natation faisait partie du programme olympique, rapidement suivie par le plongeon en 1904 et le water-polo en 1900. Au fil des années, d’autres disciplines aquatiques ont enrichi ce domaine, comme la natation artistique (anciennement natation synchronisée) en 1984 et plus récemment le surf, intégré en 2020. Ces sports attirent des athlètes du monde entier et captivent les spectateurs par la diversité des épreuves, allant de la vitesse pure aux démonstrations artistiques et stratégiques.|L’histoire des sports aquatiques aux Jeux Olympiques est jalonnée de performances légendaires et d’athlètes emblématiques. Des nageurs comme Michael Phelps, détenteur du record de médailles olympiques, ou Katie Ledecky, icône de l’endurance et de la vitesse, ont marqué leur époque par des exploits sans précédent. Le plongeon a également vu des figures marquantes, comme Greg Louganis, reconnu pour sa grâce et sa précision. Les épreuves de water-polo, souvent spectaculaires, ont donné lieu à des rivalités historiques, notamment entre la Hongrie et la Yougoslavie. Ces performances reflètent non seulement la maîtrise physique et mentale des athlètes, mais aussi leur capacité à repousser les limites du possible dans un élément naturel.|Sur le plan technique, les sports aquatiques aux JO ont évolué grâce aux avancées scientifiques et technologiques. Les piscines olympiques sont désormais conçues pour maximiser la vitesse des nageurs grâce à une gestion précise des vagues et de la flottabilité. Les maillots de bain, régulièrement repensés, ont également contribué à l’amélioration des performances. En parallèle, la natation artistique et le plongeon ont vu l’introduction de systèmes de notation plus sophistiqués, récompensant à la fois la créativité et la précision. Ces innovations témoignent de l’engagement des Jeux Olympiques à promouvoir l’excellence sportive et à offrir des compétitions de haut niveau.|Au-delà de la compétition, les sports aquatiques incarnent des valeurs fondamentales telles que la discipline, la résilience et le travail d’équipe. La natation synchronisée et le water-polo, par exemple, mettent en lumière l’importance de la coordination et de l’harmonie entre les coéquipiers. Les marathons aquatiques, introduits en 2008, symbolisent quant à eux la persévérance et la connexion intime entre l’humain et l’eau. Ces disciplines rappellent que les sports olympiques ne se résument pas à des médailles, mais à des récits de courage, de passion et de dépassement de soi.|Enfin, les sports aquatiques aux Jeux Olympiques laissent un héritage durable, tant pour les athlètes que pour les spectateurs. Ils inspirent des millions de personnes à travers le monde à explorer les joies et les défis des activités aquatiques, favorisant une relation saine avec l’eau. Les compétitions spectaculaires, comme les finales de natation ou les plongeons synchronisés, attirent un large public, renforçant l’intérêt pour les sports aquatiques. À chaque édition des Jeux, ces disciplines rappellent l’universalité du sport et célèbrent le lien profond entre l’humanité et cet élément essentiel qu’est l’eau." >> $DIR_TEXTE2/T4

echo "Traitement des images terminé."
echo "Traitement des textes..."
echo "Traitement des textes terminé."
echo "Tri des medailles..."

chmod +x tri_medaille.sh
bash ./tri_medaille.sh
clear

# 2. Telechargement des drapeaux
echo "Traitement des images..."
echo "Traitement des images terminé."
echo "Traitement des textes..."
echo "Traitement des textes terminé."
echo "Traitement des médailles..."
echo "Traitement des médailles terminé."
echo "Téléchargement des drapeaux..."

chmod +x download_drapeaux.sh
bash ./download_drapeaux.sh

# 3. Generation du HTML
clear

echo "Traitement des images..."
echo "Traitement des images terminé."
echo "Traitement des textes..."
echo "Traitement des textes terminé."
echo "Traitement des médailles..."
echo "Traitement des médailles terminé."
echo "Téléchargement des drapeaux..."
echo "Téléchargement des drapeaux terminé."
echo "Génération du tableau au format html..."

cat > "$HTML_FILE" << EOF
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tableau des medailles - JO Paris 2024</title>
    <style>
        @media print {
            @page {
                size: A4 landscape;
                margin: 0.1cm;
            }
        }

        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0px;
            width: 100%;
            height: 100%;
            box-sizing: border-box;
            display: flex;
            flex-direction: column;
            max-width: 297mm;
            max-height: 210mm;
        }

        header {
            display: flex;
            flex-direction: row;
            padding-top: 1px;
            width: 100%;
            height: 10px;
        }

        header h1 {
            font-size: 10px;
            text-align: center;
            flex: 1;
        }

        header img {
            max-width: 45px;
            height: auto;
            opacity: 1.0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 6px;
            margin-top: 12px;
        }

        tr {
            page-break-inside: avoid;
            height: 9px;
        }

        tr:first-child {
            background-color: #f4f4f4;
            font-weight: bold;
        }

        td, th {
            border: 1px solid #ddd;
            padding: 0px;
            text-align: center;
            vertical-align: middle;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        td:nth-child(1), th:nth-child(1) {
            width: 25px;
        }

        td:nth-child(2), th:nth-child(2) {
            width: 55px;
        }

        td:nth-child(3), th:nth-child(3),
        td:nth-child(4), th:nth-child(4),
        td:nth-child(5), th:nth-child(5) {
            width: 12px;
        }

        td:nth-child(6), th:nth-child(6) {
            width: 15px;
        }

        td:nth-child(7), th:nth-child(7) {
            width: 18px;
        }

        .flag {
            height: 6px;
            vertical-align: middle;
            margin-right: 1px;
        }

        .medals {
            text-align: center;
        }
    </style>
</head>
<body>
<header>
    <h1>Tableau des médailles - Jeux Olympiques Paris 2024</h1>
    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR45IwMHj8YH341Rpk_h4YnyZYPcjcmbjMLHA&s" alt="Logo JO Paris 2024">
</header>
EOF

# Ajouter le contenu du tableau depuis resultat.csv
echo "<table>" >> "$HTML_FILE"
echo "<tr><th>Rang</th><th>Pays</th><th>Or</th><th>Argent</th><th>Bronze</th><th>Total</th><th>%</th></tr>" >> "$HTML_FILE"

# Calculer le total general des medailles
TOTAL_MEDALS=$(awk -F',' 'NR>1{sum+=$6}END{print sum}' resultat.csv)

# Joindre resultat.csv avec pays_iso.csv pour avoir les codes ISO
while IFS=, read -r rank pays or argent bronze total; do
    # Chercher le code ISO correspondant dans pays_iso.csv
    if [ "$rank" != "Rank" ]; then  
        iso=$(grep "^$pays," pays_iso.csv | cut -d',' -f2 | tr '[:upper:]' '[:lower:]')
        if [ ! -z "$iso" ]; then
            percentage=$(awk "BEGIN {printf \"%.1f\", ($total / $TOTAL_MEDALS) * 100}")
            echo "<tr><td>$rank</td><td><img src=\"drapeaux/largeur_20/$iso.png\" class=\"flag\">$pays</td><td class=\"medals\">$or</td><td class=\"medals\">$argent</td><td class=\"medals\">$bronze</td><td class=\"medals\">$total</td><td class=\"medals\">${percentage}</td></tr>" >> "$HTML_FILE"
        fi
    fi
done < resultat.csv

echo "</table></body></html>" >> "$HTML_FILE"

sudo cp resultat.csv $OUTPUT_DIR/resultat.csv
sudo rm resultat.csv
sudo cp -r drapeaux/ $OUTPUT_DIR/drapeaux/
sudo rm -r drapeaux
sudo cp tableau_medailles.html $OUTPUT_DIR/tableau_medailles.html
sudo rm tableau_medailles.html

echo "Traitement de la chaine terminé !"
echo "Tout les fichiers modifiés sont dans le dossier $OUTPUT_DIR et les fichiers temporaires ont été supprimés."

exit
import 'package:flutter/material.dart';

class Education extends StatelessWidget {
    @override

 Widget build(BuildContext context) {
   return new Scaffold(
     body: ListView.builder(
       itemBuilder: (BuildContext context, int index) =>
           EntryItem(data[index]),
       itemCount: data.length,
     ),
   );
 }
}

class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
}

final List<Entry> data = <Entry>[
  Entry(
    'First Trimester',
    <Entry>[
      Entry(
        'Week 1',
        <Entry>[
          Entry('Potential Symptoms: Vaginal Bleeding, Lower Back Pain, Cramps, Bloating, Mood Swings, Headaches'),
          Entry('Tip #1: Stop any unhealthy habits such as drinking and smoking'),
          Entry('Tip #2: Take prenatal vitamins daily (400 mcg folic acid)'),
        ],
      ),
      Entry(
        'Week 2',
        <Entry>[
          Entry('Potential Symptoms: Better Sense of Smell, Breast Soreness/Tenderness, Pelvic Ache, Light Spotting, Increased Sex Drive'),
          Entry('Tip #1: Look for signs of ovulation'),
          Entry('Tip #2: Have sex every other day to increase likelihood of getting pregnant (This is near the most fertile part of your cycle)'),
        ],
      ),
      Entry(
        'Week 3',
        <Entry>[
          Entry('Potential Symptoms: Implantation Bleeding, Nausea, Missed Period'),
          Entry('Tip #1: Buy a pregnancy test'),
          Entry('Tip #2: Limit your caffeine intake (coffee, energy drinks, etc.)'),
          Entry('Tip #3: If you test positive, calculate your due date'),
        ],
      ),
      Entry(
        'Week 4',
        <Entry>[
          Entry('Your baby is the size of a poppyseed'),
          Entry('Potential Symptoms: Bloating, Mild Cramping, Spotting, Mood Swings, Morning Sickness, Fatigue, Sore Breasts'),
          Entry('Tip #1: Start taking a prenatal vitamin if you are not already'),
          Entry('Tip #2: Get some vitamin D - either through the sun, food, pills, and/or supplements'),
        ],
      ),
      Entry(
        'Week 5',
        <Entry>[
          Entry('Your baby is the size of an appleseed'),
          Entry('Potential Symptoms: Sore Breasts, Morning Sickness, Fatigue, Frequent Urination, Cramps, Spotting'),
          Entry('Tip #1: Establish a healthy diet'),
          Entry('Tip #2: Start a pregnancy journal'),
        ],
      ),
      Entry(
        'Week 6',
        <Entry>[
          Entry('Your baby is the size of a sweet pea'),
          Entry('Potential Symptoms: Fatigue, Nausea, Sore Breasts, Frequent Urination, Gas and Bloating, Mood Swings'),
          Entry('Tip #1: Prepare for your first prenatal appointment'),
          Entry('Tip #2: Stay hydrated and go when you gotta go'),
        ],
      ),
      Entry(
        'Week 7',
        <Entry>[
          Entry('Your baby is the size of a blueberry'),
          Entry('Potential Symptoms: Nausea, Food Cravings/Aversions, Frequent Urination, Acne, Mood Swings, Cramping, Spotting'),
          Entry('Tip #1: Stay active'),
          Entry('Tip #2: Make sure your makeup products are pregnancy-safe'),
        ],
      ),
      Entry(
        'Week 8',
        <Entry>[
          Entry('Your baby is the size of a raspberry'),
          Entry('Potential Symptoms: Sore Breasts, Fatigue, Morning Sickness, Improved Sense of Smell, Constipation, Weird Dreams'),
          Entry('Tip #1: Take advantage of times that you are hungry'),
          Entry('Tip #2: Schedule 12-week prenatal visit'),
        ],
      ),
      Entry(
        'Week 9',
        <Entry>[
          Entry('Your baby is the size of a cherry'),
          Entry('Potential Symptoms: Mood Swings, Morning Sickness, Frequent Urination, Fatigue, Nasal Congestion, Headaches'),
          Entry('Tip #1: Switch to stretchy fabrics'),
          Entry('Tip #2: Eat smaller meals throughout the day to prevent heartburn'),
        ],
      ),
      Entry(
        'Week 10',
        <Entry>[
          Entry('Your baby is the size of a strawberry'),
          Entry('Potential Symptoms: Round Ligament Pain, Growing Breasts, Morning Sickness, Mood Swings, Fatigue, Increased Vaginal Discharge, Visible Veins'),
          Entry('Tip #1: Eat right when you wake up to limit morning sickness'),
          Entry('Tip #2: Take vitamins (A, C, and D especially)')
        ],
      ),
      Entry(
        'Week 11',
        <Entry>[
          Entry('Your baby is the size of a lime'),
          Entry('Potential Symptoms: Fatigue, Nausea, Gas, Mood Swings, Leg Cramps, Skin Darkening, Vaginal Discharge'),
          Entry('Tip #1: Add calcium-rich foods to your diet'),
          Entry('Tip #2: Stay hydrated and active'),
        ],
      ),
      Entry(
        'Week 12',
        <Entry>[
          Entry('Your baby is the size of a plum'),
          Entry('Potential Symptoms: Increased discharge, Spotting, Headaches, Dizziness'),
          Entry('Tip #1: Wear sun protection outside'),
          Entry('Tip #2: Try to avoid junk food'),
          Entry('Tip #3: Schedule your 16-week prenatal visit'),
        ],
      ),
    ],
  ),
  Entry(
    'Second Trimester',
    <Entry>[
      Entry(
        'Week 13',
        <Entry>[
          Entry('Your baby is the size of a lemon'),
          Entry('Potential Symptoms: Visible Veins, Increased Sex Drive'),
          Entry('Tip #1: Strengthen your pelvic floor'),
          Entry('Tip #2: Tell your boss that you are pregnant'),
          Entry('Tip #3: If you have an older child, start preparing them for the birth of their younger brother/sister'),
        ],
      ),
      Entry(
        'Week 14',
        <Entry>[
          Entry('Your baby is the size of a peach'),
          Entry('Potential Symptoms: Round Ligament Pain, Increased Energy, Increased Appetite, Thicker/Shinier Hair'),
          Entry('Tip #1: Eat fiber-rich foods to cure constipation'),
          Entry('Tip #2: Stay hydrated to prevent sinus infections'),
        ],
      ),
      Entry(
        'Week 15',
        <Entry>[
          Entry('Your baby is the size of a navel orange'),
          Entry('Potential Symptoms: Increased Sex Drive, Nosebleeds, Heartburn, Gas, Indigestion, Swollen Gums, Shortness of Breath'),
          Entry('Tip #1: Schedule a dental checkup'),
          Entry('Tip #2: Rest when you can'),
          Entry('Tip #3: Look into childbirth classes'),
        ],
      ),
      Entry(
        'Week 16',
        <Entry>[
          Entry('Your baby is the size of an avocado'),
          Entry('Potential Symptoms: Backaches, Larger Breasts, Constipation, Forgetfulness, Itchy Eyes'),
          Entry('Tip #1: Find a chair with good support'),
          Entry('Tip #2: Schedule your 20-week prenatal visit'),
        ],
      ),
      Entry(
        'Week 17',
        <Entry>[
          Entry('Your baby is the size of a pear'),
          Entry('Potential Symptoms: Increased bodily fluids, Weird Dreams, Itchy Breasts and Belly, Rapid Weight Gain, Stretch Marks'),
          Entry('Tip #1: Decide whether you want to learn the sex of the baby at your next ultrasound'),
          Entry('Tip #2: Plan your maternity leave'),
        ],
      ),
      Entry(
        'Week 18',
        <Entry>[
          Entry('Your baby is the size of a sweet potato'),
          Entry('Potential Symptoms: Swollen Feet/Hands, Backaches, Leg Cramps, Trouble Sleeping, Nosebleeds, Baby Kicks'),
          Entry('Tip #1: Try yoga'),
          Entry('Tip #2: Switch your sleep position from back to side'),
        ],
      ),
      Entry(
        'Week 19',
        <Entry>[
          Entry('Your baby is the size of a mango'),
          Entry('Potential Symptoms: Abdominal Aches, Dizziness, Leg Cramps, Hip Pain'),
          Entry('Tip #1: Start looking for pediatricians'),
          Entry('Tip #2: Sign up for an infant CPR class'),
        ],
      ),
      Entry(
        'Week 20',
        <Entry>[
          Entry('Your baby is the size of a banana'),
          Entry('Potential Symptoms: Vaginal Discharge, Leg Cramps, Heartburn, Indigestion, High Energy, Swelling, Shortness of Breath'),
          Entry('Tip #1: Decide where you will give birth'),
          Entry('Tip #2: Schedule your 24-week prenatal visit'),
        ],
      ),
      Entry(
        'Week 21',
        <Entry>[
          Entry('Your baby is the size of a pomegranate'),
          Entry('Potential Symptoms: Heartburn, Indigestion, Braxton Hicks Contractions, Leaky Breasts, Dry/Itchy Skin, Stretch Marks'),
          Entry('Tip #1: Stay hydrated'),
          Entry('Tip #2: Keep moving'),
        ],
      ),
      Entry(
        'Week 22',
        <Entry>[
          Entry('Your baby is the size of a papaya'),
          Entry('Potential Symptoms: Stretch Marks, Outie Belly Button, Increased Sex Drive, Increased Vaginal Discharge, Swollen Hands/Feet, Backaches'),
          Entry('Tip #1: Decide whether to use daycare or a nanny'),
          Entry('Tip #2: Focus on breathing when enduring Braxton Hicks contractions'),
        ],
      ),
      Entry(
        'Week 23',
        <Entry>[
          Entry('Your baby is the size of a grapefruit'),
          Entry('Potential Symptoms: Swollen Ankles/Feet, Braxton Hicks Contractions, Backaches, Bleeding Gums'),
          Entry('Tip #1: Get your vitamin D outside in the sun'),
          Entry('Tip #2: Plan for time off'),
        ],
      ),
      Entry(
        'Week 24',
        <Entry>[
          Entry('Your baby is the size of a cantaloupe'),
          Entry('Potential Symptoms: Swollen Ankles/Feet, Leg Cramps, Backaches, Linea Nigra, Stretch Marks'),
          Entry('Tip #1: Keep up with your kegel exercises'),
          Entry('Tip #2: Schedule your 28-week prenatal visit'),
        ],
      ),
      Entry(
        'Week 25',
        <Entry>[
          Entry('Your baby is the size of a cauliflower'),
          Entry('Potential Symptoms: Trouble Sleeping, Frequent Urination, Constipation, Hemorrhoids, Gas/Bloating, Heartburn, Braxton Hicks Contractions'),
          Entry('Tip #1: Moisturize your itchy skin'),
          Entry('Tip #2: Continue eating healthy'),
          Entry('Tip #3: If you feel comfortable with traveling, take a trip'),
        ],
      ),
      Entry(
        'Week 26',
        <Entry>[
          Entry('Your baby is the size of bunch of scallions'),
          Entry('Potential Symptoms: Trouble Sleeping, Swelling, Headaches, Higher Blood Pressure'),
          Entry('Tip #1: Preregister with the hospital'),
          Entry('Tip #2: Stay hydrated'),
        ],
      ),
    ],
  ),
  Entry(
    'Third Trimester',
    <Entry>[
      Entry(
        'Week 27',
        <Entry>[
          Entry('Your baby is the size of a head of lettuce'),
          Entry('Potential Symptoms: Leg Cramps, Backaches, Constipation, Hemorrhoids'),
          Entry('Tip #1: Sleep while you can'),
          Entry('Tip #2: Pick a pediatrician'),
        ],
      ),
      Entry(
        'Week 28',
        <Entry>[
          Entry('Your baby is the size of an eggplant '),
          Entry('Potential Symptoms: Trouble Sleeping, Shortness of Breath, Aches and Pains, Braxton Hicks Contractions, Leaky Breasts'),
          Entry('Tip #1: Count fetal kicks'),
          Entry('Tip #2: Schedule your 30-week prenatal visit'),
        ],
      ),
      Entry(
        'Week 29',
        <Entry>[
          Entry('Your baby is the size of an acorn squash'),
          Entry('Potential Symptoms: Headaches, Itchy Belly, Back/Leg/Hip Pain, Hemorrhoids, Constipation, Trouble Sleeping, Frequent Urination'),
          Entry('Tip #1: Start taking in more calcium'),
          Entry('Tip #2: Decide what to do with the cord blood of the baby'),
        ],
      ),
      Entry(
        'Week 30',
        <Entry>[
          Entry('Your baby is the size of a zucchini'),
          Entry('Potential Symptoms: Heartburn, Trouble Sleeping, Swelling, Shortness of Breath'),
          Entry('Tip #1: Schedule your 32-week prenatal visit'),
          Entry('Tip #2: Practice a hospital run'),
          Entry('Tip #3: Wear forgiving shoes'),
        ],
      ),
      Entry(
        'Week 31',
        <Entry>[
          Entry('Your baby is the size of a pineapple'),
          Entry('Potential Symptoms: Shortness of Breath, Dry/Brittle Nails, Braxton Hicks Contractions, Leaky Breasts, Frequent Urination, Backaches, Trouble Sleeping'),
          Entry('Tip #1: Experiment with different stretches if you are experiencing back pain and aches'),
          Entry('Tip #2: Invest in nursing pads'),
        ],
      ),
      Entry(
        'Week 32',
        <Entry>[
          Entry('Your baby is the size of a squash'),
          Entry('Potential Symptoms: Braxton Hicks Contractions, Darker Nipples, Shortness of Breath, Heartburn, Leaky Boobs, Vaginal Discharge'),
          Entry('Tip #1: Schedule your 34-week prenatal visit'),
          Entry('Tip #2: Install a car seat for the baby'),
        ],
      ),
      Entry(
        'Week 33',
        <Entry>[
          Entry('Your baby is the size of a butternut squash'),
          Entry('Potential Symptoms: Overheating, Headaches, Shortness of Breath, Forgetfulness'),
          Entry('Tip #1: Use a cold compress if you are experiencing headaches'),
          Entry('Tip #2: Consider registering for a labor and delivery course, along with an infant CPR class'),
        ],
      ),
      Entry(
        'Week 34',
        <Entry>[
          Entry('Your baby is the size of a coconut'),
          Entry('Potential Symptoms: Fatigue, Blurry Vision, Constipation, Hemorrhoids, Swollen Ankles/Feet, Abdominal Pressure, Braxton Hicks Contractions'),
          Entry('Tip #1: Reduce sodium intake, especially if you are experiencing swollen feet or ankles'),
          Entry('Tip #2: Schedule your 36-week prenatal visit'),
        ],
      ),
      Entry(
        'Week 35',
        <Entry>[
          Entry('Your baby is the size of a honeydew melon'),
          Entry('Potential Symptoms: Frequent Urge to Pee, Constipation, Hip Pains, Pelvis Aches, Braxton Hicks Contractions'),
          Entry('Tip #1: Pack a hospital bag'),
          Entry('Tip #2: Limit water intake before bedtime'),
        ],
      ),
      Entry(
        'Week 36',
        <Entry>[
          Entry('Your baby is the size of Swiss chard'),
          Entry('Potential Symptoms: Improved Breathing, Pelvic Discomfort, Trouble Sleeping, Heartburn, Swollen Ankles/Feet, Changes in Vaginal Discharge, Braxton Hicks Contractions'),
          Entry('Tip #1: Select a pediatrician'),
          Entry('Tip #2: Finalize your maternity-leave plan'),
          Entry('Tip #3: Elevate your feet if you have swollen feet or ankles'),
        ],
      ),
      Entry(
        'Week 37',
        <Entry>[
          Entry('Your baby is the size of a winter melon'),
          Entry('Potential Symptoms: Heartburn, Spotting, Stretch Marks, Abdominal Pressure, Trouble Sleeping, Contractions, Nausea'),
          Entry('Tip #1: Stay hydrated'),
          Entry('Tip #2: If you are feeling queasy, try some ginger'),
        ],
      ),
      Entry(
        'Week 38',
        <Entry>[
          Entry('Your baby is the size of a pumpkin'),
          Entry('Potential Symptoms: Braxton Hicks Contractions, Trouble Sleeping, Increased Vaginal Discharge, Itchy Belly, Swollen Feet/Ankles'),
          Entry('Tip #1: Cook and freeze some meals'),
          Entry('Tip #2: Go for walk in the park to get the blood flowing (reduce swelling)'),
        ],
      ),
      Entry(
        'Week 39',
        <Entry>[
          Entry('Your baby is the size of a watermelon'),
          Entry('Potential Symptoms: Braxton Hicks Contractions, Pelvic Pressure, Lightning Crotch, Urge to Nest, Mucus Plug'),
          Entry('Tip #1: Walking can help to induce labor'),
          Entry('Tip #2: Stay well-rested'),
        ],
      ),
      Entry(
        'Week 40',
        <Entry>[
          Entry('Your baby is the size of a jackfruit'),
          Entry('Potential Symptoms: Leg Cramps, Pelvic Pressure, Trouble Sleeping, Fatigue, Contractions, Anxiety'),
          Entry('Tip #1: Talk to your doctor about induction options'),
          Entry('Tip #2: Make sure there is gas in the car for the hospital trip'),
        ],
      ),
    ],
  ),
];


class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}


//code cited: http://www.androidcoding.in/2020/09/07/flutter-expandable-listview/
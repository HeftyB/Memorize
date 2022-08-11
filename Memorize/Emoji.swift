//
//  Emoji.swift
//  Memorize
//
//  Created by Andrew Shields on 11/11/21.
//

import Foundation

// Universal easy emoji / description pair lookup
struct Emoji {
    
    let animals = [
        "🐕": "Dog",
        "🐈": "Cat",
        "🐁": "Mouse",
        "🐹": "Hamster",
        "🐰": "Rabbit",
        "🦊": "Fox",
        "🐻": "Bear",
        "🐼": "Panda Bear",
        "🐻‍❄️": "Polar Bear",
        "🐨": "Koala",
        "🐅": "Tiger",
        "🐆": "Leopard",
        "🦁": "Lion",
        "🐄": "Cow",
        "🐖": "Pig",
        "🐸": "Frog",
        "🐒": "Monkey",
        "🐔": "Chicken",
        "🐧": "Penguin",
        "🦆": "Duck",
        "🦅": "Eagle",
        "🦉": "Owl",
        "🐎": "Horse",
        "🐝": "Bee",
        "🪱": "Worm",
        "🦋": "Butterfly",
        "🐌": "Snail",
        "🐞": "Ladybug",
        "🐜": "Ant",
        "🕷": "Spider",
        "🦂": "Scorpion",
        "🐢": "Turtle",
        "🐍": "Snake",
        "🦎": "Lizard",
        "🦐": "Shrimp",
        "🦞": "Lobster",
        "🦓": "Zebra",
        "🐬": "Dolphin",
        "🐳": "Whale",
        "🐘": "Elephant",
        "🦒": "Giraffe",
        "🦘": "Kangaroo",
        "🐑": "Sheep",
        "🦙": "Llama",
        "🦝": "Racoon"]
    
    let animalsText = [ "Dog" : "🐕",
        "Cat" : "🐈",
        "Mouse" : "🐁",
        "Hamster" : "🐹",
        "Rabbit" : "🐰",
        "Fox" : "🦊",
        "Bear" : "🐻",
        "Panda Bear" : "🐼",
        "Polar Bear" : "🐻‍❄️",
        "Koala" : "🐨",
        "Tiger" : "🐅",
        "Leopard" : "🐆",
        "Lion" : "🦁",
        "Cow" : "🐄",
        "Pig" : "🐖",
        "Frog" : "🐸",
        "Monkey" : "🐒",
        "Chicken" : "🐔",
        "Penguin" : "🐧",
        "Duck" : "🦆",
        "Eagle" : "🦅",
        "Owl" : "🦉",
        "Horse" : "🐎",
        "Bee" : "🐝",
        "Worm" : "🪱",
        "Butterfly" : "🦋",
        "Snail" : "🐌",
        "Ladybug" : "🐞",
        "Ant" : "🐜",
        "Spider" : "🕷",
        "Scorpion" : "🦂",
        "Turtle" : "🐢",
        "Snake" : "🐍",
        "Lizard" : "🦎",
        "Shrimp" : "🦐",
        "Lobster" : "🦞",
        "Zebra" : "🦓",
        "Dolphin" : "🐬",
        "Whale" : "🐳",
        "Elephant" : "🐘",
        "Giraffe" : "🦒",
        "Kangaroo" : "🦘",
        "Sheep" : "🐑",
        "Llama" : "🦙",
        "Racoon" : "🦝"]
    
    let food = [
        "🍎": "Apple",
        "🍋": "Lemon",
        "🍌": "Banana",
        "🍐": "Pear",
        "🍉": "Watermelon",
        "🍇": "Grapes",
        "🍓": "Strawberry",
        "🫐": "Blueberries",
        "🍒": "Cherries",
        "🍑": "Peach",
        "🍍": "Pineapple",
        "🥥": "Coconut",
        "🥝": "Kiwi",
        "🍅": "Tomato",
        "🍆": "Eggplant",
        "🥑": "Avocado",
        "🥦": "Broccoli",
        "🥬": "Lettuce",
        "🌶": "Pepper",
        "🫑": "Bell Pepper",
        "🌽": "Corn",
        "🥕": "Carrot",
        "🫒": "Olive",
        "🧅": "Onion",
        "🥔": "Potato",
        "🥐": "Croissant",
        "🥯": "Bagel",
        "🥨": "Pretzel",
        "🧀": "Cheese",
        "🥚": "Egg",
        "🧈": "Butter",
        "🥞": "Pancakes",
        "🧇": "Waffles",
        "🥓": "Bacon",
        "🥩": "Steak",
        "🌭": "Hot Dog",
        "🍔": "Hamburger",
        "🍟": "French Fries",
        "🍕": "Pizza",
        "🥪": "Sandwich",
        "🌮": "Taco",
        "🌯": "Burrito",
        "🥗": "Salad",
        "🍝": "Spaghetti",
        "🍤": "Shrimp",
        "🍚": "Rice",
        "🍦": "Ice Cream",
        "🥧": "Pie",
        "🧁": "Cupcake",
        "🎂": "Birthday Cake",
        "🍭": "Lollipop",
        "🍿": "Popcorn",
        "🍩": "Doughnut",
        "🍪": "Cookie",
        "🥜": "Peanuts"]
    
    let foodText = [ "Apple" : "🍎",
        "Lemon" : "🍋",
        "Banana" : "🍌",
        "Pear" : "🍐",
        "Watermelon" : "🍉",
        "Grapes" : "🍇",
        "Strawberry" : "🍓",
        "Blueberries" : "🫐",
        "Cherries" : "🍒",
        "Peach" : "🍑",
        "Pineapple" : "🍍",
        "Coconut" : "🥥",
        "Kiwi" : "🥝",
        "Tomato" : "🍅",
        "Eggplant" : "🍆",
        "Avocado" : "🥑",
        "Broccoli" : "🥦",
        "Lettuce" : "🥬",
        "Pepper" : "🌶",
        "Bell Pepper" : "🫑",
        "Corn" : "🌽",
        "Carrot" : "🥕",
        "Olive" : "🫒",
        "Onion" : "🧅",
        "Potato" : "🥔",
        "Croissant" : "🥐",
        "Bagel" : "🥯",
        "Pretzel" : "🥨",
        "Cheese" : "🧀",
        "Egg" : "🥚",
        "Butter" : "🧈",
        "Pancakes" : "🥞",
        "Waffles" : "🧇",
        "Bacon" : "🥓",
        "Steak" : "🥩",
        "Hot Dog" : "🌭",
        "Hamburger" : "🍔",
        "French Fries" : "🍟",
        "Pizza" : "🍕",
        "Sandwich" : "🥪",
        "Taco" : "🌮",
        "Burrito" : "🌯",
        "Salad" : "🥗",
        "Spaghetti" : "🍝",
        "Shrimp" : "🍤",
        "Rice" : "🍚",
        "Ice Cream" : "🍦",
        "Pie" : "🥧",
        "Cupcake" : "🧁",
        "Birthday Cake" : "🎂",
        "Lollipop" : "🍭",
        "Popcorn" : "🍿",
        "Doughnut" : "🍩",
        "Cookie" : "🍪",
        "Peanuts" : "🥜"]
    
    let flags = [
        "Afghanistan" : "🇦🇫",
        "Åland Islands" : "🇦🇽",
        "Albania" : "🇦🇱",
        "Algeria" : "🇩🇿",
        "American Samoa" : "🇦🇸",
        "Andorra" : "🇦🇩",
        "Angola" : "🇦🇴",
        "Anguilla" : "🇦🇮",
        "Antartica" : "🇦🇶",
        "Antigua & Barbuda" : "🇦🇬",
        "Argentina" : "🇦🇷",
        "Armenia" : "🇦🇲",
        "Aruba" : "🇦🇼",
        "Austrilia" : "🇦🇺",
        "Austria" : "🇦🇹",
        "Azerbaijan" : "🇦🇿",
        "Bahamas" : "🇧🇸",
        "Bahrain" : "🇧🇭",
        "Bangladesh" : "🇧🇩",
        "Barbados" : "🇧🇧",
        "Belarus" : "🇧🇾",
        "Belgium" : "🇧🇪",
        "Belize" : "🇧🇿",
        "Benin" : "🇧🇯",
        "Bermuda" : "🇧🇲",
        "Bhutan" : "🇧🇹",
        "Bolivia" : "🇧🇴",
        "Bosnia & Herzegovina" : "🇧🇦",
        "Botswana" : "🇧🇼",
        "Brazil" : "🇧🇷",
        "British Virgin Islands" : "🇻🇬",
        "Brunei" : "🇧🇳",
        "Bulgaria" : "🇧🇬",
        "Burkina Faso" : "🇧🇫",
        "Burundi" : "🇧🇮",
        "Cambodia" : "🇰🇭",
        "Cameroon" : "🇨🇲",
        "Canada" : "🇨🇦",
        "Canary Islands" : "🇮🇨",
        "Cape Verde" : "🇨🇻",
        "Bonaire" : "🇧🇶",
        "Cayman Islands" : "🇰🇾",
        "Central African Republic" : "🇨🇫",
        "Chad" : "🇹🇩",
        "British Indian Ocean Territory" : "🇮🇴",
        "Chile" : "🇨🇱",
        "China" : "🇨🇳",
        "Christmas Island" : "🇨🇽",
        "Cocos (Keeling) Islands" : "🇨🇨",
        "Colombia" : "🇨🇴",
        "Comoros" : "🇰🇲",
        "Republic of the Congo" : "🇨🇬",
        "Democratic Republic of the Congo" : "🇨🇩",
        "Cook Islands" : "🇨🇰",
        "Costa Rica" : "🇨🇷",
        "Côte d’Ivoire" : "🇨🇮",
        "Croatia" : "🇭🇷",
        "Cuba" : "🇨🇺",
        "Curaçao" : "🇨🇼",
        "Cyprus" : "🇨🇾",
        "Czechia" : "🇨🇿",
        "Denmark" : "🇩🇰",
        "Djibouti" : "🇩🇯",
        "Dominica" : "🇩🇲",
        "Dominican Republic" : "🇩🇴",
        "Ecuador" : "🇪🇨",
        "Egypt" : "🇪🇬",
        "El Salvador" : "🇸🇻",
        "Equatorial Guinea" : "🇬🇶",
        "Eritrea" : "🇪🇷",
        "Estonia" : "🇪🇪",
        "Eswatini" : "🇸🇿",
        "Ethiopia" : "🇪🇹",
        "Falkland Islands" : "🇫🇰",
        "Faroe Islands" : "🇫🇴",
        "Fiji" : "🇫🇯",
        "Finland" : "🇫🇮",
        "France" : "🇫🇷",
        "French Guiana" : "🇬🇫",
        "French Polynesia" : "🇵🇫",
        "French Southern Territories" : "🇹🇫",
        "Gabon" : "🇬🇦",
        "Gambia" : "🇬🇲",
        "Georgia" : "🇬🇪",
        "Germany" : "🇩🇪",
        "Ghana" : "🇬🇭",
        "Gibraltar" : "🇬🇮",
        "Greece" : "🇬🇷",
        "Greenland" : "🇬🇱",
        "Grenada" : "🇬🇩",
        "Guadeloupe" : "🇬🇵",
        "Guam" : "🇬🇺",
        "Guatemala" : "🇬🇹",
        "Guernsey" : "🇬🇬",
        "Guinea" : "🇬🇳",
        "Guinea-Bissau" : "🇬🇼",
        "Guyana" : "🇬🇾",
        "Haiti" : "🇭🇹",
        "Honduras" : "🇭🇳",
        "Hong Kong" : "🇭🇰",
        "Hungary" : "🇭🇺",
        "Iceland" : "🇮🇸",
        "India" : "🇮🇳",
        "Indonesia" : "🇮🇩",
        "Iran" : "🇮🇷",
        "Iraq" : "🇮🇶",
        "Ireland" : "🇮🇪",
        "Isle of Man" : "🇮🇲",
        "Israel" : "🇮🇱",
        "Italy" : "🇮🇹",
        "Jamaica" : "🇯🇲",
        "Japan" : "🇯🇵",
        "Jersey" : "🇯🇪",
        "Jordan" : "🇯🇴",
        "Kazakhstan" : "🇰🇿",
        "Kenya" : "🇰🇪",
        "Kiribati" : "🇰🇮",
        "Kosovo" : "🇽🇰",
        "Kuwait" : "🇰🇼",
        "Kyrgyzstan" : "🇰🇬",
        "Laos" : "🇱🇦",
        "Latvia" : "🇱🇻",
        "Lebanon" : "🇱🇧",
        "Lesotho" : "🇱🇸",
        "Liberia" : "🇱🇷",
        "Libya" : "🇱🇾",
        "Liechtenstein" : "🇱🇮",
        "Lithuania" : "🇱🇹",
        "Luxembourg" : "🇱🇺",
        "Macao" : "🇲🇴",
        "Madagascar" : "🇲🇬",
        "Malawi" : "🇲🇼",
        "Malaysia" : "🇲🇾",
        "Maldives" : "🇲🇻",
        "Mali" : "🇲🇱",
        "Malta" : "🇲🇹",
        "Marshall Islands" : "🇲🇭",
        "Martinique" : "🇲🇶",
        "Mauritania" : "🇲🇷",
        "Mauritius" : "🇲🇺",
        "Mayotte" : "🇾🇹",
        "Mexico" : "🇲🇽",
        "Micronesia" : "🇫🇲",
        "Moldova" : "🇲🇩",
        "Monaco" : "🇲🇨",
        "Mongolia" : "🇲🇳",
        "Montenegro" : "🇲🇪",
        "Montserrat" : "🇲🇸",
        "Morocco" : "🇲🇦",
        "Mozambique" : "🇲🇿",
        "Myanmar" : "🇲🇲",
        "Namibia" : "🇳🇦",
        "Nauru" : "🇳🇷",
        "Nepal" : "🇳🇵",
        "Netherlands" : "🇳🇱",
        "New Caledonia" : "🇳🇨",
        "New Zealand" : "🇳🇿",
        "Nicaragua" : "🇳🇮",
        "Niger" : "🇳🇪",
        "Nigeria" : "🇳🇬",
        "Niue" : "🇳🇺",
        "Norfolk Island" : "🇳🇫",
        "North Korea" : "🇰🇵",
        "North Macedonia" : "🇲🇰",
        "Northern Mariana Islands" : "🇲🇵",
        "Norway" : "🇳🇴",
        "Oman" : "🇴🇲",
        "Pakistan" : "🇵🇰",
        "Palau" : "🇵🇼",
        "Palestinian" : "🇵🇸",
        "Panama" : "🇵🇦",
        "Papua New Guinea" : "🇵🇬",
        "Paraguay" : "🇵🇾",
        "Peru" : "🇵🇪",
        "Philippines" : "🇵🇭",
        "Pitcairn" : "🇵🇳",
        "Poland" : "🇵🇱",
        "Portugal" : "🇵🇹",
        "Puerto Rico" : "🇵🇷",
        "Qatar" : "🇶🇦",
        "Réunion" : "🇷🇪",
        "Romania" : "🇷🇴",
        "Russia" : "🇷🇺",
        "Rwanda" : "🇷🇼",
        "Samoa" : "🇼🇸",
        "San Marino" : "🇸🇲",
        "São Tomé & Príncipe" : "🇸🇹",
        "Saudi Arabia" : "🇸🇦",
        "Senegal" : "🇸🇳",
        "Serbia" : "🇷🇸",
        "Seychelles" : "🇸🇨",
        "Sierra Leone" : "🇸🇱",
        "Singapore" : "🇸🇬",
        "Sint Maarten" : "🇸🇽",
        "Slovakia" : "🇸🇰",
        "Slovenia" : "🇸🇮",
        "South Georgia & the South Sandwich Islands" : "🇬🇸",
        "Solomon Islands" : "🇸🇧",
        "Somalia" : "🇸🇴",
        "South Africa" : "🇿🇦",
        "South Korea" : "🇰🇷",
        "South Sudan" : "🇸🇸",
        "Spain" : "🇪🇸",
        "Sri Lanka" : "🇱🇰",
        "Saint Barthélemy" : "🇧🇱",
        "Saint Helena" : "🇸🇭",
        "Saint Kitts & Nevis" : "🇰🇳",
        "Saint Lucia" : "🇱🇨",
        "Saint Pierre & Miquelon" : "🇵🇲",
        "Saint Vincent & Grenadines" : "🇻🇨",
        "Sudan" : "🇸🇩",
        "Suriname" : "🇸🇷",
        "Sweden" : "🇸🇪",
        "Switzerland" : "🇨🇭",
        "Syria" : "🇸🇾",
        "Taiwan" : "🇹🇼",
        "Tajikistan" : "🇹🇯",
        "Tanzania" : "🇹🇿",
        "Thailand" : "🇹🇭",
        "Timor-Leste" : "🇹🇱",
        "Togo" : "🇹🇬",
        "Tokelau" : "🇹🇰",
        "Tonga" : "🇹🇴",
        "Trinidad & Tobago" : "🇹🇹",
        "Tunisia" : "🇹🇳",
        "Turkey" : "🇹🇷",
        "Turkmenistan" : "🇹🇲",
        "Turks & Caicos Islands" : "🇹🇨",
        "Tuvalu" : "🇹🇻",
        "US Virgin Islands" : "🇻🇮",
        "Uganda" : "🇺🇬",
        "Ukraine" : "🇺🇦",
        "United Arab Emirates" : "🇦🇪",
        "United Kingdom" : "🇬🇧",
        "England" : "🏴󠁧󠁢󠁥󠁮󠁧󠁿",
        "Scotland" : "🏴󠁧󠁢󠁳󠁣󠁴󠁿",
        "Wales" : "🏴󠁧󠁢󠁷󠁬󠁳󠁿",
        "United States" : "🇺🇸",
        "Uruguay" : "🇺🇾",
        "Uzbekistan" : "🇺🇿",
        "Vanuatu" : "🇻🇺",
        "Vatican City" : "🇻🇦",
        "Venezuela" : "🇻🇪",
        "Vietnam" : "🇻🇳",
        "Wallis & Futuna" : "🇼🇫",
        "Western Sahara" : "🇪🇭",
        "Yemen" : "🇾🇪",
        "Zambia" : "🇿🇲",
        "Zimbabwe" : "🇿🇼",
        
    ]
    
    let vehicles = [
        "🚗",
        "🚕",
        "🚌",
        "🏎",
        "🚓",
        "🚑",
        "🚒",
        "🛻",
        "🚜",
        "🛵",
        "🏍",
        "✈️",
        "🚀",
        "🚁",
        "⛵️",
    ]
    
    
//    func getShuffledCard (_ difficulty: Difficulty, theme: Theme) -> [EmojiCard] {
//
//        var arr: [EmojiCard]
//        let dict: [String : String]
//
//        switch theme {
//        case .animals:
//            dict = animals
//        case .food:
//            dict = food
//        case .flags:
//            dict = flags
//        case .vehicles:
//            dict = vehicles
//        }
//
//        switch difficulty {
//        case .easy:
//            arr = randomEmoji(8, dict: dict)
//        case .medium:
//            arr = randomEmoji(16, dict: dict)
//        case .hard:
//            arr = randomEmoji(24, dict: dict)
//        case .expert:
//            print("expert")
//            arr = []
////            animals.forEach() { key, value in
////                arr.append(EmojiCard(emoji: value, description: key))
////            }
//
//        }
//
//        return arr
//    }
//
    
//    func randomEmoji (_ num: Int, dict: [String: String]) -> [EmojiCard] {
//
//        var sets = Set<EmojiCard>()
//
//        while sets.count < num {
//            let e = dict.randomElement()!
//            sets.insert(EmojiCard(emoji: e.value, description: e.key))
//        }
//
//        return Array(sets)
//    }
}
//
//func getEmojiCards(theme: Theme) -> [MemoryGame<String>.Card] {
//    /// code here
//}
//
//func getRandomEmojiCards() -> [MemoryGame<String>.Card] {
//
//}

//struct EmojiCard: Hashable, Identifiable {
//    let emoji: String
//    let description: String
//
//    var id: String {
//        description
//    }
//}

//enum Theme {
//    case animals, food, flags, vehicles
//}

struct Theme {
    var name: ThemeName
    var emojis: Dictionary<String,String>
    var color: ThemeColor
}

enum Difficulty: String, CaseIterable, Identifiable {
    case easy, medium, hard, expert
    
    var id: String { self.rawValue }
}

enum ThemeColor {
    case yellow, blue, green
}

enum ThemeName: String, CaseIterable, Identifiable {
    case vehicles, animals, food, flags
    
    var id: String { self.rawValue }
}

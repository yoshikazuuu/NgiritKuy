//
//  GOPArea.swift
//  NgiritKuy
//
//  Created by Jerry Febriano on 07/04/25.
//

import Foundation
import SwiftData

// Assuming GOPArea and MenuType enums are defined elsee
// enum GOPArea { case gop1, gop2, gop3, gop4, gop5, gop6, gop7, g}
// enum MenuType { case indonesian, western, chinese, japanese, korean, javanese, sundanese }

// Structure: (Kiosk Name, Kiosk Description, Min Price, Max Price, Avg Price, GOP Area, Kiosk Name String, Menu Items)
// Menu Item Structure: (Name, Price (in thousands), Description, Dietary Tag ("vegatarian" | "non-vegetarian"), Image Name, Menu Type)
typealias StallData = (
    String, String, Double, Double, Double, GOPArea, String,
    [(String, Double, String, String, String, MenuType)]
)

let allFoodCourtStalls: [StallData] =
    [
        keKeiStallData,
        pondokBaksoPakJokoStallData,
        ayamRemekGoangStallData,
        warungKitaStallData,
        sotoKudusStallData,
        pecelMadiunBuLinStallData,
        uenaMieChiliOilStallData,
        nyandoeKitchenStallData,
        mieKocokMarikaStallData,
        dapurKepoMieJagoStallData,
        kantin28StallData,
        kedaiWakariStallData,
        dapurKencanaStallData,
    ] + greenEatery

let smallFoodCourtStalls: [StallData] = [
    keKeiStallData,
    pondokBaksoPakJokoStallData,
]

let greenEatery: [StallData] = [

    (
        "Kantin Wartas",
        "Description for Kantin Wartas",
        5.0,
        18.0,
        7.4,
        GOPArea.gop9,
        "Kantin Wartas",
        [
            (
                "Ayam Opor", 10.0,
                "A traditional Indonesian dish made with chicken cooked in a rich coconut milk sauce, flavored with spices and herbs.",
                "non-vegan",
                "c438e994c95b1f9c0be9baf54ffc2c779d95e122", .indonesian
            ),
            (
                "Nasi Putih", 5.0,
                "Steamed white rice, a staple in Indonesian cuisine, served as a side to complement various dishes.",
                "vegetarian",
                "5261ec62e3ac00543d18bdb11584542b3a8e0f15", .indonesian
            ),
            (
                "Kerupuk", 5.0,
                "Crispy crackers made from starch and spices, perfect for adding crunch to your meal.",
                "vegetarian",
                "00eb453314565cb98f9216d0ca0824d1ec402ae0", .indonesian
            ),
            (
                "Kentang Mustofa", 5.0,
                "Spicy fried potatoes seasoned with a blend of Indonesian spices, offering a delightful crunch.",
                "vegetarian",
                "2cca1c2a0f5709e21dcd2806bc7c5607e0c845d9", .indonesian
            ),
            (
                "Tahu Opor", 5.0,
                "Tofu cooked in a creamy coconut sauce, infused with aromatic spices, making it a flavorful vegetarian option.",
                "vegetarian",
                "6a98f0fd254fa42c677e40c809aae2028fe2f52a", .indonesian
            ),
            (
                "Kentang balado", 5.0,
                "Fried potatoes tossed in a spicy chili sauce, offering a perfect balance of heat and flavor.",
                "vegetarian",
                "d09e805d86451a7491b0dc91551259ed16a301fd", .indonesian
            ),
            (
                "Gulai Rebung atau Nangka", 5.0,
                "A savory curry made with bamboo shoots or jackfruit, simmered in coconut milk and spices.",
                "vegetarian",
                "985a0460f503887fe9da588f5f346613538fb8a0", .indonesian
            ),
            (
                "Terong Balado", 5.0,
                "Eggplant slices fried and served with a spicy chili sauce, a popular dish in Indonesian cuisine.",
                "vegetarian",
                "dfaedd7209a571a413d30fd124e1624a509c89e3", .indonesian
            ),
            (
                "Tumis Kangkung", 5.0,
                "Stir-fried water spinach with garlic and chili, a simple yet flavorful vegetable dish.",
                "vegetarian",
                "792f78e5c05b2a000cca4c41d3238c11eb594939", .indonesian
            ),
            (
                "Pepaya Jepang", 5.0,
                "Japanese papaya salad, fresh and crunchy, often served as a refreshing side dish.",
                "vegetarian",
                "093a8cf19f7fb18fd7f9a0e1add0a690c06393b4", .indonesian
            ),
            (
                "Sayur Bayem", 5.0,
                "A dish made with sautéed spinach, seasoned with garlic and spices, providing a nutritious option.",
                "vegetarian",
                "cdc648f4bbe257edf64897963c12049ce0be2114", .indonesian
            ),
            (
                "Sop Kacang Merah", 5.0,
                "Red bean soup, sweet and creamy, often enjoyed as a dessert or snack.",
                "vegetarian",
                "e1595eea224548c86e9fe4f780728e0b8cb0c02f", .indonesian
            ),
            (
                "Jamur Oseng", 5.0,
                "Sautéed mushrooms with spices, offering a savory and earthy flavor, perfect for mushroom lovers.",
                "vegetarian",
                "57a1cc3971290a81228fc55c629fe9b9bd377399", .indonesian
            ),
            (
                "Pare Oseng", 5.0,
                "Stir-fried bitter melon, seasoned with spices, providing a unique taste and health benefits.",
                "vegetarian",
                "a753ae552547433689180cde9d807a0daf290373", .indonesian
            ),
            (
                "Bihun Goreng", 5.0,
                "Fried rice vermicelli with vegetables and spices, a popular noodle dish in Indonesia.",
                "vegetarian",
                "631e4143bc6655ce65c365a14072bb9a527cb0a1", .indonesian
            ),
            (
                "Sayur Tahu Pokcoy", 5.0,
                "Stir-fried pokcoy with tofu, seasoned with garlic and soy sauce, a healthy vegetarian option.",
                "vegetarian",
                "82259764711d6e065a5367fbe38c29c95ba07fec", .indonesian
            ),
            (
                "Oseng Tempe", 5.0,
                "Sautéed tempeh with spices, a protein-rich dish that is both nutritious and delicious.",
                "vegetarian",
                "330e4fb461fd1b4d0c9bd6c73188a473f7f955b3", .indonesian
            ),
            (
                "Kikil", 5.0,
                "Beef tendon cooked in a savory sauce, offering a unique texture and flavor.",
                "non-vegan",
                "39a159241ca0795d029f9326e9bece793063d77b", .indonesian
            ),
            (
                "Telur Opor", 5.0,
                "Eggs cooked in a rich coconut sauce, seasoned with spices, a comforting dish.",
                "vegetarian",
                "23117688a7066939321a717841b53e0c4291dea4", .indonesian
            ),
            (
                "Telur Ceplok", 5.0,
                "Fried eggs served sunny-side up, a simple yet satisfying dish.",
                "vegetarian",
                "a0d39d40549e7a52d5c735cecb5da89c04a2a54e", .indonesian
            ),
            (
                "Telur Semur", 5.0,
                "Eggs braised in a sweet soy sauce, offering a unique flavor profile.",
                "vegetarian",
                "da8d19ec2c368eacdec4af70f43a8c7e490a6e5e", .indonesian
            ),
            (
                "Telur Dadar", 5.0,
                "Indonesian-style omelet, fluffy and flavorful, perfect for breakfast or as a side dish.",
                "vegetarian",
                "16356c162eeae04d670ccdbdc34505163bd07a5d", .indonesian
            ),
            (
                "Sayur Toge", 5.0,
                "Stir-fried bean sprouts, a crunchy and nutritious addition to any meal.",
                "vegetarian",
                "74987572e0e058d52e6cec01d136e9a1af1333d3", .indonesian
            ),
            (
                "Paket 1 ", 18.0,
                "A complete meal consisting of rice, chicken, and vegetables, offering a balanced and hearty option.",
                "vegetarian", "",
                .indonesian
            ),
            (
                "Ikan Teri Asin", 5.0,
                "Salted anchovies, often served as a side dish or snack, providing a savory flavor.",
                "non-vegan",
                "d75dfc17ac43a418eece5ee0e200bc66ee6e1d4f", .indonesian
            ),
            (
                "Ati Ampela", 8.0,
                "Chicken liver and gizzard cooked in spices, offering a rich and flavorful dish.",
                "non-vegan",
                "778654ef3719ced75e6bf336cdfd8f109dd5d32f", .indonesian
            ),
            (
                "Ikan Cue atau Tongkol", 5.0,
                "Mackerel or tuna cooked in spices, providing a delicious seafood option.",
                "non-vegan",
                "a0557440757d7673660355fc766e2f13f17b9599", .indonesian
            ),
            (
                "Ikan Tuna", 10.0,
                "Fresh tuna cooked with spices, offering a rich and savory flavor.",
                "non-vegan",
                "025c960335b22d4643ecd048583ee38374bd675c", .indonesian
            ),
            (
                "Ikan Gurame", 10.0,
                "Gourami fish grilled or fried, known for its tender and flavorful meat.",
                "non-vegan",
                "498ab92a58022f00c9259d41fd60a5d55bbfc342", .indonesian
            ),
            (
                "Ikan Kembung", 10.0,
                "Mackerel fish grilled or fried, offering a rich taste and flaky texture.",
                "non-vegan",
                "132115c0e75ff72be81de10895d1ddf4a94fdb59", .indonesian
            ),
            (
                "Ayam Goreng", 10.0,
                "Crispy fried chicken, seasoned to perfection, a favorite among many.",
                "non-vegan",
                "b0423622ff7e4e930c7e214df0e80457b40853b8", .indonesian
            ),
            (
                "Ayam Semur", 10.0,
                "Chicken braised in a sweet soy sauce, offering a unique and comforting flavor.",
                "non-vegan",
                "69a4361e1a7ee068909d21c49b9cd0b54a57c350", .indonesian
            ),
            (
                "Paket 4", 10.0,
                "A meal consisting of rice and vegetables, providing a simple yet satisfying option.",
                "vegetarian", "", .indonesian
            ),
            (
                "Paket 3", 15.0,
                "A complete meal with rice, eggs, and vegetables, offering a balanced and hearty option.",
                "vegetarian", "",
                .indonesian
            ),
            (
                "Paket 2", 18.0,
                "A meal featuring rice, fish, and vegetables, providing a nutritious and delicious option.",
                "vegetarian", "",
                .indonesian
            ),
            (
                "Paket 1 ", 18.0,
                "A complete meal consisting of rice, chicken, and vegetables, offering a balanced and hearty option.",
                "vegetarian", "",
                .indonesian
            ),
        ]
    ),

    (
        "Kedai Soto Pak Gembul",
        "Description for Kedai Soto Pak Gembul",
        3.0,
        23.0,
        12.9,
        GOPArea.gop9,
        "Kedai Soto Pak Gembul",
        [
            (
                "Nasi Putih", 5.0,
                "Steamed white rice, a staple in Indonesian cuisine, served as a side to complement various dishes.",
                "vegetarian",
                "12aaf260e95640501a9f2b4b6088b952a7c9ef09", .indonesian
            ),
            (
                "Dimsum isi 4", 13.0,
                "A delightful serving of four pieces of dim sum, filled with a variety of savory ingredients.",
                "vegetarian",
                "d15ee52b43174cdb125dcaf948c36f08656b29fe", .indonesian
            ),
            (
                "Soto Ayam dan Nasi", 20.0,
                "A hearty chicken soup served with rice, flavored with aromatic spices and herbs.",
                "non-vegan",
                "206d48e4cb85464b4e285e9736da6ef6f7981681", .indonesian
            ),
            (
                "Soto Ayam", 17.0,
                "Traditional chicken soup, rich in flavor and served with a side of rice.",
                "non-vegan",
                "552b652e50549e993d51171d7b579c95852449e5", .indonesian
            ),
            (
                "Tempe", 3.0,
                "Fried tempeh, a popular Indonesian snack, known for its crunchy texture and nutty flavor.",
                "vegetarian",
                "7c9517656139a49bee5ddfb6fa2d5d984c84032d", .indonesian
            ),
            (
                "Tahu", 3.0,
                "Fried tofu, a versatile ingredient that adds protein and texture to any meal.",
                "vegetarian",
                "00188d6b713d7546d2ae4b67bace972458de3ac7", .indonesian
            ),
            (
                "Pecel dan Nasi", 15.0,
                "A traditional dish of mixed vegetables served with rice and a spicy peanut sauce.",
                "vegetarian",
                "0a3edad97a8bd5efd1a8f6787e69322d9fa70aaa", .indonesian
            ),
            (
                "Pecel", 12.0,
                "A salad of mixed vegetables topped with a spicy peanut sauce, a refreshing and healthy option.",
                "non-vegan",
                "7a572a8a5dc930c7cc399dbab2aa7ed5c17189bb", .indonesian
            ),
            (
                "Ayam Goreng dan Nasi", 23.0,
                "Fried chicken served with rice, a classic Indonesian comfort food.",
                "non-vegan",
                "263f4cecd9e489a8fdb005dbad5726763bc370f1", .indonesian
            ),
            (
                "Ayam Goreng", 18.0,
                "Crispy fried chicken, seasoned to perfection, a favorite among many.",
                "non-vegan",
                "8feca46825879d03a4c704263b936c0fd0488f5b", .indonesian
            ),
        ]
    ),

    (
        "Bakso Bakwan Malang Josss",
        "Description for Bakso Bakwan Malang Josss",
        3.0,
        25.0,
        13.7,
        GOPArea.gop9,
        "Bakso Bakwan Malang Josss",
        [
            (
                "Baby Fish Crispy", 15.0,
                "Crispy fried baby fish, seasoned with spices, offering a crunchy and flavorful snack.",
                "non-vegan",
                "f8cbc478795faa79999eea73a27dbdc168c7247d", .indonesian
            ),
            (
                "Bawang Goreng", 15.0,
                "Crispy fried shallots, a popular topping that adds flavor and crunch to various dishes.",
                "vegetarian",
                "3c8e193dc41a3c4a265d56b1b452c06622cb7c5d", .indonesian
            ),
            (
                "Kentang Mustofa", 10.0,
                "Spicy fried potatoes seasoned with a blend of Indonesian spices, offering a delightful crunch.",
                "vegetarian",
                "efdccd19ff61524fae8871adb2cfc80c3a999d86", .indonesian
            ),
            (
                "Kerupuk Ikan Bangka", 4.0,
                "Crispy fish crackers from Bangka, perfect as a snack or side dish.",
                "non-vegan",
                "22667aa6b5cf1204895b25a7eb4ca2488a7fec5a", .indonesian
            ),
            (
                "Asinan Buah", 20.0,
                "A refreshing fruit salad with a tangy dressing, perfect for a light snack.",
                "vegetarian",
                "692bfe3198cf201f013cff48ca82bef1f27f40c1", .indonesian
            ),
            (
                "Asinan Sayur", 20.0,
                "A salad of mixed vegetables in a tangy dressing, providing a refreshing and healthy option.",
                "vegetarian",
                "3bd7bf3e96188e99d4405ee098d0375b6e5ad609", .indonesian
            ),
            (
                "Ikan Woku", 17.0,
                "Fish cooked in a spicy and aromatic sauce, offering a rich and flavorful dish.",
                "non-vegan",
                "313da77cc61dad51e2ac90e02a25cb1188ac45fe", .indonesian
            ),
            (
                "Ikan Bakar Bumbu", 17.0,
                "Grilled fish marinated in spices, providing a smoky and savory flavor.",
                "non-vegan",
                "be11def31418945319cbd210601763b65c4b40df", .indonesian
            ),
            (
                "Ikan Bakar Dabu Dabu", 17.0,
                "Grilled fish served with a spicy salsa, offering a fresh and zesty flavor.",
                "non-vegan",
                "625ac013265f69fa25fa231310566aa9b9f8519b", .indonesian
            ),
            (
                "Sup Tom Yum", 20.0,
                "A spicy and sour soup with seafood, known for its bold flavors and aromatic herbs.",
                "non-vegan",
                "fca0908112268bfd54de3009c39c7fe7b92abd32", .indonesian
            ),
            (
                "Nasi Putih", 5.0,
                "Steamed white rice, a staple in Indonesian cuisine, served as a side to complement various dishes.",
                "vegetarian",
                "f61ccbd3e48b0ac9a8b58f4d5cf2ac190ab6ee9e", .indonesian
            ),
            (
                "Bakso Urat Komplit", 25.0,
                "A complete meatball dish with various ingredients, offering a hearty and satisfying meal.",
                "non-vegan",
                "5ec46db321c9ff1b7806506ad38d54f6d77e49b6", .indonesian
            ),
            (
                "Bakso Rawit Komplit", 25.0,
                "Spicy meatballs served with a variety of toppings, perfect for those who love heat.",
                "non-vegan",
                "6878b891a8899156f8630df8a0eaf744f2192319", .indonesian
            ),
            (
                "Bakso Urat", 22.0,
                "Traditional meatballs made with a mix of beef and spices, offering a rich flavor.",
                "non-vegan",
                "7d3b2a570215f239db6e97152a8d19110bf4317e", .indonesian
            ),
            (
                "Bakso Rawit", 22.0,
                "Spicy meatballs that pack a punch, perfect for those who enjoy a bit of heat.",
                "non-vegan",
                "a399f3374d5cb1faca14205d48ba77db61b4ab4e", .indonesian
            ),
            (
                "Bakso Goreng", 15.0,
                "Fried meatballs, crispy on the outside and tender on the inside, a delicious snack.",
                "non-vegan",
                "56d1f005c29fff844800e9d73812be28c6d11e88", .indonesian
            ),
            (
                "Pangsit Goreng", 15.0,
                "Crispy fried dumplings filled with savory ingredients, perfect as a snack or appetizer.",
                "non-vegan",
                "e3110757a6bb9d37a653e6606a122cd88bdbd3ab", .indonesian
            ),
            (
                "Risol", 15.0,
                "Fried pastry filled with a mix of savory ingredients, offering a crunchy and flavorful bite.",
                "vegetarian",
                "84de1e65f253dbb0b89127e6a88d64207a27d611", .indonesian
            ),
            (
                "Siomay Kecil", 3.0,
                "Small steamed dumplings filled with meat and vegetables, served with a spicy sauce.",
                "non-vegan",
                "88e9d0f8a995474a7bef371284f0ce4ca593ccae", .indonesian
            ),
            (
                "Pilus", 3.0,
                "Fried dough balls, a popular snack that is crispy and light.",
                "vegetarian",
                "6ae06f3e33ed5fe4add34721ec7bd074614c4a8f", .indonesian
            ),
            (
                "Tahu Coklat", 3.0,
                "Fried tofu with a crispy exterior, perfect for dipping in sauces.",
                "vegetarian",
                "e6f6ee4b56be3bcb431e46df8b36ff0a9b6c639b", .indonesian
            ),
            (
                "Tahu Putih", 3.0,
                "Plain fried tofu, a versatile ingredient that adds protein and texture to any meal.",
                "vegetarian",
                "104bd4a495b99c410395cc817c47779bd7d16ef2", .indonesian
            ),
            (
                "Pangsit Rebus", 3.0,
                "Boiled dumplings filled with savory ingredients, offering a soft and tender texture.",
                "non-vegan",
                "09f1d31e4f6c0e3c4114bd2a2390aa4e61246ad5", .indonesian
            ),
            (
                "Bakwan Malang Komplit", 15.0,
                "A complete dish of Malang-style meatballs served with various toppings and sauces.",
                "non-vegan",
                "cc6ac05e37a3a00abeb5ea484092bc0e88152eaa", .indonesian
            ),
        ]
    ),

    (
        "Kantin Kasturi",
        "Description for Kantin Kasturi",
        1.0,
        14.0,
        5.3,
        GOPArea.gop9,
        "Kantin Kasturi",
        [
            (
                "Martabak Telur isi 2", 5.0,
                "Savory stuffed pancakes filled with eggs and spices, served hot.",
                "non-vegan", "", .indonesian
            ),
            (
                "Bakwan Jagung isi 2", 5.0,
                "Corn fritters made with fresh corn and spices, crispy on the outside and soft inside.",
                "vegetarian", "", .indonesian
            ),
            (
                "Bakwan Sayur isi 2", 5.0,
                "Vegetable fritters made with a mix of fresh vegetables, offering a crunchy and tasty snack.",
                "vegetarian", "", .indonesian
            ),
            (
                "Pisang Coklat isi 2", 5.0,
                "Fried bananas coated in chocolate, a sweet and indulgent treat.",
                "vegetarian",
                "b6a6dd89d59331faf2cb202963a339173adcc0de", .indonesian
            ),
            (
                "Sambal Merah", 1.0,
                "A spicy red chili sauce, perfect for adding heat to your dishes.",
                "vegetarian", "",
                .indonesian
            ),
            (
                "Tahu tempe Kerupuk Kulit Setengah Porsi", 3.0,
                "A half portion of fried tofu, tempeh, and crispy skin, offering a delightful mix of textures.",
                "vegetarian",
                "87637f5681ef845780ca2d61f602b13c376c5697", .indonesian
            ),
            (
                "Nasi Merah Setengah Porsi", 3.0,
                "Half portion of red rice, known for its nutty flavor and health benefits.",
                "non-vegan", "1ff871372451cca70079811922c11a9c5607f131",
                .indonesian
            ),
            (
                "Nasi Putih Setengah Porsi", 3.0,
                "Half portion of steamed white rice, a staple in Indonesian cuisine.",
                "vegetarian", "54f2c475c01d6f6382adbc05ad12bda498b39daa",
                .indonesian
            ),
            (
                "Nasi Merah", 5.0,
                "Steamed red rice, a healthier alternative to white rice, with a nutty flavor.",
                "vegetarian",
                "99c5575f6af513dbcaa1377582454c8e12c78aa0", .indonesian
            ),
            (
                "Nasi Putih", 5.0,
                "Steamed white rice, a staple in Indonesian cuisine, served as a side to complement various dishes.",
                "vegetarian",
                "84d4f2168f807a7a60f22facd2706f7002cc9e81", .indonesian
            ),
            (
                "Kerupuk Kampung", 5.0,
                "Traditional village crackers, crispy and light, perfect for snacking.",
                "vegetarian",
                "62368cb3c13475ff763f151e04b4ebde027f9ca5", .indonesian
            ),
            (
                "Kerupuk Bangka Isi 2", 2.0,
                "Crispy crackers from Bangka, served in a portion of two, ideal for sharing.",
                "non-vegan",
                "9d8754893c4fdb6fb909bc72c3ec9797689e90a8", .indonesian
            ),
            (
                "Pisang Coklat", 3.0,
                "Fried bananas coated in chocolate, a sweet and indulgent treat.",
                "vegetarian",
                "0a60f6788a947bc99bcd64cb71c83d194cc11b56", .indonesian
            ),
            (
                "Donat Coklat", 8.0,
                "Chocolate donuts, soft and sweet, perfect for dessert or a snack.",
                "non-vegan",
                "026c95ae2436dc3321f3f18790971dc1c1ab5389", .indonesian
            ),
            (
                "Sayur Tauge Setengah Porsi", 3.0,
                "Half portion of bean sprouts, a crunchy and nutritious addition to any meal.",
                "vegetarian",
                "fb0db256ead31e6bb82b30c2b75798ff0a91d78f", .indonesian
            ),
            (
                "Sayur Tauge", 5.0,
                "Stir-fried bean sprouts, a crunchy and nutritious addition to any meal.",
                "vegetarian",
                "96a32d0ce8ac9514ab6a48388d186e0ceb170f7c", .indonesian
            ),
            (
                "Cumi Pedas Tomat Hijau Manadonese", 5.0,
                "Spicy squid cooked in a green tomato sauce, offering a unique and flavorful dish.",
                "non-vegan",
                "25b188594ab25f9afb519801b55024d1c75ea890", .indonesian
            ),
            (
                "Sayur Sop Setengah Porsi", 3.0,
                "Half portion of vegetable soup, light and healthy, perfect for a starter.",
                "vegetarian",
                "1870c3d26a1c5a9e61f05d3e584a19d7c350035c", .indonesian
            ),
            (
                "Sayur Pakcoy Setengah Porsi", 3.0,
                "Half portion of stir-fried pakcoy, a nutritious green vegetable, seasoned with garlic.",
                "vegetarian",
                "263384e5216f2879cbffb0ba82c156b19cc7a373", .indonesian
            ),
            (
                "Sayur Pakcoy", 5.0,
                "Stir-fried pakcoy, a nutritious green vegetable, seasoned with garlic.",
                "vegetarian",
                "02fa96c59c1d0d7923d1c0e6816e5afdfab650c5", .indonesian
            ),
            (
                "Sayur Daun Singkong Setengah Porsi", 3.0,
                "Half portion of cassava leaves, a nutritious green vegetable, often cooked with spices.",
                "vegetarian",
                "669659495dc0e1e73893190dec2b37b3f68c26f5", .indonesian
            ),
            (
                "Sayur Daun Singkong", 5.0,
                "Cassava leaves cooked with spices, a nutritious green vegetable.",
                "vegetarian",
                "f5fb2f32c8f254d563c7e7d206ce7f43ae4dbe30", .indonesian
            ),
            (
                "Sayur Caysin Setengah Porsi", 3.0,
                "Half portion of caysin, a nutritious green vegetable, often cooked with spices.",
                "vegetarian",
                "f6f78061b8497fb17497dfa102f7c301f97d1e7a", .indonesian
            ),
            (
                "Sayur Caysin", 5.0,
                "Caysin cooked with spices, a nutritious green vegetable.",
                "vegetarian",
                "086af7b8717fb6fbb4d84a880039bc7765fc747e", .indonesian
            ),
            (
                "Telur Dadar Garing", 5.0,
                "Crispy omelet, fluffy and flavorful, perfect for breakfast or as a side dish.",
                "vegetarian",
                "5fdfcf91bcb07a0fee891a9d9234b03b3e2d8d87", .indonesian
            ),
            (
                "Telur Bulat Rica", 5.0,
                "Spicy round omelet, offering a flavorful twist to a classic dish.",
                "vegetarian",
                "6fcd9bcce6f1ea46085d96731062966b3bf44fee", .indonesian
            ),
            (
                "Tahu Tempe Kerupuk Kulit", 5.0,
                "A combination of fried tofu, tempeh, and crispy skin, offering a delightful mix of textures.",
                "vegetarian",
                "f18293175407d5ff88a9bda82ccda3505ec336b3", .indonesian
            ),
            (
                "Sosis Telor Rica", 5.0,
                "Spicy sausage and egg dish, offering a flavorful and hearty option.",
                "non-vegan",
                "5d4903b166561e947ff8b869fd383831b7b45a1d", .indonesian
            ),
            (
                "Ikan Tuna Woku", 5.0,
                "Tuna cooked in a spicy and aromatic sauce, offering a rich and flavorful dish.",
                "non-vegan",
                "73ebf60c0128f053c78143bfd37e2f3a8d6d09c7", .indonesian
            ),
            (
                "Ikan Makarel Sarden Rica", 10.0,
                "Mackerel cooked in a spicy sauce, providing a delicious seafood option.",
                "non-vegan",
                "f3ae7b3e5693e3f4b9c3700cb1a35185202c9a07", .indonesian
            ),
            (
                "Ikan Dori Asam Manis", 5.0,
                "Sweet and sour dory fish, offering a delightful balance of flavors.",
                "non-vegan",
                "fec781969805743941c1a7eadcb27ae6a8dce576", .indonesian
            ),
            (
                "Ikan Cakalang Rabe", 5.0,
                "Cakalang fish cooked in spices, providing a rich and savory flavor.",
                "non-vegan",
                "f003724b9acbf7c98d1b74804ea15bdc8679a4bf", .indonesian
            ),
            (
                "Fried Noodles Chn Manadonese", 5.0,
                "Fried noodles with a Manadonese twist, offering a savory and satisfying dish.",
                "non-vegan",
                "ac4341f52aa94185af2691628184478a0d51d511", .indonesian
            ),
            (
                "Bistik Ayam", 5.0,
                "Chicken steak served with a savory sauce, offering a hearty and delicious meal.",
                "non-vegan",
                "ca337b8bb218ae7dd1810e3f69193c9850e49d45", .indonesian
            ),
            (
                "Orek Tempe Rica Setengah Porsi", 3.0,
                "Half portion of spicy tempeh stir-fry, offering a flavorful and nutritious option.",
                "non-vegan",
                "0b7bdbe86d372f4c68b4ebf10d83bc8818fc1c29", .indonesian
            ),
            (
                "Orek Tempe Rica", 5.0,
                "Spicy tempeh stir-fry, offering a flavorful and nutritious option.",
                "vegetarian",
                "ab8c35c014a2ed5dfe1246275eb807aa392c6615", .indonesian
            ),
            (
                "Daging Sapi Garo Manado", 14.0,
                "Beef cooked in a Manadonese style, rich in spices and flavor.",
                "non-vegan",
                "f62f36c680bbf6c83dd31d6f84b53ef9c5b84f6b", .indonesian
            ),
            (
                "Terong Balado Setengah Porsi", 3.0,
                "Half portion of spicy eggplant, offering a flavorful and nutritious option.",
                "vegetarian",
                "cb9ce9fbf0471970de9d0ab2536d2c999f15f429", .indonesian
            ),
            (
                "Terong Balado ", 5.0,
                "Spicy eggplant dish, offering a rich and flavorful experience.",
                "vegetarian",
                "c7718a4f04c5f7888d38841a86a38f6b6beadbf8", .indonesian
            ),
            (
                "Teri Kacang Setengah Porsi", 3.0,
                "Half portion of anchovies with peanuts, a savory and crunchy snack.",
                "non-vegan",
                "e84bcd0b9a46c1118592ca4ef16cd1e6462732fc", .indonesian
            ),
            (
                "Teri Kacang", 5.0,
                "Anchovies with peanuts, a savory and crunchy snack.",
                "vegetarian",
                "b67e7d76ca153b89d7d8f3779c9fbd77f1cb50ed", .indonesian
            ),
            (
                "Orek Tempe Kering Setengah Porsi", 3.0,
                "Half portion of crispy fried tempeh, offering a crunchy and flavorful snack.",
                "vegetarian",
                "854272019ad5dbfce4bb44e3029f8dd0fdb21c04", .indonesian
            ),
            (
                "Orek Tempe Kering", 5.0,
                "Crispy fried tempeh, offering a crunchy and flavorful snack.",
                "vegetarian",
                "910c384e9c14c7976f06db729755f7acbf17a6c9", .indonesian
            ),
            (
                "Telur Kecap Atau Semur", 5.0,
                "Eggs cooked in sweet soy sauce or braised, offering a comforting dish.",
                "non-vegan",
                "53df01b9cf935b340195a325edbf922600c06af0", .indonesian
            ),
            (
                "Telur Ceplok Rica", 5.0,
                "Spicy fried eggs, offering a flavorful twist to a classic dish.",
                "vegetarian",
                "04f90c4834302732e4e033b5627877e039033940", .indonesian
            ),
            (
                "Tahu Kecap Atau Tahu Semur", 3.0,
                "Tofu cooked in sweet soy sauce or braised, offering a comforting dish.",
                "vegetarian",
                "ff8d11ef10c0720d4b2f5e119ac107edcc12fdf7", .indonesian
            ),
            (
                "Otak-Otak Singapore Rica", 5.0,
                "Spicy fish cake from Singapore, offering a unique and flavorful snack.",
                "non-vegan",
                "9f5e820071c62b939d72a349274b828242751e1e", .indonesian
            ),
            (
                "Martabak Telur", 3.0,
                "Savory stuffed pancakes filled with eggs and spices, served hot.",
                "non-vegan",
                "c2359f4673d7276748b886daab6f466f4e724979", .indonesian
            ),
            (
                "Kentang Mustafa Setengah Porsi", 3.0,
                "Half portion of spicy fried potatoes, offering a delightful crunch.",
                "vegetarian",
                "248067495d637f76a8c19a807c8f2ab8cbee4370", .indonesian
            ),
            (
                "Kentang Mustafa", 5.0,
                "Spicy fried potatoes seasoned with a blend of Indonesian spices, offering a delightful crunch.",
                "vegetarian",
                "8fa2ff4cfb1e82e08927b328d8cb8b82ebfe21fb", .indonesian
            ),
            (
                "Ikan Tenggiri Rica", 14.0,
                "Mackerel cooked in a spicy sauce, providing a delicious seafood option.",
                "non-vegan",
                "11a9d7666ed4bcd4caf7247401d80144aec23807", .indonesian
            ),
            (
                "Bakwan Sayur", 3.0,
                "Vegetable fritters made with a mix of fresh vegetables, offering a crunchy and tasty snack.",
                "vegetarian",
                "22b18e8b17051957af7669e9be45760dee881b4d", .indonesian
            ),
            (
                "Ayam Bakar Manadonese", 14.0,
                "Grilled chicken with Manadonese spices, offering a rich and flavorful dish.",
                "non-vegan",
                "e6ca2a84c39f457cb18a561caf714e9270bfa1dc", .indonesian
            ),
            (
                "Ayam Woku", 5.0,
                "Chicken cooked in a spicy and aromatic sauce, offering a rich and flavorful dish.",
                "non-vegan",
                "81998e4ab0ae5a84d0fba7fd932a46f9f4eaf2c3", .indonesian
            ),
            (
                "Ayam Kecap Teriyaki", 5.0,
                "Chicken cooked in a sweet teriyaki sauce, offering a delightful flavor.",
                "non-vegan",
                "dc9eda7e56c8a9536bb4bdaf27123b70450e175f", .indonesian
            ),
            (
                "Ayam Goreng Rica", 14.0,
                "Spicy fried chicken, offering a flavorful and satisfying meal.",
                "non-vegan",
                "b9e846b2196e77269b01ebda825b30ecc4932ac1", .indonesian
            ),
            (
                "Ayam Goreng Mentega", 10.0,
                "Butter-fried chicken, offering a rich and savory flavor.",
                "non-vegan",
                "888b44d199f7a8161bb4ec27a1e67f92aa7945b0", .indonesian
            ),
            (
                "Ayam Asam Manis", 5.0,
                "Sweet and sour chicken, offering a delightful balance of flavors.",
                "non-vegan",
                "a66193ca1a2d22240c4b471303656a2b0c3b1a47", .indonesian
            ),
            (
                "Bihun Goreng 1 porsi", 5.0,
                "Fried rice vermicelli with vegetables and spices, a popular noodle dish in Indonesia.",
                "vegetarian",
                "b4a3913e464acb4f9dde8033d6a6af7fb9de4fac", .indonesian
            ),
            (
                "Sayur Sop", 5.0,
                "Vegetable soup, light and healthy, perfect for a starter.",
                "vegetarian",
                "515b62039d904e2fb0f99ed4733dc50f53302118", .indonesian
            ),
            (
                "Sayur Buncis ½", 3.0,
                "Half portion of green beans, a crunchy and nutritious addition to any meal.",
                "vegetarian",
                "176517abf8e367aec49c1f61cff008a501745db1", .indonesian
            ),
            (
                "Sayur Buncis", 5.0,
                "Stir-fried green beans, a crunchy and nutritious addition to any meal.",
                "vegetarian",
                "e50a2f27262d976b8dd28a144c88530724a0edd9", .indonesian
            ),
            (
                "Sayur Cap Cay ½", 3.0,
                "Half portion of mixed vegetables stir-fried, offering a colorful and nutritious dish.",
                "vegetarian",
                "f6151ad279c1b421bcb2756f6922a76f5376a810", .indonesian
            ),
            (
                "Sayur Cap Cay", 5.0,
                "Mixed vegetables stir-fried, offering a colorful and nutritious dish.",
                "vegetarian",
                "2f317ce8f99ec44b758eec18cae29d3d3729b605", .indonesian
            ),
            (
                "Sayur Labu ½", 3.0,
                "Half portion of pumpkin, a nutritious and sweet vegetable.",
                "vegetarian",
                "e38b53d9781dc614c7a794a2db365240bc358104", .indonesian
            ),
            (
                "Sayur Labu", 5.0,
                "Pumpkin cooked with spices, a nutritious and sweet vegetable.",
                "vegetarian",
                "5db1dc357750961566fe19c2f3e0898860a9115c", .indonesian
            ),
            (
                "Ikan Pesmol Acar Timun", 14.0,
                "Fish cooked in a tangy cucumber pickle sauce, offering a refreshing flavor.",
                "non-vegan",
                "534113f521812f629328e5fd9253b8372c89414b", .indonesian
            ),
            (
                "Ikan Nila Bakar", 14.0,
                "Grilled tilapia fish, seasoned with spices, offering a rich and savory flavor.",
                "non-vegan",
                "2514cebb0212c7e571c84fe711e96eddeee46b22", .indonesian
            ),
        ]
    ),

    (
        "Mie Ayam Kriuk",
        "Description for Mie Ayam Kriuk",
        0.0,
        38.0,
        16.7,
        GOPArea.gop9,
        "Mie Ayam Kriuk",
        [
            (
                "Pangsit 8pcs", 15.0,
                "A serving of eight crispy dumplings, perfect for sharing or as a snack.",
                "non-vegan", "", .indonesian
            ),
            (
                "Bakso 8pcs", 15.0,
                "A serving of eight meatballs, offering a hearty and satisfying option.",
                "non-vegan", "", .indonesian
            ),
            (
                "Pangsit 3pcs", 5.0,
                "A serving of three crispy dumplings, perfect for a quick snack.",
                "non-vegan", "", .indonesian
            ),
            (
                "Bakso 3pcs", 5.0,
                "A serving of three meatballs, offering a hearty and satisfying option.",
                "non-vegan", "", .indonesian
            ),
            (
                "Pangsit 10pcs", 20.0,
                "A generous serving of ten crispy dumplings, perfect for sharing.",
                "non-vegan", "", .indonesian
            ),
            (
                "Bakso 10pcs", 20.0,
                "A generous serving of ten meatballs, perfect for a filling meal.",
                "non-vegan", "", .indonesian
            ),
            (
                "Pangsit 5pcs", 10.0,
                "A serving of five crispy dumplings, ideal for a quick snack.",
                "non-vegan", "", .indonesian
            ),
            (
                "Bakso 5pcs", 10.0,
                "A serving of five meatballs, offering a hearty and satisfying option.",
                "non-vegan", "", .indonesian
            ),
            (
                "Kwetiau", 0.0,
                "Flat rice noodles, often stir-fried with vegetables and meat, offering a chewy texture.",
                "non-vegan", "", .indonesian
            ),
            (
                "Bihun", 0.0,
                "Thin rice vermicelli, often used in soups or stir-fries, providing a light and delicate option.",
                "vegetarian", "", .indonesian
            ),
            (
                "Mie Lebar", 0.0,
                "Wide noodles, perfect for stir-frying or soups, offering a hearty texture.",
                "vegetarian", "", .indonesian
            ),
            (
                "Mie Keriting", 0.0,
                "Curly noodles, often used in soups or stir-fries, providing a unique texture.",
                "vegetarian", "", .indonesian
            ),
            (
                "Mie Ayam Dino Pangsit", 38.0,
                "A hearty bowl of chicken noodles topped with crispy dumplings, offering a satisfying meal.",
                "non-vegan", "dcdd670fdfbea3495a66ef4c396428013a8ed117",
                .indonesian
            ),
            (
                "Mie Ayam Dino Bakso", 38.0,
                "A delicious bowl of chicken noodles topped with meatballs, providing a hearty option.",
                "non-vegan", "c589bddcc06bce912f3ea269bec7ac9033020f04",
                .indonesian
            ),
            (
                "Mie Ayam Dino", 33.0,
                "A flavorful bowl of chicken noodles, seasoned with spices and served hot.",
                "non-vegan", "12074fed8b4f60ef56d0a842d7240762a4f239a2",
                .indonesian
            ),
            (
                "Mie Ayam Yamin", 23.0,
                "Sweet soy sauce chicken noodles, offering a delightful balance of flavors.",
                "non-vegan", "30f2ee34e14ca7e2c1da2d8498f119f21cfa8c11",
                .indonesian
            ),
            (
                "Mie Ayam Rica", 23.0,
                "Spicy chicken noodles, offering a flavorful and satisfying meal.",
                "non-vegan", "203dfa225e2c755dd166f6da2d078ea9a0b72471",
                .indonesian
            ),
            (
                "Mie Ayam Bakso", 28.0,
                "Chicken noodles topped with meatballs, providing a hearty and delicious option.",
                "non-vegan", "e9a57248f29171c221ad288e5821e987b54dc6a0",
                .indonesian
            ),
            (
                "Mie Ayam Pangsit", 28.0,
                "Chicken noodles served with crispy dumplings, offering a satisfying meal.",
                "non-vegan", "27962ab766c5bfcf577149ee3397838544436ca6",
                .indonesian
            ),
            (
                "Mie Ayam", 23.0,
                "A classic bowl of chicken noodles, seasoned with spices and served hot.",
                "non-vegan", "6dae5cb8ead0a6d17ae5145d3eaeeee404313284",
                .indonesian
            ),
        ]
    ),

    (
        "Mustafa Minang",
        "Description for Mustafa Minang",
        2.0,
        30.0,
        15.4,
        GOPArea.gop9,
        "Mustafa Minang",
        [
            (
                "Nasi putih", 5.0,
                "Steamed white rice, a staple in Indonesian cuisine, served as a side to complement various dishes.",
                "vegetarian", "7155feccff7188b855939b2712d5a2979d1f4333.png",
                .indonesian
            ),
            (
                "Teh Tawar ", 2.0,
                "Plain tea, served hot or cold, a refreshing beverage option.",
                "vegetarian", "fc0515bdbec33195c3225a401432f325855d0009.jpeg",
                .indonesian
            ),
            (
                "Terong Balado", 5.0,
                "Spicy eggplant dish, offering a rich and flavorful experience.",
                "vegetarian", "b0cf4d88c0493cc74b0b03e330850b4b7683709a.jpeg",
                .indonesian
            ),
            (
                "Gulai Cincang", 18.0,
                "A rich and flavorful beef curry, slow-cooked with spices and coconut milk.",
                "non-vegan", "d95d892a2214f26adefd7d1f76add41c07b67118",
                .indonesian
            ),
            (
                "Gulai Tunjang (kikil)", 20.0,
                "Beef tendon cooked in a savory curry sauce, offering a unique texture and flavor.",
                "non-vegan", "6b3b731aead49e83253b30a19e64247c51ab8410",
                .indonesian
            ),
            (
                "Telur Balado", 5.0,
                "Spicy eggs cooked in a rich sauce, providing a flavorful and satisfying dish.",
                "vegetarian", "a00a5bad95aba01b09a9223be236f82224565346",
                .indonesian
            ),
            (
                "Telur Dadar Padang", 5.0,
                "Omelet cooked in Padang style, fluffy and flavorful, perfect for breakfast or as a side dish.",
                "vegetarian", "a997d920ef8bf91fe6ae680e47644087f4312910.png",
                .indonesian
            ),
            (
                "Telur Gulai", 5.0,
                "Eggs cooked in a rich curry sauce, offering a comforting and flavorful dish.",
                "vegetarian", "03b07b128e11769ec6ef5f0d41ed5504c8306cee.jpeg",
                .indonesian
            ),
            (
                "Rendang Minang", 18.0,
                "Slow-cooked beef in a spicy coconut sauce, known for its rich flavor and tenderness.",
                "non-vegan", "116185b85b9f9e4e5a3bca73d7ae339528ec851e.jpeg",
                .indonesian
            ),
            (
                "Ayam Gulai", 15.0,
                "Chicken cooked in a rich and spicy coconut sauce, offering a comforting dish.",
                "non-vegan", "5ca814a3c2071692a6d2bb83c353dcfe6da887df",
                .indonesian
            ),
            (
                "Ayam Bakar Padang", 15.0,
                "Grilled chicken marinated in Padang spices, offering a rich and flavorful dish.",
                "non-vegan", "8a8ea3b0c829d9afb5987c1063dcfe5647336973",
                .indonesian
            ),
            (
                "Ayam Goreng Padang", 15.0,
                "Fried chicken seasoned with Padang spices, offering a crispy and flavorful option.",
                "non-vegan", "8c80f20975accfbee0d6ee36de52d248a0e3802c",
                .indonesian
            ),
            (
                "Nasi Perkedel Jumbo", 15.0,
                "Jumbo portion of rice served with fried potato cakes, offering a hearty meal.",
                "non-vegan", "f67f410fb8d2d865401166d5949fbbbf8c5cd070.jpeg",
                .indonesian
            ),
            (
                "Nasi Telur Balado", 15.0,
                "Rice served with spicy eggs, providing a flavorful and satisfying dish.",
                "non-vegan", "ed238a01d8e240d9a75e5045d5604da994455eb2.jpeg",
                .indonesian
            ),
            (
                "Nasi Telur Dadar", 15.0,
                "Rice served with an omelet, a simple yet satisfying meal.",
                "vegetarian", "8442034e868fe815079487360746e0449e986516.jpeg",
                .indonesian
            ),
            (
                "Air Putih Dingin", 2.0,
                "Chilled water, a refreshing beverage option.", "vegetarian",
                "198e17e354ab31f2a299e79687a2595eb97c2edd", .indonesian
            ),
            (
                "Es Teh Tawar", 3.0,
                "Iced plain tea, a refreshing beverage option.", "vegetarian",
                "49222c4a64f274d443032c0201adc31351298c07", .indonesian
            ),
            (
                "Es Teh Manis", 5.0,
                "Iced sweet tea, a refreshing and sweet beverage option.",
                "vegetarian", "fa4ee3d01e59cfbc126d1b11d64f5207147602de",
                .indonesian
            ),
            (
                "Nasi Tongkol Balado", 20.0,
                "Rice served with spicy mackerel, providing a flavorful and satisfying dish.",
                "non-vegan", "4608fb5c90214c00a6cb1400d52c00980d8ce3b1",
                .indonesian
            ),
            (
                "Nasi Gulai Otak", 25.0,
                "Rice served with brain curry, offering a unique and rich flavor.",
                "non-vegan", "d1e1cc7b7d3bec4260bb8c78e61922e08ab3537d",
                .indonesian
            ),
            (
                "Nasi Sambal Goreng Ati", 23.0,
                "Rice served with spicy liver, providing a flavorful and satisfying dish.",
                "non-vegan", "31760253981a5dbd20f90dc283df73b38b0cfb45",
                .indonesian
            ),
            (
                "Nasi Dendeng Basah Lombok", 25.0,
                "Rice served with wet beef jerky, offering a rich and savory flavor.",
                "non-vegan", "5bf49eab2508522b2cd71ca009c30c26426acb08",
                .indonesian
            ),
            (
                "Nasi Ayam Goreng", 20.0,
                "Rice served with fried chicken, a classic and satisfying meal.",
                "non-vegan", "eec3eb0327329f5848b53dcae74685e3461257ee",
                .indonesian
            ),
            (
                "Nasi Ayam Balado Merah", 20.0,
                "Rice served with spicy red chicken, providing a flavorful and satisfying dish.",
                "non-vegan", "79a44824db93b0f28b9b7e5cfa57287ee19409f8",
                .indonesian
            ),
            (
                "Nasi Ayam Opor Pariaman", 20.0,
                "Rice served with chicken in a creamy coconut sauce, offering a comforting dish.",
                "non-vegan", "7a4fcec892f4267048e51251129ab483c5a2756a",
                .indonesian
            ),
            (
                "Nasi Ayam Bakar", 20.0,
                "Rice served with grilled chicken, seasoned with spices for a rich flavor.",
                "non-vegan", "8f8f34da22823d9c2e7ce6226ee46e687a8f722c",
                .indonesian
            ),
            (
                "Nasi Paru Goreng", 25.0,
                "Rice served with fried beef lungs, offering a unique and flavorful dish.",
                "non-vegan", "55b8af7dd02054f3f8999395dd58bfacf9e468b7",
                .indonesian
            ),
            (
                "Nasi Cincang", 25.0,
                "Rice served with chopped beef, providing a hearty and satisfying meal.",
                "non-vegan", "ef6a0be2b884a71cb6dd5b17f73078d496cc10a3",
                .indonesian
            ),
            (
                "Nasi Tunjang Kikil", 30.0,
                "Rice served with beef tendon, offering a unique texture and rich flavor.",
                "non-vegan", "ecc91c1956ddd61b92d364de0d8b938ddda17874",
                .indonesian
            ),
            (
                "Nasi Rendang Minang", 25.0,
                "Rice served with Minang-style beef rendang, known for its rich flavor and tenderness.",
                "non-vegan", "33803fba47166b45cc59a3026c4d21a5730d9488",
                .indonesian
            ),
        ]
    ),

    (
        "Kedai Laris Manis",
        "Description for Kedai Laris Manis",
        6.0,
        20.0,
        11.7,
        GOPArea.gop9,
        "Kedai Laris Manis",
        [
            (
                "Croissant Cakalang", 8.0,
                "A flaky croissant filled with savory tuna, offering a delightful snack.",
                "non-vegan", "f10391b6ed4c86b7a4b0d4429f4c761f661e83ab",
                .indonesian
            ),
            (
                "Croissant Ayam", 8.0,
                "A flaky croissant filled with seasoned chicken, perfect for a quick meal.",
                "non-vegan", "69f1b6364937307577fda1098431b164708e3846",
                .indonesian
            ),
            (
                "Croissant Keju", 8.0,
                "A flaky croissant filled with cheese, offering a rich and savory flavor.",
                "vegetarian", "285b34a2ca15769c87bba42c3ca90bcc1e1c2bad",
                .indonesian
            ),
            (
                "Zuppa Soup", 12.0,
                "A creamy soup served in a bread bowl, perfect for a comforting meal.",
                "vegetarian", "7c46fd4aea66c3e2f3fe0beb1bf44d28f5cd0299.jpeg",
                .indonesian
            ),
            (
                "Croissant Coklat", 8.0,
                "A flaky croissant filled with rich chocolate, a sweet treat for dessert.",
                "non-vegan", "cf034b01accc7495deb909ac8c8c79f37736606d",
                .indonesian
            ),
            (
                "Rice Bowl", 15.0,
                "A bowl of rice topped with various ingredients, offering a hearty and satisfying meal.",
                "vegetarian", "", .indonesian
            ),
            (
                "Onde Onde Isi 7", 20.0,
                "Sweet glutinous rice balls filled with sesame, served in a portion of seven.",
                "vegetarian", "", .indonesian
            ),
            (
                "Bakso Goreng Isi 3", 20.0,
                "Fried meatballs filled with savory ingredients, served in a portion of three.",
                "non-vegan", "", .indonesian
            ),
            (
                "Kue Sus", 6.0,
                "Cream puffs filled with sweet cream, offering a delightful dessert option.",
                "vegetarian", "e6cb183975765dc96277928ec590465868a1a9ba",
                .indonesian
            ),
            (
                "Kue Lupis", 10.0,
                "Sweet rice cake filled with coconut, offering a chewy and sweet treat.",
                "vegetarian", "1f75baea49453da29923adc435dcaa357e547a68",
                .indonesian
            ),
            (
                "Onde Onde Isi 3", 10.0,
                "Sweet glutinous rice balls filled with sesame, served in a portion of three.",
                "vegetarian", "", .indonesian
            ),
            (
                "Croissant atau Pastry", 8.0,
                "A flaky pastry filled with various ingredients, perfect for a quick snack.",
                "non-vegan", "9643997efc6855fc263ffeead4e85bdb6a5d9b6b",
                .indonesian
            ),
            (
                "Bakso Goreng", 7.5,
                "Fried meatballs, crispy on the outside and tender on the inside, a delicious snack.",
                "non-vegan", "5aa3fc7687141c4c5c71481aa9f74538af152786",
                .indonesian
            ),
            (
                "Nasi Hainam Tim Ayam Jamur", 20.0,
                "Hainanese rice served with chicken and mushrooms, offering a flavorful meal.",
                "non-vegan", "99bd30916bfec4ed1677ae74b8dae7e959f24e62",
                .indonesian
            ),
            (
                "Croissant atau Pastry (isi 2)", 15.0,
                "A serving of two flaky pastries filled with various ingredients, perfect for sharing.",
                "non-vegan", "aca28ce6cd3c372b2562542b3119e3745895ab39",
                .indonesian
            ),
        ]
    ),

    (
        "Ahza Snack and Beverage",
        "Description for Ahza Snack and Beverage",
        2.0,
        15.0,
        7.5,
        GOPArea.gop9,
        "Ahza Snack and Beverage",
        [
            (
                "Es", 2.0, "Ice, a refreshing addition to any beverage.",
                "non-vegan", "", .indonesian
            ),
            (
                "Salad 200ml", 10.0,
                "A fresh salad served in a 200ml portion, perfect for a light meal.",
                "vegetarian", "34b2fbf2dcd12c581c6a5b32a8127687502a2bfd",
                .indonesian
            ),
            (
                "Aneka Bubur", 6.0,
                "A variety of porridge options, offering a warm and comforting dish.",
                "vegetarian", "44c6e28eab50e334c2f0b735a3a011e755f95a20",
                .indonesian
            ),
            (
                "Brownis lumer ", 10.0,
                "Melted brownies, rich and chocolatey, perfect for dessert.",
                "non-vegan", "5b0a23606b9830d23cda280f4d00514dc480c483",
                .indonesian
            ),
            (
                "Indomie Double Telor", 15.0,
                "Instant noodles served with two eggs, a quick and satisfying meal.",
                "non-vegan", "cd3548c1a9a709301258d5d023687b9a0cf54d9c",
                .indonesian
            ),
            (
                "Indomie Double", 10.0,
                "Instant noodles served with double the flavor, a quick and satisfying meal.",
                "non-vegan", "5cd95c5cc64fa9ffc1c3c5d3106e9b258146f38a",
                .indonesian
            ),
            (
                "Indomie Telor", 10.0,
                "Instant noodles served with an egg, a quick and satisfying meal.",
                "non-vegan", "66135acf70e99ba045010babb16c86d4bc9a290f",
                .indonesian
            ),
            (
                "Indomie", 7.0,
                "Classic instant noodles, a quick and easy meal option.",
                "non-vegan", "617d7356364bbb9d6a0258f1ac42ade5b2d08f34",
                .indonesian
            ),
            (
                "Pop Mie Seduh", 7.0,
                "Instant noodles served in a cup, perfect for a quick snack.",
                "vegetarian", "cb0bbcc98ee8f95b6624e2f24ed1c43b13f62dcb",
                .indonesian
            ),
            (
                "Pocari", 7.0,
                "A refreshing Pocari drink, perfect for hydration.",
                "vegetarian", "3b6455995d1f7a296988735733684cb0fb2aa220",
                .indonesian
            ),
            (
                "Nutriboost", 7.0,
                "A nutritious drink, providing a boost of energy.", "non-vegan",
                "9cf2db38a06bdabe6fbdcaf6865c4871232a66a8", .indonesian
            ),
            (
                "Pulpy Orange 300ml", 5.0,
                "A refreshing orange drink, perfect for a quick refreshment.",
                "vegetarian", "2d0d95c374c45e66b1889165f0b743a3d012a684",
                .indonesian
            ),
            (
                "Frestea 350ml", 5.0,
                "A refreshing iced tea, perfect for a hot day.", "non-vegan",
                "f59ac8b7a64477c4fc4ee983aa3fa3f0ac9037bf", .indonesian
            ),
            (
                "Sprite Fanta Cola 390ml", 6.0,
                "A mix of popular soft drinks, perfect for a refreshing beverage.",
                "vegetarian", "4a135aca21115fae5804298471f04588ed0c4eb8",
                .indonesian
            ),
            (
                "Sprite Fanta Cola 250ml", 4.0,
                "A smaller portion of popular soft drinks, perfect for a quick refreshment.",
                "vegetarian", "796eccb1e1bbdee14711374baf83632bd6e1e101",
                .indonesian
            ),
            (
                "Ades 1,5 L", 6.0,
                "A large bottle of Ades water, perfect for sharing or hydration.",
                "vegetarian", "d7b87ba4574c7be3bbc9ba2716d9c10eca3740d3",
                .indonesian
            ),
            (
                "Ades Pristine", 4.0,
                "Bottled water, a refreshing option for hydration.",
                "non-vegan", "ce3efe2bbfe21b7928fc25b8fe6364e7de0f58dd",
                .indonesian
            ),
            (
                "Teh Manis Panas", 4.0,
                "Hot sweet tea, a comforting beverage option.", "vegetarian",
                "c690e1b0ae2c8c3cc7e5949632a82f5054e742de", .indonesian
            ),
            (
                "Teh Tawar Panas", 3.0,
                "Hot plain tea, a refreshing beverage option.", "vegetarian",
                "50de9c9b8e01f89d741f7e43b707a0a8f1dcf257", .indonesian
            ),
            (
                "Es Teh Tawar", 3.0,
                "Iced plain tea, a refreshing beverage option.", "vegetarian",
                "315a63457e00ca71383e0e63f7aac42317827a67", .indonesian
            ),
            (
                "Es Teh Manis", 5.0,
                "Iced sweet tea, a refreshing and sweet beverage option.",
                "vegetarian", "942e47edc792d20941fe2f3e559452ff691f33f0",
                .indonesian
            ),
            (
                "Nutrisari", 5.0,
                "A nutritious drink, providing a boost of energy.", "non-vegan",
                "a143c9633591ba7bf891f0754edafca535956ff8", .indonesian
            ),
            (
                "Susu", 5.0,
                "Milk, a classic beverage option, perfect for pairing with snacks.",
                "non-vegan", "14f3bb00e792a81221d1995257442ffd958287b",
                .indonesian
            ),
            (
                "GoodDay mocca ", 4.0,
                "Mocca coffee, a sweet and rich beverage option.", "non-vegan",
                "7d1b3a9028cf14112e8fce4823240910c112af58", .indonesian
            ),
            (
                "Kapal Api", 4.0,
                "Kapal Api coffee, a popular Indonesian coffee brand, offering a rich flavor.",
                "non-vegan", "c66ea3b467a76cb22e4f659f388d12f65ef59838",
                .indonesian
            ),
            (
                "Luwak", 4.0,
                "Luwak coffee, known for its unique flavor and aroma, a must-try for coffee lovers.",
                "non-vegan", "768a177523392a7ca77f2d6288ed5be099ccb4e1",
                .indonesian
            ),
            (
                "Indocafe Coffemix", 4.0,
                "Instant coffee mix, offering a quick and convenient coffee option.",
                "non-vegan", "9022521af0f2d4c653448b03fb3ac28626bc2df9",
                .indonesian
            ),
            (
                "Kiwi", 10.0,
                "Fresh kiwi, a sweet and tangy fruit, perfect for a healthy snack.",
                "vegetarian", "6d4a274f1554dcaa422ce6f40838ef84e66b7e6a",
                .indonesian
            ),
            (
                "Wortel", 10.0,
                "Fresh carrots, crunchy and sweet, perfect for a healthy snack.",
                "vegetarian", "06df3a14f398ca48d30b82672cbbfb08d894b804",
                .indonesian
            ),
            (
                "Terong Belanda", 10.0,
                "Tamarillo, a sweet and tangy fruit, perfect for a healthy snack.",
                "vegetarian", "208b0491b5b488898aff26e494c525d84225cec2",
                .indonesian
            ),
            (
                "Tomat", 10.0,
                "Fresh tomatoes, juicy and sweet, perfect for salads or snacks.",
                "vegetarian", "2ba22ff8c10afc5006c5d89abf60c5cd20aafb76",
                .indonesian
            ),
            (
                "Stroberi", 10.0,
                "Fresh strawberries, sweet and juicy, perfect for a healthy snack.",
                "vegetarian", "9d6da84b91f65a9292a58018d75877bb41dc1669",
                .indonesian
            ),
            (
                "Sirsak", 10.0,
                "Soursop, a tropical fruit with a sweet and tangy flavor, perfect for a healthy snack.",
                "vegetarian", "5005c08710727b9987331f27c3059422e090b595",
                .indonesian
            ),
            (
                "Nanas", 10.0,
                "Fresh pineapple, sweet and juicy, perfect for a healthy snack.",
                "vegetarian", "9cc5e83ccac6668f4ce7e93aaeb13cf67f8ba2d3",
                .indonesian
            ),
            (
                "Mangga", 10.0,
                "Fresh mango, sweet and juicy, perfect for a healthy snack.",
                "vegetarian", "ef7effcafbadea137ab02d39f1c5b504b67c6742",
                .indonesian
            ),
            (
                "Melon", 10.0,
                "Fresh melon, sweet and juicy, perfect for a healthy snack.",
                "vegetarian", "393ff71e9d22c65880ea53ecf4cb337efe1a17f5",
                .indonesian
            ),
            (
                "Pir", 10.0,
                "Fresh pear, sweet and juicy, perfect for a healthy snack.",
                "non-vegan", "5a83756018c2fddd0ca17a988db39836f7b20a5e",
                .indonesian
            ),
            (
                "Jeruk", 10.0,
                "Fresh orange, sweet and tangy, perfect for a healthy snack.",
                "vegetarian", "3606855878edfe6c472fbfb70c08ad1ac2b20b49",
                .indonesian
            ),
            (
                "Jambu", 10.0,
                "Fresh guava, sweet and fragrant, perfect for a healthy snack.",
                "vegetarian", "d6f38e3557ddaee0661f08522ff90a21304811bf",
                .indonesian
            ),
            (
                "Buah Naga", 10.0,
                "Dragon fruit, known for its vibrant color and mildly sweet flavor, perfect for a healthy snack.",
                "vegetarian", "da8f9e1261a7c0dd396c8cc0b972ff75a2f78346",
                .indonesian
            ),
            (
                "Belimbing", 10.0,
                "Starfruit, a unique fruit with a sweet and tangy flavor, perfect for a healthy snack.",
                "vegetarian", "52e80d6273426d30d24c0257e12cbf47b1de136d",
                .indonesian
            ),
            (
                "Apel", 10.0,
                "Fresh apple, crisp and sweet, perfect for a healthy snack.",
                "vegetarian", "4ef997db682659e48e9ba4e3fd54cec99d7e897d",
                .indonesian
            ),
            (
                "Alpukat", 10.0,
                "Avocado, creamy and rich, perfect for a healthy snack or addition to dishes.",
                "vegetarian", "d1fdb4e85a7797d507fb36627df186950b5e6484",
                .indonesian
            ),
        ]
    ),

    (
        "La Ding",
        "Description for La Ding",
        3.0,
        27.0,
        12.4,
        GOPArea.gop9,
        "La Ding",
        [
            (
                "Pare 1pcs", 6.0,
                "A single piece of bitter melon, often served as a unique and healthy dish.",
                "vegetarian", "e9fd843eaedf56df212365bffac50c97a25270d1",
                .indonesian
            ),
            (
                "Telur 1pcs", 6.0,
                "A single piece of egg, cooked to perfection, offering a simple yet satisfying option.",
                "vegetarian", "e13f00a1d283047a9fea8671858b84e7353b72ed",
                .indonesian
            ),
            (
                "Kentang 1pcs", 6.0,
                "A single piece of potato, often fried or cooked, providing a hearty side dish.",
                "vegetarian", "b7c766b25b1443969ca1a783728136f07a63665f",
                .indonesian
            ),
            (
                "Tahu 1pcs", 6.0,
                "A single piece of tofu, a versatile ingredient that adds protein and texture to any meal.",
                "vegetarian", "21838a6b6896ca29fa5d7f04ec62bdb5bd34fbf",
                .indonesian
            ),
            (
                "Siomay 1pcs", 6.0,
                "A single steamed dumpling filled with meat and vegetables, served with a spicy sauce.",
                "non-vegan", "729ae5cdfe155b6113e2a03e8ca950c66528f7af",
                .indonesian
            ),
            (
                "Nasi Putih  ½", 3.0,
                "Half portion of steamed white rice, a staple in Indonesian cuisine.",
                "vegetarian", "860a2ea56316de35e832df9d6317e2bcc5984a5b",
                .indonesian
            ),
            (
                "Sop Daging", 27.0,
                "A hearty meat soup, rich in flavor and perfect for a comforting meal.",
                "non-vegan", "", .indonesian
            ),
            (
                "Nasi Putih", 5.0,
                "Steamed white rice, a staple in Indonesian cuisine, served as a side to complement various dishes.",
                "vegetarian", "3617b4003efcc717c10050816bcde7974198bddd",
                .indonesian
            ),
            (
                "Sop Iga", 27.0,
                "A rich and flavorful rib soup, perfect for a hearty meal.",
                "non-vegan", "a8e013073353b1229acdf27580e7fd4853ed3abe",
                .indonesian
            ),
            (
                "Soto Mie", 20.0,
                "A flavorful noodle soup with spices and meat, offering a comforting dish.",
                "non-vegan", "f6396169a868cc2d11c874eea04c32e50770cb65",
                .indonesian
            ),
            (
                "Somay Porsi (Isi 4)", 24.0,
                "A serving of four pieces of siomay, steamed dumplings filled with meat and vegetables.",
                "vegetarian", "3bffdac94263e32b7adf3a4fd4af4b1c2e6307f3",
                .indonesian
            ),
        ]
    ),
]

// Note: Descriptions, dietary tags, image names, GOP Area, and some menu types are inferred or placeholders based on common knowledge and visual cues. Actual details might vary.

let pondokBaksoPakJokoStallData: StallData = (
    "Pondok Bakso Pak Joko",
    "Stall specializing in various types of Indonesian meatball soup (Bakso), also offering drinks and frozen food.",
    3.0,  // Min Price: Kerupuk 3k
    25.0,  // Max Price: All Bakso variants 25k
    17.6,  // Average Price (calculated from listed items: (25*6 + 8 + 10 + 5 + 3) / 10)
    GOPArea.foodcourt,  // Assuming GOPArea based on typical layout, placehr
    "PONDOK BAKSO PAK JOKO",
    [
        (
            "Bakso Campur", 25.0, "Mixed meatball soup", "non-vegetarian",
            "bakso_campur", .indonesian
        ),
        (
            "Bakso Urat", 25.0, "Tendon meatball soup", "non-vegetarian",
            "bakso_urat", .indonesian
        ),
        (
            "Bakso Halus", 25.0, "Smooth meatball soup", "non-vegetarian",
            "bakso_halus", .indonesian
        ),
        (
            "Bakso Telur", 25.0, "Egg-filled meatball soup", "non-vegetarian",
            "bakso_telur", .indonesian
        ),
        (
            "Bakso Keju", 25.0, "Cheese-filled meatball soup", "non-vegetarian",
            "bakso_keju", .indonesian
        ),
        (
            "Bakso Mercon", 25.0, "Spicy 'firecracker' meatball soup",
            "non-vegetarian", "bakso_mercon", .indonesian
        ),
        (
            "Soft Drink", 8.0, "Canned or bottled soft drink", "vegetarian",
            "soft_drink", .western
        ),  // Category might vary
        (
            "Aneka Jus", 10.0, "Various fruit juices", "vegetarian",
            "aneka_jus", .indonesian
        ),
        (
            "Air Mineral", 5.0, "Mineral water", "vegetarian",
            "air_mineral_pak_joko", .indonesian
        ),
        ("Kerupuk", 3.0, "Crackers", "vegetarian", "kerupuk", .indonesian),
        // ("Frozen Food", 0.0, "Frozen food items (Bakso, etc.)", "non-vegetarian", "frozen_food", .indonesian) // Price not listed on main menu
    ]
)

// Note: Descriptions, dietary tags, image names, and GOP Area are inferred or placeholders based on common knowledge and visual cues. Actual details might vary. Frozen food price is omitted as it's not specified on the visible menu.

let ayamRemekGoangStallData: StallData = (
    "Ayam Remek Goang",
    "Specializing in Ayam Remek (smashed fried chicken) with various spicy sambals (Goang, Ceurik, Matah) and toppings. Offers rice, Indomie, snacks, and drinks.",
    6.0,  // Min Price: Air Mineral 6k
    37.0,  // Max Price: Nasi Goang Ayam Remek Matah/Goang 37k
    19.62,  // Average Price (calculated from Paket, Ala Carte, Snack, Drink items)
    GOPArea.foodcourt,  // Assuming GOPArea based on typical layout, placehr
    "AYAM REMEK GOANG",
    [
        // Paket
        (
            "Nasi Ayam Remek Ceurik", 25.0,
            "Rice with smashed chicken and Ceurik sambal", "non-vegetarian",
            "nasi_ayam_remek_ceurik", .indonesian
        ),
        (
            "Nasi Ayam Remek Matah", 25.0,
            "Rice with smashed chicken and Matah sambal", "non-vegetarian",
            "nasi_ayam_remek_matah", .indonesian
        ),
        (
            "Nasi Ayam Remek Goang", 31.0,
            "Rice with smashed chicken and Goang sambal", "non-vegetarian",
            "nasi_ayam_remek_goang", .indonesian
        ),
        (
            "Nasi Goang Ayam Remek Ceurik", 31.0,
            "Goang-style rice with smashed chicken and Ceurik sambal",
            "non-vegetarian", "nasi_goang_ayam_remek_ceurik", .indonesian
        ),
        (
            "Nasi Goang Ayam Remek Matah", 37.0,
            "Goang-style rice with smashed chicken and Matah sambal",
            "non-vegetarian", "nasi_goang_ayam_remek_matah", .indonesian
        ),
        (
            "Nasi Goang Ayam Remek Goang", 37.0,
            "Goang-style rice with smashed chicken and Goang sambal",
            "non-vegetarian", "nasi_goang_ayam_remek_goang", .indonesian
        ),
        (
            "Indomie Ayam Remek Ceurik", 26.0,
            "Indomie noodles with smashed chicken and Ceurik sambal",
            "non-vegetarian", "indomie_ayam_remek_ceurik", .indonesian
        ),
        (
            "Indomie Ayam Remek Matah", 26.0,
            "Indomie noodles with smashed chicken and Matah sambal",
            "non-vegetarian", "indomie_ayam_remek_matah", .indonesian
        ),
        (
            "Indomie Ayam Remek Goang", 32.0,
            "Indomie noodles with smashed chicken and Goang sambal",
            "non-vegetarian", "indomie_ayam_remek_goang", .indonesian
        ),

        // Ala Carte
        (
            "Indomie", 9.0, "Plain Indomie noodles", "vegetarian",
            "indomie_plain", .indonesian
        ),
        (
            "Nasi Putih", 7.0, "Plain white rice", "vegetarian",
            "nasi_putih", .indonesian
        ),
        (
            "Nasi Goang", 10.0, "Goang-style seasoned rice", "vegetarian",
            "nasi_goang", .indonesian
        ),
        (
            "Ayam Remek Ceurik", 18.0, "Smashed chicken with Ceurik sambal",
            "non-vegetarian", "ayam_remek_ceurik", .indonesian
        ),
        (
            "Ayam Remek Keju", 25.0, "Smashed chicken with cheese",
            "non-vegetarian", "ayam_remek_keju", .indonesian
        ),
        (
            "Ayam Remek Mozarela/Leleh", 32.0,
            "Smashed chicken with melted mozzarella cheese", "non-vegetarian",
            "ayam_remek_mozarela", .indonesian
        ),
        (
            "Ayam Remek Matah", 18.0, "Smashed chicken with Matah sambal",
            "non-vegetarian", "ayam_remek_matah", .indonesian
        ),
        (
            "Ayam Remek Saus Endog Asin", 24.0,
            "Smashed chicken with salted egg sauce", "non-vegetarian",
            "ayam_remek_saus_endog_asin", .indonesian
        ),
        (
            "Ayam Remek Goang", 25.0, "Smashed chicken with Goang sambal",
            "non-vegetarian", "ayam_remek_goang", .indonesian
        ),

        // Snack
        (
            "Tempe", 8.0, "Fried tempeh snack", "vegetarian", "tempe_snack",
            .indonesian
        ),
        (
            "Tahu", 8.0, "Fried tofu snack", "vegetarian", "tahu_snack",
            .indonesian
        ),
        ("Endog", 7.0, "Fried egg", "vegetarian", "endog", .indonesian),
        (
            "Kulit Goreng", 7.0, "Fried chicken skin", "non-vegetarian",
            "kulit_goreng_goang", .indonesian
        ),
        (
            "Nugget", 14.0, "Chicken nuggets", "non-vegetarian", "nugget",
            .western
        ),
        (
            "Kentang Goreng", 14.0, "French fries", "vegetarian",
            "kentang_goreng_goang", .western
        ),
        (
            "Tahu Tempe Kriuk", 14.0, "Crispy fried tofu and tempeh",
            "vegetarian", "tahu_tempe_kriuk", .indonesian
        ),

        // Drink
        (
            "Es Nusantara", 8.0, "Archipelago ice drink (mixed syrup/fruit)",
            "vegetarian", "es_nusantara", .indonesian
        ),
        (
            "Air Mineral 600 ml", 6.0, "Mineral water (600ml bottle)",
            "vegetarian", "air_mineral_600ml", .indonesian
        ),

        // Toppings (Not included as separate menu items for average calculation)
        // ("Topping Keju", 7.0, "Cheese topping", "vegetarian", "topping_keju", .indonesian),
        // ("Topping Endog Asin", 7.0, "Salted egg topping", "vegetarian", "topping_endog_asin", .indonesian),
        // ("Topping Leleh", 4.0, "Melted cheese topping", "vegetarian", "topping_leleh", .indonesian),
        // ("Topping Sambal", 7.0, "Extra sambal (Goang/Ceurik/Matah/Minang)", "vegetarian", "topping_sambal", .indonesian)
    ]
)

// Note: Descriptions, dietary tags, image names, and GOP Area are inferred or placeholders based on common knowledge and visual cues. Add-ons like extra toppings or choosing chicken parts are not listed as separate main items.

// Data combined from both images provided for Ke Kei stall

let keKeiStallData: StallData = (
    "Ke Kei",
    "Kedai Kopi Ekonomis Indonesia. Food stall serving a variety of Indonesian fried snacks, grilled items, main courses, sandwiches, Indomie, and drinks.",
    5.0,  // Min Price: Air Mineral 5k
    88.0,  // Max Price: Iga Sapi BBQ 88k
    32.13,  // Average Price (calculated from all listed items across images)
    GOPArea.foodcourt,  // Assuming GOPArea based on typical layout, placehr
    "KE KEI",
    [
        // Fridge Menu / Left Vertical Menu (Consistent across images)
        (
            "Baso", 30.0, "Meatball snack", "non-vegetarian", "baso",
            .indonesian
        ),
        ("Boli", 30.0, "Snack item", "non-vegetarian", "boli", .indonesian),
        ("Otli", 30.0, "Snack item", "non-vegetarian", "otli", .indonesian),
        (
            "Risolles", 30.0, "Fried spring roll", "non-vegetarian",
            "risolles", .indonesian
        ),
        (
            "Sosis Ayam", 30.0, "Chicken sausage", "non-vegetarian",
            "sosis_ayam", .indonesian
        ),
        (
            "Uyen Talas", 25.0, "Fried taro cake", "vegetarian",
            "uyen_talas", .indonesian
        ),
        ("Yimi", 25.0, "Snack item", "non-vegetarian", "yimi", .indonesian),
        (
            "Mushroom Goreng", 25.0, "Fried mushrooms", "vegetarian",
            "mushroom_goreng", .indonesian
        ),
        (
            "Ballen", 25.0, "Pastry snack, likely with filling",
            "non-vegetarian", "ballen", .indonesian
        ),
        (
            "Mashro", 25.0, "Mashed potato snack", "vegetarian", "mashro",
            .indonesian
        ),

        // PisKei Menu (Consistent across images)
        (
            "Pisang Tanduk Goreng", 18.0, "Fried plantain (tanduk type)",
            "vegetarian", "pisang_tanduk_goreng", .indonesian
        ),
        (
            "Pisang Kepok Goreng", 18.0, "Fried plantain (kepok type)",
            "vegetarian", "pisang_kepok_goreng", .indonesian
        ),
        (
            "Tempe Goreng (Pis Kei)", 20.0, "Fried tempeh", "vegetarian",
            "tempe_goreng_pis_kei", .indonesian
        ),
        (
            "Cireng", 20.0, "Fried tapioca starch snack", "vegetarian",
            "cireng", .indonesian
        ),
        (
            "Bakwan Goreng", 20.0, "Fried vegetable fritter", "vegetarian",
            "bakwan_goreng", .indonesian
        ),
        (
            "Kentang Goreng", 20.0, "French fries", "vegetarian",
            "kentang_goreng", .western
        ),
        (
            "Ubi Goreng", 20.0, "Fried sweet potato", "vegetarian",
            "ubi_goreng", .indonesian
        ),
        (
            "Singkong Goreng", 20.0, "Fried cassava", "vegetarian",
            "singkong_goreng", .indonesian
        ),
        (
            "Pisang Tanduk Bakar Coklat Keju", 25.0,
            "Grilled plantain (tanduk) with chocolate and cheese", "vegetarian",
            "pisang_tanduk_bakar", .indonesian
        ),
        (
            "Pisang Kepok Bakar Coklat Keju", 25.0,
            "Grilled plantain (kepok) with chocolate and cheese", "vegetarian",
            "pisang_kepok_bakar", .indonesian
        ),
        (
            "Roti Bakar Coklat Keju", 20.0, "Toast with chocolate and cheese",
            "vegetarian", "roti_bakar_coklat_keju", .indonesian
        ),
        (
            "Roti Bakar Srikaya Keju", 20.0,
            "Toast with srikaya jam and cheese", "vegetarian",
            "roti_bakar_srikaya_keju", .indonesian
        ),

        // Goreng Menu (Updated)
        (
            "Ayam Goreng Dada", 38.0, "Fried chicken breast", "non-vegetarian",
            "ayam_goreng_dada", .indonesian
        ),
        (
            "Ayam Goreng Paha", 38.0, "Fried chicken thigh", "non-vegetarian",
            "ayam_goreng_paha", .indonesian
        ),
        (
            "Tahu Goreng", 10.0, "Fried tofu", "vegetarian", "tahu_goreng",
            .indonesian
        ),
        (
            "Tempe Goreng", 10.0, "Fried tempeh", "vegetarian",
            "tempe_goreng", .indonesian
        ),
        (
            "Udang Goreng", 38.0, "Fried shrimp", "non-vegetarian",
            "udang_goreng", .indonesian
        ),
        (
            "Wings Goreng", 38.0, "Fried chicken wings", "non-vegetarian",
            "wings_goreng", .indonesian
        ),

        // Boneless Fish Chick Menu (Updated)
        (
            "Boneless Paha Ayam (1/2)", 25.0, "Boneless fried chicken thigh",
            "non-vegetarian", "boneless_paha_ayam", .indonesian
        ),
        (
            "Boneless Dada Ayam (1/2)", 25.0, "Boneless fried chicken breast",
            "non-vegetarian", "boneless_dada_ayam", .indonesian
        ),
        (
            "Boneless Ikan Dori", 35.0, "Boneless fried dory fish",
            "non-vegetarian", "boneless_ikan_dori", .indonesian
        ),
        (
            "Boneless Udang", 35.0, "Boneless fried shrimp", "non-vegetarian",
            "boneless_udang", .indonesian
        ),

        // Skin Chick Menu (Updated)
        (
            "Skin Chick", 15.0, "Fried chicken skin", "non-vegetarian",
            "skin_chick", .indonesian
        ),  // Same as Skin Goreng
        (
            "Ati Ampela", 15.0, "Fried chicken liver and gizzard",
            "non-vegetarian", "ati_ampela", .indonesian
        ),
        (
            "Kulit Putih", 15.0, "Fried white chicken skin (?)",
            "non-vegetarian", "kulit_putih", .indonesian
        ),  // Description speculative
        (
            "Usus", 15.0, "Fried chicken intestines", "non-vegetarian",
            "usus", .indonesian
        ),

        // Drinks Menu (Consistent across images)
        ("Kopi", 12.0, "Coffee", "vegetarian", "kopi", .indonesian),
        (
            "Kopi Susu", 12.0, "Coffee with milk", "vegetarian",
            "kopi_susu", .indonesian
        ),
        ("Teh", 10.0, "Tea", "vegetarian", "teh", .indonesian),
        (
            "Teh Susu", 10.0, "Tea with milk", "vegetarian", "teh_susu",
            .indonesian
        ),
        (
            "Es Teh Manis", 8.0, "Iced sweet tea", "vegetarian",
            "es_teh_manis", .indonesian
        ),
        (
            "Es Teh Tawar", 6.0, "Iced plain tea", "vegetarian",
            "es_teh_tawar", .indonesian
        ),
        (
            "Cokelat", 12.0, "Chocolate drink", "vegetarian", "cokelat",
            .indonesian
        ),
        (
            "Cokelat Susu", 12.0, "Chocolate milk", "vegetarian",
            "cokelat_susu", .indonesian
        ),
        ("Susu", 12.0, "Milk", "vegetarian", "susu", .indonesian),
        ("Lemonade", 30.0, "Lemonade", "vegetarian", "lemonade", .western),
        (
            "Lemot", 30.0, "Lemon tea variant", "vegetarian", "lemot",
            .indonesian
        ),
        (
            "Lemot Hijau", 30.0, "Green lemon tea variant", "vegetarian",
            "lemot_hijau", .indonesian
        ),
        (
            "Lemon Tea", 30.0, "Lemon tea", "vegetarian", "lemon_tea",
            .western
        ),
        (
            "Air Mineral", 5.0, "Mineral water", "vegetarian",
            "air_mineral", .indonesian
        ),

        // Main Dishes (Ke Kei - Updated/Combined)
        (
            "Sapi Siram", 45.0, "Beef with sauce", "non-vegetarian",
            "sapi_siram", .indonesian
        ),
        (
            "Sapi Telur Asin", 45.0, "Beef with salted egg sauce",
            "non-vegetarian", "sapi_telur_asin", .indonesian
        ),
        (
            "Ayam Suir Kampung", 58.0, "Shredded free-range chicken",
            "non-vegetarian", "ayam_suir_kampung", .indonesian
        ),
        (
            "Ika Crispy", 38.0, "Crispy fish", "non-vegetarian",
            "ika_crispy", .indonesian
        ),  // From 1st image
        (
            "Ika Bakar", 48.0, "Grilled fish", "non-vegetarian",
            "ika_bakar", .indonesian
        ),  // Price updated
        (
            "Iga Sapi BBQ", 88.0, "BBQ beef ribs", "non-vegetarian",
            "iga_sapi_bbq", .western
        ),  // Price updated
        (
            "Iga Sapi Bakar Rica", 48.0,
            "Grilled beef ribs with rica-rica sauce", "non-vegetarian",
            "iga_sapi_rica", .indonesian
        ),  // From 1st image
        (
            "Dada Bakar", 38.0, "Grilled chicken breast", "non-vegetarian",
            "dada_bakar", .indonesian
        ),
        (
            "Wings Bakar", 38.0, "Grilled chicken wings", "non-vegetarian",
            "wings_bakar", .indonesian
        ),
        (
            "Sapi Lada Hitam", 45.0, "Black pepper beef", "non-vegetarian",
            "sapi_lada_hitam", .chinese
        ),  // From 1st image
        (
            "Sapi Cabe Hijau", 45.0, "Beef with green chili", "non-vegetarian",
            "sapi_cabe_hijau", .indonesian
        ),  // From 1st image
        (
            "Sapi Plecing Kuah", 48.0, "Beef in plecing soup", "non-vegetarian",
            "sapi_plecing_kuah", .indonesian
        ),  // From 1st image
        (
            "Ayam Kuah", 48.0, "Chicken soup dish", "non-vegetarian",
            "ayam_kuah", .indonesian
        ),  // From 1st image

        // Dankei / Sandwich Panggang Menu (Updated)
        (
            "Dankei Original", 35.0, "Original Danket pastry/bread",
            "vegetarian", "dankei_original", .indonesian
        ),
        (
            "Dankei Coklat", 38.0, "Chocolate Danket pastry/bread",
            "vegetarian", "dankei_coklat", .indonesian
        ),
        (
            "Dankei Keju", 38.0, "Cheese Danket pastry/bread", "vegetarian",
            "dankei_keju", .indonesian
        ),
        (
            "Dankei Cokelat Keju", 45.0, "Chocolate Cheese Danket pastry/bread",
            "vegetarian", "dankei_cokelat_keju", .indonesian
        ),
        (
            "Sandwich Sosis", 58.0, "Sausage sandwich", "non-vegetarian",
            "sandwich_sosis", .western
        ),
        (
            "Sandwich Beef", 68.0, "Beef sandwich", "non-vegetarian",
            "sandwich_beef", .western
        ),  // Price updated
        (
            "Sandwich Cheese", 68.0, "Cheese sandwich", "vegetarian",
            "sandwich_cheese", .western
        ),
        (
            "Sandwich Patty", 78.0, "Patty sandwich", "non-vegetarian",
            "sandwich_patty", .western
        ),
        (
            "Sandwich Coklat", 78.0, "Chocolate sandwich", "vegetarian",
            "sandwich_coklat", .western
        ),

        // Blugit / Roti Bluder Menu (Updated)
        (
            "Blugit Original", 35.0, "Original Blugit pastry/bread",
            "vegetarian", "blugit_original", .indonesian
        ),
        (
            "Roti Bluder", 38.0, "Bluder bread", "vegetarian",
            "roti_bluder", .indonesian
        ),
        (
            "Blugit Cokelat", 38.0, "Chocolate Blugit pastry/bread",
            "vegetarian", "blugit_cokelat", .indonesian
        ),
        (
            "Blugit Keju", 38.0, "Cheese Blugit pastry/bread", "vegetarian",
            "blugit_keju", .indonesian
        ),
        (
            "Blugit Cokelat Keju", 45.0, "Chocolate Cheese Blugit pastry/bread",
            "vegetarian", "blugit_coklat_keju_updated", .indonesian
        ),  // Price updated
        (
            "Blugit Beef", 58.0, "Beef Blugit pastry/bread", "non-vegetarian",
            "blugit_beef", .indonesian
        ),  // From 1st image
        (
            "Blugit Cheese", 68.0, "Cheese Blugit pastry/bread", "vegetarian",
            "blugit_cheese", .indonesian
        ),  // From 1st image

        // Indomie Goreng Jumbo Menu (New)
        (
            "Indomie Goreng Jumbo Skin Chick", 25.0,
            "Jumbo fried Indomie with chicken skin", "non-vegetarian",
            "indomie_jumbo_skin", .indonesian
        ),
        (
            "Indomie Goreng Jumbo Boneless", 30.0,
            "Jumbo fried Indomie with boneless chicken", "non-vegetarian",
            "indomie_jumbo_boneless", .indonesian
        ),
        (
            "Indomie Goreng Jumbo Baso Goreng", 30.0,
            "Jumbo fried Indomie with fried meatballs", "non-vegetarian",
            "indomie_jumbo_baso", .indonesian
        ),
        (
            "Indomie Goreng Jumbo Sosis", 30.0,
            "Jumbo fried Indomie with sausage", "non-vegetarian",
            "indomie_jumbo_sosis", .indonesian
        ),
    ]
)

// Note: Descriptions, dietary tags, image names, GOP Area, and some menu types are inferred or placeholders. Some items from the first image not visible in the second are retained assuming they are still offered. Prices are updated based on the second image where available.

let warungKitaStallData: StallData = (
    "Warung Kita",
    "Indonesian food stall specializing in Pecel Ayam (fried chicken with sambal), Pecel Lele (fried catfish with sambal), satay, and other traditional dishes. Also offers catering.",
    8.0,  // Estimated Min Price: Es Teh Manis 8k
    50.0,  // Estimated Max Price: Sate Kambing 50k
    25.07,  // Estimated Average Price (calculated from estimated item prices)
    GOPArea.foodcourt,  // Assuming GOPArea based on typical layout, placehr
    "WARUNG KITA",
    [
        // Estimated Menu Items based on visuals
        (
            "Ayam Kremes", 32.0, "Fried chicken with crispy bits",
            "non-vegetarian", "ayam_kremes_wk", .indonesian
        ),
        (
            "Ayam Bakar", 32.0, "Grilled chicken", "non-vegetarian",
            "ayam_bakar_wk", .indonesian
        ),
        (
            "Ayam Penyet", 32.0, "Smashed fried chicken with sambal",
            "non-vegetarian", "ayam_penyet_wk", .indonesian
        ),
        (
            "Pecel Lele", 28.0, "Fried catfish with sambal and vegetables",
            "non-vegetarian", "pecel_lele_wk", .indonesian
        ),
        (
            "Pecak Ikan", 38.0, "Fish cooked in Pecak style (spicy sour sauce)",
            "non-vegetarian", "pecak_ikan_wk", .indonesian
        ),  // Assuming it's Pecak Ikan
        (
            "Sate Ayam", 40.0, "Chicken satay portion", "non-vegetarian",
            "sate_ayam_wk", .indonesian
        ),
        (
            "Sate Kambing", 50.0, "Goat satay portion", "non-vegetarian",
            "sate_kambing_wk", .indonesian
        ),
        (
            "Cah Kangkung", 22.0, "Stir-fried water spinach", "vegetarian",
            "cah_kangkung_wk", .indonesian
        ),
        (
            "Tahu / Tempe Goreng", 10.0, "Fried tofu and/or tempeh side dish",
            "vegetarian", "tahu_tempe_wk", .indonesian
        ),  // Assuming available
        (
            "Es Teh Manis", 8.0, "Iced sweet tea", "vegetarian",
            "es_teh_manis_wk", .indonesian
        ),
        (
            "Es Jeruk Peras", 15.0, "Freshly squeezed orange juice",
            "vegetarian", "es_jeruk_peras_wk", .indonesian
        ),
        (
            "Es Cincau", 15.0, "Grass jelly iced drink", "vegetarian",
            "es_cincau_wk", .indonesian
        ),
        (
            "Es Kopyor", 18.0, "Kopyor coconut (mutant coconut) iced drink",
            "vegetarian", "es_kopyor_wk", .indonesian
        ),
        (
            "Es Kuwut", 18.0, "Balinese melon and coconut iced drink",
            "vegetarian", "es_kuwut_wk", .indonesian
        ),
        (
            "Es Kelapa", 18.0, "Young coconut iced drink", "vegetarian",
            "es_kelapa_wk", .indonesian
        ),  // Assuming based on partial view
    ]
)

// Note: All prices for Warung Kita are ESTIMATED based on visual comparison with neighboring stalls as no prices were clearly visible. Descriptions, dietary tags, image names, and GOP Area are inferred or placeholders. The exact menu might differ.

let sotoKudusStallData: StallData = (
    "Soto Kudus Stall",  // Name inferred from menu items, not explicitly stated
    "Stall specializing in Soto Kudus (chicken soup from Kudus), various satay side dishes, and drinks.",
    2.0,  // Min Price: K. Kaleng 2k
    25.0,  // Max Price: Soto Kudus Spesial / Campur Nasi 25k
    7.71,  // Average Price (calculated from listed items: 131 / 17)
    GOPArea.foodcourt,  // Assuming GOPArea based on relative position, placehr
    "SOTO KUDUS STALL",  // Placeholder name string
    [
        (
            "Soto Kudus Spesial", 25.0, "Special Kudus-style chicken soup",
            "non-vegetarian", "soto_kudus_spesial", .javanese
        ),
        (
            "Soto Kudus campur Nasi", 25.0,
            "Kudus-style chicken soup mixed with rice", "non-vegetarian",
            "soto_kudus_campur", .javanese
        ),
        // ("Soto Kudus", 20.0, "Kudus-style chicken soup", "non-vegetarian", "soto_kudus", .javanese), // Price unclear, omitted from calculation
        (
            "Nasi Putih", 5.0, "Plain white rice", "vegetarian",
            "nasi_putih_soto", .indonesian
        ),
        (
            "Sate Telur", 5.0, "Quail egg satay", "vegetarian",
            "sate_telur", .javanese
        ),
        (
            "Sate Ati Ampela", 5.0, "Chicken liver and gizzard satay",
            "non-vegetarian", "sate_ati_ampela_soto", .javanese
        ),
        (
            "Sate Usus", 5.0, "Chicken intestine satay", "non-vegetarian",
            "sate_usus_soto", .javanese
        ),
        (
            "Bacem", 4.0, "Sweet braised tempeh or tofu", "vegetarian",
            "bacem", .javanese
        ),
        ("Gendar", 7.0, "Rice cracker", "vegetarian", "gendar", .javanese),
        (
            "K. Kaleng", 2.0, "Crackers from a tin", "vegetarian",
            "k_kaleng", .indonesian
        ),
        (
            "Aneka Kopi", 5.0, "Various coffee options", "vegetarian",
            "aneka_kopi", .indonesian
        ),
        (
            "Es Jeruk Anget", 10.0, "Warm orange juice", "vegetarian",
            "jeruk_anget", .indonesian
        ),  // "Es" usually means iced, but "Anget" means warm. Assuming "Jeruk Anget".
        (
            "Es Teh Anget", 5.0, "Warm tea", "vegetarian", "teh_anget",
            .indonesian
        ),  // Assuming "Teh Anget".
        (
            "Teh Tawar", 3.0, "Plain tea (unsweetened)", "vegetarian",
            "teh_tawar_soto", .indonesian
        ),
        (
            "Teh Pucuk", 5.0, "Bottled jasmine tea (Teh Pucuk brand)",
            "vegetarian", "teh_pucuk", .indonesian
        ),
        (
            "Teh Sosro", 5.0, "Bottled tea (Sosro brand)", "vegetarian",
            "teh_sosro", .indonesian
        ),
        (
            "Prestine", 7.0, "Bottled mineral water (Prestine brand)",
            "vegetarian", "prestine", .indonesian
        ),
        (
            "Aqua Botol", 3.0, "Bottled mineral water (Aqua brand)",
            "vegetarian", "aqua_botol", .indonesian
        ),
    ]
)

// Note: Stall name is inferred. Descriptions, dietary tags, image names, GOP Area, and menu types are inferred or placeholders. "Es Jeruk Anget" and "Es Teh Anget" are unusual names; interpreted as warm drinks despite the "Es". Price for plain "Soto Kudus" was unclear and omitted.

let pecelMadiunBuLinStallData: StallData = (
    "Pecel Madiun Bu Lin / Nasi Berkat",
    "Stall specializing in Madiun-style Pecel (vegetables with peanut sauce), Nasi Berkat (blessing rice dishes), various Javanese/Indonesian side dishes (lauk), soups, and drinks.",
    3.0,  // Min Price: Bakwan Jagung/Sayur, Tempe Mendoan, Tahu/Tempe Goreng @ 3k
    58.0,  // Max Price: Sop Buntut 58k
    24.03,  // Average Price (calculated from listed items, using lower price for ranges)
    GOPArea.foodcourt,  // Assuming GOPArea based on relative position, placehr
    "PECEL MADIUN BU LIN NASI BERKAT",
    [
        // Nasi Pecel / Pecel Sayur
        (
            "Pecel Sayur Tahu/Tempe", 25.0,
            "Vegetables with peanut sauce, tofu/tempeh", "vegetarian",
            "pecel_sayur_tahu_tempe", .javanese
        ),
        (
            "Nasi Pecel Tahu/Tempe", 25.0,
            "Rice with pecel vegetables, tofu/tempeh", "vegetarian",
            "nasi_pecel_tahu_tempe", .javanese
        ),
        (
            "Nasi Pecel Tahu+Tempe", 28.0,
            "Rice with pecel vegetables, tofu and tempeh", "vegetarian",
            "nasi_pecel_tahu_plus_tempe", .javanese
        ),
        (
            "Nasi Pecel Telor Dadar", 28.0,
            "Rice with pecel vegetables and fried egg omelette", "vegetarian",
            "nasi_pecel_telor_dadar", .javanese
        ),
        (
            "Nasi Pecel Telor Ceplok", 28.0,
            "Rice with pecel vegetables and fried egg (sunny side up)",
            "vegetarian", "nasi_pecel_telor_ceplok", .javanese
        ),
        (
            "Nasi Pecel Telor Tahu Tempe", 33.0,
            "Rice with pecel vegetables, egg, tofu, tempeh", "vegetarian",
            "nasi_pecel_telor_tahu_tempe", .javanese
        ),
        (
            "Nasi Pecel Ayam Goreng NG", 40.0,
            "Rice with pecel vegetables and fried chicken (broiler)",
            "non-vegetarian", "nasi_pecel_ayam_ng", .javanese
        ),
        (
            "Nasi Pecel Ayam Goreng KP", 45.0,
            "Rice with pecel vegetables and fried chicken (free-range)",
            "non-vegetarian", "nasi_pecel_ayam_kp", .javanese
        ),
        (
            "Nasi Pecel Empal Daging", 48.0,
            "Rice with pecel vegetables and sweet fried beef", "non-vegetarian",
            "nasi_pecel_empal", .javanese
        ),

        // Lauk / Gorengan
        (
            "Ayam Goreng (Negri)", 20.0, "Fried chicken (broiler)",
            "non-vegetarian", "ayam_goreng_negri", .indonesian
        ),
        (
            "Ayam Goreng (Kampung)", 25.0, "Fried chicken (free-range)",
            "non-vegetarian", "ayam_goreng_kampung", .indonesian
        ),
        (
            "Ayam Penyet (Negri)", 23.0,
            "Smashed fried chicken (broiler) with sambal", "non-vegetarian",
            "ayam_penyet_negri", .indonesian
        ),
        (
            "Ayam Penyet (Kampung)", 28.0,
            "Smashed fried chicken (free-range) with sambal", "non-vegetarian",
            "ayam_penyet_kampung", .indonesian
        ),
        (
            "Empal Daging Suwir", 30.0, "Shredded sweet fried beef",
            "non-vegetarian", "empal_daging_suwir", .javanese
        ),
        (
            "Paru Goreng", 20.0, "Fried beef lung", "non-vegetarian",
            "paru_goreng", .indonesian
        ),
        (
            "Kulit Ayam", 10.0, "Fried chicken skin", "non-vegetarian",
            "kulit_ayam_bulin", .indonesian
        ),
        (
            "Usus / Jantung Ayam", 10.0, "Fried chicken intestine / heart",
            "non-vegetarian", "usus_jantung_ayam", .indonesian
        ),
        (
            "Telor Dadar / Telor Ceplok", 6.0,
            "Fried egg omelette / sunny side up", "vegetarian",
            "telor_dadar_ceplok", .indonesian
        ),
        (
            "Telor Asin", 8.0, "Salted duck egg", "vegetarian",
            "telor_asin", .indonesian
        ),
        (
            "Telor Puyuh", 6.0, "Quail eggs", "vegetarian", "telor_puyuh",
            .indonesian
        ),
        (
            "Ikan Asin / Cue Kecil", 5.0, "Salted fish / Small Cue fish",
            "non-vegetarian", "ikan_asin_cue", .indonesian
        ),
        (
            "Bakwan Jagung", 3.0, "Corn fritter (price per piece, range 3/5)",
            "vegetarian", "bakwan_jagung", .indonesian
        ),
        (
            "Bakwan Sayur", 3.0,
            "Vegetable fritter (price per piece, range 3/5)", "vegetarian",
            "bakwan_sayur", .indonesian
        ),
        (
            "Tempe Mendoan", 3.0,
            "Batter-fried tempeh (price per piece, range 3/5)", "vegetarian",
            "tempe_mendoan", .javanese
        ),
        (
            "Tahu / Tempe Goreng", 3.0, "Fried tofu / tempeh", "vegetarian",
            "tahu_tempe_goreng_bulin", .indonesian
        ),
        (
            "Peyek @ isi 4 pcs", 10.0, "Peanut/anchovy crackers (4 pieces)",
            "vegetarian", "peyek", .javanese
        ),  // Can be non-veg if anchovy
        (
            "Extra Sambal / Bumbu Pecel", 10.0,
            "Extra chili sauce / peanut sauce", "vegetarian",
            "extra_sambal_pecel", .javanese
        ),

        // Sayur / Lauk (Side Dishes)
        (
            "Sayur: Lodeh / Sop / Asem / Tumis", 8.0,
            "Vegetable dish: Coconut curry/Soup/Sour soup/Stir-fry",
            "vegetarian", "sayur_lodeh_sop_asem_tumis", .indonesian
        ),
        (
            "Pepes Tahu / Pepes Jamur / Oncom", 7.0,
            "Steamed tofu/mushroom/fermented soy cake in banana leaf",
            "vegetarian", "pepes_tahu_jamur_oncom", .sundanese
        ),
        (
            "Orek Tempe / Tahu Kecap / Telor Balado", 8.0,
            "Sauteed tempeh/Tofu in sweet soy sauce/Egg in chili sauce",
            "vegetarian", "orek_tempe_tahu_kecap_telor_balado", .indonesian
        ),
        (
            "Tongkol Suwir / Balado / Oseng Kikil", 10.0,
            "Shredded tuna/Chili sauce dish/Sauteed beef tendon",
            "non-vegetarian", "tongkol_balado_kikil", .indonesian
        ),
        (
            "Ikan Kembung / Dori / Cumi", 13.0,
            "Mackerel fish / Dory fish / Squid", "non-vegetarian",
            "ikan_kembung_dori_cumi", .indonesian
        ),
        (
            "Ayam Suwir / Goreng / Ayam Bumbu", 13.0,
            "Shredded chicken / Fried chicken / Seasoned chicken",
            "non-vegetarian", "ayam_suwir_goreng_bumbu", .indonesian
        ),
        (
            "Daging Sapi", 18.0, "Beef side dish", "non-vegetarian",
            "daging_sapi_side", .indonesian
        ),

        // Nasi Tanpa Lauk
        (
            "Nasi Putih", 7.0, "Plain white rice", "vegetarian",
            "nasi_putih_bulin", .indonesian
        ),
        (
            "Nasi Merah", 8.0, "Red rice", "vegetarian", "nasi_merah",
            .indonesian
        ),
        (
            "Nasi Uduk", 8.0, "Coconut milk rice", "vegetarian",
            "nasi_uduk", .indonesian
        ),
        (
            "Nasi Liwet Sunda", 8.0, "Sundanese seasoned rice", "vegetarian",
            "nasi_liwet_sunda", .sundanese
        ),

        // Paket Nasi + Sayur + Lauk
        (
            "Paket 12K", 12.0, "Rice + 2 vegetable side dishes", "vegetarian",
            "paket_12k", .indonesian
        ),
        (
            "Paket 20K", 20.0, "Rice + 2 veg sides + Egg (Opor/Balado/Dadar)",
            "vegetarian", "paket_20k", .indonesian
        ),  // Can be non-veg if Opor contains meat broth
        (
            "Paket 22K", 22.0, "Rice + 2 veg sides + Tuna/Skin/Intestine",
            "non-vegetarian", "paket_22k", .indonesian
        ),
        (
            "Paket 25K", 25.0, "Rice + 2 veg sides + Chicken / Mackerel",
            "non-vegetarian", "paket_25k", .indonesian
        ),
        (
            "Paket 30K", 30.0, "Rice + 2 veg sides + Beef", "non-vegetarian",
            "paket_30k", .indonesian
        ),

        // Nasi Empal, Nasi Krawu
        (
            "Nasi Empal Daging Suwir", 35.0,
            "Rice with shredded sweet fried beef", "non-vegetarian",
            "nasi_empal_suwir", .javanese
        ),
        (
            "Nasi Krawu Empal Paru", 48.0,
            "Krawu rice with sweet fried beef and lung", "non-vegetarian",
            "nasi_krawu_empal_paru", .javanese
        ),

        // Nasi + Ayam Goreng / Ayam Penyet
        (
            "Nasi Ayam Goreng Negri", 25.0, "Rice with fried chicken (broiler)",
            "non-vegetarian", "nasi_ayam_goreng_negri", .indonesian
        ),
        (
            "Nasi Ayam Goreng KP", 30.0, "Rice with fried chicken (free-range)",
            "non-vegetarian", "nasi_ayam_goreng_kp", .indonesian
        ),
        (
            "Nasi Ayam Penyet Negri", 28.0,
            "Rice with smashed fried chicken (broiler)", "non-vegetarian",
            "nasi_ayam_penyet_negri", .indonesian
        ),
        (
            "Nasi Ayam Penyet KP", 33.0,
            "Rice with smashed fried chicken (free-range)", "non-vegetarian",
            "nasi_ayam_penyet_kp", .indonesian
        ),
        (
            "Nasi Ayam Penyet Tahu Tempe Negri", 33.0,
            "Rice with smashed chicken (broiler), tofu, tempeh",
            "non-vegetarian", "nasi_ayam_penyet_tahu_tempe_negri",
            .indonesian
        ),
        (
            "Nasi Ayam Penyet Tahu Tempe KP", 38.0,
            "Rice with smashed chicken (free-range), tofu, tempeh",
            "non-vegetarian", "nasi_ayam_penyet_tahu_tempe_kp", .indonesian
        ),
        (
            "Nasi Timbel Ayam NG/KP/Empal", 40.0,
            "Timbel rice with Chicken (NG/KP) or Beef Empal (price range 40/45/48)",
            "non-vegetarian", "nasi_timbel_ayam_empal", .sundanese
        ),

        // Nasi Rames
        (
            "Nasi Rames Ayam Goreng NG", 40.0,
            "Mixed rice with fried chicken (broiler) and sides",
            "non-vegetarian", "nasi_rames_ayam_ng", .indonesian
        ),
        (
            "Nasi Rames Ayam Goreng KP", 45.0,
            "Mixed rice with fried chicken (free-range) and sides",
            "non-vegetarian", "nasi_rames_ayam_kp", .indonesian
        ),
        (
            "Nasi Rames Empal Daging", 48.0,
            "Mixed rice with sweet fried beef and sides", "non-vegetarian",
            "nasi_rames_empal", .indonesian
        ),

        // Nasi Liwet Sunda / Nasi Uduk
        (
            "Nasi Liwet/Uduk Empal Komplit", 48.0,
            "Sundanese Liwet/Coconut rice with complete beef empal set",
            "non-vegetarian", "nasi_liwet_uduk_empal", .sundanese
        ),
        (
            "Nasi Liwet/Uduk Ayam KP Komplit", 45.0,
            "Sundanese Liwet/Coconut rice with complete free-range chicken set",
            "non-vegetarian", "nasi_liwet_uduk_ayam_kp", .sundanese
        ),
        (
            "Nasi Liwet/Uduk Ayam NG Komplit", 40.0,
            "Sundanese Liwet/Coconut rice with complete broiler chicken set",
            "non-vegetarian", "nasi_liwet_uduk_ayam_ng", .sundanese
        ),

        // Rawon / Sop Daging / Sop Iga
        (
            "Rawon Daging/Nasi Rawon Campur", 30.0,
            "Beef black soup / Rice mixed with Rawon (price range 30/35)",
            "non-vegetarian", "rawon_daging", .javanese
        ),
        (
            "Sop Daging", 35.0, "Beef soup", "non-vegetarian", "sop_daging",
            .indonesian
        ),
        (
            "Sop Balungan Daging", 38.0, "Beef bone soup", "non-vegetarian",
            "sop_balungan", .indonesian
        ),
        (
            "Sop Iga", 45.0, "Beef rib soup", "non-vegetarian", "sop_iga",
            .indonesian
        ),
        (
            "Sop Buntut", 58.0, "Oxtail soup", "non-vegetarian",
            "sop_buntut", .indonesian
        ),

        // Minuman
        (
            "Teh Tawar", 4.0, "Plain tea (unsweetened)", "vegetarian",
            "teh_tawar_bulin", .indonesian
        ),
        (
            "Es Teh Tawar / Teh Manis", 5.0, "Iced plain tea / Sweet tea (hot)",
            "vegetarian", "es_teh_tawar_manis", .indonesian
        ),
        (
            "Es Teh Manis", 6.0, "Iced sweet tea", "vegetarian",
            "es_teh_manis_bulin", .indonesian
        ),
        (
            "Air Mineral", 5.0, "Mineral water", "vegetarian",
            "air_mineral_bulin", .indonesian
        ),
        (
            "Jeruk Hangat / Es Jeruk", 11.0,
            "Warm orange juice / Iced orange juice (price range 11/12)",
            "vegetarian", "jeruk_hangat_es", .indonesian
        ),
        (
            "Kopi Tubruk", 5.0, "Indonesian style coarse ground coffee",
            "vegetarian", "kopi_tubruk", .indonesian
        ),
    ]
)

// Note: Descriptions, dietary tags, image names, GOP Area, and menu types are inferred or placeholders. Prices for items with ranges (e.g., 3/5) use the lower value for min/avg calculation. Paket prices are included as base prices. Peyek is assumed vegetarian but might contain anchovies. Opor in Paket 20K might make it non-veg depending on broth.

// Stall 1: UENA Mie Chili Oil
let uenaMieChiliOilStallData: StallData = (
    "UENA Mie Chili Oil",
    "Stall specializing in noodles with chili oil (Mie Chili Oil) and other variations like Mie Ayam Asin and Mie Yamin Manis.",
    14.0,  // Min Price: Mie Chili Oil 14k
    19.0,  // Max Price: Mie Yamin Manis 19k
    16.67,  // Average Price: (14 + 17 + 19) / 3
    GOPArea.foodcourt,  // Assuming GOPArea based on relative position, placehr
    "UENA MIE CHILI OIL",
    [
        (
            "Mie Chili Oil", 14.0, "Noodles with signature chili oil",
            "non-vegetarian", "mie_chili_oil_uena", .chinese
        ),  // Assumed non-veg base/toppings
        (
            "Mie Ayam Asin", 17.0, "Savory chicken noodles", "non-vegetarian",
            "mie_ayam_asin_uena", .indonesian
        ),
        (
            "Mie Yamin Manis", 19.0, "Sweet soy sauce chicken noodles",
            "non-vegetarian", "mie_yamin_manis_uena", .indonesian
        ),
    ]
)

// Stall 2: Nyandoe Kitchen
let nyandoeKitchenStallData: StallData = (
    "Nyandoe Kitchen",
    "Offers a variety of Indonesian dishes including Ayam Penyet, Ayam Kalasan, Bakmi Jawa, Nasi Goreng variations, Soto Ayam, and Ikan Fillet.",
    15.0,  // Estimated Min Price: Kentang Goreng 15k
    35.0,  // Estimated Max Price: Nasi Goreng Seafood / Ikan Fillet 35k
    27.6,  // Estimated Average Price
    GOPArea.foodcourt,  // Assuming GOPArea based on relative position, placehr
    "NYANDOE KITCHEN",
    [
        // Prices are estimated
        (
            "Ayam Penyet", 28.0, "Smashed fried chicken with sambal",
            "non-vegetarian", "ayam_penyet_nyandoe", .indonesian
        ),
        (
            "Ayam Kalasan", 30.0,
            "Sweet marinated fried/grilled chicken (Kalasan style)",
            "non-vegetarian", "ayam_kalasan_nyandoe", .javanese
        ),
        (
            "Bakmi Godok Jawa", 25.0, "Javanese boiled noodles",
            "non-vegetarian", "bakmi_godok_jawa_nyandoe", .javanese
        ),
        (
            "Bakmi Goreng Jawa", 25.0, "Javanese fried noodles",
            "non-vegetarian", "bakmi_goreng_jawa_nyandoe", .javanese
        ),
        (
            "Nasi Goreng Gila", 30.0, "'Crazy' fried rice with mixed toppings",
            "non-vegetarian", "nasi_goreng_gila_nyandoe", .indonesian
        ),
        (
            "Nasi Goreng Seafood", 35.0, "Seafood fried rice", "non-vegetarian",
            "nasi_goreng_seafood_nyandoe", .indonesian
        ),
        (
            "Nasi Goreng Cabe Ijo", 28.0, "Green chili fried rice",
            "non-vegetarian", "nasi_goreng_cabe_ijo_nyandoe", .indonesian
        ),
        (
            "Soto Ayam", 25.0, "Indonesian chicken soup", "non-vegetarian",
            "soto_ayam_nyandoe", .indonesian
        ),
        (
            "Ikan Fillet Saus Rica-Rica", 35.0,
            "Fish fillet with spicy rica-rica sauce", "non-vegetarian",
            "ikan_fillet_rica_nyandoe", .indonesian
        ),
        (
            "Kentang Goreng", 15.0, "French fries", "vegetarian",
            "kentang_goreng_nyandoe", .western
        ),
    ]
)

// Stall 3: Mie Kocok Bandung Marika
let mieKocokMarikaStallData: StallData = (
    "Mie Kocok Bandung Marika",
    "Specializes in Bandung-style Mie Kocok (beef noodle soup with tendon/kikil) and variations with meatballs or tripe. Also serves Mie Yamin and drinks.",
    3.0,  // Estimated Min Price: Kerupuk 3k
    45.0,  // Estimated Max Price: Mie Kocok Komplit 45k
    30.09,  // Estimated Average Price
    GOPArea.foodcourt,  // Assuming GOPArea based on relative position, placehr
    "MIE KOCOK BANDUNG MARIKA",
    [
        // Prices are estimated
        (
            "Mie Kocok Biasa", 30.0,
            "Standard Bandung beef noodle soup with kikil", "non-vegetarian",
            "mie_kocok_biasa_marika", .sundanese
        ),
        (
            "Mie Kocok Bakso", 35.0, "Mie Kocok with meatballs",
            "non-vegetarian", "mie_kocok_bakso_marika", .sundanese
        ),
        (
            "Mie Kocok Babat", 35.0, "Mie Kocok with beef tripe",
            "non-vegetarian", "mie_kocok_babat_marika", .sundanese
        ),
        (
            "Mie Kocok Spesial", 40.0,
            "Special Mie Kocok (likely more toppings)", "non-vegetarian",
            "mie_kocok_spesial_marika", .sundanese
        ),
        (
            "Mie Kocok Komplit", 45.0,
            "Complete Mie Kocok (likely bakso, babat, kikil)", "non-vegetarian",
            "mie_kocok_komplit_marika", .sundanese
        ),
        (
            "Mie Yamin Asin/Manis", 25.0, "Savory or Sweet soy sauce noodles",
            "non-vegetarian", "mie_yamin_marika", .indonesian
        ),
        (
            "Mie Baso Kuah/Yamin", 30.0,
            "Meatball noodles (soup or yamin style)", "non-vegetarian",
            "mie_baso_marika", .indonesian
        ),
        (
            "Baso Kuah", 25.0, "Meatball soup", "non-vegetarian",
            "baso_kuah_marika", .indonesian
        ),
        (
            "Aneka Jus Buah", 15.0, "Various fruit juices", "vegetarian",
            "aneka_jus_marika", .indonesian
        ),
        (
            "Aneka Minuman Dingin", 8.0, "Various cold drinks", "vegetarian",
            "minuman_dingin_marika", .indonesian
        ),
        (
            "Kerupuk", 3.0, "Crackers", "vegetarian", "kerupuk_marika",
            .indonesian
        ),
    ]
)

// Stall 4: Dapur Kepo x Mie Jago
let dapurKepoMieJagoStallData: StallData = (
    "Dapur Kepo x Mie Jago",
    "Collaboration stall offering Dapur Kepo's Tongseng, Madura-style duck/chicken, and Mie Jago's chicken, beef, and goat noodles. Also serves squash drinks.",
    1.0,  // Min Price: Air Mineral Gelas 1k
    40.0,  // Max Price: Paket Tongseng Iga Sapi 40k
    21.08,  // Average Price (calculated from listed items)
    GOPArea.foodcourt,  // Assuming GOPArea based on relative position, placehr
    "DAPUR KEPO X MIE JAGO",
    [
        // Mie Aja
        (
            "Mie Ayam (Aja)", 17.0, "Chicken noodles only", "non-vegetarian",
            "mie_ayam_aja_jago", .indonesian
        ),
        (
            "Mie Sapi (Aja)", 20.0, "Beef noodles only", "non-vegetarian",
            "mie_sapi_aja_jago", .indonesian
        ),
        (
            "Mie Kambing (Aja)", 20.0, "Goat noodles only", "non-vegetarian",
            "mie_kambing_aja_jago", .indonesian
        ),
        // Paket Mie
        (
            "Paket Mie Ayam", 20.0, "Chicken noodle set", "non-vegetarian",
            "paket_mie_ayam_jago", .indonesian
        ),
        (
            "Paket Mie Sapi", 25.0, "Beef noodle set", "non-vegetarian",
            "paket_mie_sapi_jago", .indonesian
        ),
        (
            "Paket Mie Kambing", 25.0, "Goat noodle set", "non-vegetarian",
            "paket_mie_kambing_jago", .indonesian
        ),
        // Paket Mie Komplit
        (
            "Mie Ayam Komplit", 26.0, "Complete chicken noodle set",
            "non-vegetarian", "mie_ayam_komplit_jago", .indonesian
        ),
        (
            "Mie Sapi Komplit", 30.0, "Complete beef noodle set",
            "non-vegetarian", "mie_sapi_komplit_jago", .indonesian
        ),
        (
            "Mie Kambing Komplit", 30.0, "Complete goat noodle set",
            "non-vegetarian", "mie_kambing_komplit_jago", .indonesian
        ),
        // Dapur Kepo Paket
        (
            "Paket Tongseng Ayam/Kambing", 32.0,
            "Chicken/Goat tongseng stew set", "non-vegetarian",
            "paket_tongseng_ayam_kambing_kepo", .javanese
        ),
        (
            "Paket Tongseng Iga Sapi", 40.0, "Beef rib tongseng stew set",
            "non-vegetarian", "paket_tongseng_iga_kepo", .javanese
        ),
        (
            "Paket Tongseng Kepala Ayam", 25.0,
            "Chicken head tongseng stew set", "non-vegetarian",
            "paket_tongseng_kepala_ayam_kepo", .javanese
        ),
        (
            "Paket Bebek Madura", 35.0, "Madura-style duck set",
            "non-vegetarian", "paket_bebek_madura_kepo", .javanese
        ),
        (
            "Paket Ayam Madura", 30.0, "Madura-style chicken set",
            "non-vegetarian", "paket_ayam_madura_kepo", .javanese
        ),
        // Minuman
        (
            "Melon Squash", 15.0, "Melon flavored squash drink", "vegetarian",
            "melon_squash_kepo", .indonesian
        ),
        (
            "Orange Squash", 15.0, "Orange flavored squash drink", "vegetarian",
            "orange_squash_kepo", .indonesian
        ),
        (
            "Leci Squash", 15.0, "Lychee flavored squash drink", "vegetarian",
            "leci_squash_kepo", .indonesian
        ),
        (
            "Lemon Squash", 15.0, "Lemon flavored squash drink", "vegetarian",
            "lemon_squash_kepo", .indonesian
        ),
        (
            "Mangga Squash", 15.0, "Mango flavored squash drink", "vegetarian",
            "mangga_squash_kepo", .indonesian
        ),
        (
            "Strawberry Squash", 15.0, "Strawberry flavored squash drink",
            "vegetarian", "strawberry_squash_kepo", .indonesian
        ),
        (
            "Fresh Juice Alpukat", 15.0, "Fresh avocado juice", "vegetarian",
            "juice_alpukat_kepo", .indonesian
        ),
        (
            "Air Mineral Gelas", 1.0, "Mineral water cup", "vegetarian",
            "air_mineral_gelas_kepo", .indonesian
        ),
        (
            "Air Mineral Botol", 5.0, "Bottled mineral water", "vegetarian",
            "air_mineral_botol_kepo", .indonesian
        ),
        (
            "Teh Botol (Kotak/Botol)", 5.0,
            "Bottled/Carton tea (Teh Botol brand)", "vegetarian",
            "teh_botol_kepo", .indonesian
        ),
        (
            "Sprite/Fanta (Kaleng/Botol)", 7.0,
            "Canned/Bottled Sprite or Fanta", "vegetarian",
            "sprite_fanta_kepo", .western
        ),
        (
            "Teh Manis (Panas/Dingin)", 5.0, "Sweet tea (hot/iced)",
            "vegetarian", "teh_manis_kepo", .indonesian
        ),
    ]
)

// Stall 5: Kantin 28
let kantin28StallData: StallData = (
    "Kantin 28",
    "Halal stall offering Japanese-inspired meals (Katsu, Teriyaki, Ebi Furai), Indonesian favorites (Pempek, Tekwan, Sop Iga), snacks (Gorengan, Pisang Bakar), instant noodles, and drinks.",
    2.0,  // Min Price: Gorengan 2k
    40.0,  // Max Price: Paket Hemat A 40k
    16.06,  // Average Price (calculated from listed items)
    GOPArea.foodcourt,  // Assuming GOPArea based on relative position, placehr
    "KANTIN 28",
    [
        // Paket 20k Choices (Base price 20k includes Nasi Putih)
        (
            "Paket Chicken Katsu", 20.0, "Chicken cutlet set with rice",
            "non-vegetarian", "paket_chicken_katsu_20k", .japanese
        ),
        (
            "Paket Dori Katsu", 20.0, "Dory fish cutlet set with rice",
            "non-vegetarian", "paket_dori_katsu_20k", .japanese
        ),
        (
            "Paket Ebi Furai", 20.0, "Fried shrimp set with rice",
            "non-vegetarian", "paket_ebi_furai_20k", .japanese
        ),
        (
            "Paket Chicken Teriyaki", 20.0, "Chicken teriyaki set with rice",
            "non-vegetarian", "paket_chicken_teriyaki_20k", .japanese
        ),
        (
            "Paket Karaage", 20.0, "Japanese fried chicken set with rice",
            "non-vegetarian", "paket_karaage_20k", .japanese
        ),
        // Paket 25k Choices (Base price 25k includes Nasi Putih)
        (
            "Paket Katsu + Ebi Furai", 25.0,
            "Chicken/Dory Katsu + Ebi Furai set with rice", "non-vegetarian",
            "paket_katsu_ebi_furai_25k", .japanese
        ),
        (
            "Paket Katsu + Scramble Egg", 25.0,
            "Chicken/Dory Katsu + Scrambled Egg set with rice",
            "non-vegetarian", "paket_katsu_scramble_25k", .japanese
        ),
        (
            "Paket Beef Teriyaki", 25.0, "Beef teriyaki set with rice",
            "non-vegetarian", "paket_beef_teriyaki_25k", .japanese
        ),
        (
            "Paket Karaage Salted Egg", 25.0,
            "Salted egg fried chicken set with rice", "non-vegetarian",
            "paket_karaage_salted_egg_25k", .japanese
        ),
        // Paket 30k Choices
        (
            "Paket Chicken Steak", 30.0, "Chicken steak set", "non-vegetarian",
            "paket_chicken_steak_30k", .western
        ),
        (
            "Paket BBQ Chicken Wings + FF", 30.0,
            "BBQ chicken wings with french fries set", "non-vegetarian",
            "paket_bbq_wings_30k", .western
        ),
        (
            "Paket Chicken Katsu Don", 30.0,
            "Chicken cutlet rice bowl set with rice", "non-vegetarian",
            "paket_chicken_katsu_don_30k", .japanese
        ),
        // Paket Hemat
        (
            "Paket Hemat A", 40.0,
            "Beef Teriyaki + Dori Katsu + Ebi Furai + Rice", "non-vegetarian",
            "paket_hemat_a", .japanese
        ),
        (
            "Paket Hemat B", 35.0, "Beef Teriyaki + Karaage + Ebi Furai + Rice",
            "non-vegetarian", "paket_hemat_b", .japanese
        ),
        (
            "Paket Hemat C", 30.0,
            "Chicken Teriyaki + Dori Katsu + Ebi Furai + Rice",
            "non-vegetarian", "paket_hemat_c", .japanese
        ),
        // Pempek/Tekwan
        (
            "Pempek Lenjer", 23.0, "Long cylindrical fishcake",
            "non-vegetarian", "pempek_lenjer_k28", .indonesian
        ),
        (
            "Pempek Kapal Selam", 23.0, "Submarine fishcake (with egg)",
            "non-vegetarian", "pempek_kapal_selam_k28", .indonesian
        ),
        (
            "Pempek Kecil isi 3", 23.0, "Small fishcakes (3 pcs, mixed types)",
            "non-vegetarian", "pempek_kecil_k28", .indonesian
        ),
        (
            "Tekwan", 23.0, "Fishcake soup with mushrooms and noodles",
            "non-vegetarian", "tekwan_k28", .indonesian
        ),
        (
            "Lenggang Goreng", 25.0, "Fried fishcake omelette",
            "non-vegetarian", "lenggang_goreng_k28", .indonesian
        ),
        // Others
        (
            "Sosis + French Fries", 25.0, "Sausage and french fries",
            "non-vegetarian", "sosis_ff_k28", .western
        ),  // Estimated price
        (
            "Sop Iga + Nasi Putih", 35.0, "Beef rib soup with rice",
            "non-vegetarian", "sop_iga_k28", .indonesian
        ),  // Estimated price
        (
            "Otak-Otak Pisang Coklat", 3.0,
            "Grilled fishcake snack (Pisang Coklat flavor?)", "non-vegetarian",
            "otak_pisang_coklat", .indonesian
        ),  // Flavor name unusual
        (
            "Otak-Otak Singapore", 6.0, "Singapore-style grilled fishcake",
            "non-vegetarian", "otak_singapore", .indonesian
        ),
        (
            "Otak-Otak Baksto", 3.0, "Grilled fishcake snack (Bakso flavor?)",
            "non-vegetarian", "otak_baksto", .indonesian
        ),  // Flavor name unusual
        (
            "Gorengan (Tape/Pisang/Ubi/Martabak)", 2.0,
            "Fried snacks (fermented cassava/banana/sweet potato/martabak)",
            "vegetarian", "gorengan_k28", .indonesian
        ),  // Martabak might be non-veg
        // Nugget Pisang / Bakar
        (
            "Nugget Pisang/Pisang Bakar Original", 10.0,
            "Original banana nuggets / grilled banana", "vegetarian",
            "pisang_original_k28", .indonesian
        ),
        (
            "Nugget Pisang/Pisang Bakar 1 Topping", 12.0,
            "Banana nuggets/grilled banana with 1 topping", "vegetarian",
            "pisang_1_topping_k28", .indonesian
        ),
        (
            "Nugget Pisang/Pisang Bakar 2 Topping", 15.0,
            "Banana nuggets/grilled banana with 2 toppings", "vegetarian",
            "pisang_2_topping_k28", .indonesian
        ),
        (
            "Nugget Pisang/Pisang Bakar 3 Topping", 18.0,
            "Banana nuggets/grilled banana with 3 toppings", "vegetarian",
            "pisang_3_topping_k28", .indonesian
        ),
        // Drinks
        (
            "Aqua/Teh Pucuk", 5.0, "Mineral water / Bottled jasmine tea",
            "vegetarian", "aqua_teh_pucuk_k28", .indonesian
        ),
        (
            "Coca Cola/Sprite/Fanta", 8.0, "Canned soft drinks", "vegetarian",
            "coke_sprite_fanta_k28", .western
        ),
        // Mi Instan (from small sign)
        (
            "Mi Instan Goreng/Rebus", 10.0, "Instant noodles (fried/boiled)",
            "vegetarian", "mi_instan_k28", .indonesian
        ),  // Base is veg
        (
            "Mi Instan + Telur", 13.0, "Instant noodles with egg", "vegetarian",
            "mi_instan_telur_k28", .indonesian
        ),
        (
            "Mi Instan + Kornet", 15.0, "Instant noodles with corned beef",
            "non-vegetarian", "mi_instan_kornet_k28", .indonesian
        ),
        (
            "Mi Instan + Sosis", 15.0, "Instant noodles with sausage",
            "non-vegetarian", "mi_instan_sosis_k28", .indonesian
        ),
        // Minuman (from small sign)
        (
            "Teh Manis", 5.0, "Sweet tea", "vegetarian", "teh_manis_k28",
            .indonesian
        ),
        (
            "Jeruk", 8.0, "Orange drink (likely iced)", "vegetarian",
            "jeruk_k28", .indonesian
        ),
        (
            "Lemon Tea", 8.0, "Lemon tea (likely iced)", "vegetarian",
            "lemon_tea_k28", .western
        ),
        (
            "Kopi Hitam/Susu", 7.0, "Black coffee / Coffee with milk",
            "vegetarian", "kopi_k28", .indonesian
        ),
        (
            "Nutrisari", 5.0, "Instant fruit drink sachet", "vegetarian",
            "nutrisari_k28", .indonesian
        ),
        (
            "Good Day", 5.0, "Instant coffee mix sachet", "vegetarian",
            "good_day_k28", .indonesian
        ),
    ]
)

// Stall 6: Kedai Wakari
let kedaiWakariStallData: StallData = (
    "Kedai Wakari",
    "Simple eatery offering Indonesian staples like Ketoprak, Gado-Gado, Soto Lamongan, Mie Ayam, Ayam Penyet, Bakso, Indomie, snacks, and drinks.",
    3.0,  // Min Price: Aneka gorengan 3k
    25.0,  // Max Price: Ketoprak, Gado-Gado, Nasi Soto Lamongan 25k
    14.82,  // Average Price (calculated from listed items)
    GOPArea.foodcourt,  // Assuming GOPArea based on relative position, placehr
    "KEDAI WAKARI",
    [
        (
            "Ketoprak biasa/indomie", 25.0,
            "Tofu, rice cake, noodles salad with peanut sauce (plain or with Indomie)",
            "vegetarian", "ketoprak_wakari", .indonesian
        ),
        (
            "Gado-Gado Lontong/Nasi", 25.0,
            "Vegetable salad with peanut sauce, served with rice cake or rice",
            "vegetarian", "gado_gado_wakari", .indonesian
        ),
        (
            "Nasi Soto Lamongan", 25.0, "Lamongan-style chicken soup with rice",
            "non-vegetarian", "nasi_soto_lamongan_wakari", .javanese
        ),
        (
            "Mie Ayam Pangsit", 15.0, "Chicken noodles with wonton",
            "non-vegetarian", "mie_ayam_pangsit_wakari", .indonesian
        ),
        (
            "Nasi Ayam Penyet", 20.0,
            "Smashed fried chicken with rice and sambal", "non-vegetarian",
            "nasi_ayam_penyet_wakari", .indonesian
        ),
        (
            "Bakso Kuah Kaldu", 15.0, "Meatball soup in broth",
            "non-vegetarian", "bakso_kuah_wakari", .indonesian
        ),
        // Minuman Panas (All 5k)
        (
            "Aneka Kopi Panas", 5.0, "Hot coffee (various instant brands)",
            "vegetarian", "kopi_panas_wakari", .indonesian
        ),
        (
            "Jahe Merah Panas", 5.0, "Hot red ginger drink", "vegetarian",
            "jahe_merah_wakari", .indonesian
        ),
        (
            "Teh Manis/Tawar Panas", 5.0, "Hot sweet/plain tea", "vegetarian",
            "teh_panas_wakari", .indonesian
        ),
        // Others
        (
            "Aneka Indomie", 8.0, "Instant noodles (various flavors)",
            "vegetarian", "indomie_wakari", .indonesian
        ),  // Base is veg
        (
            "Aneka Indomie + Telor", 12.0, "Instant noodles with egg",
            "vegetarian", "indomie_telor_wakari", .indonesian
        ),
        (
            "Aneka Gorengan", 3.0, "Various fried snacks", "vegetarian",
            "gorengan_wakari", .indonesian
        ),  // Could be non-veg depending on type
    ]
)

let dapurKencanaStallData: StallData = (
    "Dapur Kencana",
    "Restaurant offering a wide variety of Indonesian dishes, including Prasmanan (buffet-style), snacks (Cemilan), main courses, soups, chicken specialties, and breakfast items.",
    3.5,  // Min Price: Aneka Gorengan 3.5k
    44.0,  // Max Price: Soto Daging Garang Asem Set 44k
    18.96,  // Average Price (calculated from all listed items, using lower price for ranges/ala carte)
    GOPArea.gop1,  // Assuming GOPArea based on relative position, placeholder
    "DAPUR KENCANA",
    [
        // Prasmanan Menu
        (
            "Nasi Putih (Prasmanan)", 6.0, "Plain white rice (buffet)",
            "vegetarian", "nasi_putih_dk.jpg", .indonesian
        ),
        (
            "Nasi Uduk (Prasmanan)", 8.0, "Coconut milk rice (buffet)",
            "vegetarian", "nasi_uduk_dk.jpg", .indonesian
        ),
        (
            "1 Aneka Olahan Telur", 8.5, "1 portion of egg dish (buffet)",
            "vegetarian", "olahan_telur_dk.jpg", .indonesian
        ),
        (
            "1 Aneka Olahan Sayur", 6.5, "1 portion of vegetable dish (buffet)",
            "vegetarian", "olahan_sayur_dk.jpg", .indonesian
        ),
        (
            "1 Aneka Olahan Ayam / Ikan", 13.5,
            "1 portion of chicken/fish dish (buffet)", "non-vegetarian",
            "olahan_ayam_ikan_dk.jpg", .indonesian
        ),
        (
            "1 Aneka Olahan Daging Sapi / Cumi / Udang", 18.5,
            "1 portion of beef/squid/shrimp dish (buffet)", "non-vegetarian",
            "olahan_daging_dk.jpg", .indonesian
        ),
        (
            "1 Aneka Gorengan", 3.5, "1 portion of fried snacks (buffet)",
            "vegetarian", "gorengan_dk.jpg", .indonesian
        ),  // Could be non-veg
        (
            "1 Semur Kentang / Tahu", 5.0,
            "1 portion of potato/tofu stew (buffet)", "vegetarian",
            "semur_kentang_tahu_dk.jpg", .indonesian
        ),

        // Minuman (Prasmanan Menu)
        (
            "Es Teh / Panas Tawar", 5.0, "Iced/Hot plain tea", "vegetarian",
            "teh_tawar_dk.jpg", .indonesian
        ),
        (
            "Es Teh / Panas Manis", 7.0, "Iced/Hot sweet tea", "vegetarian",
            "teh_manis_dk.jpg", .indonesian
        ),
        (
            "Es Ocha / Panas Ocha", 5.0, "Iced/Hot Ocha tea", "vegetarian",
            "ocha_dk.jpg", .japanese
        ),
        (
            "Air Mineral (Prasmanan)", 5.0, "Mineral water", "vegetarian",
            "air_mineral_dk.jpg", .indonesian
        ),
        (
            "Hot/Ice Coffee Tubruk", 8.0, "Hot/Iced coarse ground coffee",
            "vegetarian", "kopi_tubruk_dk.jpg", .indonesian
        ),
        (
            "Hot/Ice Coffee Drip", 15.0, "Hot/Iced drip coffee", "vegetarian",
            "kopi_drip_dk.jpg", .western
        ),

        // Cemilan Menu
        (
            "Japchae", 15.0, "Korean glass noodle stir fry", "vegetarian",
            "japchae_dk.jpg", .korean
        ),  // Often contains meat, but can be veg
        (
            "Martabak Goreng", 14.0, "Fried savory pancake", "non-vegetarian",
            "martabak_goreng_dk.jpg", .indonesian
        ),
        (
            "Chicken Ball", 15.0, "Chicken meatballs", "non-vegetarian",
            "chicken_ball_dk.jpg", .chinese
        ),
        (
            "Spring Roll", 9.0, "Fried spring rolls", "vegetarian",
            "spring_roll_dk.jpg", .chinese
        ),  // Filling might vary
        (
            "French Fries", 19.0, "French fries", "vegetarian",
            "french_fries_dk.jpg", .western
        ),
        (
            "Corndog Sosis", 7.0, "Sausage corn dog (per piece)",
            "non-vegetarian", "corndog_sosis_dk.jpg", .western
        ),
        (
            "Tteokbokki", 14.0, "Korean spicy rice cakes", "vegetarian",
            "tteokbokki_dk.jpg", .korean
        ),
        (
            "Chicken Crispy Original", 17.0, "Original crispy chicken snack",
            "non-vegetarian", "chicken_crispy_original_dk.jpg", .western
        ),
        (
            "Chicken Crispy Orange / Gochujang", 20.0,
            "Crispy chicken snack with orange or gochujang sauce",
            "non-vegetarian", "chicken_crispy_sauce_dk.jpg", .western
        ),  // Gochujang is Korean
        (
            "Apple Pie", 7.5, "Apple pie slice", "vegetarian",
            "apple_pie_dk.jpg", .western
        ),
        (
            "Siomai", 15.0, "Steamed fish/meat dumplings", "non-vegetarian",
            "siomai_dk.jpg", .chinese
        ),  // Often fish/shrimp

        // Daftar Menu (Main Dishes)
        (
            "Tongseng Daging Sapi Ala", 28.0, "Beef tongseng stew (a la carte)",
            "non-vegetarian", "tongseng_sapi_ala_dk.jpg", .javanese
        ),
        (
            "Tongseng Daging Sapi Set", 33.0,
            "Beef tongseng stew set (with rice)", "non-vegetarian",
            "tongseng_sapi_set_dk.jpg", .javanese
        ),
        (
            "Soto Ayam Bening Ala", 21.0, "Clear chicken soup (a la carte)",
            "non-vegetarian", "soto_ayam_bening_ala_dk.jpg", .indonesian
        ),
        (
            "Soto Ayam Bening Set", 26.0, "Clear chicken soup set (with rice)",
            "non-vegetarian", "soto_ayam_bening_set_dk.jpg", .indonesian
        ),
        (
            "Soto Daging Garang Asem Ala", 39.0,
            "Spicy & sour beef soup (a la carte)", "non-vegetarian",
            "soto_garang_asem_ala_dk.jpg", .javanese
        ),
        (
            "Soto Daging Garang Asem Set", 44.0,
            "Spicy & sour beef soup set (with rice)", "non-vegetarian",
            "soto_garang_asem_set_dk.jpg", .javanese
        ),
        (
            "Chicken Katsu Ala", 23.0, "Chicken cutlet (a la carte)",
            "non-vegetarian", "chicken_katsu_ala_dk.jpg", .japanese
        ),
        (
            "Chicken Katsu Set", 28.0, "Chicken cutlet set (with rice)",
            "non-vegetarian", "chicken_katsu_set_dk.jpg", .japanese
        ),
        (
            "Soto Betawi Ayam Ala", 22.0,
            "Betawi-style coconut milk chicken soup (a la carte)",
            "non-vegetarian", "soto_betawi_ayam_ala_dk.jpg", .indonesian
        ),
        (
            "Soto Betawi Ayam Set", 27.0,
            "Betawi-style coconut milk chicken soup set (with rice)",
            "non-vegetarian", "soto_betawi_ayam_set_dk.jpg", .indonesian
        ),
        (
            "Soto Betawi Daging Ala", 31.0,
            "Betawi-style coconut milk beef soup (a la carte)",
            "non-vegetarian", "soto_betawi_daging_ala_dk.jpg", .indonesian
        ),
        (
            "Soto Betawi Daging Set", 36.0,
            "Betawi-style coconut milk beef soup set (with rice)",
            "non-vegetarian", "soto_betawi_daging_set_dk.jpg", .indonesian
        ),
        (
            "Sop Daging Ala", 34.0, "Beef soup (a la carte)", "non-vegetarian",
            "sop_daging_ala_dk.jpg", .indonesian
        ),
        (
            "Sop Daging Set", 39.0, "Beef soup set (with rice)",
            "non-vegetarian", "sop_daging_set_dk.jpg", .indonesian
        ),
        (
            "Garang Asem Ayam Ala", 24.0,
            "Spicy & sour chicken dish (a la carte)", "non-vegetarian",
            "garang_asem_ayam_ala_dk.jpg", .javanese
        ),
        (
            "Garang Asem Ayam Set", 30.0,
            "Spicy & sour chicken dish set (with rice)", "non-vegetarian",
            "garang_asem_ayam_set_dk.jpg", .javanese
        ),
        (
            "Gulai Ayam Ala", 24.0, "Chicken curry (a la carte)",
            "non-vegetarian", "gulai_ayam_ala_dk.jpg", .indonesian
        ),
        (
            "Gulai Ayam Set", 30.0, "Chicken curry set (with rice)",
            "non-vegetarian", "gulai_ayam_set_dk.jpg", .indonesian
        ),
        (
            "Chicken / Dori Katsu Nabe Original Ala", 28.0,
            "Chicken/Dory cutlet hot pot (original, a la carte)",
            "non-vegetarian", "katsu_nabe_original_ala_dk.jpg", .japanese
        ),
        (
            "Chicken / Dori Katsu Nabe Original Set", 33.0,
            "Chicken/Dory cutlet hot pot (original, set)", "non-vegetarian",
            "katsu_nabe_original_set_dk.jpg", .japanese
        ),
        (
            "Chicken / Dori Katsu Nabe Sweet Chili Ala", 31.0,
            "Chicken/Dory cutlet hot pot (sweet chili, a la carte)",
            "non-vegetarian", "katsu_nabe_sweet_chili_ala_dk.jpg", .japanese
        ),
        (
            "Chicken / Dori Katsu Nabe Sweet Chili Set", 36.0,
            "Chicken/Dory cutlet hot pot (sweet chili, set)", "non-vegetarian",
            "katsu_nabe_sweet_chili_set_dk.jpg", .japanese
        ),
        (
            "Chicken / Dori Katsu Nabe Spicy Ala", 33.0,
            "Chicken/Dory cutlet hot pot (spicy, a la carte)", "non-vegetarian",
            "katsu_nabe_spicy_ala_dk.jpg", .japanese
        ),
        (
            "Chicken / Dori Katsu Nabe Spicy Set", 38.0,
            "Chicken/Dory cutlet hot pot (spicy, set)", "non-vegetarian",
            "katsu_nabe_spicy_set_dk.jpg", .japanese
        ),
        (
            "Ayam Serundeng Ala", 22.0,
            "Fried chicken with spiced coconut flakes (a la carte)",
            "non-vegetarian", "ayam_serundeng_ala_dk.jpg", .indonesian
        ),
        (
            "Ayam Serundeng Set", 35.0,
            "Fried chicken with spiced coconut flakes set (with rice)",
            "non-vegetarian", "ayam_serundeng_set_dk.jpg", .indonesian
        ),  // Price seems high for set, check image
        (
            "Ayam Goreng Kremes Ala", 24.0,
            "Fried chicken with crispy bits (a la carte)", "non-vegetarian",
            "ayam_kremes_ala_dk.jpg", .indonesian
        ),
        (
            "Ayam Goreng Kremes Set", 38.0,
            "Fried chicken with crispy bits set (with rice)", "non-vegetarian",
            "ayam_kremes_set_dk.jpg", .indonesian
        ),  // Price seems high for set, check image
        (
            "Gado-Gado", 23.0, "Vegetable salad with peanut sauce",
            "vegetarian", "gado_gado_dk.jpg", .indonesian
        ),
        (
            "Sate Ayam", 27.0, "Chicken satay", "non-vegetarian",
            "sate_ayam_dk.jpg", .indonesian
        ),
        (
            "Bakmie Goreng Spesial", 29.0, "Special fried noodles",
            "non-vegetarian", "bakmie_goreng_spesial_dk.jpg", .indonesian
        ),
        (
            "Bakso Sapi", 23.0, "Beef meatball soup", "non-vegetarian",
            "bakso_sapi_dk.jpg", .indonesian
        ),
        (
            "Nasi Goreng Spesial", 25.0, "Special fried rice", "non-vegetarian",
            "nasi_goreng_spesial_dk.jpg", .indonesian
        ),

        // Sarapan Pagi Menu
        (
            "Beef Sandwich", 24.0, "Beef sandwich", "non-vegetarian",
            "beef_sandwich_dk.jpg", .western
        ),
        (
            "Bakmie Ayam Pangsit", 20.0,
            "Chicken noodles with wonton (breakfast)", "non-vegetarian",
            "bakmie_ayam_pangsit_dk.jpg", .indonesian
        ),
        (
            "Nasi Uduk Telur Balado", 20.0,
            "Coconut rice with egg in chili sauce", "vegetarian",
            "nasi_uduk_telur_balado_dk.jpg", .indonesian
        ),
        (
            "Bubur Jepang", 17.0, "Japanese rice porridge", "non-vegetarian",
            "bubur_jepang_dk.jpg", .japanese
        ),  // Usually contains chicken/dashi
        (
            "American Breakfast", 29.0, "American breakfast set",
            "non-vegetarian", "american_breakfast_dk.jpg", .western
        ),
        (
            "Lontong Sayur", 18.0, "Rice cakes with vegetable curry",
            "vegetarian", "lontong_sayur_dk.jpg", .indonesian
        ),  // Can be non-veg if broth used
        (
            "Sandwich Ragout", 19.0, "Sandwich with ragout filling",
            "non-vegetarian", "sandwich_ragout_dk.jpg", .western
        ),  // Ragout usually meat-based
    ]
)

// Note: Descriptions, dietary tags, image names, GOP Area, and menu types are inferred or placeholders. Prices for Ayam Serundeng Set and Ayam Goreng Kremes Set seem high compared to ala carte; used listed price but might be typo on menu. Dietary tags assume common preparations (e.g., Japchae often has meat, Lontong Sayur broth might not be veg). Buffet item prices are per portion.

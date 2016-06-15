//
//  MusicDataSource.swift
//  Jtabs
//
//  Created by High Jumper on 10/15/16.
//  Copyright © 2016 High Jumper. All rights reserved.
//

import Foundation

class MusicDataSource {
    static var playlists: [Playlist] = [
        Playlist(titleName: "Favorites",
                 songs: [Song(title: "Song",
                              artist: Artist(name: "legend", coverArt: "Default"),
                              chords: "altira")])]
    
    static var artists : [Artist]! {
        if _artists == nil {
            initialize()
        }
        return _artists!
    }
    
    static var songs : [Song]! {
        if _songs == nil {
            initialize()
        }
        return _songs!
    }
    
    
    private static var _artists : [Artist]?
    private static var _songs : [Song]?
    
    private init() {}
    
    static func initialize() {
        _songs = [Song]()
        _artists = [Artist]()
        
        var newSongs : [Song]!
        var newArtist : Artist!
        
        newSongs = [Song(title: "Acheinu", chords: "acheinuabierotenberg")]
        newArtist = Artist(name: "Abie Rotenberg", songs: newSongs, coverArt:"abierotenberg")
        _songs!.append(contentsOf: newSongs)
        _artists!.append(newArtist)
        
        newSongs = [Song(title: "Lecha Dodi", chords: "lechadodibaruchlevine"), Song(title: "Vehu Keili", chords: "vehukeili"), Song(title: "Vizakeini", chords: "vizakeini")]
        newArtist = Artist(name: "Baruch Levine", songs: newSongs, coverArt:"baruchlevine")
        _songs!.append(contentsOf: newSongs)
        _artists!.append(newArtist)
        
        newSongs = [Song(title: "Ein Aroch Lecha", chords: "einarochlecha")]
        newArtist = Artist(name: "Belz", songs: newSongs, coverArt:"belz")
        _songs!.append(contentsOf: newSongs)
        _artists!.append(newArtist)
        
        newSongs = [Song(title: "B’sheim Hashem", chords: "bsheimhashembennyfriedman"), Song(title: "Yesh Tikvah", chords: "yeshtikvah")]
        newArtist = Artist(name: "Benny Friedman", songs: newSongs, coverArt:"bennyfriedman")
        _songs!.append(contentsOf: newSongs)
        _artists!.append(newArtist)
        
        newSongs = [Song(title: "Oz Vehadar", chords: "ozvehadar")]
        newArtist = Artist(name: "Breslov", songs: newSongs, coverArt:"breslov")
        _songs!.append(contentsOf: newSongs)
        _artists!.append(newArtist)
        
        newSongs = [Song(title: "Anim Zemiros", chords: "animzemiros"), Song(title: "Chabadsker Niggun", chords: "chabadskerniggun"), Song(title: "Keli Ata", chords: "keliata"), Song(title: "Utzu Eitza", chords: "utzueitza"), Song(title: "Yifrach", chords: "yifrach")]
        newArtist = Artist(name: "Chabad", songs: newSongs, coverArt:"chabad")
        _songs!.append(contentsOf: newSongs)
        _artists!.append(newArtist)
        
        newSongs = [Song(title: "Odcha", chords: "odchathechevra"), Song(title: "Shema", chords: "shemathechevra")]
        newArtist = Artist(name: "The Chevra", songs: newSongs, coverArt:"thechevra")
        _songs!.append(contentsOf: newSongs)
        _artists!.append(newArtist)
        
        newSongs = [Song(title: "Haben Yakir Li", chords: "habenyakirli"), Song(title: "Lev Tahor", chords: "levtahor"), Song(title: "Na’ar Hayiti", chords: "naarhayiti"), Song(title: "Shema Koleinu", chords: "shemakoleinu")]
        newArtist = Artist(name: "D'veykus", songs: newSongs, coverArt:"dveykus")
        _songs!.append(contentsOf: newSongs)
        _artists!.append(newArtist)
        
        newSongs = [Song(title: "Havdalah", chords: "havdalah")]
        newArtist = Artist(name: "Debbie Friedman", songs: newSongs, coverArt:"debbiefriedman")
        _songs!.append(contentsOf: newSongs)
        _artists!.append(newArtist)
        
        newSongs = [Song(title: "Ani L’dodi", chords: "anildodi"), Song(title: "Boruch Hu", chords: "boruchhu"), Song(title: "Dminor Niggun", chords: "dminorniggun"), Song(title: "Elul Nigun", chords: "elulnigun"), Song(title: "Kol Atzmosai", chords: "kolatzmosai"), Song(title: "L’maancha", chords: "lmaancha"), Song(title: "Nigun", chords: "nigun"), Song(title: "Od Yishama", chords: "odyishamaeitankatz"), Song(title: "Ye’erav Na", chords: "yeeravna")]
        newArtist = Artist(name: "Eitan Katz", songs: newSongs, coverArt:"eitankatz")
        _songs!.append(contentsOf: newSongs)
        _artists!.append(newArtist)
        
        newSongs = [Song(title: "Al Tira", chords: "altira"), Song(title: "Ani Ma’amin", chords: "animaamineitankatzshlomocarlebach"), Song(title: "Asher Bara", chords: "asherbaraeitankatzshlomocarlebach"), Song(title: "Barcheinu Avinu", chords: "barcheinuavinu"), Song(title: "Bo’ee B’shalom", chords: "boeebshalom"), Song(title: "Licha Ezbach", chords: "lichaezbach"), Song(title: "Niggun Neshama", chords: "niggunneshama"), Song(title: "Odcha", chords: "odchaeitankatzshlomocarlebach"), Song(title: "Shomer Yisroel", chords: "shomeryisroeleitankatzshlomocarlebach"), Song(title: "Yisborach Shimcha", chords: "yisborachshimcha")]
        newArtist = Artist(name: "Eitan Katz (Shlomo Carlebach)", songs: newSongs, coverArt:"eitankatzshlomocarlebach")
        _songs!.append(contentsOf: newSongs)
        _artists!.append(newArtist)
        
        newSongs = [Song(title: "Hashem Melech", chords: "hashemmelech")]
        newArtist = Artist(name: "Gad Elbaz", songs: newSongs, coverArt:"gadelbaz")
        _songs!.append(contentsOf: newSongs)
        _artists!.append(newArtist)
        
        newSongs = [Song(title: "Lo Alecha", chords: "loalecha")]
        newArtist = Artist(name: "Kol B'seder", songs: newSongs, coverArt:"kolbseder")
        _songs!.append(contentsOf: newSongs)
        _artists!.append(newArtist)
        
        newSongs = [Song(title: "U’vnei Yerushalayim", chords: "uvneiyerushalayimlevtahor"), Song(title: "Yedid Nefesh", chords: "yedidnefesh")]
        newArtist = Artist(name: "Lev Tahor", songs: newSongs, coverArt:"levtahor")
        _songs!.append(contentsOf: newSongs)
        _artists!.append(newArtist)
        
        newSongs = [Song(title: "Ya’aleh Viyavo", chords: "yaalehviyavo")]
        newArtist = Artist(name: "Miami Boys Choir", songs: newSongs, coverArt:"miamiboyschoir")
        _songs!.append(contentsOf: newSongs)
        _artists!.append(newArtist)
        
        newSongs = [Song(title: "Hinei Anochi", chords: "hineianochi"), Song(title: "Ma Ashiv", chords: "maashiv"), Song(title: "Va’ani Bechasdecha", chords: "vaanibechasdecha")]
        newArtist = Artist(name: "Mordechai Ben David", songs: newSongs, coverArt:"mordechaibendavid")
        _songs!.append(contentsOf: newSongs)
        _artists!.append(newArtist)
        
        newSongs = [Song(title: "Ani Ma’amin", chords: "animaaminmordechaishapiro"), Song(title: "Chizku", chords: "chizku"), Song(title: "Kol Haderech", chords: "kolhaderech"), Song(title: "Schar Mitzvah", chords: "scharmitzvah"), Song(title: "Shir Hamaalot", chords: "shirhamaalot")]
        newArtist = Artist(name: "Mordechai Shapiro", songs: newSongs, coverArt:"mordechaishapiro")
        _songs!.append(contentsOf: newSongs)
        _artists!.append(newArtist)
        
        newSongs = [Song(title: "Eliyahu Hanavi", chords: "eliyahuhanavi")]
        newArtist = Artist(name: "Moshav Band", songs: newSongs, coverArt:"moshavband")
        _songs!.append(contentsOf: newSongs)
        _artists!.append(newArtist)
        
        newSongs = [Song(title: "Amar Rabi Akiva", chords: "amarrabiakiva"), Song(title: "Ashreinu Ashreinu Ashreinu", chords: "ashreinuashreinuashreinu"), Song(title: "Ata Bichartanu", chords: "atabichartanu"), Song(title: "Ashreinu Ma Tov Chelkeinu", chords: "ashreinumatovchelkeinu"), Song(title: "Ever Kayona", chords: "everkayona"), Song(title: "Rabbeinu Tzaak", chords: "rabbeinutzaak"), Song(title: "Shir Hagiulah", chords: "shirhagiulah"), Song(title: "Slichot", chords: "slichot"), Song(title: "Uman Rosh Hashana Sheli (Ki Hirbaisa)", chords: "umanroshhashanashelikihirbaisa"), Song(title: "Uvichen Tzadikim", chords: "uvichentzadikimnachman"), Song(title: "Viamartem Ko Lechi", chords: "viamartemkolechi")]
        newArtist = Artist(name: "Nachman", songs: newSongs, coverArt:"nachman")
        _songs!.append(contentsOf: newSongs)
        _artists!.append(newArtist)
        
        newSongs = [Song(title: "Birchas Habayis", chords: "birchashabayis"), Song(title: "Birchos Habonim", chords: "birchoshabonim")]
        newArtist = Artist(name: "Ohad", songs: newSongs, coverArt:"ohad")
        _songs!.append(contentsOf: newSongs)
        _artists!.append(newArtist)
        
        newSongs = [Song(title: "Shomer Yisroel", chords: "shomeryisroelomekhadavar")]
        newArtist = Artist(name: "Omek Hadavar", songs: newSongs, coverArt:"omekhadavar")
        _songs!.append(contentsOf: newSongs)
        _artists!.append(newArtist)
        
        newSongs = [Song(title: "Vihaviosim", chords: "vihaviosim")]
        newArtist = Artist(name: "Rav Hutner", songs: newSongs, coverArt:"ravhutner")
        _songs!.append(contentsOf: newSongs)
        _artists!.append(newArtist)
        
        newSongs = [Song(title: "Ma Shehaya Haya", chords: "mashehayahaya")]
        newArtist = Artist(name: "Rav Shalom Arush", songs: newSongs, coverArt:"ravshalomarush")
        _songs!.append(contentsOf: newSongs)
        _artists!.append(newArtist)
        
        newSongs = [Song(title: "Kichu", chords: "kichu")]
        newArtist = Artist(name: "Rav Shmuel Brazil", songs: newSongs, coverArt:"ravshmuelbrazil")
        _songs!.append(contentsOf: newSongs)
        _artists!.append(newArtist)
        
        newSongs = [Song(title: "Berdichever Niggun", chords: "berdicheverniggun")]
        newArtist = Artist(name: "Rebbe Levi Yitzchak", songs: newSongs, coverArt:"rebbeleviyitzchak")
        _songs!.append(contentsOf: newSongs)
        _artists!.append(newArtist)
        
        newSongs = [Song(title: "Am Yisroel Chai", chords: "amyisroelchai"), Song(title: "Ana Hashem", chords: "anahashemshlomocarlebach"), Song(title: "B’sheim Hashem", chords: "bsheimhashemshlomocarlebach"), Song(title: "Dovid Melech", chords: "dovidmelech"), Song(title: "Elecha", chords: "elecha"), Song(title: "Esa Einai", chords: "esaeinaishlomocarlebach"), Song(title: "Hamavir Banav", chords: "hamavirbanav"), Song(title: "Harachaman Hu Yizakeinu", chords: "harachamanhuyizakeinu"), Song(title: "Hashem Oz", chords: "hashemoz"), Song(title: "Hashiveinu", chords: "hashiveinushlomocarlebach"), Song(title: "Im Eshkachech", chords: "imeshkachechshlomocarlebach"), Song(title: "Ki Mitzion", chords: "kimitzionshlomocarlebach"), Song(title: "Ki Va Moed", chords: "kivamoed"), Song(title: "Kol Ha’olam Kulo", chords: "kolhaolamkulo"), Song(title: "Krakow Niggun", chords: "krakowniggun"), Song(title: "L’maan Achai", chords: "lmaanachai"), Song(title: "Lecha Dodi", chords: "lechadodishlomocarlebach"), Song(title: "Leshana Haba", chords: "leshanahaba"), Song(title: "Lo Tevoshi", chords: "lotevoshi"), Song(title: "Meheira", chords: "meheirashlomocarlebach"), Song(title: "Mekimi", chords: "mekimi"), Song(title: "Mimkomcha", chords: "mimkomcha"), Song(title: "Mimkomcha (V’shamru)", chords: "mimkomchavshamru"), Song(title: "Od Yishama", chords: "odyishamashlomocarlebach"), Song(title: "Odcha", chords: "odchashlomocarlebach"), Song(title: "Orech Yamim", chords: "orechyamim"), Song(title: "Oseh Shalom", chords: "osehshalom"), Song(title: "Pischu Li", chords: "pischulishlomocarlebach"), Song(title: "Shalom Aleichem", chords: "shalomaleichem"), Song(title: "Shifchi Kamayim", chords: "shifchikamayim"), Song(title: "Shomrim", chords: "shomrim"), Song(title: "Simcha Le’artzecha", chords: "simchaleartzecha"), Song(title: "Tov Lehodot", chords: "tovlehodotshlomocarlebach"), Song(title: "U’vnei Yerushalayim", chords: "uvneiyerushalayimshlomocarlebach"), Song(title: "Uvau Haovdim", chords: "uvauhaovdim"), Song(title: "V’lirushalayim", chords: "vlirushalayim"), Song(title: "V’shamru (Mimkomcha)", chords: "vshamrumimkomcha"), Song(title: "Vehoair Eineinu", chords: "vehoaireineinu"), Song(title: "Vinisgav", chords: "vinisgav"), Song(title: "Yehi Shalom Bichelech", chords: "yehishalombichelech"), Song(title: "Yibaneh", chords: "yibaneh"), Song(title: "Yibaneh Hamikdash", chords: "yibanehhamikdash")]
        newArtist = Artist(name: "Shlomo Carlebach", songs: newSongs, coverArt:"shlomocarlebach")
        _songs!.append(contentsOf: newSongs)
        _artists!.append(newArtist)
        
        newSongs = [Song(title: "Niggun Nevo", chords: "niggunnevo"), Song(title: "Yismichu", chords: "yismichu")]
        newArtist = Artist(name: "Shlomo Katz", songs: newSongs, coverArt:"shlomokatz")
        _songs!.append(contentsOf: newSongs)
        _artists!.append(newArtist)
        
        newSongs = [Song(title: "Kol Berama", chords: "kolberama"), Song(title: "Pischi Li", chords: "pischili")]
        newArtist = Artist(name: "Simcha Leiner", songs: newSongs, coverArt:"simchaleiner")
        _songs!.append(contentsOf: newSongs)
        _artists!.append(newArtist)
        
        newSongs = [Song(title: "Al Hanissim", chords: "alhanissimsix13")]
        newArtist = Artist(name: "Six13", songs: newSongs, coverArt:"six13")
        _songs!.append(contentsOf: newSongs)
        _artists!.append(newArtist)
        
        newSongs = [Song(title: "Ach Tov Vachesed", chords: "achtovvachesed"), Song(title: "Ahalelu", chords: "ahalelu"), Song(title: "Al Hanissim", chords: "alhanissimtraditional"), Song(title: "Ani Ma’amin", chords: "animaamintraditional"), Song(title: "Asher Bara", chords: "asherbaratraditional"), Song(title: "Baruch Hagever", chords: "baruchhagever"), Song(title: "Esa Einai", chords: "esaeinaitraditional"), Song(title: "Etz Chaim", chords: "etzchaim"), Song(title: "Hamalach Hago’el Oti", chords: "hamalachhagoeloti"), Song(title: "Hatikvah", chords: "hatikvah"), Song(title: "Hoshiah Et Amecha", chords: "hoshiahetamecha"), Song(title: "Im Eshkachech", chords: "imeshkachechtraditional"), Song(title: "Ivdu", chords: "ivdu"), Song(title: "Kah Echsof", chords: "kahechsof"), Song(title: "Keitzad Mirakdim", chords: "keitzadmirakdim"), Song(title: "Ki Hirbaisa (Uman Rosh Hashana Sheli)", chords: "kihirbaisaumanroshhashanasheli"), Song(title: "Ki Mitzion", chords: "kimitziontraditional"), Song(title: "Layihudim Layihudim Hayta Ora", chords: "layihudimlayihudimhaytaora"), Song(title: "Lev Tahor Bira Lee", chords: "levtahorbiralee"), Song(title: "Ma’aminim", chords: "maaminim"), Song(title: "Maoz Tzur", chords: "maoztzur"), Song(title: "Mishe Nichnas Adar Marbim Bisimcha", chords: "mishenichnasadarmarbimbisimcha"), Song(title: "Od Yavo Shalom", chords: "odyavoshalom"), Song(title: "Od Yishama", chords: "odyishamatraditional"), Song(title: "Shoshanat Yaakov", chords: "shoshanatyaakov"), Song(title: "Siman Tov", chords: "simantov"), Song(title: "Siman Tov (Dovid Melech)", chords: "simantovumazaltov"), Song(title: "Siu Shiarim", chords: "siushiarim"), Song(title: "Toras Hashem Temima", chords: "torashashemtemima"), Song(title: "Tov Lehodot", chords: "tovlehodottraditional"), Song(title: "Uvichen Tzadikim", chords: "uvichentzadikimtraditional"), Song(title: "Vayehi Bishurun Melech", chords: "vayehibishurunmelech"), Song(title: "Veyiyu Rachamecha", chords: "veyiyurachamecha"), Song(title: "Visamachta Bichagecha", chords: "visamachtabichagecha"), Song(title: "Vitahair Libeinu", chords: "vitahairlibeinu"), Song(title: "Viyazor Viyagen", chords: "viyazorviyagen"), Song(title: "Yachad", chords: "yachad"), Song(title: "Yasis Alayich Elokayich", chords: "yasisalayichelokayich")]
        newArtist = Artist(name: "Traditional", songs: newSongs, coverArt:"traditional")
        _songs!.append(contentsOf: newSongs)
        _artists!.append(newArtist)
        
        newSongs = [Song(title: "Tzama Lecha Nafshi", chords: "tzamalechanafshi")]
        newArtist = Artist(name: "Viznitz", songs: newSongs, coverArt:"viznitz")
        _songs!.append(contentsOf: newSongs)
        _artists!.append(newArtist)
        
        newSongs = [Song(title: "Am Yisrael", chords: "amyisrael"), Song(title: "Boee Beshalom", chords: "boeebeshalom"), Song(title: "Eishes Chayil", chords: "eisheschayil"), Song(title: "Im Eshkachech", chords: "imeshkachechyaakovshwekey"), Song(title: "Meheira", chords: "meheirayaakovshwekey"), Song(title: "Mi Adir", chords: "miadir"), Song(title: "Mi Bon Siach", chords: "mibonsiach"), Song(title: "Rachem", chords: "rachem"), Song(title: "Shema", chords: "shemayaakovshwekey"), Song(title: "Vehi Sheomda", chords: "vehisheomda")]
        newArtist = Artist(name: "Yaakov Shwekey", songs: newSongs, coverArt:"yaakovshwekey")
        _songs!.append(contentsOf: newSongs)
        _artists!.append(newArtist)
        
        newSongs = [Song(title: "Shiru Lamelech", chords: "shirulamelech")]
        newArtist = Artist(name: "Yeedle", songs: newSongs, coverArt:"yeedle")
        _songs!.append(contentsOf: newSongs)
        _artists!.append(newArtist)
        
        newSongs = [Song(title: "Hashiveinu", chords: "hashiveinuyehudagreen")]
        newArtist = Artist(name: "Yehuda Green", songs: newSongs, coverArt:"yehudagreen")
        _songs!.append(contentsOf: newSongs)
        _artists!.append(newArtist)
        
        newSongs = [Song(title: "Acheinu", chords: "acheinuyehuda"), Song(title: "Mi Bon", chords: "mibon"), Song(title: "Vehoair", chords: "vehoair")]
        newArtist = Artist(name: "Yehuda!", songs: newSongs, coverArt:"yehuda")
        _songs!.append(contentsOf: newSongs)
        _artists!.append(newArtist)
        
        newSongs = [Song(title: "Lashem Ha’aretz", chords: "lashemhaaretz")]
        newArtist = Artist(name: "Yitzchak Fuchs", songs: newSongs, coverArt:"yitzchakfuchs")
        _songs!.append(contentsOf: newSongs)
        _artists!.append(newArtist)
        
        newSongs = [Song(title: "Viafilu", chords: "viafilu")]
        newArtist = Artist(name: "Yoeli Klein", songs: newSongs, coverArt:"yoeliklein")
        _songs!.append(contentsOf: newSongs)
        _artists!.append(newArtist)
        
        newSongs = [Song(title: "Shir Lamaalot", chords: "shirlamaalot")]
        newArtist = Artist(name: "Yosef Karduner", songs: newSongs, coverArt:"yosefkarduner")
        _songs!.append(contentsOf: newSongs)
        _artists!.append(newArtist)
        
        newSongs = [Song(title: "Anavim Anavim", chords: "anavimanavim")]
        newArtist = Artist(name: "Yossi Green", songs: newSongs, coverArt:"yossigreen")
        _songs!.append(contentsOf: newSongs)
        _artists!.append(newArtist)
        
        newSongs = [Song(title: "Ana Hashem", chords: "anahashemzusha"), Song(title: "Beis", chords: "beis"), Song(title: "Binyan Ariel", chords: "binyanariel"), Song(title: "Child", chords: "child"), Song(title: "Dov Bear", chords: "dovbear"), Song(title: "East Shtetl", chords: "eastshtetl"), Song(title: "Festival", chords: "festival"), Song(title: "Forever", chords: "forever"), Song(title: "Hamavdil", chords: "hamavdil"), Song(title: "Ikvisa", chords: "ikvisa"), Song(title: "Lishem Yichud", chords: "lishemyichud"), Song(title: "Mashiach", chords: "mashiach"), Song(title: "Pashut", chords: "pashut"), Song(title: "Peace", chords: "peace"), Song(title: "Pischu Li", chords: "pischulizusha"), Song(title: "Question", chords: "question"), Song(title: "Shuva", chords: "shuva"), Song(title: "Tzion", chords: "tzion"), Song(title: "V’shamru", chords: "vshamru"), Song(title: "Yisgadal", chords: "yisgadal"), Song(title: "Yismichu", chords: "yismichu")]
        newArtist = Artist(name: "Zusha", songs: newSongs, coverArt:"zusha")
        _songs!.append(contentsOf: newSongs)
        _artists!.append(newArtist)
        
        newSongs = [Song(title: "Brother", chords: "brother")]
        newArtist = Artist(name: "Zusha & C Lanzbom", songs: newSongs, coverArt:"zushaclanzbom")
        _songs!.append(contentsOf: newSongs)
        _artists!.append(newArtist)
    }
}

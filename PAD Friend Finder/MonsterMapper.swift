//
//  MonsterMapper.swift
//  PAD Friend Finder
//
//  Created by Alexander Chiou on 7/28/15.
//  Copyright (c) 2015 Alexander Chiou. All rights reserved.
//

import Foundation

class MonsterMapper
{
    // Singleton instance. Do MonsterMapper.sharedInstance to fetch it
    static let sharedInstance = MonsterMapper()
    
    // Ghetto static variable
    struct Static
    {
        static var nameToInfo = [String: Monster]()
    }
    
    func initializeMonsterMapper()
    {
        Static.nameToInfo["Ancient Dragon Knight, Zeal"] = Monster(level: 9, skillLevel: 5, awakenings: 3, imageName: "adk_zeal")
        Static.nameToInfo["World Tree Sprite, Alraune"] = Monster(level: 99, skillLevel: 11, awakenings: 3, imageName: "alraune_green")
        Static.nameToInfo["Dancing Light, Amaterasu Ohkami"] = Monster(level: 99, skillLevel: 11, awakenings: 4, imageName: "ama_light")
        Static.nameToInfo["Deathly Hell Deity Jackal, Anubis"] = Monster(level: 99, skillLevel: 11, awakenings: 4, imageName: "anubis_final")
        Static.nameToInfo["Heavenly Herald, Archangel"] = Monster(level: 99, skillLevel: 6, awakenings: 3, imageName: "archangel_blue")
        Static.nameToInfo["Guardian of the Sacred City, Athena"] = Monster(level: 99, skillLevel: 9, awakenings: 6, imageName: "athena_final")
        Static.nameToInfo["Moonlit Feline Goddess, Bastet"] = Monster(level: 99, skillLevel: 8, awakenings: 4, imageName: "bastet_dark")
        Static.nameToInfo["Feline Deity of Harmony, Bastet"] = Monster(level: 99, skillLevel: 8, awakenings: 4, imageName: "bastet_light")
        Static.nameToInfo["BAO Batman+Batarang"] = Monster(level: 50, skillLevel: 4, awakenings: 0, imageName: "batman_4")
        Static.nameToInfo["BAO Batman+BW Stealth"] = Monster(level: 99, skillLevel: 4, awakenings: 7, imageName: "batman_blue_final")
        Static.nameToInfo["Crazed King of Purgatory, Beelzebub"] = Monster(level: 99, skillLevel: 5, awakenings: 8, imageName: "beelz_final")
        Static.nameToInfo["Endless Blue Dragon Caller, Sonia"] = Monster(level: 99, skillLevel: 6, awakenings: 6, imageName: "blonia_7")
        Static.nameToInfo["Keeper of Paradise, Metatron"] = Monster(level: 99, skillLevel: 6, awakenings: 6, imageName: "btron")
        Static.nameToInfo["Awoken Ceres"] = Monster(level: 99, skillLevel: 3, awakenings: 8, imageName: "ceres_final")
        Static.nameToInfo["Destroying Goddess of Power, Kali"] = Monster(level: 99, skillLevel: 6, awakenings: 6, imageName: "dkali_6")
        Static.nameToInfo["Arbiter of Judgement, Metatron"] = Monster(level: 99, skillLevel: 4, awakenings: 7, imageName: "dmeta_final")
        Static.nameToInfo["Divine Flowers, Da Qiao & Xiao Qiao"] = Monster(level: 99, skillLevel: 6, awakenings: 4, imageName: "dqxq_6")
        Static.nameToInfo["Demon Slaying Goddess, Durga"] = Monster(level: 99, skillLevel: 6, awakenings: 4, imageName: "durga_6")
        Static.nameToInfo["Hell-Creating Archdemon, Lucifer"] = Monster(level: 99, skillLevel: 16, awakenings: 4, imageName: "fa_lucifer_dark")
        Static.nameToInfo["Goemon, the Thief"] = Monster(level: 99, skillLevel: 15, awakenings: 3, imageName: "goemon_7")
        Static.nameToInfo["Shining Lance Wielder, Odin"] = Monster(level: 99, skillLevel: 6, awakenings: 8, imageName: "grodin_final")
        Static.nameToInfo["Eternal Jade Dragon Caller, Sonia"] = Monster(level: 99, skillLevel: 6, awakenings: 6, imageName: "gronia_7")
        Static.nameToInfo["Genius Sleeping Dragon, Zhuge Liang"] = Monster(level: 99, skillLevel: 5, awakenings: 5, imageName: "gzl_6")
        Static.nameToInfo["Banishing Claw Byakko, Haku"] = Monster(level: 99, skillLevel: 6, awakenings: 7, imageName: "haku_final")
        Static.nameToInfo["Sacred Life Goddess, Hathor"] = Monster(level: 99, skillLevel: 6, awakenings: 4, imageName: "hathor_6")
        Static.nameToInfo["Blazing Deity Falcon, Horus"] = Monster(level: 99, skillLevel: 11, awakenings: 4, imageName: "horus_final")
        Static.nameToInfo["Eternal Twin Stars, Idunn&Idunna"] = Monster(level: 99, skillLevel: 9, awakenings: 4, imageName: "i_and_i_healer")
        Static.nameToInfo["Shining Sea Deity, Isis"] = Monster(level: 99, skillLevel: 6, awakenings: 4, imageName: "isis_light")
        Static.nameToInfo["Kirin of the Sacred Gleam, Sakuya"] = Monster(level: 99, skillLevel: 6, awakenings: 7, imageName: "kirin_final")
        Static.nameToInfo["Divine Brave General, Krishna"] = Monster(level: 99, skillLevel: 6, awakenings: 4, imageName: "krishna_6")
        Static.nameToInfo["Devoted Miko Goddess, Kushinadahime"] = Monster(level: 99, skillLevel: 4, awakenings: 7, imageName: "kush_final")
        Static.nameToInfo["Shining Goddess of Secrets, Kali"] = Monster(level: 99, skillLevel: 6, awakenings: 5, imageName: "lkali_6")
        Static.nameToInfo["Keeper of the Sacred Texts, Metatron"] = Monster(level: 99, skillLevel: 6, awakenings: 6, imageName: "lmeta_final")
        Static.nameToInfo["Divine Flying General, Lu Bu"] = Monster(level: 99, skillLevel: 6, awakenings: 4, imageName: "lubu_6")
        Static.nameToInfo["Divine Law Goddess, Valkyrie Rose"] = Monster(level: 99, skillLevel: 7, awakenings: 5, imageName: "lvalk_final")
        Static.nameToInfo["Celestial Life Dragon, Zhuge Liang"] = Monster(level: 99, skillLevel: 6, awakenings: 6, imageName: "lzl_7")
        Static.nameToInfo["Sea God's Songstress, Siren"] = Monster(level: 99, skillLevel: 7, awakenings: 3, imageName: "mermaid_final")
        Static.nameToInfo["Awoken Minerva"] = Monster(level: 99, skillLevel: 3, awakenings: 8, imageName: "minerva_final")
        Static.nameToInfo["Goddess of the Dead, Nephthys"] = Monster(level: 99, skillLevel: 6, awakenings: 4, imageName: "nephthys_6")
        Static.nameToInfo["Awoken Neptune"] = Monster(level: 99, skillLevel: 3, awakenings: 8, imageName: "neptune_final")
        Static.nameToInfo["Roaming National Founder, Okuninushi"] = Monster(level: 99, skillLevel: 4, awakenings: 4, imageName: "oku_final")
        Static.nameToInfo["God of Dark Riches, Osiris"] = Monster(level: 99, skillLevel: 6, awakenings: 4, imageName: "osiris_6")
        Static.nameToInfo["Goddess of the Bleak Night, Pandora"] = Monster(level: 99, skillLevel: 6, awakenings: 4, imageName: "pandora_6")
        Static.nameToInfo["Pure Light Sun Deity, Ra"] = Monster(level: 99, skillLevel: 8, awakenings: 4, imageName: "ra_light")
        Static.nameToInfo["BAO Robin"] = Monster(level: 99, skillLevel: 4, awakenings: 0, imageName: "robin_4")
        Static.nameToInfo["Awoken Phantom God, Odin"] = Monster(level: 99, skillLevel: 6, awakenings: 6, imageName: "rodin_7")
        Static.nameToInfo["Marvelous Red Dragon Caller, Sonia"] = Monster(level: 99, skillLevel: 6, awakenings: 6, imageName: "ronia_final")
        Static.nameToInfo["Holy Night Kirin Princess, Sakuya"] = Monster(level: 99, skillLevel: 6, awakenings: 7, imageName: "santa_kirin")
        Static.nameToInfo["King of Hell, Satan"] = Monster(level: 99, skillLevel: 16, awakenings: 3, imageName: "satan_final")
        Static.nameToInfo["Demolishing Creator, Shiva"] = Monster(level: 99, skillLevel: 6, awakenings: 4, imageName: "shiva_final")
        Static.nameToInfo["Rebel Seraph Lucifer"] = Monster(level: 99, skillLevel: 16, awakenings: 4, imageName: "sod_lucifer_final")
        Static.nameToInfo["Sylph"] = Monster(level: 35, skillLevel: 6, awakenings: 0, imageName: "sylph_4")
        Static.nameToInfo["Divine Wardens, Umisachi&Yamasachi"] = Monster(level: 99, skillLevel: 4, awakenings: 7, imageName: "u_and_y_final")
        Static.nameToInfo["Awoken Zeus Olympios"] = Monster(level: 99, skillLevel: 16, awakenings: 3, imageName: "zeus_light")
        Static.nameToInfo["BAO Robin+E. Stick"] = Monster(level: 99, skillLevel: 4, awakenings: 3, imageName: "robin_5")
        Static.nameToInfo["Dark Sun Deity, Ra"] = Monster(level: 99, skillLevel: 8, awakenings: 4, imageName: "ra_dark")
        Static.nameToInfo["Gleaming Kouryu Emperor, Fagan"] = Monster(level: 99, skillLevel: 6, awakenings: 8, imageName: "fagan_light")
        Static.nameToInfo["Dark Kouryu Emperor, Fagan"] = Monster(level: 99, skillLevel: 6, awakenings: 8, imageName: "fagan_dark")
        Static.nameToInfo["Seraph of Dawn Lucifer"] = Monster(level: 99, skillLevel: 16, awakenings: 4, imageName: "sod_lucifer")
        Static.nameToInfo["Dark Liege, Vampire Duke"] = Monster(level: 99, skillLevel: 7, awakenings: 3, imageName: "vamp_dark")
        Static.nameToInfo["Jester Dragon, Drawn Joker"] = Monster(level: 99, skillLevel: 7, awakenings: 3, imageName: "drawn_joker_final")
        Static.nameToInfo["Asuka&Eva Unit-02"] = Monster(level: 50, skillLevel: 11, awakenings: 0, imageName: "asuka_eva_4")
        Static.nameToInfo["Awoken Dancing Queen Hera-Ur"] = Monster(level: 99, skillLevel: 5, awakenings: 6, imageName: "hera_ur_final")
        Static.nameToInfo["Awoken Hinokagutsuchi"] = Monster(level: 99, skillLevel: 5, awakenings: 8, imageName: "kagutsuchi_final")
        Static.nameToInfo["Crimson Lotus Mistress, Echidna"] = Monster(level: 99, skillLevel: 6, awakenings: 3, imageName: "echidna_final")
        Static.nameToInfo["Unyielding Samurai Dragon King, Zaerog"] = Monster(level: 99, skillLevel: 5, awakenings: 4, imageName: "zaerog_samurai")
        Static.nameToInfo["TAMADRApurin"] = Monster(level: 99, skillLevel: 5, awakenings: 4, imageName: "tamadrapurin")
        Static.nameToInfo["Norn of the Past, Urd"] = Monster(level: 99, skillLevel: 6, awakenings: 5, imageName: "urd_6")
        Static.nameToInfo["Norn of the Present, Verdandi"] = Monster(level: 99, skillLevel: 6, awakenings: 5, imageName: "verdandi_6")
        Static.nameToInfo["Norn of the Future, Skuld"] = Monster(level: 99, skillLevel: 6, awakenings: 6, imageName: "skuld_7")
        Static.nameToInfo["Gods of Hunt, Umisachi&Yamasachi"] = Monster(level: 99, skillLevel: 4, awakenings: 4, imageName: "u_and_y_6")
        Static.nameToInfo["Awoken Odin"] = Monster(level: 99, skillLevel: 6, awakenings: 5, imageName: "grodin_6")
        Static.nameToInfo["Nocturne Chanter, Tsukuyomi"] = Monster(level: 99, skillLevel: 6, awakenings: 4, imageName: "yomi_dark")
        Static.nameToInfo["Hand of the Dark God, Metatron"] = Monster(level: 99, skillLevel: 6, awakenings: 6, imageName: "dmeta_7")
        Static.nameToInfo["Warrior Rose, Graceful Valkyrie"] = Monster(level: 99, skillLevel: 7, awakenings: 3, imageName: "valk_7")
        Static.nameToInfo["Scholarly God, Ganesha"] = Monster(level: 99, skillLevel: 6, awakenings: 4, imageName: "ganesha_6")
        Static.nameToInfo["Goddess of Rice Fields, Kushinada"] = Monster(level: 99, skillLevel: 4, awakenings: 4, imageName: "kush_6")
        Static.nameToInfo["Voice of God, Metatron"] = Monster(level: 99, skillLevel: 6, awakenings: 5, imageName: "lmeta_6")
        Static.nameToInfo["Extant Red Dragon Caller, Sonia"] = Monster(level: 99, skillLevel: 6, awakenings: 5, imageName: "ronia_6")
        Static.nameToInfo["Kirin of the Aurora, Sakuya"] = Monster(level: 99, skillLevel: 6, awakenings: 4, imageName: "kirin_6")
        Static.nameToInfo["Noble Wolf King Hero, Cu Chulainn"] = Monster(level: 99, skillLevel: 7, awakenings: 3, imageName: "cu_chu_dark")
        Static.nameToInfo["Earth-Rending Emperor, Siegfried"] = Monster(level: 99, skillLevel: 7, awakenings: 3, imageName: "sieg_fire")
        Static.nameToInfo["Abyssal Hell Deity Jackal, Anubis"] = Monster(level: 99, skillLevel: 11, awakenings: 4, imageName: "hamnubis")
        Static.nameToInfo["Sparkling Goddess of Secrets, Kali"] = Monster(level: 99, skillLevel: 6, awakenings: 6, imageName: "lkali_7")
        Static.nameToInfo["Awoken Horus"] = Monster(level: 99, skillLevel: 5, awakenings: 8, imageName: "awoken_horus")
        Static.nameToInfo["Awoken Ra"] = Monster(level: 99, skillLevel: 5, awakenings: 8, imageName: "awoken_ra")
        Static.nameToInfo["Awoken Bastet"] = Monster(level: 99, skillLevel: 5, awakenings: 8, imageName: "awoken_bastet")
        Static.nameToInfo["Awoken Shiva"] = Monster(level: 99, skillLevel: 5, awakenings: 8, imageName: "awoken_shiva")
        Static.nameToInfo["Magic Hand Slayer Goddess, Durga"] = Monster(level: 99, skillLevel: 6, awakenings: 4, imageName: "durga_7")
        Static.nameToInfo["Avowed Thief, Ishikawa Goemon"] = Monster(level: 99, skillLevel: 6, awakenings: 4, imageName: "goemon_8")
        Static.nameToInfo["Wailing Bleak Night Goddess, Pandora"] = Monster(level: 99, skillLevel: 6, awakenings: 7, imageName: "pandora_7")
        Static.nameToInfo["Chaotic Flying General, Lu Bu"] = Monster(level: 99, skillLevel: 5, awakenings: 7, imageName: "lubu_7")
        Static.nameToInfo["Awoken Meimei"] = Monster(level: 99, skillLevel: 5, awakenings: 8, imageName: "awoken_meimei")
        Static.nameToInfo["Lightning Red Dragonbound, Gadius"] = Monster(level: 99, skillLevel: 6, awakenings: 5, imageName: "gadius_6")
        Static.nameToInfo["Dawning Dragon Caller, Sonia Gran"] = Monster(level: 99, skillLevel: 11, awakenings: 9, imageName: "sonia_gran_8")
        Static.nameToInfo["Blue Chain Starsea Goddess, Andromeda"] = Monster(level: 99, skillLevel: 6, awakenings: 7, imageName: "andromeda_7")
        Static.nameToInfo["Sacred Divine Flower, Xiao Qiao"] = Monster(level: 99, skillLevel: 6, awakenings: 4, imageName: "xq_7")
        Static.nameToInfo["Awoken Venus"] = Monster(level: 99, skillLevel: 5, awakenings: 8, imageName: "awoken_venus")
        Static.nameToInfo["Awoken Hades"] = Monster(level: 99, skillLevel: 5, awakenings: 8, imageName: "awoken_hades")
        Static.nameToInfo["Awoken Lakshmi"] = Monster(level: 99, skillLevel: 5, awakenings: 8, imageName: "awoken_lakshmi")
        Static.nameToInfo["Awoken Parvati"] = Monster(level: 99, skillLevel: 5, awakenings: 8, imageName: "awoken_parvati")
        Static.nameToInfo["Sacred Dragon Princess, Da Qiao"] = Monster(level: 99, skillLevel: 6, awakenings: 7, imageName: "dq_7")
        Static.nameToInfo["Scholarship Student, Isis"] = Monster(level: 99, skillLevel: 6, awakenings: 5, imageName: "schoolgirl_isis")
        Static.nameToInfo["Discipline Committee Chair, Athena"] = Monster(level: 99, skillLevel: 9, awakenings: 6, imageName: "schoolgirl_athena")
        Static.nameToInfo["Stormy God-Emperor, Yamato Takeru"] = Monster(level: 99, skillLevel: 6, awakenings: 7, imageName: "yamato_7")
        Static.nameToInfo["Revered Monkey King, Sun Wukong"] = Monster(level: 99, skillLevel: 6, awakenings: 7, imageName: "wukong_7")
        Static.nameToInfo["Green Star Vanquishing Deity, Perseus"] = Monster(level: 99, skillLevel: 6, awakenings: 7, imageName: "perseus_7")
        Static.nameToInfo["Dominating Warrior King, Cao Cao"] = Monster(level: 99, skillLevel: 6, awakenings: 7, imageName: "cao_cao_green")
        Static.nameToInfo["Unifying Martial Deity, Cao Cao"] = Monster(level: 99, skillLevel: 6, awakenings: 4, imageName: "cao_cao_dark")
        Static.nameToInfo["Divine General of the Sun, Krishna"] = Monster(level: 99, skillLevel: 10, awakenings: 4, imageName: "krishna_7")
        Static.nameToInfo["Wise and Moral Goddess, Sarasvati"] = Monster(level: 99, skillLevel: 10, awakenings: 4, imageName: "sarasvati_7")
        Static.nameToInfo["Awoken Isis"] = Monster(level: 99, skillLevel: 5, awakenings: 8, imageName: "awoken_isis")
        Static.nameToInfo["Awoken Anubis"] = Monster(level: 99, skillLevel: 5, awakenings: 8, imageName: "awoken_anubis")
        Static.nameToInfo["Enraged Black Phantom Demon, Zuoh"] = Monster(level: 99, skillLevel: 6, awakenings: 5, imageName: "zuoh_6")
    }
    
    func getMonsterList() -> [String]
    {
        if (Static.nameToInfo.isEmpty)
        {
            initializeMonsterMapper()
        }
        let monsterNames = Array(Static.nameToInfo.keys)
        return sorted(monsterNames, <)
    }
    
    func getMonsterInfo(monsterName: String) -> Monster?
    {
        if (Static.nameToInfo.isEmpty)
        {
            initializeMonsterMapper()
        }
        return Static.nameToInfo[monsterName]
    }
}

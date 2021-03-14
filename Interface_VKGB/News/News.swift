//
//  News.swift
//  Interface_VKGB
//
//  Created by Виталий Степушин on 06.03.2021.
//

import UIKit

struct News {
    var avatarUserNews: UIImage?
    var nameUserNews: String
    var dateContentNews: Data?
    var contentUserNews: String
    var imageContentNews: UIImage?
}

final class AllNews {
    static func newsMake() -> [News] {
        let newsDG1 = News(avatarUserNews: UIImage(named: "DG.2.Avatar"), nameUserNews: "Дмитрий Гордей", dateContentNews: nil, contentUserNews: "Локация ТОП - сразу говорю😉", imageContentNews: UIImage(named: "DG.2.3"))
        
        let newsVP1 = News(avatarUserNews: UIImage(named: "VP.1.Avatar"), nameUserNews: "Петухов Валентин", dateContentNews: nil, contentUserNews: "Циклон Валентин 🤣 ", imageContentNews: UIImage(named: "VP.1.4"))
        
        let newsLT1 = News(avatarUserNews: UIImage(named: "LT.4.Avatar"), nameUserNews: "Лихой Топор", dateContentNews: nil, contentUserNews: "Круть", imageContentNews: UIImage(named: "LT.4.1"))
        
        let newsAM1 = News(avatarUserNews: UIImage(named: "AM.6.Avatar"), nameUserNews: "Алик Макиев", dateContentNews: nil, contentUserNews: "Шик", imageContentNews: UIImage(named: "AM.6.4"))
        
        let newsDG2 = News(avatarUserNews: UIImage(named: "DG.2.Avatar"), nameUserNews: "Дмитрий Гордей", dateContentNews: nil, contentUserNews: "Вот что будет дальше👽 ", imageContentNews: UIImage(named: "DG.2.1"))
        
        let newsDK1 = News(avatarUserNews: UIImage(named: "DK.3.Avatar"), nameUserNews: "Даня Крайстер", dateContentNews: nil, contentUserNews: "Мутим кое-че адовое", imageContentNews: UIImage(named: "DK.3.3"))
        
        let newsDM1 = News(avatarUserNews: UIImage(named: "DM.5.Avatar"), nameUserNews: "Дмитрий Масленников", dateContentNews: nil, contentUserNews: "Это был лучший День рождения!", imageContentNews: UIImage(named: "DM.5.8"))
        
        let newsDM2 = News(avatarUserNews: UIImage(named: "DM.5.Avatar"), nameUserNews: "Дмитрий Масленников", dateContentNews: nil, contentUserNews: "Это не ролик, а какой-то разнос!!!", imageContentNews: UIImage(named: "DM.5.5"))
        return [newsDG1, newsVP1, newsLT1, newsAM1, newsDG2, newsDK1, newsDM1, newsDM2]
    }
}

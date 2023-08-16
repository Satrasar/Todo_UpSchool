//
//  TodoKayitViewModel.swift
//  todo
//
//  Created by ozlemkumtas on 12.08.2023.
//

import Foundation
//repo uzerinde islem yaptirmak istiyor isek bu class tan bir nesneye ihtiyacimiz var
class TodoKayitViewModel{
    var krepo = TodoDaoRepository()

    func kaydet (name :  String){
       krepo.kaydet(name: name)

    }
}

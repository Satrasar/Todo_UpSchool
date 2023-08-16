//
//  AnasayfaViewModel.swift
//  todo
//
//  Created by ozlemkumtas on 12.08.2023.
//

import Foundation
import RxSwift

class AnasayfaViewModel {
    var krepo = TodoDaoRepository()
    var todoListesi = BehaviorSubject<[Todo]>(value: [Todo]())

    init(){
        todoListesi = krepo.todoListesi //bu baglanti sayesinde repodan tetiklenebilir
        veritabaniKopyala()
    }

    func sil(id:Int){
        krepo.sil(id: id)
        TodoYukle()
    }

    func ara(aramaKelimesi: String){
        krepo.ara(aramaKelimesi: aramaKelimesi)
    }

    func TodoYukle(){
        krepo.TodoYukle()
    }

    func veritabaniKopyala(){
        let bundleYolu = Bundle.main.path(forResource: "todo", ofType: ".sqlite")

        let dosyaYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: dosyaYolu).appendingPathComponent("todo.sqlite")

        let fm = FileManager.default

        if fm.fileExists(atPath: veritabaniURL.path()){
            print("Veritabani daha once var")

        }else{
            do{
                try fm.copyItem(atPath: bundleYolu!, toPath: veritabaniURL.path)

            }catch{
                print(error.localizedDescription)
            }

        }
    }
}

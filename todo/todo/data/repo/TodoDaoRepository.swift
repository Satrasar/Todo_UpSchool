//
//  TodoDaoRepository.swift
//  todo
//
//  Created by ozlemkumtas on 12.08.2023.
//

import Foundation
import RxSwift

class TodoDaoRepository {
    var todoListesi = BehaviorSubject<[Todo]>(value: [Todo]())//BehaviorSubject En son yayılan değeri hafızada tutar.

    let db:FMDatabase?

    init(){ //o classtan nesne olusturdugumuz zaman bize sonuc getiren bir fonksiyon
        let dosyaYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: dosyaYolu).appendingPathComponent("todo.sqlite")
        db = FMDatabase(path: veritabaniURL.path)
    }
    func kaydet (name:String){
        db?.open()
        do{
            try db!.executeUpdate("INSERT INTO todo (name) VALUES (?,?)", values: [name])
        }catch{
            print(error.localizedDescription)
        }


        db?.close()
    }

    func guncelle (id:Int, name: String){
        db?.open()
        do{
            try db!.executeUpdate("UPDATE todo SET name = ? WHERE id = ?", values: [name,id])
        }catch{
            print(error.localizedDescription)
        }


        db?.close()
    }

    func sil(id:Int){
        db?.open()
        do{
            try db!.executeUpdate("DELETE FROM todo WHERE id = ?", values: [id])
        }catch{
            print(error.localizedDescription)
        }


        db?.close()
    }

    func ara(aramaKelimesi: String){
        db?.open()
        var liste = [Todo]()

        do{

            let result = try db!.executeQuery("SELECT * FROM todo WHERE name like '%\(aramaKelimesi)%'", values: nil)

            while result.next(){
                let id = Int(result.string(forColumn: "id"))!
                let name = result.string(forColumn: "name")!

                let todo = Todo(id: id, name: name)
                liste.append(todo)


            }
        }catch{
            print(error.localizedDescription)
        }

        db?.close()
    }

    func TodoYukle(){

       // todoListesi.onNext(liste)//tetikleme:todoListesini nerede dinliyorsak oraya tetikleme gondericez

        db?.open()
        var liste = [Todo]()

        do{

            let result = try db!.executeQuery("SELECT * FROM todo", values: nil)

            while result.next(){
                let id = Int(result.string(forColumn: "id"))!
                let name = result.string(forColumn: "name")!

                let todo = Todo(id: id, name: name)
                liste.append(todo)


            }
        }catch{
            print(error.localizedDescription)
        }

        db?.close()

    }

}


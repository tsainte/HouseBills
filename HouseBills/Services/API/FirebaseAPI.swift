//
//  FirebaseAPI.swift
//  HouseBills
//
//  Created by Tiago Bencardino on 17/05/2018.
//  Copyright © 2018 Tiago Bencardino. All rights reserved.
//

import Alamofire
import FirebaseFirestore

class FirebaseAPI {

    let db = Firestore.firestore()
    init() {
        let settings = db.settings
        settings.areTimestampsInSnapshotsEnabled = true
        db.settings = settings
    }

}

extension FirebaseAPI {

    func fetchHousehold() {
        let docRef = db.collection("households").document("O5sQdLyprW8LLP637iiZ")
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                print("Document data: \(dataDescription)")
            } else {
                print("Document does not exist")
            }
        }
    }

    func testFunctions() {
        let url = URL(string: "https://us-central1-open-banking-household.cloudfunctions.net/helloWorld")!
        Alamofire.request(url).response { response in
            guard let data = response.data else { print("not receiving data"); return }
            guard let text = String(data: data, encoding: .utf8) else { print("cant parse text"); return }
            print(text)
        }
    }


}

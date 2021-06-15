//
//  CatalogProvider.swift
//  ShazamCustom
//
//  Created by Runhua Huang on 2021/6/13.
//
//  Abstract:
//  The model that creates a custom catalog with a reference signature and metadata.

import ShazamKit

struct CatalogProvider {
    
    static func catalog() throws -> SHCustomCatalog? {
        let allMediaItems = [
            SHMediaItem(properties: [.title: "起风了", .subtitle: "眨眼的瞬间，回忆吹了进来", .song: 1, .singer: "动漫唯美风"]),
            SHMediaItem(properties: [.title: "若能绽放光芒", .subtitle: "你驻足于春色中，于那独一无二的春色之中", .song: 2, .singer: "石川绫子"]),
            SHMediaItem(properties: [.title: "学校不允许乱壁咚^.^", .subtitle: "单身狗保护协会", .song: 3, .singer: "橘卫门"]),
            SHMediaItem(properties: [.title: "Flower Dance", .subtitle: "玫瑰到了花期", .song: 4, .singer: "up初相识"]),
            SHMediaItem(properties: [.title: "Windy Hill", .subtitle: "愿你我，终有一天，在风丘下相遇", .song: 5, .singer: "羽肿"]),
            SHMediaItem(properties: [.title: "风居住的街道", .subtitle: "那一夜我睡在自己的青春里", .song: 6, .singer: "Yukiko"])
        ]
        let customCatalog = SHCustomCatalog()
        for item in allMediaItems {
            if let signature = try getSignatureFile(fileResource: item.title!) {
                try customCatalog.addReferenceSignature(signature, representing: [item])
            }
        }
        return customCatalog
    }
    
    
    static func getSignatureFile(fileResource: String) throws ->SHSignature? {
        guard let signaturePath = Bundle.main.url(forResource: fileResource, withExtension: "shazamsignature") else {
            print("No .shazamsignature File Found")
            return nil
        }
        let signatureData = try Data(contentsOf: signaturePath)
        let signature = try SHSignature(dataRepresentation: signatureData)
        return signature
    }
    
}

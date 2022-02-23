//
//  ImageLoader.swift
//  ProductSales
//
//  Created by Yeşim Daşdemir on 23.02.2022.
//
import UIKit

extension UIImageView {
    
    func setImage(url: URL) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error)
                return
            }
            DispatchQueue.global(qos: .userInteractive).async { [weak self] in
                DispatchQueue.main.async {
                    if let data = data {
                        let imageCache = NSCache<NSString, UIImage>()
                        if let downloadedImage = UIImage(data: data) {
                            imageCache.setObject(downloadedImage, forKey: NSString(string: "\(url)"))
                            self?.image = downloadedImage
                        }
                    }
                }
            }
        }.resume()
    }
}

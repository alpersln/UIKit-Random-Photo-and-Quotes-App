//
//  ViewController.swift
//  RandomPhoto
//
//  Created by calatinalper on 14.07.2021.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var img1: UIImageView!
    let image1 = "https://source.unsplash.com/random/1920x1080"
    
    
    @IBOutlet weak var zenLabel: UILabel!
    
    @IBOutlet weak var authorLabel: UILabel!
    
   
    
    var zen: [Zen] = []
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        img1.load(urlString: image1)
        img1.layer.cornerRadius = 10
        img1.layer.borderWidth = 1
        img1.layer.borderColor = UIColor.white.cgColor
        zenLabel.layer.cornerRadius = 10
        zenLabel.layer.masksToBounds = true
        fetchDailyZen()
        
        
//        
        
        
    }
    func fetchDailyZen() {
        if let url = URL(string: "https://zenquotes.io/api/random") {
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { [self] (data,response,error) in
                if error != nil {
                    print("error while getting zen api")
                } else if data != nil {
                    do {
                        zen = try JSONDecoder().decode([Zen].self, from: data!)
                        DispatchQueue.main.async {
                            zenLabel.text = "\u{22}\(zen.first!.q)\u{22}"
                            authorLabel.text = zen.first?.a
                        }
                    } catch{
                        print("error decoding \(error)")
                    }
                }
            }.resume()
        }
    }
    
    @IBAction func refreshQuotesButton(_ sender: UIButton) {

        fetchDailyZen()
    }
    
    @IBAction func refreshButton(_ sender: UIButton) {
        img1.load(urlString: image1)
    }
    
}



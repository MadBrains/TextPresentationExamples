//
//  ViewController.swift
//  WebPresentation
//
//  Created by admin on 15/10/2019.
//  Copyright © 2019 AlexanderKhiger. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        title = "Markdown examples"
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let rawIdentifier = segue.identifier,
            let identifier = SegueIdentifier(rawValue: rawIdentifier),
            let target = segue.destination as? MarkdownPresentable else {
            return
        }
        
        let example: MarkdownExample = {
            switch identifier {
            case .downShort, .markdownShort: return .short
            case .downLong, .markdownLong: return .long
            }
        }()
        
        target.markdownExample = example
    }

}

extension MainViewController {
    
    enum SegueIdentifier: String {
        case downShort
        case downLong
        case markdownShort
        case markdownLong
    }
    
}

//
//  MarkdownViewController.swift
//  WebPresentation
//
//  Created by admin on 15/10/2019.
//  Copyright © 2019 AlexanderKhiger. All rights reserved.
//

import UIKit
import MarkdownView
import Cartography

class MarkdownViewController: UIViewController {
    
    @IBOutlet weak var renderingTimeLabel: UILabel!
    @IBOutlet weak var markdownViewContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let startTimestamp = mach_absolute_time()
        
        let markdownView = MarkdownView()
        markdownView.load(markdown: Constants.markdownExample)
        markdownView.onRendered = { [weak self] _ in
            let timeDiff = "\(mach_absolute_time().timeIntervalSince(timestamp: startTimestamp))"
            self?.renderingTimeLabel.text = "Rendering time: " + timeDiff + " s"
        }
        
        markdownViewContainer.addSubview(markdownView)
        constrain(markdownView, markdownViewContainer) { downView, view in
            downView.edges == view.edges
        }
    }

}

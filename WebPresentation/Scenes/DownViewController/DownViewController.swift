//
//  DownViewController.swift
//  WebPresentation
//
//  Created by admin on 15/10/2019.
//  Copyright © 2019 AlexanderKhiger. All rights reserved.
//

import UIKit
import Down
import Cartography

class DownViewController: UIViewController, MarkdownPresentable {
    
    @IBOutlet weak var renderingTimeLabel: UILabel!
    @IBOutlet weak var markdownViewContainer: UIView!

    var markdownExample = MarkdownExample.short
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Down"

        let startTimestamp = mach_absolute_time()
        
        guard let downView = try? DownView(
            frame: self.view.bounds,
            markdownString: markdownExample.text,
            options: .smartUnsafe
        ) else {
            return
        }
        
        let timeDiff = "\(mach_absolute_time().timeIntervalSince(timestamp: startTimestamp))"
        renderingTimeLabel.text = "Rendering time: " + timeDiff + " s"
        
        markdownViewContainer.addSubview(downView)
        constrain(downView, markdownViewContainer) { downView, view in
            downView.edges == view.edges
        }
    }

}

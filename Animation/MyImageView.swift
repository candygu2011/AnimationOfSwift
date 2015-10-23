//
//  MyImageView.swift
//  Animation
//
//  Created by hi on 15/10/13.
//  Copyright (c) 2015年 GML. All rights reserved.
//

import UIKit

class MyImageView: UIImageView {

    let progressIndicatorView = CircularLoaderView(frame: CGRectZero)

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubview(self.progressIndicatorView)
        progressIndicatorView.frame = bounds
        progressIndicatorView.autoresizingMask =  .FlexibleWidth | .FlexibleHeight
        
        let url = NSURL(string: "http://www.raywenderlich.com/wp-content/uploads/2015/02/mac-glasses.jpeg")
        sd_setImageWithURL(url, placeholderImage: nil, options: .CacheMemoryOnly, progress: {
            // 你会注意到block使用weak self引用 – 这样能够避免retain cycle。
            [weak self]
            (receivedSize, expectedSize) -> Void in
            println( CGFloat (receivedSize) / CGFloat(expectedSize))
            self!.progressIndicatorView.progress = CGFloat (receivedSize) / CGFloat(expectedSize)

        
    }) {  [weak self] (image, error, _, _) -> Void in
        self!.progressIndicatorView.reveal()

        }
        
    }
}

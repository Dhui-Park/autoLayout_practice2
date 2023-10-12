//
//  ViewController.swift
//  autoLayout_practice2
//
//  Created by dhui on 2023/10/11.
//

import UIKit

class SplashViewController: UIViewController {

    @IBOutlet weak var splashTitle: UILabel!
    
    @IBOutlet weak var porscheLogo: UIImageView!
    
    //MARK: - override method
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(#fileID, #function, #line, "- viewDidLoad() 호출됨.")
        self.navigationController?.navigationBar.isHidden = true
        
        UIView.animate(withDuration: 1.0, delay: 1.5, options: .curveEaseInOut,  animations: {
            
            // animation 처리
            // animation 할 녀석의 크기를 가져온다.
            var splashTitleTopFrame = self.splashTitle.frame
            
            // 변경될 위치를 가져온다.
            splashTitleTopFrame.origin.y -= splashTitleTopFrame.size.height * 3
            
            self.splashTitle.frame = splashTitleTopFrame
            
        }, completion: { finished in
            print(#fileID, #function, #line, "- finished: \(finished)")
            
            self.porscheLogoTransition()
        })
    }
    
    //MARK: - fileprivate Method
    // logo 보이게 처리 & transition
    fileprivate func porscheLogoTransition() {
        
        UIView.transition(with: self.porscheLogo,
                          duration: 1.5,
                          options: .transitionCrossDissolve,
                          animations: {
            self.porscheLogo.isHidden = false
        },
                          completion: { finished in
            print("logo animation completed")
            guard let vc = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "MainViewController") as? MainViewController else { return }
            self.navigationController?.pushViewController(vc, animated: true)
        })
    }


}


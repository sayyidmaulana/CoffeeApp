//
//  MenuController.swift
//  AppCoffee
//
//  Created by Sayyid Maulana Khakul Yakin on 12/11/21.
//

import UIKit
import XLPagerTabStrip

class MenuController: ButtonBarPagerTabStripViewController {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

    }
    override func viewDidLoad() {
        
        settings.style.buttonBarBackgroundColor = .white
        settings.style.buttonBarItemBackgroundColor = .white
        settings.style.selectedBarBackgroundColor = UIColor(named: "buttonPrimaryColor") ?? UIColor.init()
        settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 14)
        settings.style.selectedBarHeight = 2.0
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemTitleColor = .black
        settings.style.buttonBarItemsShouldFillAvailableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        settings.style.buttonBarHeight = 50
        
        changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = UIColor(named: "greyIcon")
            newCell?.label.textColor = UIColor(named: "buttonPrimaryColor")
        }
        super.viewDidLoad()
        
        //get rod of containerView offset
        edgesForExtendedLayout = []
        buttonBarView.frame.origin.y = buttonBarView.frame.origin.y + 50

        // Do any additional setup after loading the view.
    }
    
    @objc func filter() {
        
    }

    // MARK: - PagerTabStripDataSource
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {

        let childOne = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "season")
        let childTwo = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "best")
        let childThree = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "coffee")
        
        return [childOne,childTwo,childThree]
    }

    override func updateIndicator(for viewController: PagerTabStripViewController, fromIndex: Int, toIndex: Int, withProgressPercentage progressPercentage: CGFloat, indexWasChanged: Bool) {
        super.updateIndicator(for: viewController, fromIndex: fromIndex, toIndex: toIndex, withProgressPercentage: progressPercentage, indexWasChanged: indexWasChanged)
        if indexWasChanged && toIndex > -1 && toIndex < viewControllers.count {
            let child = viewControllers[toIndex] as! IndicatorInfoProvider // swiftlint:disable:this force_cast
            UIView.performWithoutAnimation({ [weak self] () -> Void in
                guard let me = self else { return }
                me.navigationItem.leftBarButtonItem?.title =  child.indicatorInfo(for: me).title
            })
        }
    }

}

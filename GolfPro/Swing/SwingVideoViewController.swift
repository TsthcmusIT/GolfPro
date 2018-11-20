//
//  SwingVideoViewController.swift
//  GolfPro
//
//  Created by tsthcmusit on 11/5/18.
//  Copyright © 2018 tsthcmusit. All rights reserved.
//

import UIKit
import AVFoundation
import AssetsLibrary
import QuartzCore
import MobileCoreServices
import MediaPlayer

enum SwingTab {
    case master
    case user
    case review
}

class SwingVideoViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var videoList: NSMutableArray
    //    var userVideoList: NSMutableArray
    //    var normalVideoList: NSMutableArray
    //    var reviewVideoList: NSMutableArray
    //    var videoInfoList: NSMutableArray
    //    var videoInfo: SwingVideo
    //    var userProfile: UserProfile
    //
    //    var circleRadius: Int
    //    var currentRow: Int
    //    var updateFlag: Bool
    //    var editFlag: Bool
    //    var currentTab: SwingTab
    var refreshControl: UIRefreshControl
    var nCounter: Int
    
    required init?(coder aDecoder: NSCoder) {
        videoList = NSMutableArray.init()
        refreshControl = UIRefreshControl.init()
        nCounter = 0
        super.init(coder: aDecoder)
    }
    
    required override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        videoList = NSMutableArray.init()
        refreshControl = UIRefreshControl.init()
        nCounter = 0
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Swing"
        self.navigationController?.title = "Swing";
        
        // -- Setup refresh control
        refreshControl.addTarget(self, action: Selector.init("refreshAllVideos"), for: .valueChanged)
        refreshControl.tintColor = UIColor.init(red: 200.0/255.0, green: 200.0/255.0, blue: 200.0/255.0, alpha: 0.8)
        tableView.addSubview(refreshControl)
    }
    
    // MARK: - UIRefreshControl Selector
    func refreshAllVideos(refreshControlV: UIRefreshControl) -> Void {
        refreshControlV.beginRefreshing()
        tableView.reloadData()
        refreshControlV.endRefreshing()
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

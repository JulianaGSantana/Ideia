//
//  DoubtViewController.swift
//  Ideia
//
//  Created by Juliana Santana on 19/07/21.
//
import UIKit

class DoubtViewController: UIViewController {
    
    @IBOutlet weak var exitButton: UIButton!
    
    
    lazy var view0: UIView = {
        let view = UIView()
        //view.backgroundColor = .systemTeal
        let label = UILabel()
        label.text = "Move the buttons with the themes to both sides.  When you find the desired one click on it.  You can click as many times as you like."
        label.textAlignment = .center
        label.numberOfLines = 5
        label.font = UIFont .boldSystemFont(ofSize: 17.0)
        view.addSubview(label)
        let imageName = "doubt1"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        view.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.frame.width/5).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -45).isActive = true
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height * 12).isActive = true
        imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier:0.8).isActive = true
        label.edgeTo(view: view)
        return view
    }()
    
    lazy var view1: UIView = {
        let view = UIView()
        //view.backgroundColor = .systemPink
        let label = UILabel()
        label.text = "When you like the theme, start creating, for that click on the notebook at the bottom and have access to the sketchbooks."
        label.textAlignment = .center
        label.numberOfLines = 4
        label.font = UIFont .boldSystemFont(ofSize: 17.0)
        view.addSubview(label)
        label.edgeTo(view: view)
        let imageName = "doubt2"
        let image = UIImage(named: imageName)
        let imageView1 = UIImageView(image: image!)
        view.addSubview(imageView1)
        imageView1.contentMode = .scaleAspectFit
        imageView1.translatesAutoresizingMaskIntoConstraints = false
        imageView1.widthAnchor.constraint(equalToConstant: 250).isActive = true
        imageView1.heightAnchor.constraint(equalToConstant: 200).isActive = true
        imageView1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView1.topAnchor.constraint(equalTo: view.topAnchor, constant: 95).isActive = true
        return view
    }()
    
    lazy var view2: UIView = {
        let view = UIView()
        //view.backgroundColor = .systemYellow
        let label = UILabel()
        label.text = "You can create as many as you want, as well as delete them. Click on the sketch you want to leave your creation on and add a new page."
        label.textAlignment = .center
        label.numberOfLines = 4
        label.font = UIFont .boldSystemFont(ofSize: 17.0)
        view.addSubview(label)
        label.edgeTo(view: view)
        let imageName = "doubt3.1"
        let image = UIImage(named: imageName)
        let imageView2 = UIImageView(image: image!)
        view.addSubview(imageView2)
        imageView2.contentMode = .scaleAspectFit
        imageView2.translatesAutoresizingMaskIntoConstraints = false
        imageView2.widthAnchor.constraint(equalToConstant: 250).isActive = true
        imageView2.heightAnchor.constraint(equalToConstant: 200).isActive = true
        imageView2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView2.topAnchor.constraint(equalTo: view.topAnchor, constant: 95).isActive = true
        return view
    }()
    
    lazy var view3: UIView = {
        let view = UIView()
        //view.backgroundColor = .systemBlue
        let label = UILabel()
        label.text = "Take a picture and your advances will be stored."
        label.textAlignment = .center
        label.numberOfLines = 4
        label.font = UIFont .boldSystemFont(ofSize: 17.0)
        view.addSubview(label)
        label.edgeTo(view: view)
        let imageName = "doubt4"
        let image = UIImage(named: imageName)
        let imageView3 = UIImageView(image: image!)
        view.addSubview(imageView3)
        imageView3.translatesAutoresizingMaskIntoConstraints = false
        imageView3.widthAnchor.constraint(equalToConstant: 250).isActive = true
        //imageView3.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height * 4).isActive = true
        imageView3.heightAnchor.constraint(equalToConstant: 200).isActive = true
        imageView3.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView3.topAnchor.constraint(equalTo: view.topAnchor, constant: 95).isActive = true
        view.addSubview(imageView3)
        return view
    }()
    
    
    lazy var views = [view0, view1, view2, view3]
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(views.count), height: view.frame.height)
        
        for i in 0..<views.count {
            scrollView.addSubview(views[i])
            views[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
        }
        
        scrollView.delegate = self
        
        return scrollView
    }()
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = views.count
        pageControl.currentPage = 0
        pageControl.addTarget(self, action: #selector(pageControlTapHandler(sender:)), for: .touchUpInside)
        return pageControl
    }()
    
    @objc
    func pageControlTapHandler(sender: UIPageControl) {
        scrollView.scrollTo(horizontalPage: sender.currentPage, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(scrollView)
        scrollView.edgeTo(view: view)
        
        view.addSubview(pageControl)
        pageControl.pinTo(view)
           
        }
 

    @IBAction func exitActionButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension DoubtViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
}

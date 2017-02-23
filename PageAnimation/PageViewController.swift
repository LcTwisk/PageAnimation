import UIKit
import SnapKit
import Lottie

class PageViewController: UIViewController, UIScrollViewDelegate {
	let pages = 6
	let animationView = LOTAnimationView.animationNamed("onboarding")!
	lazy var contentView = UIView()
	
	lazy var pagingControl: UIPageControl = {
		let p = UIPageControl()
		p.numberOfPages = self.pages
		p.pageIndicatorTintColor = .red
		p.currentPageIndicatorTintColor = .blue
		return p
	}()
	
	lazy var scrollView: UIScrollView = {
		let s = UIScrollView()
		s.isPagingEnabled = true
		s.delegate = self
		s.showsHorizontalScrollIndicator = false
		return s
	}()

	init() {
		super.init(nibName: nil, bundle: nil)
		setupViews()
		setupConstraints()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setupViews() {
		view.backgroundColor = .white
		view.addSubview(animationView)		
		view.addSubview(scrollView)
		view.addSubview(pagingControl)
		scrollView.addSubview(contentView)
	}
	
	func setupConstraints() {
		scrollView.snp.makeConstraints { (make) in
			make.top.right.bottom.left.equalToSuperview()
		}
		contentView.snp.makeConstraints { (make) in
			make.top.right.bottom.left.equalToSuperview()
			make.height.equalTo(view)
			make.width.equalTo(view).multipliedBy(pages)
		}
		
		animationView.snp.makeConstraints { (make) in
			make.width.height.equalTo(view.snp.width)
			make.centerY.equalToSuperview()
		}
		
		pagingControl.snp.makeConstraints { (make) in
			make.centerX.equalToSuperview()
			make.bottom.equalToSuperview().inset(20)
		}
	}
	
	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		let scrollViewWidth = scrollView.bounds.size.width
		let progress = (scrollView.contentOffset.x) / (scrollView.contentSize.width - scrollViewWidth)
		animationView.animationProgress = progress
		pagingControl.currentPage = Int(progress * CGFloat(pages))
	}
}

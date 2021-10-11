package controller.product;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import Model.AuthInfoDTO;
import Model.PageDTO;
import Model.ProductDTO;
import command.ProdCommand;
import command.ReviewCommand;
import service.coupon.CouponSelectService;
import service.coupon.CpMemSelectService;
import service.product.HitsproductListService;
import service.product.HotelDetailService;
import service.product.ProdThemeListService;
import service.product.ProductDeleteService;
import service.product.ProductDetailService;
import service.product.ProductListService;
import service.product.ProductLocationListService;
import service.product.ProductNumberService;
import service.product.ProductUpdateService;
import service.product.ProductWriteService;
import service.product.ReviewListService;
import service.product.ReviewUpdateService;
import service.product.ReviewWriteService;
import service.wishlist.WishlistService;

@Controller
@RequestMapping("product")
public class ProductController {
	@Autowired
	ProductNumberService productNumberService;
	@Autowired
	ProductWriteService productWriteService;
	@Autowired
	ProductListService productListService;
	@Autowired
	ProductLocationListService productLocationListService;
	@Autowired
	ProductDetailService productDetailService;
	@Autowired
	ProductUpdateService productUpdateService;
	@Autowired
	ProductDeleteService productDeleteService;
	@Autowired
	HotelDetailService hotelDetailService;
	@Autowired
	WishlistService wishlistService;
	@Autowired
	CouponSelectService couponSelectService;
	@Autowired
	CpMemSelectService cpMemSelectService;
	@Autowired
	ReviewWriteService reviewWriteService;
	@Autowired
	ReviewUpdateService reviewUpdateService;
	@Autowired
	ReviewListService reviewListService;
	@Autowired
	ProdThemeListService prodThemeListService;

	
	
	@RequestMapping("prodJoin") /// IOC
	public String prodJoin(ProdCommand prodCommand,Errors errors,HttpSession session) {
		/*
		 * new ProdCommandValidator().validate(prodCommand, errors);
		 * if(errors.hasErrors()) { return "product/prodJoin"; }
		 */
		productWriteService.prodInsert(prodCommand, session);
		return "redirect:prodList";
	}
	
	
	@RequestMapping("prodRegist") /// IOC
	public String prodRegist(Model model) {
		productNumberService.prodNo(model);
		return "product/prodJoin";
	}
	
	
	@RequestMapping("prodList")
	public String prodlist(@RequestParam(value="page", defaultValue = "1") int page, Model model) {
		List<ProductDTO> prodList = productListService.prodList(page);
		model.addAttribute("prodList", prodList);
		PageDTO pageDTO = productListService.productCount(page);
		model.addAttribute("pageDTO", pageDTO);
		productListService.productAllCount(model);
		return "product/prodList";
	}

	
	@RequestMapping("prodSeoulList")
	public String seoulList(@RequestParam(value="page", defaultValue = "1") int page, @RequestParam(value="prodLocation") String prodLocation, Model model) {
		List<ProductDTO> seoulList = productLocationListService.seoulList(page, prodLocation);
		model.addAttribute("seoulList", seoulList);
		PageDTO pageDTO = productLocationListService.seoulCount(page);
		model.addAttribute("pageDTO", pageDTO);
		productLocationListService.seoulCount1(model);
		return "product/prodSeoulList";
	}
	
	@RequestMapping("prodGyeonggiList")
	public String gyeList(@RequestParam(value="page", defaultValue = "1") int page, 
			@RequestParam(value="prodLocation") String prodLocation, Model model) {
		List<ProductDTO> gyeList = productLocationListService.gyeList(page, prodLocation);
		model.addAttribute("gyeList", gyeList);
		PageDTO pageDTO = productLocationListService.gyeCount(page);
		model.addAttribute("pageDTO", pageDTO);
		productLocationListService.gyeCount1(model);
		return "product/prodGyeonggiList";
	}
	
	@RequestMapping("prodJejuList")
	public String jejuList(@RequestParam(value="page", defaultValue = "1") int page, 
			@RequestParam(value="prodLocation") String prodLocation, Model model) {
		List<ProductDTO> jejuList = productLocationListService.jejuList(page, prodLocation);
		model.addAttribute("jejuList", jejuList);
		PageDTO pageDTO = productLocationListService.jejuCount(page);
		model.addAttribute("pageDTO", pageDTO);
		productLocationListService.jejuCount1(model);
		return "product/prodJejuList";
	}
	
	@RequestMapping("prodgsdList")
	public String gsdList(@RequestParam(value="page", defaultValue = "1") int page, @RequestParam(value="prodLocation") String prodLocation, Model model) {
		List<ProductDTO> gsdList = productLocationListService.gsdList(page, prodLocation);
		model.addAttribute("gsdList", gsdList);
		PageDTO pageDTO = productLocationListService.gsdCount(page);
		model.addAttribute("pageDTO", pageDTO);
		productLocationListService.gsdCount1(model);
		return "product/prodgsdList";
	}
	
	

	///////////////////////////////////테마여행/////////////////////////////////
	
	//액티비티
	@RequestMapping("themeActive")
	public String themeActive(@RequestParam(value="page", defaultValue = "1") int page, @RequestParam(value="prodTheme") String prodTheme, Model model) {
		List<ProductDTO> activityList = prodThemeListService.activityList(page, prodTheme);
		model.addAttribute("activityList", activityList);
		//상품 페이징 처리
		PageDTO pageDTO = prodThemeListService.activeCount(page);
		model.addAttribute("pageDTO", pageDTO);
		//총상품의 갯수 불러오기
		prodThemeListService.activeCount1(model);
		return "Thema/themeActive";
	}
	
	//힐링
	@RequestMapping("themeHeeling")
	public String themeheeling(@RequestParam(value="page", defaultValue = "1") int page, @RequestParam(value="prodTheme") String prodTheme, Model model) {
		List<ProductDTO> heelingList = prodThemeListService.heelingList(page, prodTheme);
		model.addAttribute("heelingList", heelingList);
		//상품 페이징 처리
		PageDTO pageDTO = prodThemeListService.heelingCount(page);
		model.addAttribute("pageDTO", pageDTO);
		//총상품의 갯수 불러오기
		prodThemeListService.heelingCount1(model);
		return "Thema/themaheeling";
	}
	
	//푸드
	@RequestMapping("themeFood")
	public String themefood(@RequestParam(value="page", defaultValue = "1") int page, @RequestParam(value="prodTheme") String prodTheme, Model model) {
		List<ProductDTO> foodList = prodThemeListService.foodList(page, prodTheme);
		model.addAttribute("foodList", foodList);
		//상품 페이징 처리
		PageDTO pageDTO = prodThemeListService.foodCount(page);
		model.addAttribute("pageDTO", pageDTO);
		//총상품의 갯수 불러오기
		prodThemeListService.foodCount1(model);
		return "Thema/themefood";
	}
	
	//히스토리
	@RequestMapping("themeHistory")
	public String histroyList(@RequestParam(value="page", defaultValue = "1") int page, @RequestParam(value="prodTheme") String prodTheme, Model model) {
		List<ProductDTO> histroyList = prodThemeListService.histroyList(page, prodTheme);
		model.addAttribute("histroyList", histroyList);
		//상품 페이징 처리
		PageDTO pageDTO = prodThemeListService.histroyCount(page);
		model.addAttribute("pageDTO", pageDTO);
		//총상품의 갯수 불러오기
		prodThemeListService.histroyCount1(model);
		return "Thema/themehistory";
	}
	
	
	
	@RequestMapping("prodDetail")
	public String prodDetail(@RequestParam(value = "prodNo") String prodNo, Model model) {
		productDetailService.prodDetail(prodNo, model);
		return "product/prodDetail";
	}
	
	
	@RequestMapping("prodModify")
	public String prodModify(@RequestParam(value="prodNo") String prodNo, Model model) {
		productDetailService.prodDetail(prodNo, model);
		return "product/prodModify";
	}
	
	
	@RequestMapping("prodUpdate")
	public String prodUpdate(ProdCommand prodCommand, Errors errors, HttpSession session) {
		productUpdateService.prodUpdate(prodCommand, session);
		return "redirect:/product/prodList";
	}	
	
	
	@RequestMapping("prodDel")
	public String prodDel(@RequestParam(value="prodNo")String prodNo, HttpSession session) {
		productDeleteService.prodDel(prodNo, session);
		return "redirect:prodList";
	}
	
	@RequestMapping("prodView")
	public String prodView(@RequestParam(value="prodNo") String prodNo, Model model, HttpSession session) {
		reviewListService.reviewAvg(prodNo, model);
		//멤버쿠폰 가져오는 서비스
		AuthInfoDTO authInfo = (AuthInfoDTO)session.getAttribute("authInfo");
		if(authInfo != null) {
			cpMemSelectService.cpMemSelect(prodNo,session,model);
			productDetailService.prodDetail(prodNo, model);
			hotelDetailService.hotelViewDetail(null, prodNo, model);
			couponSelectService.cpSelect(prodNo,model);
			reviewListService.reviewList(prodNo, model);
			//위시리스트
			wishlistService.getWishCount(session, model, prodNo);
			return "product/prodView";
		} else {
			productDetailService.prodDetail(prodNo, model);
			hotelDetailService.hotelViewDetail(null, prodNo, model);
			couponSelectService.cpSelect(prodNo,model);
			reviewListService.reviewList(prodNo, model);
			return "product/prodView";
		}
	}


	@RequestMapping("wishAdd")
	public String wishAdd(@RequestParam(value="prodNo") String prodNo, HttpSession session, Model model) {
		wishlistService.goodsWishAdd(prodNo, session, model);
		model.addAttribute("prodNo",prodNo);
		return "product/wish_add_success";
	}
	@RequestMapping("wishDelete")
	public String deleteWish(@RequestParam(value="prodNo") String prodNo, HttpSession session) {
		wishlistService.deleteWish(prodNo,session);
		return "product/wish_delete_success";
	}
	
	
	
	//////////////////////////////리뷰//////////////////////////////
	
	//리뷰작성
	@RequestMapping("productReview")
	public String productReview(@RequestParam(value = "paymentNo") String paymentNo, @RequestParam(value = "prodNo") String prodNo,Model model) {
		model.addAttribute("pay",paymentNo);
		model.addAttribute("prod",prodNo);
		return "product/productReview";
	}
	
	@RequestMapping(value = "reviewJoin", method = RequestMethod.POST)
	public String reviewJoin(ReviewCommand reviewCommand, HttpSession session) {
		reviewWriteService.reviewInsert(reviewCommand, session);
		return "redirect:../pl/OrderProcessList";
	}

	
	@RequestMapping("reviewUpdate")
	public String reviewUpdate(ReviewCommand reviewCommand) {
		reviewUpdateService.reviewUpdate(reviewCommand);
		return "redirect:../pl/OrderProcessList";
	}
	
	@RequestMapping("productReviewUpdate")
	public String reviewUpdate(@RequestParam(value = "paymentNo") String paymentNo, @RequestParam(value = "prodNo") String prodNo,Model model,HttpSession session) {
		model.addAttribute("pay",paymentNo);
		model.addAttribute("prod",prodNo);
		reviewUpdateService.reviewInfo(paymentNo, prodNo , model, session);	
		return "product/productReviewModify";
	}

}

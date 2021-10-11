package controller.product;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import Model.HotelDTO;
import Model.PageDTO;
import command.HotelCommand;
import command.LogInCommand;
import command.ProdCommand;
import service.product.HotelDeleteService;
import service.product.HotelDetailService;
import service.product.HotelListService;
import service.product.HotelNumberService;
import service.product.HotelUpdateService;
import service.product.HotelWriteService;
import validator.HotelCommandValidator;
import validator.ProdCommandValidator;

@Controller
@RequestMapping("hotel")
public class HotelController {
	@Autowired
	HotelNumberService hotelNumberService;
	@Autowired
	HotelWriteService hotelWriteService;
	@Autowired
	HotelListService hotelListService;
	@Autowired
	HotelDetailService hotelDetailService;
	@Autowired
	HotelUpdateService hotelUpdateService;
	@Autowired
	HotelDeleteService hotelDeleteService;
	
	@RequestMapping("hotelJoin") /// IOC
	public String hotelJoin(HotelCommand hotelCommand, Errors errors, HttpSession session) {
		/*
		 * new HotelCommandValidator().validate(hotelCommand, errors);
		 * if(errors.hasErrors()) { 
		 * return "hotel/hotelJoin"; 
		 * }
		 */		
		hotelWriteService.hotelInsert(hotelCommand, session); 
		return "redirect:hotelList";
	}
	
	@RequestMapping("hotelRegist") /// IOC
	public String hotelRegist(Model model) {
		hotelNumberService.hotelNo(model);
		return "hotel/hotelJoin";
	}
	
	@RequestMapping("hotelDetail")
	public String hotelDetail(@RequestParam(value = "hotelNo") int hotelNo, Model model) {
		hotelDetailService.hotelDetail(hotelNo, null, model);
		return "hotel/hotelDetail";
	}
	@RequestMapping("hotelModify")
	public String hotelModify(@RequestParam(value="hotelNo") int hotelNo, Model model) {
		hotelDetailService.hotelDetail(hotelNo, null, model);
		return "hotel/hotelModify";
	}
	

	@RequestMapping("hotelUpdate")
	public String hotelUpdate(HotelCommand hotelCommand, Errors errors, HttpSession session) {
		/*
		new HotelCommandValidator().validate(hotelCommand, errors);
		
		 * if (errors.hasErrors()) { return "hotel/hotelModify"; }
		 */
		hotelUpdateService.hotelUpdate(hotelCommand, session);
		return "redirect:/hotel/hotelList";
	}

	@RequestMapping("hotelDel")
	public String hotelDel(@RequestParam(value="hotelNo")int hotelNo, HttpSession session) {
		hotelDeleteService.hotelDel(hotelNo, session);
		return "redirect:hotelList";
	}
	
	@RequestMapping("hotelList")
	public String hotelList(@RequestParam(value = "page", defaultValue = "1") int page, Model model) {
		 hotelListService.hotelList(page,model);
		 hotelListService.hotelCount(page,model);
		return "hotel/hotelList";
	}
	

}

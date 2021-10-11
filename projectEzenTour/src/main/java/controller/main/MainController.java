package controller.main;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import Model.ProductDTO;
import command.LogInCommand;
import command.ProductHotelCommand;
import service.employee.EmployeeDetailService;
import service.employee.EmployeeListService;
import service.main.SearchService;
import service.member.MemberListService;
import service.product.HitsproductListService;
import service.product.HotelRecommandDetailService;
import service.product.ProductListService;

@Controller
public class MainController {
	@Autowired
	ProductListService productListService;
	@Autowired
	HotelRecommandDetailService HotelRecommandDetailService;
	@Autowired
	EmployeeListService employeeListService;
	@Autowired
	MemberListService memberListService;
	@Autowired
	EmployeeDetailService employeeDetailService;
	@Autowired
	SearchService searchService;
	@Autowired
	HitsproductListService hitsproductListService;
	
		//채팅============================================
		@RequestMapping("chattingS")
		public String chattingS() {
			return "chatting/chatS";
		}
		
		@RequestMapping("chattingG")
		public String chattingG() {
			return "chatting/chatG";
		}
		
		@RequestMapping("chattingK")
		public String chattingK() {
			return "chatting/chatK";
		}
		
		@RequestMapping("chattingJ")
		public String chattingJ() {
			return "chatting/chatJ";
		}
		@RequestMapping("chatting")
		public String chatting() {
			return "chatting/chatSelect";
		}
		
		
		
		@RequestMapping("recommand") 
		public String recommand(ProductHotelCommand productHotelCommand, Model model) {
			 HotelRecommandDetailService.HRecommandDetail(productHotelCommand,model);
			 return "main/surveyResult"; 
		 }
		
		
		 
		@RequestMapping("survey")
		public String survey() {
			return "main/survey";
		}
		
		@RequestMapping("pop")
		public String pop() {
			return "main/pop";
		}
		
		@RequestMapping("mapview")
		public String mapview() {
			return "main/mapview";
		}
		
		@RequestMapping("main")
		public String mainPage(@ModelAttribute LogInCommand logInCommand, @RequestParam(value="page", defaultValue = "1") int page, Model model) {
			hitsproductListService.hitsList(model);//조회수별 리스트출력
			List<ProductDTO> prodList = productListService.prodList(page);	
			model.addAttribute("prodList", prodList);
			return "main/main";
		}
	
	//메인 top jsp전용
		//직원리스트
		@RequestMapping("empList")
		public String empList() {
			return "employee/employeeList";	
		}
		
		//직원 마이페이지
		@RequestMapping("empMypage")
		public String memMypage(HttpSession session, Model model) {
			employeeDetailService.empMypage(session, model);
			return "employee/employeeInfo";	
		}

		//회원리스트 List
		@RequestMapping("memList")
		public String memList( @RequestParam(value="page" ,defaultValue = "1") Integer page, Model model) {
			memberListService.memList(model,null,page);
			return "member/memberList";
		}
		
		//검색기능
		@RequestMapping("searchName")
		public String searchName(@RequestParam(value="prodName")String prodName ,@RequestParam(value="page", defaultValue = "1") int page,Model model ) {
			searchService.Search(prodName,model);
			List<ProductDTO> prodList = productListService.prodList(page);
			model.addAttribute("prodList", prodList);
			return "main/main";
		}
}

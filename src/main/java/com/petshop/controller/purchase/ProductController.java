package com.petshop.controller.purchase;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.petshop.purchase.dto.CartVO;
import com.petshop.purchase.dto.ProductVO;
import com.petshop.purchase.service.CartService;
import com.petshop.purchase.service.CommentService;
import com.petshop.purchase.service.ProductService;

import utils.Criteria;
import utils.PageMaker;


@Controller
public class ProductController {

   @Autowired
   private ProductService productService;
   @Autowired
   private CartService cartService;
   @Autowired
   private CommentService commentService;
   
//      @GetMapping("/blog")
//      public String productGo(ProductVO vo,Model model) {
//        //vo.setCno(1);
//        List<ProductVO> productList=productService.getProductList(vo);
//        model.addAttribute("productList", productList);
//         return "/product/DogClothes";
//      }
//      
//      @GetMapping("/dogtoy")
//      public String productGo2(ProductVO vo,Model model) {
//       //  vo.setCno(2);
//         List<ProductVO> productList=productService.getProductList(vo);
//         model.addAttribute("productList", productList);
//         return "/product/DogToy";
//      }
//      
//      @GetMapping("/dogsnack")
//      public String productGo3(ProductVO vo,Model model) {
//        // vo.setCno(3);
//         List<ProductVO> productList=productService.getProductList(vo);
//         model.addAttribute("productList", productList);
//         
//         return "/product/DogSnack";
//      }
//      
//      @GetMapping("product_detail")
//      public String productDetail(ProductVO vo,Model model) {
//         ProductVO productVO=productService.getProductDetail(vo);
//         model.addAttribute("productVO", productVO);
//         return "/product/ClothesDetail";
//      }
//   
//      //상품 조회
//      @RequestMapping(value="/product_detail",method=RequestMethod.GET)
//      public String productDetailAction(ProductVO vo,Model model) {
//         
//      //상품 상세 조회
//         ProductVO product =productService.getlistProduct(vo);
//         
//         //결과 조회
//         model.addAttribute("ProductVO", product);
//         
//         return "product/productDetail";
//      }
   
   
      
      @GetMapping("product_All")
      public String productAll(Model model,Criteria criteria,
             @RequestParam(value = "pname", defaultValue = "") String pname,
            @RequestParam(value = "pageNum", defaultValue = "") String pageNum,
              @RequestParam(value = "rowsPerPage", defaultValue = "6") String rowsPerPage) {
         
         if(pageNum.length()==0) {
            pageNum="1";
        }
        int p = Integer.parseInt(pageNum);
        criteria.setPageNum(p);
        p=(p-1)*6; 
        criteria.setSqlPage(p); 
        criteria.setRowsPerPage(Integer.parseInt(rowsPerPage));
        // (1) 전체 상품목록 조회
       List<ProductVO> productAllList=productService.getProductAllList(criteria,pname); 

        // (2) 화면에 표시할 페이지 버튼 정보 설정(PageMaker 클래스 이용)
        PageMaker pageMaker = new PageMaker();
        pageMaker.setCriteria(criteria); // 현재 페이지 정보 저장
        pageMaker.setTotalCount(productService.getProductAllCount(pname)); // 전체 게시글의 수 저장
        
        //wprice *(1+(margin/100));
        
        //(wprice/100*margin)+wprice
        
        // (2) model 객체에 상품 목록 저장
        model.addAttribute("productAllList", productAllList);
        model.addAttribute("pageMaker", pageMaker);
        model.addAttribute("criteria", criteria);
        
         return "product2/productPage";
      }
      
      @GetMapping("product_Cno_List")
      public String productAll(Model model,Criteria criteria,
               @RequestParam(value = "cno") int cno,
            @RequestParam(value = "pageNum", defaultValue = "") String pageNum,
              @RequestParam(value = "rowsPerPage", defaultValue = "6") String rowsPerPage) {
         if(pageNum.length()==0) {
            pageNum="1";
        }
        int p = Integer.parseInt(pageNum);
        criteria.setPageNum(p);
        p=(p-1)*6; 
        criteria.setSqlPage(p); 
        criteria.setRowsPerPage(Integer.parseInt(rowsPerPage));
        // (1) 전체 상품목록 조회
       List<ProductVO> productAllList=productService.getProductCnoList(criteria, cno);

        // (2) 화면에 표시할 페이지 버튼 정보 설정(PageMaker 클래스 이용)
        PageMaker pageMaker = new PageMaker();
        pageMaker.setCriteria(criteria); // 현재 페이지 정보 저장
        pageMaker.setTotalCount(productService.getProductCnoCount(cno)); // 전체 게시글의 수 저장
        
        // (2) model 객체에 상품 목록 저장
        model.addAttribute("productAllList", productAllList);
        model.addAttribute("pageMaker", pageMaker);
         return "product2/productPage";
      }
      
      @GetMapping("product_One")
      public String productOne(Model model,ProductVO vo,Criteria criteria) {
         ProductVO pvo=productService.getProductDetail(vo);
         List<ProductVO> productAllList=productService.getProductAllList(criteria,""); 
         
         int countr=commentService.getCountR(pvo.getPno());
         String astar=commentService.getStarAvg(vo.getPno());
 		double avgstar=0;
 		
 		if(astar!=null) {
 			avgstar=Double.parseDouble(astar);
 		}
         model.addAttribute("countr", countr);
         model.addAttribute("avgstar", avgstar);
         
         model.addAttribute("pvo", pvo);
         model.addAttribute("productAllList", productAllList);
         
         return "product2/productDetail";
      }
      
      
      //장바구니 담기
      @PostMapping("cart_insert")
      public String cartInsert(CartVO vo2,Model model) {
         
         cartService.insertCart(vo2);
         
         return "redirect:product_All";
      }
      
      
      

}
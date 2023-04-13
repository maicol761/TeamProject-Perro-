package com.petshop.controller.beauty;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.petshop.beauty.dto.DogVO;
import com.petshop.beauty.dto.ReservationVO;
import com.petshop.beauty.dto.ServiceVO;
import com.petshop.beauty.service.ReservationService;

@Controller
public class ReservationController {
	
	@Autowired
	private ReservationService reservationService;
	
	//예약 홈페이지 이동
	@GetMapping("reservation_home")
		public String reservation_home(ReservationVO vo,
				@RequestParam(value="rrdate", defaultValue="")String date
				,Model model) {
		String now=LocalDate.now().plusDays(1).toString();
		if(date.length()==0 || date==null) {
			date=now;
		}
		vo.setRrdate(date);
		List<ReservationVO> rList=reservationService.getReservation(vo);
		// list 안에 rtime,rteacher 비교 1,0 반환
				List<Integer> choireservList=new ArrayList<Integer>(); 
				
				for(int i=0;i<8;i++) {
					choireservList.add(i, 0);
				}
				
				for(ReservationVO a:rList) {
					if(a.toString().equals("10choi")) {
						choireservList.set(0, 1);
					}
					if(a.toString().equals("11choi")) {
						choireservList.set(1, 1);
					}
					if(a.toString().equals("12choi")) {
						choireservList.set(2, 1);
					}
					if(a.toString().equals("14choi")) {
						choireservList.set(3, 1);
					}
					if(a.toString().equals("15choi")) {
						choireservList.set(4, 1);
					}
					if(a.toString().equals("16choi")) {
						choireservList.set(5, 1);
					}
					if(a.toString().equals("17choi")) {
						choireservList.set(6, 1);
					}
					if(a.toString().equals("18choi")) {
						choireservList.set(7, 1);
					}
				}
				
				List<Integer> leereservList=new ArrayList<Integer>(); 
				
				for(int i=0;i<8;i++) {
					leereservList.add(i, 0);
				}
				
				for(ReservationVO a:rList) {
					if(a.toString().equals("10lee")) {
						leereservList.set(0, 1);
					}
					if(a.toString().equals("11lee")) {
						leereservList.set(1, 1);
					}
					if(a.toString().equals("12lee")) {
						leereservList.set(2, 1);
					}
					if(a.toString().equals("14lee")) {
						leereservList.set(3, 1);
					}
					if(a.toString().equals("15lee")) {
						leereservList.set(4, 1);
					}
					if(a.toString().equals("16lee")) {
						leereservList.set(5, 1);
					}
					if(a.toString().equals("17lee")) {
						leereservList.set(6, 1);
					}
					if(a.toString().equals("18lee")) {
						leereservList.set(7, 1);
					}
				}
				
				List<Integer> jangreservList=new ArrayList<Integer>(); 
				
				for(int i=0;i<8;i++) {
					jangreservList.add(i, 0);
				}
				
				for(ReservationVO a:rList) {
					if(a.toString().equals("10jang")) {
						jangreservList.set(0, 1);
					}
					if(a.toString().equals("11jang")) {
						jangreservList.set(1, 1);
					}
					if(a.toString().equals("12jang")) {
						jangreservList.set(2, 1);
					}
					if(a.toString().equals("14jang")) {
						jangreservList.set(3, 1);
					}
					if(a.toString().equals("15jang")) {
						jangreservList.set(4, 1);
					}
					if(a.toString().equals("16jang")) {
						jangreservList.set(5, 1);
					}
					if(a.toString().equals("17jang")) {
						jangreservList.set(6, 1);
					}
					if(a.toString().equals("18jang")) {
						jangreservList.set(7, 1);
					}
				}
			model.addAttribute("rrdate", date);
			model.addAttribute("choireservList", choireservList);
			model.addAttribute("leereservList", leereservList);
			model.addAttribute("jangreservList", jangreservList);
			return "beauty/reservationHome";
		}
	
	//예약 페이지로 이동
	@GetMapping("/reservationPage")
	public String findZipNumView(ReservationVO vo,Model model) {

		//견종 카테고리
		List<DogVO> dogList = reservationService.getDog();
		//서비스 카테고리
		List<ServiceVO> serviceList = reservationService.getServiceList();
		
		model.addAttribute("vo", vo);
		model.addAttribute("dogList", dogList);
		model.addAttribute("serviceList", serviceList);
	      return "beauty/reservationPage";
	}
	
	//예약 insert
	@PostMapping("reservation_write")
	public String reservation_write(
			@RequestParam(value="pay3")int rprice,
			ReservationVO vo,Model model) {
		
		int dno2=vo.getDno()/5000-3;
		
		int sno2=vo.getSno()/5000+1;
		
		
		vo.setRtime(vo.getRtime().substring(0, 2));
		vo.setRprice(rprice);
		vo.setDno(dno2);
		vo.setSno(sno2);
		
		System.out.println("결과: "+vo.toString());
		int result=0;
		if(reservationService.getReserCheck(vo).size()==0) {
			reservationService.insertReservation(vo);
			result=1;
		}
			model.addAttribute("result", result);
			return "beauty/reservationResult";
		}
	
//-----------------------------------------------------------------------------------------------	
	@GetMapping("reservation_price")
	public String reservationPrice() {
		
		return "beauty/reservationPrice";
	}
	
	
}

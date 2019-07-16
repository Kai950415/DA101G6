package com.ad.controller;

import java.io.*;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.res.model.*;
import com.ad.model.*;

@WebServlet("/ad.do")
@MultipartConfig(
fileSizeThreshold = 1024 * 1024,
  maxFileSize = 1024 * 1024 * 5, 
  maxRequestSize = 1024 * 1024 * 5 * 5)
public class AdServlet extends HttpServlet{
	
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
		
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException{

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		HttpSession session = req.getSession();
		
		if("getOneAd_For_Display_By_Admin".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			
			try {
				String str = req.getParameter("ad_no");
				if(str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入廣告編號");
				}
				
				if(!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/ad/ad_BE.jsp");
					failureView.forward(req, res);
					return;
				}
				
				String ad_no = null;
				try {
					ad_no = new String(str);
				} catch (Exception e) {
					errorMsgs.add("廣告編號格式不正確");
				}
				
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/ad/ad_BE.jsp");
					failureView.forward(req, res);
					return;
				}
				
				
				AdService adSvc = new AdService();
				AdVO adVO = adSvc.getOneAd(ad_no);
				if(adVO == null) {
					errorMsgs.add("查無資料");
				}
				
				if(!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/ad/ad_BE.jsp");
					failureView.forward(req, res);
					return;
				}
				
				req.setAttribute("adVO", adVO);
				String url = "/back-end/ad/listOneAd_BE.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); 
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/ad/ad_BE.jsp");
				failureView.forward(req, res);
			}
		}
		
		if("getOneAd_For_Display_By_Res".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			
			try {
				String str = req.getParameter("ad_no");
				if(str == null || str.trim().length() == 0) {
					errorMsgs.add("請輸入廣告編號");
				}
				
				if(!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/ad/ad_FE.jsp");
					failureView.forward(req, res);
					return;
				}
				
				String ad_no = null;
				try {
					ad_no = new String(str);
				} catch (Exception e) {
					errorMsgs.add("廣告編號格式不正確");
				}
				
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/ad/ad_FE.jsp");
					failureView.forward(req, res);
					return;
				}
				
				
				AdService adSvc = new AdService();
				
				ResVO resVO = (ResVO)session.getAttribute("resVO");
				String ad_resno = resVO.getRes_no();
				AdVO adVO = adSvc.getOneAdbyRes(ad_no,ad_resno);
				if(adVO == null) {
					errorMsgs.add("查無資料");
				}
				
				if(!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/ad/ad_FE.jsp");
					failureView.forward(req, res);
					return;
				}
				
				req.setAttribute("adVO", adVO);
				String url = "/front-end/ad/listOneAd_FE.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); 
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/ad/ad_FE.jsp");
				failureView.forward(req, res);
			}
		}
		
		if("insert".equals(action)) {
			System.out.println("157");
			List<String> errorMsgs = new LinkedList<String>();

			req.setAttribute("errorMsgs", errorMsgs);
			System.out.println("161");
			try {
				
				ResVO resVO = (ResVO)session.getAttribute("resVO");
				System.out.println("161");
				String ad_resno = resVO.getRes_no();
				System.out.println("167");
				String ad_text = req.getParameter("ad_text");
				String ad_textReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{30,500}$";
				if(ad_text == null || ad_text.trim().length() == 0) {
					errorMsgs.add("請輸入廣告內文");
				}else if(!ad_text.trim().matches(ad_textReg)) { 
					errorMsgs.add("廣告內文: 只能是中、英文字母、數字和_ , 且長度必需在30到500之間");
	            }
				System.out.println("175");
				String ad_title = req.getParameter("ad_title");
				String ad_titleReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,30}$";
				if(ad_title == null || ad_title.trim().length() == 0) {
					errorMsgs.add("請輸入廣告標題");
				}else if(!ad_title.trim().matches(ad_titleReg)) { 
					errorMsgs.add("廣告標題: 只能是中、英文字母、數字和_ , 且長度必需在2到30之間");
	            }
				System.out.println("183");
				Part part = req.getPart("ad_img");
				InputStream in = part.getInputStream();
				byte[] ad_img = null;
				if(in.available()==0) {
					errorMsgs.add("請上傳廣告圖片");
				}else{
					in = part.getInputStream();
					ad_img = new byte[in.available()];
					in.read(ad_img);
				} in.close();
				
				System.out.println("195");
				String ad_status = "ads1"; //新增廣告時預設狀態ads1 = 未審核
				
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				java.sql.Timestamp ad_start = null;
				try {
					ad_start = new java.sql.Timestamp(dateFormat.parse(req.getParameter("ad_start").trim()).getTime());
				} catch (IllegalArgumentException | ParseException e) {
					ad_start = new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("請輸入廣告結束刊登時間");
				}
				
				System.out.println("199");
				java.sql.Timestamp ad_end = null;
				try {
					ad_end = new java.sql.Timestamp(dateFormat.parse(req.getParameter("ad_end").trim()).getTime());
				} catch (IllegalArgumentException | ParseException e) {
					ad_end = new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("請輸入廣告結束刊登時間");
				}
					System.out.println("205");	
				
					
				AdVO adVO = new AdVO();
				
				adVO.setAd_resno(ad_resno);
				adVO.setAd_title(ad_title);
				adVO.setAd_text(ad_text);
				adVO.setAd_img(ad_img);
				adVO.setAd_status(ad_status);
				adVO.setAd_start(ad_start);
				adVO.setAd_end(ad_end);
				System.out.println("219");
				if(!errorMsgs.isEmpty()) {
					req.setAttribute("adVO", adVO);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/ad/addAd.jsp");
					failureView.forward(req, res);
					return;
				}
				System.out.println("227");
				AdService adSvc = new AdService();
				adVO = adSvc.addAd(ad_resno, ad_text, ad_img, ad_start, ad_end, ad_title, ad_status);
				req.setAttribute("adVO", adVO);
				String url = "/front-end/ad/listOneAd_FE.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/ad/addAd.jsp");
				failureView.forward(req, res);
			}
		}
	}
}

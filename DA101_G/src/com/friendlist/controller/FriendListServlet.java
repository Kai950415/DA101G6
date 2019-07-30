package com.friendlist.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.feastinfo.model.FeastInfoService;
import com.feastinfo.model.FeastInfoVO;
import com.friendlist.model.FriendListService;
import com.friendlist.model.FriendListVO;
import com.mem.model.MemService;
import com.mem.model.MemVO;

public class FriendListServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(request, res);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse res)
			throws ServletException, IOException {
		 HttpSession session = request.getSession();

		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		
		System.out.println("action" + action);
//		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求
//
//			List<String> errorMsgs = new LinkedList<String>();
//			// Store this set in the requestuest scope, in case we need to
//			// send the ErrorPage view.
//			request.setAttribute("errorMsgs", errorMsgs);
//
//			try {
//				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
//				String str = request.getParameter("f_memno");
//				
//				if (str == null || (str.trim()).length() == 0) {
//					errorMsgs.add("請輸入好友會員編號");
//				}
//				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					requestuestDispatcher failureView = req
//							.getRequestDispatcher("/friendlist/select_page.jsp");
//					failureView.forward(req, res);
//					return;//程式中斷
//				}
//				
//				String f_memno = null;
//				try {
//					f_memno = new String(str);
//				} catch (Exception e) {
//					errorMsgs.add("好友會員編號格式不正確");
//				}
//				
//				
//				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/friendlist/select_page.jsp");
//					failureView.forward(req, res);
//					return;//程式中斷
//				}
//				
//				/***************************2.開始查詢資料*****************************************/
//				FriendListService friSvc = new FriendListService();
//				FriendListService friendlistVO = friSvc.getOneReportFeast(f_memno);
//				if (friendlistVO == null) {
//					errorMsgs.add("查無資料");
//				}
//				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/friendlist/select_page.jsp");
//					failureView.forward(req, res);
//					return;//程式中斷
//				}
//				
//				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
//				req.setAttribute("friendlistVO", friendlistVO); // 資料庫取出的empVO物件,存入req
//				String url = "/friendlist/listOneEmp.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
//				successView.forward(req, res);
//
//				/***************************其他可能的錯誤處理*************************************/
//			} catch (Exception e) {
//				errorMsgs.add("無法取得資料:" + e.getMessage());
//				RequestDispatcher failureView = req
//						.getRequestDispatcher("/friendlist/select_page.jsp");
//				failureView.forward(req, res);
//			}
//		}
		

        if ("insert".equals(action)) { 
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
//			request.setAttribute("errorMsgs", errorMsgs);

			try {
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				 FeastInfoService feastInfoService = new FeastInfoService();
				 
				 MemVO memVO=(MemVO) session.getAttribute("memberVO");
				 FriendListService friSvc=new FriendListService();
				 
				 
				 String mye_feano = (String) request.getParameter("mye_feano");
				 System.out.println("mye_feano" + mye_feano);
				 
				 FeastInfoVO feastInfoVO = feastInfoService.getOneFeastInfo(mye_feano);
				 System.out.println(feastInfoVO);
				 
				 String f_memno = (String) request.getParameter("f_memno");
				 System.out.println("f_memno" + f_memno);
				 
				 String f_no =memVO.getMem_no();
				 System.out.println("f_no" + f_no);
				 
				

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					request.setAttribute("feastInfoVO", feastInfoVO);
					RequestDispatcher failureView = request
							.getRequestDispatcher("/front-end/feast/listOneFeast.jsp");
					failureView.forward(request, res);
					return;
				}
				
				/***************************2.開始新增資料***************************************/
				 friSvc.addFriendList(f_no,f_memno);	//???

				 request.setAttribute("feastInfoVO", feastInfoVO);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = request.getContextPath() + "/front-end/feast/listOneFeast.jsp";
				
				
				RequestDispatcher successView = request.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(request, res);				
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = request
						.getRequestDispatcher("/front-end/feast/listOneFeast.jsp");
				failureView.forward(request, res);
			}
		}
		
		
		if ("delete".equals(action)) { // 來自listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			request.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.接收請求參數***************************************/
				//MemVO memVO = (MemVO) session.getAttribute("memberVO");
				 MemService memSv = new MemService();
				 MemVO memVO=memSv.memFindByPrimaryKey("ME000001");
				 FriendListService friSvc=new FriendListService();
				 
				 String f_no = memVO.getMem_no();
				 String f_memno=memVO.getMem_no(); 								//???
				
				/***************************2.開始刪除資料***************************************/
				friSvc.rejectFriendList(f_no,f_memno);							//???
				
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
				String url = "/friendlist/listAllFriendList.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(request, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:"+e.getMessage());
				RequestDispatcher failureView = request
						.getRequestDispatcher("/friendlist/listAllFriendList.jsp");
				failureView.forward(request, res);
			}
		}
	}
}

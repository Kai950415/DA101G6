package com.reportlm.controller;

import javax.servlet.http.*;

import java.io.*;
import java.util.*;

import javax.servlet.*;

import com.mem.model.MemVO;
import com.reportlm.model.*;

public class ReportLmServlet extends HttpServlet{
	
	public void doGet(HttpServletRequest req,HttpServletResponse res)
			throws ServletException, IOException{
		doPost(req,res);
	}
	public void doPost(HttpServletRequest req,HttpServletResponse res)
	throws ServletException, IOException{
		System.out.println("22");
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		System.out.println(action);
		
		if("getAll".equals(action)) {
			//查詢
			ReportLmDAO dao = new ReportLmDAO();
			List<ReportLmVO> list = dao.getAll();
			
			HttpSession session = req.getSession();
			session.setAttribute("list", list);
			String url = "/reportlm/listAllReportLm.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交listAllEmp2_getFromSession.jsp
			successView.forward(req, res);
			return;
		}
		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求

				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);

				try {
					/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
					String str = req.getParameter("repolm_no");
					if (str == null || (str.trim()).length() == 0) {
						errorMsgs.add("請輸入檢舉留言編號");
					}
					// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty()) {
						RequestDispatcher failureView = req
								.getRequestDispatcher("/reportlm/reportlm_select_page.jsp");
						failureView.forward(req, res);
						return;// 程式中斷
					}

					String repolm_no = null;
					try {
						repolm_no = new String(str);
					} catch (Exception e) {
						errorMsgs.add("檢舉留言編號格式不正確");
					}
					// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty()) {
						RequestDispatcher failureView = req
								.getRequestDispatcher("/reportlm/reportlm_select_page.jsp");
						failureView.forward(req, res);
						return;//程式中斷
					}
					
					/***************************2.開始查詢資料*****************************************/
					ReportLmService ReportLmService = new ReportLmService();
					ReportLmVO ReportLmVO = ReportLmService.getOneReportLm(repolm_no);
					if (ReportLmVO == null) {
						errorMsgs.add("查無資料");
					}
					// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty()) {
						RequestDispatcher failureView = req
								.getRequestDispatcher("/reportlm/reportlm_select_page.jsp");
						failureView.forward(req, res);
						return;//程式中斷
					}
					
					/***************************3.查詢完成,準備轉交(Send the Success view)*************/
					req.setAttribute("ReportLmVO", ReportLmVO); 
					String url = "/reportlm/listOneReportLm.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); 
					successView.forward(req, res);

					/***************************其他可能的錯誤處理*************************************/
				} catch (Exception e) {
					errorMsgs.add("無法取得資料:" + e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/reportlm/reportlm_select_page.jsp");
					failureView.forward(req, res);
				}
			}
		

		if ("getOne_For_Update".equals(action)) { 

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數****************************************/
				String repolm_no = new String(req.getParameter("repolm_no"));
				
				/***************************2.開始查詢資料****************************************/
				ReportLmService ReportLmService = new ReportLmService();
				ReportLmVO ReportLmVO = ReportLmService.getOneReportLm(repolm_no);
								
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("ReportLmVO", ReportLmVO);         // 資料庫取出的empVO物件,存入req
				String url = "/reportlm/update_reportlm_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/reportlm/listAllReportLm.jsp");
				failureView.forward(req, res);
			}
		}
if ("update".equals(action)) { // 來自update_emp_input.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String repolm_no = new String(req.getParameter("repolm_no").trim());
				
				String repolm_lmano = req.getParameter("repolm_lmano");
				if (repolm_lmano == null || repolm_lmano.trim().length() == 0) {
					errorMsgs.add("被檢舉的留言編號,請勿空白");
	            }
				

				
				String repolm_memno = req.getParameter("repolm_memno").trim();
				if (repolm_memno == null || repolm_memno.trim().length() == 0) {
					errorMsgs.add("會員編號請勿空白");
				}
				
				String repolm_text = req.getParameter("repolm_text").trim();
				if (repolm_text == null || repolm_text.trim().length() == 0);
				
				String repolm_status = req.getParameter("repolm_status").trim();
				if (repolm_status == null || repolm_status.trim().length() == 0) {
					errorMsgs.add("檢舉留言狀態請勿空白");
				}
				

				ReportLmVO ReportLmVO = new ReportLmVO();
				ReportLmVO.setRepolm_no(repolm_no);
				ReportLmVO.setRepolm_lmano(repolm_lmano);
				ReportLmVO.setRepolm_memno(repolm_memno);
				ReportLmVO.setRepolm_text(repolm_text);
				ReportLmVO.setRepolm_status(repolm_status);


				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("ReportLmVO", ReportLmVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/reportlm/update_reportlm_input.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
				
				/***************************2.開始修改資料*****************************************/
				ReportLmService ReportLmService = new ReportLmService();
				ReportLmVO = ReportLmService.updateRepoLm(repolm_no,repolm_lmano,repolm_memno,repolm_text,repolm_status);
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("ReportLmVO", ReportLmVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/reportlm/listOne_ReportLm.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/reportlm/update_reportlm_input.jsp");
				failureView.forward(req, res);
			}
		}

        if ("insert".equals(action)) { // 來自addEmp.jsp的請求  
        	System.out.println("197");
			Map<String,String> errorMsgs = new LinkedHashMap<String,String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				//接收參數 處理錯誤	
				String leaveMessageRe = null;
				String LeaveMessage_lmno = null;
				String memno = null;
				MemVO memberVO = new MemVO();
				
				
				LeaveMessage_lmno = req.getParameter("LeaveMessage_lmno");
				System.out.println(LeaveMessage_lmno);
				System.out.println("213");
				memberVO = (MemVO)req.getSession().getAttribute("memberVO");
				System.out.println(memberVO);
				System.out.println("215");
				memno = memberVO.getMem_no();
				System.out.println("219");
				if(req.getParameter("leaveMessageRe").trim().length()==0) {
					errorMsgs.put("leaveMessageRe","請勿輸入空白");
				}else {
					leaveMessageRe = req.getParameter("leaveMessageRe");
				}
				System.out.println("225");
				if(!errorMsgs.isEmpty()) {
					
					req.getRequestDispatcher("/front-end/post/post.jsp").forward(req, res);
					return;
				}
				System.out.println("231");
				//DB處理
				ReportLmService rlmSvc = new ReportLmService();
				rlmSvc.addRepLm(LeaveMessage_lmno, memno, leaveMessageRe);
				
				//轉回頁面
				req.getRequestDispatcher("/front-end/post/post.jsp").forward(req, res);
				return;

				
				} catch (Exception e) {
					errorMsgs.put("leaveMessageRe", "刪除資料失敗:"+e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/post/post.jsp");
					failureView.forward(req, res);
				}
		}
		
		
		if ("delete".equals(action)) { // 來自listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	System.out.println("252");
			try {
				/***************************1.接收請求參數***************************************/
				String repolm_no = new String(req.getParameter("repolm_no"));
				
				/***************************2.開始刪除資料***************************************/
				ReportLmService ReportLmService = new ReportLmService();
				ReportLmService.deleteRepoLm(repolm_no);
				
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
				String url = "/reportlm/listAllReportLm.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/reportlm/listAllReportLm.jsp");
				failureView.forward(req, res);
			}
		}

	
		
	

		}
}
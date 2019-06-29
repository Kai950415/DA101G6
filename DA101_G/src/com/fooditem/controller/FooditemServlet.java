package com.fooditem.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.fooditem.model.FooditemService;
import com.fooditem.model.FooditemVO;

/**
 * Servlet implementation class FooditemServlet
 */

@WebServlet("/FooditemServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class FooditemServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("getOne_For_Display".equals(action)) { // �Ӧ�select_page.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.�����ШD�Ѽ� - ��J�榡�����~�B�z **********************/
				String str = req.getParameter("fo_no");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("�п�J���u�s��");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/fooditem/fooditem_select_page.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}

				String fo_no = null;
				try {
					fo_no = new String(str);
				} catch (Exception e) {
					errorMsgs.add("���u�s���榡�����T");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/fooditem/fooditem_select_page.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}

				/*************************** 2.�}�l�d�߸�� *****************************************/
				FooditemService fooditemSvc = new FooditemService();
				FooditemVO fooditemVO = fooditemSvc.getOneFooditem(fo_no);
				if (fooditemVO == null) {
					errorMsgs.add("�d�L���");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/fooditem/fooditem_select_page.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}

				/*************************** 3.�d�ߧ���,�ǳ����(Send the Success view) *************/
				req.setAttribute("fooditemVO", fooditemVO); // ��Ʈw���X��empVO����,�s�Jreq
				String url = "/fooditem/listOneFooditem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneEmp.jsp
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z *************************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/fooditem/listOneFooditem.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getOne_For_Update".equals(action)) { // �Ӧ�listAllFooditem.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.�����ШD�Ѽ� ****************************************/
				String fo_no = new String(req.getParameter("fo_no"));

				/*************************** 2.�}�l�d�߸�� ****************************************/
				FooditemService fooditemSvc = new FooditemService();
				FooditemVO fooditemVO = fooditemSvc.getOneFooditem(fo_no);

				/*************************** 3.�d�ߧ���,�ǳ����(Send the Success view) ************/
				req.setAttribute("fooditemVO", fooditemVO); // ��Ʈw���X��fooditemVO����,�s�Jreq
				String url = "/fooditem/update_fooditem_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// ���\��� update_fooditem_input.jsp
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z **********************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o�n�ק諸���:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/fooditem/listAllFooditem.jsp");
				failureView.forward(req, res);
			}
		}

		if ("update".equals(action)) { // �Ӧ�update_fooditem_input.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.�����ШD�Ѽ� - ��J�榡�����~�B�z **********************/
				String fo_no = req.getParameter("fo_no").trim();
				String fo_resno = req.getParameter("fo_resno").trim();
			
				String fo_name = req.getParameter("fo_name");
				String fo_nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,100}$";
				if (fo_name == null || fo_name.trim().length() == 0) {
					errorMsgs.add("�\�I�W��: �ФŪť�");
				} else if (!fo_name.trim().matches(fo_nameReg)) { // �H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
					errorMsgs.add("�\�I�W��: �u��O���B�^��r���B�Ʀr�M_ , �B���ץ��ݦb2��10����");
				}
				
				Part part = req.getPart("fo_img");
				InputStream is = part.getInputStream();
				ByteArrayOutputStream os = new ByteArrayOutputStream();
				
				byte[] buffer = new byte[is.available()];
				int len;

				// read bytes from the input stream and store them in buffer
				while ((len = is.read(buffer)) != -1) {
					// write bytes from the buffer into output stream
					os.write(buffer, 0, len);
				}
				byte[] fo_img = null;
				fo_img = os.toByteArray();

				Integer fo_price = null;
				try {
					fo_price = new Integer(req.getParameter("fo_price").trim());
				} catch (NumberFormatException e) {
					fo_price = 0;
					errorMsgs.add("�ж�Ʀr.");
				}

				String fo_intro = new String(req.getParameter("fo_intro").trim());
				String fo_introReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,100}$";
				if (fo_intro == null || fo_intro.trim().length() == 0) {
					errorMsgs.add("�\�I���A: �ФŪť�");
				} else if (!fo_name.trim().matches(fo_introReg)) { // �H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
					errorMsgs.add("�\�I���A: �u��O���B�^��r���B�Ʀr�M_ , �B���ץ��ݦb2��10����");
				}

				String fo_status = new String(req.getParameter("fo_status").trim());
				String fo_statusReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,100}$";
				if (fo_status == null || fo_status.trim().length() == 0) {
					errorMsgs.add("�\�I����: �ФŪť�");
				} else if (!fo_name.trim().matches(fo_statusReg)) { // �H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
					errorMsgs.add("�\�I����: �u��O���B�^��r���B�Ʀr�M_ , �B���ץ��ݦb2��10����");
				}


				FooditemVO fooditemVO = new FooditemVO();
			
				fooditemVO.setFo_no(fo_no);
				fooditemVO.setFo_resno(fo_resno);
				fooditemVO.setFo_name(fo_name);
				fooditemVO.setFo_price(fo_price);
				fooditemVO.setFo_img(fo_img);
				fooditemVO.setFo_intro(fo_intro);
				fooditemVO.setFo_status(fo_status);
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("fooditemVO", fooditemVO); // �t����J�榡���~��empVO����,�]�s�Jreq
					RequestDispatcher failureView = req.getRequestDispatcher("/fooditem/update_fooditem_input.jsp");
					failureView.forward(req, res);
					return; // �{�����_
				}

				/*************************** 2.�}�l�ק��� *****************************************/
				FooditemService fooditemSvc = new FooditemService();
				fooditemVO = fooditemSvc.updateFooditem(fo_no, fo_resno, fo_name, fo_price, fo_img, fo_intro,
						fo_status);

				/*************************** 3.�ק粒��,�ǳ����(Send the Success view) *************/
				req.setAttribute("fooditemVO", fooditemVO); // ��Ʈwupdate���\��,���T����empVO����,�s�Jreq
				String url = "/fooditem/listOneFooditem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �ק令�\��,���listOneEmp.jsp
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z *************************************/
			} catch (Exception e) {
				errorMsgs.add("�ק��ƥ���:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/fooditem/update_fooditem_input.jsp");
				failureView.forward(req, res);
			}
		}

		if ("insert".equals(action)) { // �Ӧ�addFooditem.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*********************** 1.�����ШD�Ѽ� - ��J�榡�����~�B�z *************************/
				
				String fo_resno = req.getParameter("fo_resno").trim();
				String fo_name  = req.getParameter("fo_name");
				
				String fo_nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (fo_name == null || fo_name.trim().length() == 0) {
					errorMsgs.add("�\�I�W��: �ФŪť�");
				} else if (!fo_name.trim().matches(fo_nameReg)) { // �H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
					errorMsgs.add("�\�I�W��: �u��O���B�^��r���B�Ʀr�M_ , �B���ץ��ݦb2��10����");
				}

				Part part = req.getPart("fo_img");
				InputStream is = part.getInputStream();
				ByteArrayOutputStream os = new ByteArrayOutputStream();
				byte[] buffer = new byte[is.available()];
				int len;
				// read bytes from the input stream and store them in buffer
				while ((len = is.read(buffer)) != -1) {
					// write bytes from the buffer into output stream
					os.write(buffer, 0, len);
				}
				byte[] fo_img = null;
				fo_img = os.toByteArray();

				
				Integer fo_price = null;
				try {
					fo_price = new Integer(req.getParameter("fo_price").trim());
				} catch (NumberFormatException e) {
					fo_price = 0;
					errorMsgs.add("�ж�Ʀr.");
				}
			
				String fo_intro = (req.getParameter("fo_intro").trim());
				String fo_introReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (fo_intro == null || fo_intro.trim().length() == 0) {
					errorMsgs.add("�\�I���A: �ФŪť�");
				} else if (!fo_name.trim().matches(fo_introReg)) { // �H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
					errorMsgs.add("�\�I���A: �u��O���B�^��r���B�Ʀr�M_ , �B���ץ��ݦb2��10����");
				}

				String fo_status = new String(req.getParameter("fo_status").trim());
				String fo_statusReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (fo_status == null || fo_status.trim().length() == 0) {
					errorMsgs.add("�\�I����: �ФŪť�");
				} else if (!fo_name.trim().matches(fo_introReg)) { // �H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
					errorMsgs.add("�\�I����: �u��O���B�^��r���B�Ʀr�M_ , �B���ץ��ݦb2��10����");
				}
				
				FooditemVO fooditemVO = new FooditemVO();
				fooditemVO.setFo_name(fo_name);
				fooditemVO.setFo_price(fo_price);
				fooditemVO.setFo_img(fo_img);
				fooditemVO.setFo_intro(fo_intro);
				fooditemVO.setFo_status(fo_status);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("fooditemVO", fooditemVO); // �t����J�榡���~��empVO����,�]�s�Jreq
					RequestDispatcher failureView = req.getRequestDispatcher("/fooditem/addFooditem.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.�}�l�s�W��� ***************************************/
				FooditemService fooditemSvc = new FooditemService();
				fooditemVO = fooditemSvc.addFooditem(fo_resno, fo_name, fo_price, fo_img, fo_intro, fo_status);

				/*************************** 3.�s�W����,�ǳ����(Send the Success view) ***********/
				String url = "/fooditem/listAllFooditem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����listAllFooditem.jsp
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z **********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/fooditem/addFooditem.jsp");
				failureView.forward(req, res);
			}
		}

		if ("delete".equals(action)) { // �Ӧ�listAllFooditem.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.�����ШD�Ѽ� ***************************************/
				String fo_no = new String(req.getParameter("fo_no"));

				/*************************** 2.�}�l�R����� ***************************************/
				FooditemService fooditemSvc = new FooditemService();
				fooditemSvc.deleteFooditem(fo_no);

				/*************************** 3.�R������,�ǳ����(Send the Success view) ***********/
				String url = "/fooditem/listAllFooditem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// �R�����\��,���^�e�X�R�����ӷ�����
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z **********************************/
			} catch (Exception e) {
				errorMsgs.add("�R����ƥ���:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/fooditem/listAllFooditem.jsp");
				failureView.forward(req, res);
			}
		}
	}
}

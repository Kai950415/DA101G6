package com.myfeast.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.feastinfo.model.FeastInfoDAO;
import com.feastinfo.model.FeastInfoService;
import com.feastinfo.model.FeastInfoVO;
import com.mem.model.MemVO;
import com.myfeast.model.MyFeastService;

@WebServlet("/MyFeastController")
public class MyFeastServlet extends HttpServlet
{
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        HttpSession session = request.getSession();

        if (session.getAttribute("memberVO") == null)
        {
            session.setAttribute("location", request.getRequestURI());
        }

        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        if ("joinfeast".equals(action))
        {
            List<String> errorMsgs = new LinkedList<String>();
            // Store this set in the request scope, in case we need to
            // send the ErrorPage view.
            request.setAttribute("errorMsgs", errorMsgs);
            try
            {
                String mye_feaNo = (String) request.getParameter("mye_feano");
                MemVO memVO = (MemVO) session.getAttribute("memberVO");


                MyFeastService myFeastService = new MyFeastService();
                myFeastService.addMyFeast(mye_feaNo, memVO.getMem_no());

                FeastInfoService feastInfoService = new FeastInfoService();
                FeastInfoVO feastInfoVO = feastInfoService.getOneFeastInfo(mye_feaNo);
                request.setAttribute("feastInfoVO", feastInfoVO);

                String url = "/front-end/feast/listOneFeast.jsp";
                RequestDispatcher successView = request.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
                successView.forward(request, response);
            }
            catch (Exception e)
            {
                errorMsgs.add(e.getMessage());
                RequestDispatcher failureView = request
                        .getRequestDispatcher("/front-end/feast/listOneFeast.jsp");

                failureView.forward(request, response);
            }
        }
        
        if ("leftfeast".equals(action))
        {
            List<String> errorMsgs = new LinkedList<String>();
            // Store this set in the request scope, in case we need to
            // send the ErrorPage view.
            request.setAttribute("errorMsgs", errorMsgs);
            try
            {
                String mye_feaNo = (String) request.getParameter("mye_feano");
                MemVO memVO = (MemVO) session.getAttribute("memberVO");


                MyFeastService myFeastService = new MyFeastService();
                myFeastService.deleteMyFeast(mye_feaNo, memVO.getMem_no());

                FeastInfoService feastInfoService = new FeastInfoService();
                FeastInfoVO feastInfoVO = feastInfoService.getOneFeastInfo(mye_feaNo);
                request.setAttribute("feastInfoVO", feastInfoVO);

                String url = "/front-end/feast/listOneFeast.jsp";
                RequestDispatcher successView = request.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
                successView.forward(request, response);
            }
            catch (Exception e)
            {
                errorMsgs.add(e.getMessage());
                RequestDispatcher failureView = request
                        .getRequestDispatcher("/front-end/feast/listOneFeast.jsp");

                failureView.forward(request, response);
            }
        }

    }

}

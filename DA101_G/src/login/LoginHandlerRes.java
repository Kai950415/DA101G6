package login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mem.model.MemVO;
import com.res.model.ResService;
import com.res.model.ResVO;

@WebServlet("/loginhandlerRes")
public class LoginHandlerRes extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// 【檢查使用者輸入的帳號(account) 密碼(password)是否有效】
	// 【實際上應至資料庫搜尋比對】
	protected ResVO allowUser(String res_ac, String res_pass) {    //會員

		ResService rs = new ResService();
		ResVO resVO = rs.resFindByAC(res_ac);
		if (resVO != null && res_pass.equals(resVO.getRes_pass()))
			return resVO;
		else
			return null;
	}
	
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) {

	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();

		// 【取得使用者 帳號(account) 密碼(password)】
		String res_ac = req.getParameter("res_ac");
		String res_pass = req.getParameter("res_pass");

		System.out.println(res_ac);
		System.out.println(res_pass);
		// 【檢查該帳號 , 密碼是否有效】
		ResVO resVO = allowUser(res_ac, res_pass);


		if ((resVO = allowUser(res_ac, res_pass)) == null) { // 【帳號 , 密碼無效時】
			out.println("<HTML><HEAD><TITLE>Access Denied</TITLE></HEAD>");
			out.println("<BODY>你的帳號 , 密碼無效!<BR>");
			out.println("請按此重新登入 <A HREF=" + req.getContextPath() + "/hometag.jsp>重新登入</A>");
			out.println("</BODY></HTML>");
		} else { // 【帳號 , 密碼有效時, 才做以下工作】
			HttpSession session = req.getSession();
			session.setAttribute("resVO", resVO); // *工作1: 才在session內做已經登入過的標識

			try {
				String location = (String) session.getAttribute("location");
				if (location != null) {
					session.removeAttribute("location"); // *工作2: 看看有無來源網頁 (-->如有來源網頁:則重導至來源網頁)
					res.sendRedirect(location);
					return;
				}
			} catch (Exception ignored) {
			}

			res.sendRedirect(req.getContextPath() + "/hometag.jsp"); // *工作3: (-->如無來源網頁:則重導至login_success.jsp)
		}
	}
}
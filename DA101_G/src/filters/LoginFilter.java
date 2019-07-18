package filters;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class LoginFilter implements Filter
{

    private FilterConfig config;

    public void init(FilterConfig config)
    {
        this.config = config;
    }

    public void destroy()
    {
        config = null;
    }

    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain) throws ServletException, IOException
    {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        // 【取得 session】
        req.setCharacterEncoding("UTF-8");
        res.setContentType("text/html; charset=UTF-8");
        HttpSession session = req.getSession();
        // 【從 session 判斷此user是否登入過】
        Object account = session.getAttribute("memberVO");
        Object resAccount = session.getAttribute("resVO");

        if (account != null)
        {
            chain.doFilter(request, response);

        }
        else if (resAccount != null)
        {
            chain.doFilter(request, response);
        }
        else
        {
            session.setAttribute("location", req.getHeader("referer") );
            session.setAttribute("login", "false");
            res.sendRedirect(req.getContextPath() + "/hometag.jsp");
            return;

        }
    }
}
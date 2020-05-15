package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(name = "Login", urlPatterns = { "/login" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId=request.getParameter("memberId");
		String memberPw=request.getParameter("memberPw");
		Member m=new MemberService().selectOneMember(memberId,memberPw);
		
		System.out.println(memberId);
		System.out.println(memberPw);
		RequestDispatcher rd=request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		HttpSession session =request.getSession();
		if(m!=null) {
			
			session.setAttribute("member", m);
			request.setAttribute("msg", "환영합니다.");
			request.setAttribute("loc", "/");
		}else {
			request.setAttribute("msg", "아이디 또는 패스워드를 다시 입력해주세요");
			request.setAttribute("loc", "/login");
		}
		rd.forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

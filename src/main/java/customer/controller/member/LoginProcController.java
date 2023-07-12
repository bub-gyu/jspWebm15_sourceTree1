package customer.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import customer.controller.Controller;
import customer.dao.MemberDao;
import customer.vo.Member;

public class LoginProcController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("LoginProcController~~");
		
		request.setCharacterEncoding("utf-8");
		String uid = request.getParameter("id");
		String pwd = request.getParameter("password");
		
		// dao 처리
		MemberDao dao = new MemberDao();
		Member m = dao.getMember(uid);
		
		// 상태분류
		// 1. 아이디 없음	2. 비밀번호 오류	3. 성공
		if(m==null) {	// 아이디 없음
			request.setAttribute("error", "아이디 없음");
			request.getRequestDispatcher("loginForm.jsp").forward(request, response);
		}else if(!m.getPwd().equals(pwd)) {		// 비밀번호 오류
			request.setAttribute("error", "비밀번호 오류");
			request.getRequestDispatcher("loginForm.jsp").forward(request, response);
		}else {	// 성공
			// 아이디 세션에 담고 notice.do로 진행
			request.getSession().setAttribute("uid", uid);
			response.sendRedirect("../customer/notice.do");
		}
		
		
//		request.getRequestDispatcher("loginForm.jsp").forward(request, response);
		
	}

}

package login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class LoginAction2 extends Action {
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		// ActionFormをLoginFormにキャスト
		LoginForm2 loginForm = (LoginForm2) form;

		// フォームに入力された値を取得
		String id = loginForm.getId();

		int x = loginForm.getX();
		int y = loginForm.getY();


		// フォームに入力されたパスワードを取得
		String password = loginForm.getPassword();

		// messageの作成
		String message = "Your ID is " + id + ". Password is " + password + ".";

		String message2 = "X:" + x + " , Y:" + y;

		// messageをrequestスコープに登録
		request.setAttribute("message", message);

		request.setAttribute("message2", message2);

		// ActionForwordの返却
		return mapping.findForward("success");
	}
}

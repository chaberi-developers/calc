package login;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

public class LoginForm2 extends ActionForm {

	private String id = null;
	private String password = null;
	private int x = 0;
	private int y = 0;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getX() {
		return x;
	}

	public void setX(int x) {
		this.x = x;
	}

	public int getY() {
		return y;
	}

	public void setY(int y) {
		this.y = y;
	}

	public void reset() {
	}

	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
		// ActionErrorsクラスのインスタンスを作成
		ActionErrors errors = new ActionErrors();

		// IDが未入力かどうか
		if ("".equals(getId())) {
			// エラーメッセージを登録
			errors.add("id", new ActionMessage("invalid.id"));
			errors.add("id", new ActionMessage("message1"));
		}
		// パスワードが未入力かどうか
		if ("".equals(getPassword())) {
			// エラーメッセージを登録
			errors.add("password", new ActionMessage("errors.required", "パスワード"));
		}
		// ActionErrorsを返す
		return errors;
	}

}
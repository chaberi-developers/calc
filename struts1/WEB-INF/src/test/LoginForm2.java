package test;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

public class LoginForm2 extends ActionForm {

	private String id = null;
	private String password = null;
	private String[] hobbies;

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

	public String[] getHobbies() {
		return hobbies;
	}

	public void setHobbies(String[] hobbies) {
		this.hobbies = hobbies;
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

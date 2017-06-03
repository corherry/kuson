package com.zhbit.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

public class JsonUtil {
	public static void toJson(HttpServletResponse response, Object data) throws IOException {
		Gson gson = new Gson();
		String result = gson.toJson(data);
		response.setContentType("text/json; charset=utf-8");
		response.setHeader("Cache-Control", "no-cache"); // È¡Ïûä¯ÀÀÆ÷»º´æ
		PrintWriter out = response.getWriter();
		System.out.println(result);
		out.print(result);
		out.flush();
		out.close();
	}
}

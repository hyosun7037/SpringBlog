package com.example.springBlog.util;

public class Script {
	
	public static String back(String msg) {
		return
		"<script>"+
		"alert('" + msg + "');"+
		"history.back();"+
		"</script>";
	}
	
	public static String href(String msg, String uri) {
		return
		"<script>"+
		"alert('" + msg + "');"+
		"location.href='"+uri+"';"+
		"</script>";
	}

}


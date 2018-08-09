<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B551182/codeInfoService/getAddrCodeList"); /*URL*/
urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=h1WoDyOi4e8rhTTYSuSJmN5H5sMOoJZhuTOsYTgxzzOEJaarD%2FrWJBttt15QA9Dw5h9Tj4%2BslQNc7eTa49aOOg%3D%3D"); /*Service Key*/
urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("h1WoDyOi4e8rhTTYSuSJmN5H5sMOoJZhuTOsYTgxzzOEJaarD%2FrWJBttt15QA9Dw5h9Tj4%2BslQNc7eTa49aOOg%3D%3D", "UTF-8")); /*공공데이터포털에서 받은 인증키*/
urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
urlBuilder.append("&" + URLEncoder.encode("addrTp","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*1:시도, 2:시군구, 3:읍면동*/
urlBuilder.append("&" + URLEncoder.encode("sidoCd","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*addrTp 2일 경우 입력*/
urlBuilder.append("&" + URLEncoder.encode("sidoCdNm","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*addrTp 3일 경우 시도명 입력*/
urlBuilder.append("&" + URLEncoder.encode("sgguCdNm","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*addrTp 3일 경우 시도명 입력*/

URL url = new URL(urlBuilder.toString());
HttpURLConnection conn = (HttpURLConnection) url.openConnection();
conn.setRequestMethod("GET");
conn.setRequestProperty("Content-type", "application/json; charset=utf-8");
System.out.println("Response code: " + conn.getResponseCode());
BufferedReader rd;
if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
    rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
} else {
    rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
}
StringBuilder sb = new StringBuilder();
String line;
while ((line = rd.readLine()) != null) {
    sb.append(line);
}
rd.close();
conn.disconnect();
System.out.println(sb.toString());
out.print(sb.toString());
%>
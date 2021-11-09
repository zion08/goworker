<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/header.jsp" %>

<title>프로젝트 찾기</title>

<h1>íë¡ì í¸ ë¦¬ì¤í¸</h1>
    
íë¡ì í¸ ëª<input type="text" name="projectName">
<input type="text" name="">
<form action=s-projectPro.jsp method="post">
	ê²½ë ¥<br />
	<input type=radio name="career" checked>ì ì
	<input type=radio name="career">1ëì´í
	<input type=radio name="career">1ë~2ë
	<input type=radio name="career">2ë~3ë
	<input type=radio name="career">4ëì´ì<br />
	
	ì¬ì©ê¸°ì <br />
	<input type=checkbox name="lang" value="Python">Python
	<input type=checkbox name="lang" value="Java">Java
	<input type=checkbox name="lang" value="JavaScript">JavaScript
	<input type=checkbox name="lang" value="JavaServerPage">JavaServerPage
	<input type=checkbox name="lang" value="Spring">Spring
	<input type=checkbox name="lang" value="Html">Html<br />
	<input type=checkbox name="lang" value="C">C
	<input type=checkbox name="lang" value="C++">C++
	<input type=checkbox name="lang" value="C#">C#
	<input type=checkbox name="lang" value="SQL">SQL
	<input type=checkbox name="lang" value="R">R
	<input type=checkbox name="lang" value="Django">Django
	<input type=checkbox name="lang" value="React">React<br />
	
	ìë¬´ ë°©ì<br />
	<input type=checkbox name="worktype" value="">ìê²©
	<input type=checkbox name="worktype" value="">ìì£¼
	<input type=checkbox name="worktype" value="">íì<br />
	
	íë¡ì í¸ ì í<br />
	<input type=checkbox name="projecttype" value="ë©ì¸ íë¡ì í¸">ë©ì¸ íë¡ì í¸
	<input type=checkbox name="projecttype" value="ì¬ì´ë íë¡ì í¸">ì¬ì´ë íë¡ì í¸
	<br />
	
	ê³ì½<br />
	<input type=radio name="employtype">ì ê·ì§
	<input type=radio name="employtype">ê³ì½ì§<br />
	
	íë¡ì í¸ ììê¸°ê°
	<SELECT multuple size="1" name="period">
		<option>íë¡ì í¸ ììê¸°ê°</option>
		<option>7ì¼</option>
		<option>15ì¼</option>
		<option>30ì¼</option>
		<option>60ì¼</option>
		<option>90ì¼</option>
		<option>180ì¼</option>
		<option>365ì¼ ì´ì</option>
	</SELECT><br />
	
	ì§ì­
	<input type="text" name="location" value="ì,êµ°,êµ¬"><br />
	
	ììê¸ì¡
	<SELECT multuple size="1" name="pay">
		<option>íë¡ì í¸ ììê¸ì¡</option>
		<option>100ë§ ì</option>
		<option>200ë§ ì</option>
		<option>300ë§ ì</option>
		<option>400ë§ ì</option>
		<option>500ë§ ì</option>
		<option>600ë§ ì</option>
		<option>700ë§ ì</option>
		<option>800ë§ ì</option>
		<option>900ë§ ì</option>
		<option>1000ë§ ì</option>
		<option>2000ë§ ì</option>
		<option>3000ë§ ì</option>
		<option>4000ë§ ì</option>
		<option>5000ë§ ì</option>
		<option>5000ë§ ì ì´ì</option>
	</SELECT><br />
	
	<input type=checkbox name="endProject">ëª¨ì§ ë§ê° íë¡ì í¸ ì¨ê¸°ê¸°<br />
	
	<input type=checkbox name="sent">ì´ë ¥ì ë³´ë¸ íë¡ì í¸ ì¨ê¸°ê¸°<br />
	
	<input type="submit" value="ê²ì">
</form>

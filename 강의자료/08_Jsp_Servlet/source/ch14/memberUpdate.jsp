<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="myPortal.db.*" %>    
<jsp:useBean id="mgr" class="myPortal.db.MemberMgr"/>

<%
	request.setCharacterEncoding("UTF-8");
	//String id = (String)session.getAttribute("idKey");
	String id = "1111";
	MemberBean mb = mgr.getMember(id);
	
	if (id == null) {
%>
<script>
   //alert('로그아웃 되었습니다.');
   location.href="login.jsp";
</script>
<%			
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet"  />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/script.js" >
<script type="text/javascript">
	
	function zipSearch() {
		url = "zipSearch.jsp?search=n";
		window.open(url, "ZipCodeSearch","width=500,height=300,scrollbars=yes");
	}
</script>
</head>
<body bgcolor="#FFFFCC" onLoad="regFrm.id.focus()">
	<div align="center">
		<br /><br />
		<form name="regFrm" method="post" action="memberProc.jsp">
			<table cellpadding="5">
				<tr>
					<td bgcolor="#FFFFCC">
						<table border="1" cellspacing="0" cellpadding="2" width="600">
							<tr bgcolor="#996600">
								<td colspan="3"><font color="#FFFFFF"><b>회원 가입</b></font></td>
							</tr>
							<tr>
								<td width="20%">아이디</td>
								<td width="50%"><%=id %>
									<input type=hidden name="id" value="<%=id %>"> 
								</td>
								<td width="30%">아이디를 적어 주세요.</td>
							</tr>
							<tr>
								<td>패스워드</td>
								<td><input type="password" name="pwd" size="15"></td>
								<td>패스워드를 적어주세요.</td>
							</tr>
							<tr>
								<td>패스워드 확인</td>
								<td><input type="password" name="repwd" size="15"></td>
								<td>패스워드를 확인합니다.</td>
							</tr>
							<tr>
								<td>이름</td>
								<td><input name="name" size="15" value=<%=mb.getName() %>>
								</td>
								<td>이름을 적어주세요.</td>
							</tr>
							<tr>
								<td>성별</td>
								<td>
									남<input type="radio" name="gender" value="1" <% if ( mb.getGender().equals("1") ) { %>checked <% } %>> 
									여<input type="radio" name="gender" value="2" <% if ( mb.getGender().equals("2") ) { %>checked <% } %>>
								</td>
								<td>성별을 선택 하세요.</td>
							</tr>
							<tr>
								<td>생년월일</td>
								<td><input name="birthday" size="6" value="<%=mb.getBirthday()%>">
									ex)830815</td>
								<td>생년월일를 적어 주세요.</td>
							</tr>
							<tr>
								<td>Email</td>
								<td><input name="email" size="30" value="<%=mb.getEmail()%>">
								</td>
								<td>이메일를 적어 주세요.</td>
							</tr>
							<tr>
								<td>우편번호</td>
								<td><input name="zipcode" size="5" readonly value="<%=mb.getZipcode()%>">
									<input type="button" value="우편번호찾기" onClick="zipSearch()">
								</td>
								<td>우편번호를 검색하세요.</td>
							</tr>
							<tr>
								<td>주소</td>
								<td><input name="address" size="45" value="<%=mb.getAddress()%>"></td>
								<td>주소를 적어 주세요.</td>
							</tr>
							<tr>
								<td>취미</td>
								<td>인터넷<input type="checkbox" name="hobby" value="인터넷">
									여행<input type="checkbox" name="hobby" value="여행"> 게임<input
									type="checkbox" name="hobby" value="게임"> 영화<input
									type="checkbox" name="hobby" value="영화"> 운동<input
									type="checkbox" name="hobby" value="운동">
								</td>
								<td>취미를 선택 하세요.</td>
							</tr>
							<tr>
								<td>직업</td>
								<td><select name=job>
										<option value="0" selected>선택하세요.
										<option value="회사원">회사원
										<option value="연구전문직">연구전문직
										<option value="교수학생">교수학생
										<option value="일반자영업">일반자영업
										<option value="공무원">공무원
										<option value="의료인">의료인
										<option value="법조인">법조인
										<option value="종교,언론,에술인">종교.언론/예술인
										<option value="농,축,수산,광업인">농/축/수산/광업인
										<option value="주부">주부
										<option value="무직">무직
										<option value="기타">기타
								</select></td>
								<td>직업을 선택 하세요.</td>
							</tr>
							<tr>
								<td colspan="3" align="center">
								   <input type="button" value="회원가입" onclick="inputCheck()">
								    &nbsp; &nbsp; 
								    <input type="reset" value="다시쓰기">
								    &nbsp; &nbsp; 
								    <input type="button" value="로그인" onClick="javascript:location.href='login.jsp'">
								 </td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/login_style.css">
<!-- ${pageContext.request.contextPath}넣어서 가능했음. -->

<script src="resources/js/httpRequest.js"></script>

<script type="text/javascript">
	
	function send(f) {
		let id = f.login_id_text.value.trim();
		let pwd = f.login_pw_text.value.trim();
	
		if(id==''){
			alert("아이디를 입력해주세요");
			return;
		}
		
		if(pwd==''){
			alert("비밀번호를 입력해주세요");
			return;
		}
		
		let url = "mloginconf";
		let param = "id="+id+"&pwd="+pwd;
		//alert(param);
		sendRequest(url,param,callback,"post");
	}
	
	function callback() {
		//var data = json.parse({f});
		//alert(data);
		//encodeURIComponent
		if(xhr.readyState==4 && xhr.status==200) {
		//4: 데이터를 전부 받음, 200: 서버로부터의 응답상태가 요청에 성공
		
			let temp = xhr.responseText;
			console.log(temp);
			let eval2 = eval(temp);
			console.log(eval2);
			console.log(eval2[0]['data']);
			//alert(eval2[0]['data']);
			
			if(eval2[0]['data']=='null_data'){
				alert("아이디나 비밀번호가 일치하지 않습니다.");
			} else{
				location.href='/gift/testpage';
			}
			
			//메인화면으로 리다이렉트
			//location.href="/gift";
			//if(eval2[data]=="null_data"){
			//	alert("아이디나 비밀번호가 일치하지 않습니다."));
			//}
			
			
		}
		
	}

</script>

<style type="text/css">


</style>

</head>
<body>
    <form id = "member_login_form">
        <table id="login_table">
			<caption id="member_login_title">로그인</caption>
            <tbody>
	            <tr class="member_login_tablemargin">
	                <td class="member_login_text">
	                    <input type="text" placeholder="아이디를 입력해주세요" name="login_id_text" class="member_login_id_pwd_text">
	                </td>
	            </tr>
	            <tr>
	                <td class="member_login_text">
						<input type="password" placeholder="비밀번호를 입력해주세요" name="login_pw_text" class="member_login_id_pwd_text">
	                </td>
	            </tr>
	           
	            <tr class="member_login_tablemargin">
		            <td >
		            	<input type="button" value="로그인" onclick="send(this.form)"class="member_login">
		            </td>
	            </tr>
	            
	             <tr class="member_login_tablemargin">
	            	<td id="member_login_top_bottom">
	            		<input type="button" value="아이디 찾기" onclick="selectmidfor(this.form)">
	            		<input type="button" value="비밀번호 찾기" onclick="selectmpwdfor(this.form)">
	            		<input type="button" value="회원가입" onclick="location.href='/gift/mjoin'">
	            	</td>
	            </tr>
            </tbody>
            	
            
            
        </table>
    </form>
</body>
</html>


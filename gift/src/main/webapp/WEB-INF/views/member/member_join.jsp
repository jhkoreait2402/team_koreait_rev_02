<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 

<script
  src="https://code.jquery.com/jquery-3.7.1.js"
  integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
  crossorigin="anonymous">
</script>

 -->

<script src="resources/js/httpRequest.js"></script>
<link rel="../../../resources/css/member/memberjoin.css">

<script type="text/javascript">


	
	function send(f) {
		let id = f.join_id_text.value.trim();
		let pwd = f.join_pw_text.value.trim();
		let name = f.join_name_text.value.trim();
		let addr = f.join_addr_text.value.trim();
		let email = f.join_email_text.value.trim();
		let phone = f.join_phone_text.value.trim();
		
	
		if(id==''){
			alert("아이디를 입력해주세요");
			return;
		}
		
		if(pwd==''){
			alert("비밀번호를 입력해주세요");
			return;
		}
		
		if(name==''){
			alert("이름을 입력해주세요");
			return;
		}
		
		if(addr==''){
			alert("주소를 입력해주세요");
			return;
		}
		
		if(email==''){
			alert("이메일을 입력해주세요");
			return;
		}
		
		if(phone==''){
			alert("휴대폰 번호를 입력해주세요");
			return;
		}
		
		//alert(id);
		//alert(pwd);
		//alert(name);
		//alert(addr);
		//alert(email);
		//alert(phone);
		
		
		let url = "mjoininsert";
		let param = "id="+encodeURIComponent(id)+"&pwd="+encodeURIComponent(pwd)+"&name="+encodeURIComponent(name)+"&addr="+encodeURIComponent(addr)+"&email="+encodeURIComponent(email)+"&phone="+encodeURIComponent(phone);
		
		let checked_id = document.getElementById("searched_member_id_for_join");
		if(checked_id.innerText == ''){
			alert('아이디 확인이 필요합니다.');
		}else{
			//파라미터 오류가 났어서 수정한적있음.
			
			//alert(param);
			sendRequest(url,param,"POST");
		}
		
		

		/*
		if(xhr.readyState==4 & xhr.status==200) {
			location.href="/gift";//괄호아님
		} else {
			alert("회원가입에 실패했습니다. 다시 시도해 주십시오.");
			location.href="/gift/mjoin";
		}*/
		//location.href="/gift/mjoin";
	}
	
	
	

	/*
		function callback(f) { // 데이터를 받고 요청에 성공
			if(xhr.readyState == 4 & xhr.status == 200) {
				alert('d');
			}
		}
	*/
	
	function idcheck(f) {
		alert("아이디 체크 시험");
		
		//id값만 가져와 컨트롤러에 요청 보냄
		
		param = f.
		

		//"searched_member_id_for_join"의 innerText에 값을 집어넣으려 함
		let checked_id = document.getElementById("searched_member_id_for_join");
		
		checked_id.innerText = "해당 아이디를 사용할 수 있습니다.";
		
		

	}
	
	

</script>


</head>
<body>
    <form>
        <table id="join_table">
            <tr>
                <td class="join_col_style">
                	<div>아이디</div>
                    <input type="text" placeholder="아이디를 입력해주세요" name="join_id_text" id="login_id_text">
                    <input type="button" value="아이디 중복확인" onclick="idcheck()">
                    <div id="searched_member_id_for_join"></div>
                </td>
            </tr>
            <tr>
                <td class="join_col_style">
                	<div>비밀번호</div>
					<input type="password" placeholder="비밀번호를 입력해주세요" name="join_pw_text" id="login_pw_text">
                </td>
            </tr>
            <tr>
                <td class="join_col_style">
                	<div>이름</div>
                    <input type="text" placeholder="성함을 입력해주세요" name="join_name_text" id="login_id_text">
                </td>
            </tr>
            <tr>
                <td class="join_col_style">
                	<div>주소</div>
					<input type="text" placeholder="주소를 입력해주세요" name="join_addr_text" id="login_pw_text">
                </td>
            </tr>
            <tr>
                <td class="join_col_style">
               		<div>이메일</div>
                    <input type="text" placeholder="이메일을 입력해주세요" name="join_email_text" id="login_id_text">
                </td>
            </tr>
            <tr>
                <td class="join_col_style">
                	<div>전화번호</div>
					<input type="text" placeholder="전화번호를 입력해주세요" name="join_phone_text" id="login_pw_text">
                </td>
            </tr>
            <tr>
            	<td>
            		<input type="button" value="가입" onclick="send(this.form)">
            	</td>
            </tr>
        </table>
    </form>
</body>
</html>


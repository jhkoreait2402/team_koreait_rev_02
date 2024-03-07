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

<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>

<script type="text/javascript">
	
	//로그인 처리 자바스크립트
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
	
	
	//로그인 처리 자바스크립트 함수와 연결된 콜백함수
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
		
		//입력한 아이디가 db에 있든 없든 쿠키로 저장해버리기
		
	}
	
	function idsave(f){
		
		
		let saved_id = f.login_id_text.value.trim();
		//alert("ㅎㅇ");
		
		//체크박스 체크 시 아이디를 세션으로 보냄
		if(document.getElementById('member_save_id_checkbox').checked == true){
			alert("잘 입력하셨습니다");
			
			if(saved_id==null || saved_id=='') {
				alert("아이디를 입력해 주십시오");
			}else{
				alert("당신의 저장한 아이디는 "+saved_id);
				//여기서 시작
				
				//ajax 안됨 지금..?
				$.ajax({
					
					//url, data, datatype, method
					
					url : "/gift/mloginidcheck",
					data : saved_id/*${login_id_text}*/,
					datatype : "JSON",
					method : "POST"
				});
				
				
				
				
			}
		}
		
		//체크박스 체크 시 세션, 쿠키 날림.
		if(document.getElementById('member_save_id_checkbox').checked == false) {
			alert("입력 해제");
		}
		
		/*if(saved_id==null || saved_id=='') {
			alert("아이디를 입력해 주십시오");
		}else{
			alert("당신의 저장한 아이디는 "+saved_id);
		}*/

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
	            <tr>
	                <td class="member_login_text">
	                    <input type="text" placeholder="아이디를 입력해주세요" name="login_id_text" class="member_login_id_pwd_text">
	                </td>
	            </tr>
	            <tr>
	                <td class="member_login_text">
						<input type="password" placeholder="비밀번호를 입력해주세요" name="login_pw_text" class="member_login_id_pwd_text">
	                </td>
	            </tr>
	           
	            <tr>
		            <td >
		            	<input type="button" value="로그인" onclick="send(this.form)"class="member_login">
		            </td>
	            </tr>
	            <tr>
	           		<td>
	             		<label id="member_id_save_text">아이디 저장</label>
	             		<input type="checkbox"  onclick="idsave(this.form)" id="member_save_id_checkbox">
	             		<label id = "member_save_id_checkbox"></label>
	             	</td>
	            </tr>
	             <tr>
	            	<td id="member_login_top_bottom">
	            		<input type="button" value="아이디 찾기" onclick="selectmidfor(this.form)" class="member_login_select_detail">
	            		<input type="button" value="비밀번호 찾기" onclick="selectmpwdfor(this.form)" class="member_login_select_detail">
	            		<input type="button" value="회원가입" onclick="location.href='/gift/mjoin'" class="member_login_select_detail">
	            	</td>
	            </tr>
            </tbody>
            	
            
            
        </table>
    </form>
</body>
</html>


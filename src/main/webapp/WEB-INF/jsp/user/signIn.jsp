<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<section>
		<div class="d-flex justify-content-center align-items-center">
			<div>
				<form id="signInForm" class="form-group" method="post" action="/user/sign-in">
					<div class="input-group flex-nowrap mt-5">
						<div class="input-group-prepend">
							<span class="input-group-text" id="addon-wrapping">👤</span>
						</div>
						<input type="text" id="loginId" name="loginId" class="form-control" placeholder="아이디를 입력하세요.">
					</div>
					<div class="input-group flex-nowrap mt-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="addon-wrapping">🔑</span>
						</div>
						<input type="password" id="password" name="password" class="form-control" placeholder="비밀번호를 입력하세요.">
					</div>
					<div class="d-flex justify-content-between">
						<input type="button" name="signUpBtn" class="btn btn-dark form-control col-5 mt-4" value="회원가입">
						<input type="submit" name="signInBtn" class="btn btn-primary form-control col-5 mt-4" value="로그인">
					</div>
				</form>
			</div>
		</div>
		
		<script>
			$(document).ready(function(){
				
				$('#signInForm').on('submit', function(e){
					e.preventDefault();
					
					let loginId = $('#loginId').val().trim();
					let password = $('#password').val();
					
					if (!loginId){
						alert("아이디를 입력하세요.");
						return false;
					}
					
					if (loginId.length < 4){
						alert("아이디는 4자 이상입니다.");
						return false;
					}
					
					if (!password){
						alert("비밀번호를 입력하세요.");
						return false;
					}
					
					let url = $(this).attr('action');
					let params = $(this).serialize();
					
					$.post(url, params)
					.done(function(data){
						if (data.code == 200){
							//$('#signInOk').removeClass("d-none");
							// rmf ahrfhrdmfh qhsoa
							location.href = "/timeline/timeline-list-view"; 
						} else {
							alert(data.errorMessage); 
						}
					});
					
				});
				
			});
		</script>
		
	</section>
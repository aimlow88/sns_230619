<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	
				<section>
					<div class="d-flex justify-content-center align-items-center">
						<div>
							<form class="form-group" method="post" action="/">
								<table class="table table-center mt-5" border=1>
									<tr >
										<th>
											<div class="d-flex justify-content-center align-items-center">
												<div>
													<span class="font-weight-bold">아이디</span>
												</div>
											</div>
										</th>
										<td>
											<div class="d-flex align-items-center justify-content-arround">
												<input name="userId" class="form-control col-7">
												<button id="dupCheckBtn" type="button" class="btn btn-success">중복확인</button>
											</div>
											<small id="" class="">사용 가능한 아이디입니다.</small>
										</td>
									</tr>
									<tr >
										<th>
											<div class="d-flex align-items-center justify-content-center">
												<span class="font-weight-bold">비밀번호</span>
											</div>
										</th>
										<td>
											<input type="password" name="password" class="form-control col-7">
										</td>
									</tr>
									<tr >
										<th>
											<div class="d-flex align-items-center justify-content-center">
												<span class="font-weight-bold">비밀번호 확인</span>
											</div>
										</th>
										<td>
											<input type="password" name="checkPassword" class="form-control col-7">
										</td>
									</tr>
									<tr >
										<th>
											<div class="d-flex align-items-center justify-content-center">
												<span class="font-weight-bold">이름</span>
											</div>
										</th>
										<td>
											<input name="name" class="form-control col-7">
										</td>
									</tr>
									<tr >
										<th>
											<div class="d-flex align-items-center justify-content-center">
												<span class="font-weight-bold">이메일 주소</span>
											</div>
										</th>
										<td>
											<input name="email" class="form-control col-8">
										</td>
									</tr>
								</table>
								<input type="submit" name="signUpBtn" class="btn btn-primary form-control col-2" value="회원가입">
							</form>
						</div>
					</div>
				</section>
	
	</body>
</html>
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
								<div class="input-group flex-nowrap mt-5">
									<div class="input-group-prepend">
										<span class="input-group-text" id="addon-wrapping">👤</span>
									</div>
									<input type="text" name="userId" class="form-control" placeholder="Username">
								</div>
								<div class="input-group flex-nowrap mt-3">
									<div class="input-group-prepend">
										<span class="input-group-text" id="addon-wrapping">🔑</span>
									</div>
									<input type="password" name="password" class="form-control">
								</div>
								<input type="submit" name="signInBtn" class="btn btn-primary form-control col-12 mt-4" value="로그인">
								<input type="button" name="signUpBtn" class="btn btn-dark form-control col-12 mt-4" value="회원가입">
							</form>
						</div>
					</div>
				</section>
	</body>
</html>
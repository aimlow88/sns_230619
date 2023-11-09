<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- -- JSTL을 사용하려면 아래의 태그를 붙여 넣는다. -->--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>

<div>
	<c:if test="${!empty userId}">
		<form id="contentUploadForm" method="post" action="">
			<div class="d-flex justify-content-center">
				<div  class="border border-gray mt-4 w-50">
					<div class="d-flex justify-content-center mt-2">
						<textarea id="content" name="content" class="col-11" rows=6></textarea>
					</div>
					<div class="d-flex justify-content-between mt-2 mb-2">
							<input type="file" id="file" accept=".jpg, .png, .jpeg, .gif" class="d-none">
							<a href="#" id="fileUploadBtn"><img src="/static/img/sns/image_icon.png" alt="이미지1" width="35px"></a>
							
							<%-- 업로드 된 임시파일명 노출 --%>
							<div id="fileName" class="ml-2"></div>
							<input type="text" id="imagePath" name="imagePath" class="form-control">
							<input type="submit" id="uploadBtn" name="uploadBtn" class="btn btn-primary" value="업로드">
					</div>
				</div>
			</div>
		</form>
	</c:if>
	
	<br><br>
	
	<c:forEach items="${cardViewList}" var="card">
		<div class="d-flex justify-content-center">
			<div class="w-50">
			
				<div class="bg-light d-flex justify-content-between align-items-center">
					<span class="display-4 font-weight-bold ml-4">${card.user.loginId}</span>
					<input type="button" id="deleteBtn" name="deleteBtn" class="deleteBtn btn btn-warning mr-4" value="•••" data-login-user-id="${userId}" data-post-id="${card.post.id}" data-post-user-id="${card.user.id}">
				</div>
			
				<div class="d-flex justify-content-center mt-3">
					<img src="${card.post.imagePath}" alt="게시글 이미지" width="780px">
				</div>
			
				<br>
			
				<div class="d-flex align-items-center">
					<c:choose>
						<c:when test="${card.filledLike eq true}">
							<button type="button" class="toggleLikeBtn btn" data-login-userid=${card.user.id} data-post-id=${card.post.id} data-filled-like=${card.filledLike}>
								<img src="/static/img/sns/heart_icon.png" alt="좋아요 이미지" width="30px">
							</button>
						</c:when>
						<c:otherwise>
							<button type="button" class="toggleLikeBtn btn" data-login-userid=${card.user.id} data-post-id=${card.post.id} data-filled-like=${card.filledLike}>
								<img src="/static/img/sns/heart-icon.png" alt="좋아요 이미지" width="30px">
							</button>
						</c:otherwise>
					</c:choose>
					<span class="display-5 font-weight-bold ml-3"> 좋아요 ${card.likeCount}개</span>
				</div>
			
				<br>
			
				<div class="d-flex align-items-center">
					<span class="display-5 font-weight-bold">${card.user.loginId}</span>
					<span class="display-5 text-dark ml-2">${card.post.content}</span>
				</div>
			
				<table class="table mt-3" border=0>
					<thead>
						<tr>
							<th class="display-5 font-weight-bold bg-light" colspan="2">댓글</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${card.commentViewList}" var="commentView">
							<tr>
								<td class="display-5 font-weight-bold">
									<div>
										${commentView.user.loginId}
									</div>
								</td>
								<td>
									<div class="d-flex justify-content-between align-items-center">
										${commentView.comment.content}
										<button type="button" id="delCommentBtn" name="delCommentBtn" class="delCommentBtn btn" data-comment-userid=${commentView.comment.userId} data-comment-id=${commentView.comment.id}>
											<img src="/static/img/sns/x-icon.png" alt="삭제 이미지" width=15></a>
										</button>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
				<c:if test="${!empty userId}">
					<div class="d-flex align-items-center">
						<input type="text" id="content" name="content" class="content form-control" placeholder="댓글 내용을 입력해 주세요.">
						<button type="button" id="addContentBtn" name="addContentBtn" class="addContentBtn btn btn-white" value="${card.post.id}">게시</button>
					</div>
				</c:if>
				
				<br>
			
			</div>
		</div>
	</c:forEach>
	
	<script>
		$(document).ready(function(){
			//파일 이미지 클릭시 숨겨져 있던 typr="file"을 동작시킨다.
			
			$('#fileUploadBtn').on('click', function(e){
				e.preventDefault();               // a태그 시 스크롤되는 것을 방지
				$('#file').click();

			});

			
			// 이미지를 선택하는 순간 -> 유효성 확인 ㅂ및 업로드된 파일명 노출
			$('#file').on('change', function(e){
				let fileName = e.target.files[0].name;  // $('#file').val()
				console.log(fileName);
				
				// 확장자 유효성 확인
				let ext = fileName.split(".").pop().toLowerCase();
				// alert(ext);
				if (ext != 'jpg' && ext != 'gif' && ext != 'png' && ext != 'jpeg'){
					alert("이미지 파일만 업로드할 수 있습니다.");
					$('#file').val("");    // file태그에 파일 제거(보이지 않지마ㅓㄴ 업로드될 수 있으므로 반드시 제거)
					$('#fileName').text(""); // 파일명 지우기
					return;
				}
				// 유효성 통과 이미지는 업로드된 파일명 노출
				$('#fileName').text(fileName);
			});
			
			$('#uploadBtn').on('click', function(e){
				e.preventDefault();
				
				let content = $('#content').val();
				if (!content) {
					alert("글을 입력해 주세요.");
					return;
				}
				
				let formData = new FormData();
				formData.append("content", content);
				formData.append("file", $('#file')[0].files[0]);
				
				$.ajax({
					
					//request
					type:"post"
					, url:"/post/create"
					, data:formData
					, enctype:"multipart.form-data"
					, processData:false
					, contentType:false
					
					// response
					, success:function(data){
						if (data.code == 200){
							alert("글이 성공적으로 게시되었습니다.");
							location.href="/timeline/timeline-list-view";
						} else {
							alert(data.errorMessage);
						}
					}
					, error:function(request, status, error){
						alert("글 작성을 실패하였습니다. - 관리자 문의");
					}
				});
			});
			
			$('.addContentBtn').on('click', function(){
				
				let postId = $(this).val();
				let content = $(this).prev().val();
				// tag의 형제태그들 중 태그 id, class명, 혹은 태그명을 선탯하면 된다.
				// let content = $(this).siblings('input').val();
				
				if (!content){
					alert("댓글을 입력해 주세요.");
					return;
				}
				
				$.ajax({
					type:"post"
					, url:"/comment/create"
					, data:{"postId":postId, "content":content}
					,success:function(data){
						if (data.code == 200){
							alert("댓글이 성공적으로 게시되었습니다.");
							//location.href="/timeline/timeline-list-view";
							location.reload(true);
						} else {
							alert(data.errorMessage);
						}
					}
					, error:function(request, status, error){
						alert("댓글 작성을 실패하였습니다. - 관리자 문의");
					}
				});
				
			});
			
			$('.delCommentBtn').on('click', function(){

				let commentId = $(this).data('comment-id');
				let commentUserId = $(this).data('comment-userid');
				
				//alert(commentUserId);
				//let sessionUserId = session.getAttribute("userId"};
				
				$.ajax({
					type:"DELETE"         // 삭제시 type은 delete로 왜?
					, url:"/comment/delete"
					, data:{"commentId":commentId, "commentUserId":commentUserId}
					, success:function(data){
						if (data.code == 200) {
							alert("삭제하였습니다.");
							location.reload(true);   // scroll되지 않고 그 자리에 머문다. 
						} else {
							alert(data.errorMessage);
						}
					}
					, error:function(request, status, error){
						alert("댓글 삭제를 실패하였습니다. - 관리자 문의")
					}
				});
								
			});
				
			$('.toggleLikeBtn').on('click', function(){
				
				let loginUserId = $(this).data('login-userid');
				let postId = $(this).data('post-id');
				let filledLike = $(this).data("filled-like");
				
				//alert(loginUserId + ", " +postId + ", " + filledLike);
				
				if (!loginUserId){
					alert("로그인 해주세요.");
					return;
				}
				
				$.ajax({
					
					type:"get"
					, url:"/like/toggle-like" + "/" + postId + "/" +filledLike
					//, data:{"postId":postId, "filledLike":filledLike}
					, success:function(data){
						if (data.code == 200) {
							// alert("성공하였습니다.");
							location.reload(true);
						} else {
							alert(data.errorMessage);
						}
					}
					, error:function(request, status, error){
						alert("'좋아요'가 눌러지지 않았습니다. - 관리자 문의" );
					}
					
				});
			
			});
			
			
			// 게시물 삭제
			$('.deleteBtn').on('click', function(){
				
				let loginUserId = $(this).data("login-user-id");
				let postUserId = $(this).data("post-user-id");
				let postId = $(this).data("post-id");
				
				alert("loginUserId : " + loginUserId + ", postId : " + postId + ", postUserId : " + postUserId);
				
				if (loginUserId == ""){
					alert("로그인을 해주세요.");
					return;
				}
				
				if (loginUserId != postUserId){
					alert("본인의 글이 아니면 삭제할 수 없습니다.");
					return;
				}
				
				$.ajax({
					
					type:"DELETE"
					, url:"/post/delete"
					, data:{"postId":postId, "postUserId":postUserId}
					, success:function(data){
						if (data.code == 200){
							alert("삭제 성공");
							location.reload(true);
						} else {
							alert(data.erroeMessage);
						}
					  }
					, error:function(request, ststus, error){
						alert("알 수 없는 오류가 발생하였습니다. - 관리자 문의")
					  }
				});
				
			});
			
			
		});
		
	</script>
</div>

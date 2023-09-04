<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<script>
	$(function(){
		$('.btnDelete').click(function(){
			if(confirm('정말 삭제 하시겠습니까?')){
				return true;	
			}else{
				return false;
			}
		});	
	});
</script>
<section class="view">
    <h3>글보기</h3>
    <table>
        <tr>
            <td>제목</td>
            <td><input type="text" name="title" value="${view.no}" readonly/></td>
        </tr>
        <tr>
            <td>첨부파일</td>
            <td>
                <a href="#">2020년 상반기 매출자료.xls</a>
                <span>7회 다운로드</span>
            </td>
        </tr>
        <tr>
            <td>내용</td>
            <td>
                <textarea name="content" readonly>${view.content}</textarea>
            </td>
        </tr>
    </table>
    <div>
        <a href="./delete.do?group=${group}&cate=${cate}&no=${view.no}" class="btnDelete">삭제</a>
        <a href="./modify.do?group=${group}&cate=${cate}&no=${view.no}" class="btnModify">수정</a>
        <a href="./list.do?group=${group}&cate=${cate}" class="btnList">목록</a>
    </div>
    
    <!-- 댓글리스트 -->
    <section class="commentList">
        <h3>댓글목록</h3>
        <article class="comment">
        	<form action="#" method="post">
        		<input type="hidden" name="no"     value="${view.no}">
        		<input type="hidden" name="parent" value="${view.no}">
				<span>
					<span></span>
					<span></span>
				</span>
				<textarea name="comment" readonly></textarea>
				<div>
					<a href="#" class="del">삭제</a>
					<a href="#" class="can">취소</a>
					<a href="#" class="mod">수정</a>
				</div> 
            </form>
        </article>
        
        <p class="empty">등록된 댓글이 없습니다.</p>

    </section>

    <!-- 댓글입력폼 -->
    <section class="commentForm">
        <h3>댓글쓰기</h3>
        <form action="./proc/commentInsert.do" method="post">
        	<input type="hidden" name="group" value="${group}"/>
        	<input type="hidden" name="cate" value="${cate}"/>
        	<input type="hidden" name="parent" value="${view.no}"/>
        	<input type="hidden" name="writer" value="${sessUser.uid}"/>
            <textarea name="content"></textarea>
            <div>
                <a href="#" class="btnCancel">취소</a>
                <input type="submit" class="btnWrite" value="작성완료"/>
            </div>
        </form>
    </section>
</section>
<!-- 내용 끝 -->
        </article>
    </section>
</div>

<%@ include file="../_footer.jsp" %>
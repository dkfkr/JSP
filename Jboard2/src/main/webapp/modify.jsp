<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./_header.jsp" %>
<main id="board">
    <section class="modify">
        <form action="/Jboard2/modify.do" method="post" enctype="multipart/form-data">
            <table border="0">
                <caption>글수정</caption>
                <tr>
                    <th>제목</th>
                    <td><input type="text" name="title" value="${modify.title}" placeholder="제목을 입력하세요."/></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td>
                        <textarea name="content">${modify.content}</textarea>
                    </td>
                </tr>
                <tr>
                    <th>파일</th>
                    <td>
                        <input type="file" name="file"/>
                    </td>
                </tr>
            </table>
            
            <div>
                <a href="/Jboard2/view.do?no=${no}" class="btn btnCancel">취소</a>
                <input type="submit" value="작성완료" class="btn btnComplete"/>
            </div>
        </form>

    </section>
</main>
<%@ include file="./_footer.jsp" %>
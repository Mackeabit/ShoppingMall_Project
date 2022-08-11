<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:if test="${ param.p == 1 }">
<script>
	alert("정상적으로 업로드 되었습니다");
	opener.parent.location.reload();
	self.close();
</script>
</c:if>
<c:if test="${ param.p == -1 }">
<script>
	alert("로그인 후 이용해주세요.");
	opener.parent.location.reload();
	self.close();
</script>
</c:if>
<c:if test="${ param.c == 1 }">
<script>
	alert("정상적으로 삭제되었습니다.");
	opener.parent.location.reload();
	self.close();
</script>
</c:if>
<c:if test="${ param.c == -1 }">
<script>
	alert("삭제에 실패하였습니다.");
	opener.parent.location.reload();
	self.close();
</script>
</c:if>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

</body>
</html>
<%@page import="com.liferay.portal.kernel.util.WebKeys"%>
<%@page import="com.liferay.portal.kernel.dao.search.ResultRow"%>
<%@page import="com.liferay.portal.kernel.util.ParamUtil"%>
<%@include file="/init.jsp"%>

 

<%@page
	import="com.liferay.portal.kernel.security.permission.ActionKeys"%>
<%@page import="Module1s.model.Student"%>

 
<%
	String mvcPath = ParamUtil.getString(request, "mvcPath");

	ResultRow row = (ResultRow) request.getAttribute(WebKeys.SEARCH_CONTAINER_RESULT_ROW);

	Student student = (Student) row.getObject();
%>

<!-- View URL Creation -->

<portlet:renderURL var="viewURL">
	<portlet:param name="mvcPath" value="/displayIndividualDetails.jsp"></portlet:param>
	<portlet:param name="studentId"
		value="<%=String.valueOf(student.getStudentId())%>" />

</portlet:renderURL>

<!-- Edit URL Creation -->

<portlet:renderURL var="editURL">
	<portlet:param name="mvcPath" value="/update-student.jsp"></portlet:param>
	<portlet:param name="studentId"
		value="<%=String.valueOf(student.getStudentId())%>" />

</portlet:renderURL>

 
<!-- Delete URL Creation -->

<portlet:actionURL name="deleteProcessActionName" var="deleteURL">
	<portlet:param name="studentId"
		value="<%=String.valueOf(student.getStudentId())%>" />
</portlet:actionURL>

<!-- Buttons -->

<liferay-ui:icon-menu message="Edit">
    <liferay-ui:icon image="edit" message="Update"
		url="<%=editURL.toString()%>" />
	<liferay-ui:icon image="delete" url="<%=deleteURL.toString()%>" />
	<liferay-ui:icon image="view" url="<%=viewURL.toString()%>" />
</liferay-ui:icon-menu>
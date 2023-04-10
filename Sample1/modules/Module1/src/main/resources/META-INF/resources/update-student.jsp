
<%@page import="com.liferay.petra.string.StringPool"%>
<%@page import="com.liferay.portal.kernel.util.Validator"%>
<%@page import="Module1s.service.StudentLocalServiceUtil"%>
<%@page import="Module1s.model.Student"%>
<%@page import="com.liferay.portal.kernel.util.ParamUtil"%>
<%@ include file="init.jsp"%>

<portlet:defineObjects />


<portlet:actionURL name="/sample/action" var="updateStudentActionURL" />


<%
    Long studentId = ParamUtil.getLong(renderRequest, "studentId"); 

	Student student = StudentLocalServiceUtil.fetchStudent(studentId);
	

/*     String firstName = ParamUtil.getString(renderRequest, "firstName"); 
    String lastName = ParamUtil.getString(renderRequest, "lastName"); 
    Integer age = ParamUtil.getInteger(renderRequest, "age"); */
%>
<aui:form action="<%= updateStudentActionURL %>" method="post">
	<aui:input name="studentId" type="hidden" value="<%= studentId%>" />
	<aui:input name="firstName" type="text" value="<%= student.getFirstName()%>" />
	<aui:input name="lastName" type="text" value="<%= student.getLastName()%>"/>
	<aui:input name="age" type="int" value="<%= student.getAge()%>" />
	<aui:input type="submit" value="Update" name="update"></aui:input>
	<portlet:renderURL var="backButtonURL">
<portlet:param name="mvcPath" value="/view.jsp"></portlet:param>
</portlet:renderURL>

   <aui:button onClick="<%= backButtonURL.toString() %>" value="Back" style = "float:left"></aui:button>
</aui:form>
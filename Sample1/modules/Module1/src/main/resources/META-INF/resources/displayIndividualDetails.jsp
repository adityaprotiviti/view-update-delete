<%@page import="com.liferay.portal.kernel.util.ParamUtil"%>
<%@page import="Module1s.model.Student"%>
<%@page import="com.liferay.portal.kernel.util.Validator"%>
<%@page import="Module1s.service.StudentLocalServiceUtil"%>
<%@page import="javax.portlet.PortletURL" %>
<%@ include file="/init.jsp" %>
<%@taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %>

<portlet:renderURL var="backButtonURL">
<portlet:param name="mvcPath" value="/view.jsp"></portlet:param>
</portlet:renderURL>

   <aui:button onClick="<%= backButtonURL.toString() %>" value="Back" style = "float:left"></aui:button>

<%

long studentId = ParamUtil.getLong(request, "studentId");

Student student =null;

if(Validator.isNotNull(studentId)){
	student = StudentLocalServiceUtil.fetchStudent(studentId);

}


%> 
<p>
Name: <%=student.getFirstName() %> <%=student.getLastName() %>
Age: <%=student.getAge() %>

</p>


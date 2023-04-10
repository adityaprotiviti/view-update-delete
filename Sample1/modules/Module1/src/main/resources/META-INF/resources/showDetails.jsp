
<%@page import="Module1s.service.StudentLocalServiceUtil"%>
<%@page import="javax.portlet.PortletURL" %>
<%@ include file="/init.jsp" %>
<%@taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %>

<%
PortletURL studentItrUrl = renderResponse.createRenderURL();
studentItrUrl.setParameter("mvcPath", "/showDetails.jsp");
studentItrUrl.setParameter("orderByCol", "createDate");
studentItrUrl.setParameter("orderByType", "desc");
%>


<!-- Back and Update Button -->

<portlet:resourceURL id="exportToExcelResourceId" var="exportURL" />

<aui:button onClick="<%=exportURL.toString()%>" value="Export to excel" style="float: right">
</aui:button> 
<portlet:renderURL var="addEntryURL">
<portlet:param name="mvcPath" value="/addDetails.jsp"></portlet:param>
</portlet:renderURL>

    <aui:button onClick="<%= addEntryURL.toString() %>" value="Add New Entry" style = "float:left"></aui:button>

<%-- <portlet:renderURL var="backButtonURL">
<portlet:param name="mvcPath" value="/view.jsp"></portlet:param>
</portlet:renderURL>

   <aui:button onClick="<%= backButtonURL.toString() %>" value="Back" style = "float:left"></aui:button> --%>


        
<liferay-ui:search-container total="<%=StudentLocalServiceUtil.getStudentsCount()%>" emptyResultsMessage="No students found" delta="5" deltaConfigurable="true" iteratorURL="<%= studentItrUrl %>">
<liferay-ui:search-container-results results="<%= StudentLocalServiceUtil.getStudents(searchContainer.getStart(), searchContainer.getEnd()) %>" />
<liferay-ui:search-container-row className="Module1s.model.Student" modelVar="student" keyProperty="studentId">
<liferay-ui:search-container-column-text property="firstName" name="First Name"/>
<liferay-ui:search-container-column-text property="lastName" name="Last Name"/>
<liferay-ui:search-container-column-text property="age" name="Age"/>
<liferay-ui:search-container-column-jsp path="/displayDetails.jsp" align="right" />
</liferay-ui:search-container-row>
<liferay-ui:search-iterator paginate="<%=true%>" markupView="lexicon" searchContainer="<%=searchContainer%>"></liferay-ui:search-iterator>
</liferay-ui:search-container>
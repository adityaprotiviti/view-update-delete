<%@ include file="/init.jsp" %>
<%@ include file="/showDetails.jsp" %>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<portlet:defineObjects />




<aui:button-row>
<%-- <portlet:renderURL var="addEntryURL">
<portlet:param name="mvcPath" value="/addDetails.jsp"></portlet:param>
</portlet:renderURL>

    <aui:button onClick="<%= addEntryURL.toString() %>" value="Add New Entry"></aui:button>
 --%>

<%-- <portlet:renderURL var="showEntryURL">
<portlet:param name="mvcPath" value="/showDetails.jsp"></portlet:param>
</portlet:renderURL>

<aui:button onClick="<%= showEntryURL.toString() %>" value="Show Entries"></aui:button>
 --%>

</aui:button-row>



<%@ include file="/init.jsp" %>

<portlet:defineObjects />


<portlet:actionURL var="someProcessAction" name="/sample/action"/>

<aui:form action="<%= someProcessAction %>" method="post" name="studentForm">


<aui:input name="firstName" type="text">
 <aui:validator name="required"/>
 <aui:validator name="alpha"/>
 
</aui:input>


<aui:input name="lastName" type="text">
<aui:validator name="required"/>
 <aui:validator name="alpha"/>
 </aui:input>
        <aui:input name="age" type="Integer">
        <aui:validator name="required"/>
              <aui:validator name="custom"
                     errorMessage="You must have 18 years or more">
function (val, fieldNode, ruleValue) {
var result = false;
//alert(val);
if (val >=18) {
result = true;
}
return result;
}
</aui:validator>
       </aui:input>

    <aui:button-row>
<aui:button type="submit">
</aui:button>
</aui:button-row>
</aui:form>
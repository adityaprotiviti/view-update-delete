package Module1.portlet;

import com.liferay.portal.kernel.portlet.bridges.mvc.BaseMVCActionCommand;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCActionCommand;
import com.liferay.portal.kernel.util.ParamUtil;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;

import org.osgi.service.component.annotations.Component;

import Module1.constants.Module1PortletKeys;
import Module1s.service.StudentLocalServiceUtil;

@Component
(
		immediate = true,
		property = {
"javax.portlet.name="+ Module1PortletKeys.MODULE1,
 "mvc.command.name=deleteProcessActionName"
},
service = MVCActionCommand.class)

public class DeleteActionCommand extends BaseMVCActionCommand {

	@Override
	protected void doProcessAction(ActionRequest actionRequest, ActionResponse actionResponse) throws Exception {
		// TODO Auto-generated method stub
		
		
		long studentId = ParamUtil.getLong(actionRequest, "studentId");
		StudentLocalServiceUtil.deleteStudent(studentId);
		actionResponse.getRenderParameters().setValue("jspPage", "/showDetails.jsp");
	}
	
	
	

}

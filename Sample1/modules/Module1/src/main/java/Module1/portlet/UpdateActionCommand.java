package Module1.portlet;

import com.liferay.portal.kernel.portlet.bridges.mvc.BaseMVCActionCommand;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCActionCommand;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;

import org.osgi.service.component.annotations.Component;

import Module1.constants.Module1PortletKeys;

@Component
(
		immediate = true,
		property = {
"javax.portlet.name="+ Module1PortletKeys.MODULE1,
 "mvc.command.name=updateProcessActionName"
},
service = MVCActionCommand.class)

public class UpdateActionCommand extends BaseMVCActionCommand{

		
	@Override
	protected void doProcessAction(ActionRequest actionRequest, ActionResponse actionResponse) throws Exception {
		// TODO Auto-generated method stub
		
		
		}
	

}

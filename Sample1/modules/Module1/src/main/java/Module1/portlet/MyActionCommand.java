package Module1.portlet;

import com.liferay.counter.kernel.service.CounterLocalServiceUtil;

import com.liferay.portal.kernel.portlet.bridges.mvc.BaseMVCActionCommand;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCActionCommand;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.Validator;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;

import org.osgi.service.component.annotations.Component;

import Module1.constants.Module1PortletKeys;
import Module1s.model.Student;
import Module1s.service.StudentLocalServiceUtil;

@Component(immediate = true, property =

{ "javax.portlet.name=" + Module1PortletKeys.MODULE1,
		"mvc.command.name=/sample/action" }, service = MVCActionCommand.class)

public class MyActionCommand extends BaseMVCActionCommand {

	@Override
	protected void doProcessAction(ActionRequest actionRequest, ActionResponse actionResponse) throws Exception {

		String firstName = ParamUtil.getString(actionRequest, "firstName");
		String lastName = ParamUtil.getString(actionRequest, "lastName");
		Integer age = ParamUtil.getInteger(actionRequest, "age");
		
		long studentId = ParamUtil.getLong(actionRequest, "studentId"); 

		//update student details
		if(Validator.isNotNull(studentId)) {
			Student student = StudentLocalServiceUtil.fetchStudent(studentId);
			student.setStudentId(studentId);
			student.setFirstName(firstName);
			student.setLastName(lastName);
			student.setAge(age);
			StudentLocalServiceUtil.updateStudent(student);
			actionResponse.getRenderParameters().setValue("jspPage", "/showDetails.jsp");
		
		}else {
			String message = "Hello " + firstName + " " + lastName + " " + age;

			System.out.println(message);

			Student student = StudentLocalServiceUtil
					.createStudent(CounterLocalServiceUtil.increment(Student.class.getName()));
			student.setFirstName(firstName);
			student.setLastName(lastName);
			student.setAge(age);
			StudentLocalServiceUtil.addStudent(student);
		}		
	}

}

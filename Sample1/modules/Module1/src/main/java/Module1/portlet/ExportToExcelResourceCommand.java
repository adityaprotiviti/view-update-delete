package Module1.portlet;

import com.liferay.portal.kernel.portlet.PortletResponseUtil;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCResourceCommand;
import com.liferay.portal.kernel.util.ContentTypes;
import com.liferay.portal.kernel.util.Validator;

import java.io.ByteArrayOutputStream;
import java.util.List;

import javax.portlet.PortletException;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.osgi.service.component.annotations.Component;

import Module1.constants.Module1PortletKeys;
import Module1s.model.Student;
import Module1s.service.StudentLocalServiceUtil;

@Component(immediate = true, property = { "javax.portlet.name=" + Module1PortletKeys.MODULE1,
		"mvc.command.name=exportToExcelResourceId" }, service = MVCResourceCommand.class)
public class ExportToExcelResourceCommand implements MVCResourceCommand {

	@Override
	public boolean serveResource(ResourceRequest resourceRequest, ResourceResponse resourceResponse)
			throws PortletException {

		System.out.println("method called!!!!!!!!!!");
		List<Student> dataList = StudentLocalServiceUtil.getStudents(0,
				StudentLocalServiceUtil.getStudentsCount());

		Workbook workbook = null;
		Sheet sheet = null;
		ByteArrayOutputStream outByteStream = null;
		byte[] outArray = null;

		workbook = new XSSFWorkbook();
		sheet = workbook.createSheet("Excel Sheet");

		int refNum = 1;

		Row heading = sheet.createRow(0);
		
		Cell sampleDataIdHeading = heading.createCell(0);
		sampleDataIdHeading.setCellValue("ID");
		
		Cell firstNameHeading = heading.createCell(1);
		firstNameHeading.setCellValue("First Name");
		
		Cell lastNameHeading = heading.createCell(2);
		lastNameHeading.setCellValue("Last Name");
		
		Cell ageHeading = heading.createCell(3);
		ageHeading.setCellValue("Age");
		
	
		
		for (Student sampleData : dataList) {

			Row row = sheet.createRow(refNum);

			Cell sampleDataIdCell = row.createCell(0);
			sampleDataIdCell.setCellValue(sampleData.getStudentId());
			
			Cell firstNameCell = row.createCell(1);
			firstNameCell.setCellValue(sampleData.getFirstName());

			Cell lastNameCell = row.createCell(2);
			lastNameCell.setCellValue(sampleData.getLastName());

			Cell ageCell = row.createCell(3);
			ageCell.setCellValue(sampleData.getAge());
			
			refNum++;
		}
		outByteStream = new ByteArrayOutputStream();
		try {
			workbook.write(outByteStream);
			outArray = outByteStream.toByteArray();
			//System.out.println(outArray);
			String contentType = ContentTypes.APPLICATION_TEXT;

			String fileName="File.xlsx";
			PortletResponseUtil.sendFile(resourceRequest, resourceResponse,
			fileName, outArray, contentType);
			if(Validator.isNotNull(outByteStream)) {
				/*
				 * outByteStream.flush(); outByteStream.close();
				 */
		
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return true;
	}

}

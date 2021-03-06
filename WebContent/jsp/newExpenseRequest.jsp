<%@include file="include.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href='<c:url value="/resources/images/favicon.ico" />' rel="shortcut icon">
<title>Reimbursement Management System SupraITS</title>
	<link href='<c:url value="/resources/css/bootstrap.min2.css" />' rel="stylesheet">
	<link href="<c:url value="/resources/css/datepicker3.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/styles.css" />" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">
	<link href="<c:url value="/resources/css/googleapi-fonts.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/jquery-ui.min.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/font-awesome.min.css" />" rel="stylesheet">
	
	<script src="<c:url value="/resources/js/jquery-1.11.1.min.js"/>"></script>
	<script src="<c:url value="/resources/js/bootstrap.js"/>"></script>
	<script src="<c:url value="/resources/js/bootstrap-datepicker.js"/>"></script>
	<script src="<c:url value="/resources/js/bootstrap-table.js"/>"></script>
	<script src="<c:url value="/resources/js/moment.min.js"/>"></script>
	<script src="<c:url value="/resources/js/lumino.glyphs.js" />"></script>
	<script src="<c:url value="/resources/js/bootstrap-datetimepicker.min.js" />"></script>
	<script src="<c:url value="/resources/js/bootstrap-filestyle.min.js" />"></script>
	<script src="<c:url value="/resources/scripts/reimbursement.js"/>"></script>
<script type="text/javascript">
var sessionuser = '${sessionScope.loggedInUser}';
if(sessionuser == "" ||  sessionuser == null ||sessionuser == undefined){
	alert("Session Expired.");
	window.close();
}
</script>	
</head>
<body style="padding-top: 20px;">
<div class="container" style="width:100%;">
<form:form cssClass="form-horizontal" role="form"
				id="newRequestForm" data-toggle="validator" method="post"
				modelAttribute="expenseRequestBean" enctype="multipart/form-data">
<div class="row">
	<c:if test="${not empty successMsg}">
			<script type="text/javascript">
				alert('${successMsg}');
				window.close();
			</script>
		</c:if>
		<c:if test="${not empty errorMsg}">
			<script type="text/javascript">
				alert('${errorMsg}');
				window.close();
			</script>
		</c:if>
   <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" style="display:inline-block;">
						<div class="panel-group" id="accordion">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										New Reimbursement Request 
										<span class="pull-right clickable">
										<i class="glyphicon glyphicon-chevron-up" data-toggle="collapse" data-target="#collapseUser"></i>
										</span>
									</h4>
								</div>
								<div id="collapseUser" class="panel-collapse collapse in" style="min-height: 300px;">
									<div class="panel-body">
									<table class="table" style="border:none;border-top:0px;">
										<tbody>
										<tr>
											<td style="border-top:0px;text-align:left;width:10%;">
											<form:label path="requestNumber" for="requestNumber"
													class="col-xs-6 col-sm-2 col-md-2 col-lg-3 form-control" style="border:none;">Request Number:</form:label>
											</td>
											<td style="border-top:0px;text-align:left">
											<form:input path="requestNumber" cssClass="form-control" style="width: 100%;background-color: #ff6666;"
														id="requestNumber" readonly="true" />
											</td>
											<td style="border-top:0px;text-align:left;width:10%;">
											<form:label path="requestNumber" for="requestNumber"
													class="col-xs-6 col-sm-2 col-md-2 col-lg-3 form-control" style="border:none;">Account Unit:</form:label>
											</td>
											<td style="border-top:0px;text-align:left">
											<form:input path="" cssClass="form-control" style="width: 100%;"
														id="" readonly="true" value='${sessionScope.loggedInUserAccUnit}'/>
											</td>
										</tr>
										<tr>
											<td style="border-top:0px;text-align:left;width:10%;">
											<form:label path="" for=""
													class="col-xs-6 col-sm-2 col-md-2 col-lg-3 form-control" style="border:none;">Base Location:</form:label>
											</td>
											<td style="border-top:0px;text-align:left">
											<form:input path="" cssClass="form-control" style="width: 100%;"
														id="" readonly="true" value='${sessionScope.loggedInUserLocation}'/>
											</td>
											<td style="border-top:0px;text-align:left;width:10%;">
											<form:label path="" for=""
													class="col-xs-6 col-sm-2 col-md-2 col-lg-3 form-control" style="border:none;">Emp Department:</form:label>
											</td>
											<td>
											<form:input path="" cssClass="form-control" style="width: 100%;" id="" readonly="true" value='${sessionScope.loggedInUserDepartment}'/>
											</td>
										</tr>
										<tr>
											<td style="border-top:0px;text-align:left;width:10%;">
											<form:label path="" for=""
													class="col-xs-6 col-sm-2 col-md-2 col-lg-3 form-control" style="border:none;">Employee Id:</form:label>
											</td>
											<td style="border-top:0px;text-align:left">
											<form:input path="" cssClass="form-control" style="width: 100%;" value='${sessionScope.loggedInUserCode}'
														id="" readonly="true" />
											<form:hidden path="username" cssClass="form-control" style="width: 100%;" value='${sessionScope.loggedInUser}'
														id="" readonly="true" />
											</td>
											<td style="border-top:0px;text-align:left;width:10%;">
											<form:label path="" for=""
													class="col-xs-6 col-sm-2 col-md-2 col-lg-3 form-control" style="border:none;">Employee Name:</form:label>
											</td>
											<td style="border-top:0px;text-align:left">
											<form:input path="" cssClass="form-control" style="width: 100%;"
														id="" readonly="true" value='${sessionScope.loggedInUserFullName}' />
											</td>
										</tr>
										<tr>
											<td style="border-top:0px;text-align:left;width:10%;">
											<form:label path="" for=""
													class="col-xs-6 col-sm-2 col-md-2 col-lg-3 form-control" style="border:none;">Designation:</form:label>
											</td>
											<td style="border-top:0px;text-align:left">
											<form:input path="" cssClass="form-control" style="width: 100%;"
														id="" readonly="true" value='${sessionScope.loggedInUserDesignation}'/>
											</td>
											<td style="border-top:0px;text-align:left;width:10%;">
											<form:label path="" for=""
													class="col-xs-6 col-sm-2 col-md-2 col-lg-3 form-control" style="border:none;">Approver Name:</form:label>
											</td>
											<td style="border-top:0px;text-align:left">
											<form:input path="" cssClass="form-control" style="width: 100%;" value='${sessionScope.reportingManager}'
														id="" readonly="true" />
											</td>
										</tr>
										<tr>
											<td style="border-top:0px;text-align:left;width:10%;">
											<form:label path="createdOn" for="createdOn"
													class="col-xs-6 col-sm-2 col-md-2 col-lg-3 form-control" style="border:none;">Generation Date:</form:label>
											</td>
											<td style="border-top:0px;text-align:left">
													<form:input path="createdOn" cssClass="form-control" style="width: 100%;"
														id="generationDate" readonly="true" />											
											</td>
											<td style="border-top:0px;text-align:left;width:10%;">
											<form:label path="" for=""
													class="col-xs-6 col-sm-2 col-md-2 col-lg-3 form-control" style="border:none;">Requested By:</form:label>
											</td>
											<td style="border-top:0px;text-align:left">
												<c:choose>
												    <c:when test="${sessionScope.loggedInUserProxy != ''}">
												    <form:input path="" cssClass="form-control" style="width: 100%;"
														id="" readonly="true" value='${sessionScope.loggedInUserFullNameProxy}'/>
												    <form:hidden path="" cssClass="form-control" style="width: 100%;"
														id="" readonly="true" value='${sessionScope.loggedInUserProxy}'/> 
												    </c:when>    
												    <c:otherwise>
												    <form:input path="" cssClass="form-control" style="width: 100%;"
														id="" readonly="true" value='${sessionScope.loggedInUserCode}'/>
													<form:hidden path="" cssClass="form-control" style="width: 100%;"
														id="" readonly="true" value='${sessionScope.loggedInUser}'/>
													</c:otherwise>
												</c:choose>
											
											</td>
										</tr>
										</tbody>
									</table>
									</div>
								</div>
							</div>
						</div>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" style="display:inline-block;">
						<div class="panel-group" id="accordion">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										Reimbursement Guideline <span class="pull-right clickable"><i
											class="glyphicon glyphicon-chevron-up" data-toggle="collapse" data-target="#collapseGuideline"></i></span>
									</h4>
								</div>
								<div id="collapseGuideline" class="panel-collapse collapse in" style="min-height: 300px;">
									<div class="panel-body">
										<p class="egov-p-form"><b>Guideline for uploading Documents:</b></p>
										<p class="egov-p-form">Upload scans of the original documents(<b>PDF Only</b>), i.e. the documents given to you by the issuing authority.</p>
										<p class="egov-p-form">Upload <b style="color:red">only one consolidated PDF file</b> per Expense head for multiple bill </p>
										<p class="egov-p-form">Submit only what is requested. Submitted documents that are not requested will not be taken into consideration and will only complicate the evaluation of your request</p>
										<p class="egov-p-form">Scanned documents must be clear and legible. They must appear right-side up when seen in a standard document viewer. Also make sure that the entire document, including the reverse side, is included in the scan.</p>
										<p class="egov-p-form">Claimed amount must be less or equal bill amount.</p>
									</div>
								</div>
							</div>
						</div>
					</div>
			</div>
	<div class="row" style="margin-left:0px;margin-right:0px;">
		 <div class="panel-group" id="accordion">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										Add Request<span class="pull-right clickable"></span>
									</h4>
								</div>
								<div id="collapseUser" class="panel-collapse collapse in">
									<div class="panel-body">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 column">
				<table id="piotable_exp" class="table table-bordered table-hover" id="tab_logic_exp" style="margin-bottom:0px;">
					<thead>
						<tr>
							<th class="text-center" style="width:13%;">
								Project Name*
							</th>
							<th class="text-center" style="width:11%;">
								Expense Type*
							</th>
							<th class="text-center" style="width:15%;">
								Name*
							</th>
							<th class="text-center" style="width:10%;">
								Ref./Bill No
							</th>
							<th class="text-center" style="width:8%;">
								Bill Amount*
							</th>
							<th class="text-center" style="width:8%;">
								Claimed*
							</th>
							<th class="text-center" style="width:10%;">
								Bill Date*
							</th>
							<th class="text-center">
								Attachment
							</th>
							<th class="text-center" style="width:20%;">
								Employee Remark*
							</th>
							<th>
								#
							</th>
						</tr>
					</thead>
					<tbody id="tab_logicExp">
						<tr id='query0'>
						<td>
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-12 input-group">
							<form:select class="form-control" path="expenseList[0].projectName" id="expenseList[0].projectName" title="Select Project">
								<form:option value="select"  selected="selected">Select Type</form:option>
							</form:select>
							<div class="help-block with-errors"></div>
		                 </div>
		                 <form:input type="hidden" name="expenseList[0].codeName" path="expenseList[0].codeName" id="expenseList[0].codeName" />	
						</td>
						<td>
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-12 input-group">
							<form:select class="form-control" path="expenseList[0].expenseCode" id="expenseList[0].expenseCode" onchange="setExpenseCodeName('0')">
								<form:option value="select"  selected="selected">Select Type</form:option>
							</form:select>
							<div class="help-block with-errors"></div>
		                 </div>
		                 <form:input type="hidden" name="expenseList[0].codeName" path="expenseList[0].codeName" id="expenseList[0].codeName" />	
						</td>
						 <td>
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-12 input-group">
								<form:input type="text" path="expenseList[0].expenseName" id="expenseList[0].expenseName" maxlength="50" placeholder="Expense Name" class="form-control"/>
							</div>
						</td>
						<td>
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-12 input-group">
								<form:input type="text" path="expenseList[0].billNumber" id="expenseList[0].billNumber" maxlength="20" placeholder="Bill Number" class="form-control"/>
							</div>
						</td>
						<td>
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-12 input-group">
								<form:input type="text" path="expenseList[0].billAmount" id="expenseList[0].billAmount" onkeyup="calculateSumAmount();return false;" maxlength="8" placeholder="INR" onkeypress="validate(event)" onfocusout="fillRequestValue('0')" class="form-control"/>
							</div>
						</td>
						<td>
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-12 input-group">
								<form:input type="text" path="expenseList[0].requestAmount" id="expenseList[0].requestAmount" onkeyup="calculateSumAmount();return false;" maxlength="8" placeholder="INR" onkeypress="validate(event)" class="form-control"/>
							</div>
						</td>
						<td>
								<form:input type="text" path="expenseList[0].billDate" id="expenseList[0].billDate" class="form-control billDate"/>
						</td>
						<td>
								<!-- <a href="#!" class="btn btn-info btn-sm" onclick="openAddDocModal('expenseList[0].expenseDocumentList');">
						          <span class="glyphicon glyphicon-file"></span> File 
						        </a> -->
						        <input type="file" name="file" onchange="valFileUpload(this.value,id);" path="expenseList[0].expenseDocumentList" id="expenseList[0].expenseDocumentList" style="width:200px;" class="filestyle" data-buttonText="PDF"/>
						       	<input type='text' readOnly='true' style='color:red;font-size:10px;overflow:hidden;border:none;' name="expenseList[0].expDocName" id="expenseList[0].expDocName"/> 
						</td>
						<td>
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-12 input-group">
								<form:input type="text" path="expenseList[0].applicantRemark" id="expenseList[0].applicantRemark" class="form-control" maxlength="250" placeholder="Remark"/>
							</div>
						</td>
						<td>
								<a href="#!" class="btn btn-info btn-sm" onclick="deleteExpenseRow('0')">
						          <span class="glyphicon glyphicon-trash"></span> 
						        </a>
						</td>
						</tr>
						<tr id='query1'></tr>
					</tbody>
					</table>
					<table class="table table-bordered ">
									<tr style="background-color:#eee;">
									<td colspan="4" style="text-align:right;width:39%;color:red;">Total</td>
									<td style="width:8%;color:red;" id="totalBillAmt">0</td>
									<td style="width:8%;color:red;" id="totalClaimedAmt">0</td>	
									<td colspan="4" style="width:30%;"></td>								
									</tr>
					</table>
					</div>
					<div class="row">
					<a id="add_expense_row" class="btn btn-success pull-left" style="margin-left:30px;" onclick="addNewExpenseRow();">Add New Row</a>
					<a id="submitForApproval" class="btn btn-success pull-right" style="margin-right:30px;">Submit</a>
					<a id="saveAsDraft" class="btn btn-danger pull-right" style="margin-right:10px;">Save</a>
			</div>					
		    </div>
			</div>
		</div>
	</div>		 
 </div>	
</form:form>
</div>
<div class="modal fade" id="addDocModal" role="dialog">
				    <div class="modal-dialog modal-md">
				      <div class="modal-content">
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				     	     <h4 class="modal-title">Upload Document </h4><span id="id_cmtId"></span>
				          </div>
				          <div class="modal-body">
				        			<div id="docRow_logic">
												<div id="docRow0" style="padding-bottom: 5px;">
													<fieldset class="form-inline">
														<input type="file" name="file" class="filestyle"
															data-buttonName="btn-primary"
															data-buttonText="Upload Document"
															onchange="valFileUpload(this.value,id);"
															id="docTemp">
														<input type="hidden" id="tempFile" value=""/>	
														<progress id="progressBar" value="0" max="100"
															style="width: 100px; display: none;"></progress>
														<span id="docNote0" style="color: red; margin-left: 3px;"></span>
													</fieldset>
												</div>
												<div id="docRow1"></div>
				        </div>
				       						 <!-- <div> 
				       						 <br>
												<a id="add_docRow"	class="btn btn-default pull-left">Add New Doc</a> 
												<a id='delete_docRow' class="pull-right btn btn-default">Delete	Last Doc</a>
												<br>
											</div> -->
				        <div class="modal-footer">
	    			      <button type="button" class="btn btn-success" onclick="uploadExpenseDocuments();">Upload</button>
				          <button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
				        </div>
				       </div>
				     </div>
				</div>
				</div>
<script>
function formatDate(date) {
    var d = new Date(date),
        month = '' + (d.getMonth() + 1),
        day = '' + d.getDate(),
        year = d.getFullYear();

    if (month.length < 2) month = '0' + month;
    if (day.length < 2) day = '0' + day;

    return [year, month, day].join('-');
}
$(document).ready(function(){
	fetchNewRequestNumber();
	getAssignedProjects("expenseList[0].projectName");
	getExpenseList("expenseList[0].expenseCode");
	$(".billDate").datetimepicker({
	      format: 'YYYY-MM-DD',
	      maxDate: new Date()
	  	});
	/* $("#generationDate").datetimepicker({
	      format: 'YYYY-MM-DD',
	      maxDate: new Date()
	  	}); */
	$("#generationDate").val(formatDate(new Date()));
	  	   
	$('#submitForApproval').click(function() {
		if(validateExpenseTable('tab_logicExp')){
		var ret = confirm("Do you want to send for approval?");
		if (ret == true) {
			var x = document.getElementById("newRequestForm");
			x.action = "submitNewExpenseAction";
			x.submit();
		} else {
			return false;
		}
		}else{
			return false;
		}
	});
	$('#saveAsDraft').click(function() {
		if(validateExpenseTable('tab_logicExp')){
		var ret = confirm("Do you want to save?");
		if (ret == true) {
			var x = document.getElementById("newRequestForm");
			x.action = "saveNewExpenseAction";
			x.submit();
		} else {
			return false;
		}
		}else{
			return false;
		}
	});
	/* $("#add_expense_row").click(function(){ });*/
});
</script>
</body>
</html>

<?php
include "database.php";
include "session.php";
//include "logfile.php";

class Oms
{

	private $db;
	public function __construct()
	{
		$this->db = new Database();
		$this->session = new Session();
	}

	//Login Check Function
	public function login_check($data)
	{
		$email		= $data['email'];
		$password	= $data['password'];
		// Password for employee
		$password = md5($password);
		$result = $this->login_value_check($email, $password);

		if ($email == "") {
			$msg['email'] = '<p class="text-danger"><strong>Error! </strong>Invalid Email!</p>';
		} else if (filter_var($email, FILTER_VALIDATE_EMAIL) === false) {
			$msg['email'] = '<p class="text-danger"><strong>Error! </strong>The email address is not valid!</p>';
		}
		if ($password == "") {
			$msg['password'] = '<p class="text-danger"><strong>Error! </strong>Invalid Password!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}
		if ($result) {
			Session::init();
			Session::set("login", true);
			Session::set("id", $result->id);
			Session::set("name", $result->name);
			Session::set("username", $result->username);
			Session::set("user_role", $result->user_role);
			Session::set("loginmsg", '<p class="text-success"><strong>Success! </strong>You are Login.</p>');
			// header("Location: dashboard.php");
			// $this->session->sessionLoginCheck();

			$this->log();
			if ($result->user_role == "1") {
				header("Location: dashboard.php");
			} else if ($result->user_role == "0") {
				header("Location: user/user_dashboard.php");
			} else if ($result->user_role == "2") {
				header("Location: auditor/aud_dashboard.php");
			} else if ($result->user_role == "3") {
				header("Location: tm/tm_dashboard.php");
			} else if ($result->user_role == "4") {
				header("Location: tl/tl_dashboard.php");
			} else {
				$msg = '<p class="text-danger"><strong>Error! </strong>Data Not Found!</p>';
				return $msg;
			}
		} else {
			$msg['email'] = '<p class="text-danger"><strong>Error! </strong>Username or Password Incorrect!</p>';
			return $msg;
		}
	}
	public function login_value_check($email, $password)
	{
		$sql = "SELECT * FROM employee WHERE email = :email AND password = :password LIMIT 1";
		$query = $this->db->conn->prepare($sql);
		$query->bindValue(":email", $email);
		$query->bindValue(":password", $password);
		$query->execute();
		$result = $query->fetch(PDO::FETCH_OBJ);
		return $result;
	}

	//Save Attendance
	public function save_attendance($id1)
	{
		$daily_date = date('Y-m-d');
		$entry_time = date('H:i:s');

		$checkAtten = $this->check_attendance($id1, $daily_date);

		if (empty($checkAtten)) {
			$sql = "INSERT INTO attendance (employee_id, daily_date, entry_time) VALUES (:employee_id, :daily_date, :entry_time)";
			$query = $this->db->conn->prepare($sql);
			$query->bindValue(":employee_id", $id1);
			$query->bindValue(":daily_date", $daily_date);
			$query->bindValue(":entry_time", $entry_time);
			$query->execute();
		} else {
			echo "Not";
		}
	}
	public function check_attendance($daily_date, $id1)
	{
		$sql = "SELECT * FROM attendance WHERE id=:id AND daily_date = :daily_date LIMIT 1";
		$query = $this->db->conn->prepare($sql);
		$query->bindValue(":id", $id1);
		$query->bindValue(":daily_date", $daily_date);
		$query->execute();
		$result = $query->fetch(PDO::FETCH_OBJ);
		return $result;
	}
	public function ckeckout_time($id)
	{
		$exit_time = date('H:i:s');
		$daily_date = date('Y-m-d');
		$sql = "UPDATE attendance SET exit_time=:exit_time WHERE id=:id AND daily_date=:daily_date";
		$query = $this->db->conn->prepare($sql);
		$query->bindValue(":exit_time", $exit_time);
		$query->bindValue(":id", $id);
		$query->bindValue(":daily_date", $daily_date);
		$result = $query->execute();
		if ($result) {
			header("Location: dashboard.php");
		}
	}
	public function view_attendance()
	{
		$sql = "SELECT * FROM attendance";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}


	// Save Designation
	public function save_designation($data)
	{
		$designation_name = $data['designation_name'];

		$check_des = $this->check_designation($designation_name);

		if ($designation_name == "") {
			$msg['designation_name'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($designation_name == $check_des->designation) {
			$msg['designation_name'] = '<p class="text-danger"><strong>Error! </strong>Designation already exists!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}

		$sql = "INSERT INTO tbl_designation (designation) VALUES (:designation_name)";
		$query = $this->db->conn->prepare($sql);
		$query->bindValue(":designation_name", $designation_name);
		$result = $query->execute();
		if ($result) {
			$msg['su'] = '<p class="text-success"><strong>Success! </strong>Data Inserted.</p>';
			return $msg;
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Insert!</p>';
			return $msg;
		}
		if (!empty($msg)) {
			return $msg;
		}
	}
	//it will be removed
	// Check annual
	public function check_annual($Audit_activities)
	{
		$sql = "SELECT * FROM annual_plan WHERE Audit_activities = :Audit_activities LIMIT 1";
		$query = $this->db->conn->prepare($sql);
		$query->bindValue(":Audit_activities", $Audit_activities);
		$query->execute();
		$result = $query->fetch(PDO::FETCH_OBJ);
		return $result;
	}

	// Check designation
	public function check_designation($designation_name)
	{
		$sql = "SELECT * FROM tbl_designation WHERE designation = :designation LIMIT 1";
		$query = $this->db->conn->prepare($sql);
		$query->bindValue(":designation", $designation_name);
		$query->execute();
		$result = $query->fetch(PDO::FETCH_OBJ);
		return $result;
	}
	//Risk list
	public function rs_list()
	{
		$sql = "SELECT * FROM Risk_list";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	//control list
	public function cont_list()
	{
		$sql = "SELECT * FROM control_list";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	//select operational area
	public function select_operational()
	{
		$sql = "SELECT * FROM operational";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	// Select Irregularity type
	public function select_ity()
	{
		$sql = "SELECT * FROM irregularity_type";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	//select operational area
	public function select_chk()
	{
		$sql = "SELECT * FROM checklist";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	//select risk level
	public function select_risk_level()
	{
		$sql = "SELECT * FROM risk_level";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	//select Engagement ID
	public function select_engagement_id()
	{
		$sql = "SELECT * FROM audit_program_engagement";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	//Select Finding number
	public function select_f_num()
	{
		$sql = "SELECT * FROM finding_registration";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	//Criteria
	public function select_criteria_id()
	{
		$sql = "SELECT * FROM criteria";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	//Select Recommendation
	public function select_recommendation_id()
	{
		$sql = "SELECT * FROM recommendation";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	//select Auditor justification
	public function select_auditor_justification_id()
	{
		$sql = "SELECT * FROM auditor_justification";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	//select Cause ID
	public function select_cause_id()
	{
		$sql = "SELECT * FROM cause";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	//select Effect ID
	public function select_effect_id()
	{
		$sql = "SELECT * FROM effect";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	//Selecting Finding Number
	public function select_Finding_id()
	{
		$sql = "SELECT * FROM audit_program_engagement";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	//Select Finding ID
	public function select_finding_number()
	{
		$sql = "SELECT * FROM finding_registration";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	//select Field ID
	// public function select_task_id()
	// {
	// 	$sql = "SELECT * FROM assigned_task";
	// 	$query = $this->db->conn->prepare($sql);
	// 	$query->execute();
	// 	$result = $query->fetchAll();
	// 	return $result;
	// }
	//Select operational area
	public function select_quarter_plan()
	{
		$sql = "SELECT * FROM Quarter_plan";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	//List of month of year
	public function select_month_year()
	{
		$sql = "SELECT * FROM month_year";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	//Select monthly Plan
	public function select_monthly_plan()
	{
		$sql = "SELECT * FROM monthly_plan";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	//select quarter number
	public function select_quarter_number()
	{
		$sql = "SELECT * FROM quarter_number";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	//Select Team
	public function select_team()
	{
		$sql = "SELECT * FROM team";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	//Select auditor name
	public function select_auditor_name()
	{
		$sql = "SELECT * FROM auditor_name";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	public function select_contac_p()
	{
		$sql = "SELECT * FROM contac_p";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	public function select_audit_activities()
	{
		$sql = "SELECT * FROM audit_activities";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	//Select Audit Object
	public function select_audit_object()
	{
		$sql = "SELECT * FROM audit_object";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	//Select Audit type
	public function select_auditType()
	{
		$sql = "SELECT * FROM audit_type";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	//Select Audit type for quarter plan
	public function select_auditTypeq()
	{
		$sql = "SELECT * FROM audit_typeq";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	//for annual plan id
	public function select_annual_pid()
	{
		$sql = "SELECT * FROM annual_plan";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	//Select Audit Program
	public function select_audit_type()
	{
		$sql = "SELECT * FROM audit_object";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	//Select Auditee List
	public function select_auditee()
	{
		$sql = "SELECT * FROM audit_object";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	//Select Auditee Response
	public function select_auditee_response()
	{
		$sql = "SELECT * FROM auditee_response";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	//Select Auditee Audit finding answer
	public function select_aud_find()
	{
		$sql = "SELECT * FROM audit_finding";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	//Select Rectification
	public function select_rectification()
	{
		$sql = "SELECT * FROM rectification";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	//Select Acceptance Status 
	public function select_acceptance()
	{
		$sql = "SELECT * FROM acceptance";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	//Add temp_team
	public function add_temp_team()
	{
		$E_id	 	= $_POST['E_id'];
		$tmember 			= $_POST['Team_member'];
		$Auditor_in_charge 	= $_POST['Auditor_in_charge'];
		$audit_type 	= $_POST['audit_type'];
		$audit_object 	= $_POST['audit_object'];
		$sub 	= $_POST['sub'];
		$Description 	= $_POST['Description'];

		if ($E_id == "") {
			$msg['E_id'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if ($tmember == "") {
			$msg['Team_member'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if ($Auditor_in_charge == "") {
			$msg['Auditor_in_charge'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if ($audit_type == "") {
			$msg['audit_type'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if ($audit_object == "") {
			$msg['audit_object'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if ($sub == "") {
			$msg['sub'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if ($Description == "") {
			$msg['Description'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}
		foreach ($tmember as $rowaud) {
			$sql = "INSERT INTO temp_team (E_id, Team_member, Auditor_in_charge, audit_type, audit_object,sub, Description) VALUES ('$E_id','$rowaud', '$Auditor_in_charge', '$audit_type', '$audit_object','$sub', '$Description')";
			$query = $this->db->conn->prepare($sql);
			$query->bindValue(":E_id", $E_id);
			$query->bindValue(":Team_member", $rowaud);
			$query->bindValue(":Auditor_in_charge", $Auditor_in_charge);
			$query->bindValue(":audit_type", $audit_type);
			$query->bindValue(":audit_object", $audit_object);
			$query->bindValue(":sub", $sub);
			$query->bindValue(":Description", $Description);
			$result = $query->execute();
		}
		if ($result) {
			header("location: temp_team.php");
			$msg['su'] = '<p class="text-success"><strong>Success! </strong>Data Inserted.</p>';
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Insert!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}
	}
	//view_designation
	//select_designation
	public function select_designation()
	{
		$sql = "SELECT * FROM tbl_designation";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	//Edit auditee response justification
	public function edit_auditee_resp()
	{
		$id = $_POST['up_id'];
		$name = $_POST['name'];
		

		if ($name == "") {
			$msg['name'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}  

		if (!empty($msg)) {
			return $msg;
		}

		$sql = "UPDATE auditee_response SET name='$name' WHERE id='$id'";

		$result = $this->db->conn->prepare($sql);
		$result->execute();


		if ($result) {
			header("Location: response.php");
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Update</p>';
			return $msg;
		}
		if (!empty($msg)) {
			return $msg;
		}
	}


	//edit employee
	public function edit_employee()
	{
		$id = $_POST['up_id'];
		$name = $_POST['name'];
		// $designation = $_POST['designation'];
		//$Address = $_POST['Address'];
		$phone = $_POST['Phone'];
		$joining_date = $_POST['joining_date'];
		$email = $_POST['email'];
		$username = $_POST['username'];
		$password = $_POST['password'];
		$password = md5($password);
		//$Status = $_POST['status'];

		if ($name == "") {
			$msg['name'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} 
		//  else if ($designation == "") {
		// 	$msg['designation'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		// } 
		else if ($phone == "") {
			$msg['phone'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($joining_date == "") {
			$msg['joining_date'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($email == "") {
			$msg['email'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($username == "") {
			$msg['username'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($password == "") {
			$msg['password'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}

		$sql = "UPDATE employee SET name='$name', phone='$phone', joining_date='$joining_date', email='$email', username='$username', password='$password' WHERE id='$id'";

		$result = $this->db->conn->prepare($sql);
		$result->execute();


		if ($result) {
			header("Location: view-employee.php");
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Update</p>';
			return $msg;
		}
		if (!empty($msg)) {
			return $msg;
		}
	}
	//Edit approve finding
	public function edit_approve_finding()
	{
		$id = $_POST['up_id'];
		$E_id = $_POST['E_id'];
		$auditee = $_POST['auditee'];
		$Operational_area = $_POST['Operational_area'];
		$Finding_number = $_POST['Finding_number'];
		$Facts = $_POST['Facts'];
		$Description = $_POST['Description'];
		$Criteria = $_POST['Criteria'];
		$Cause = $_POST['Cause'];
		$Effect = $_POST['Effect'];
		$Internal_control = $_POST['Internal_control'];
		$Recommendation = $_POST['Recommendation'];
		// $Resp = $_POST['Resp'];
		$Auditor_conclusion = $_POST['Auditor_conclusion'];

		$Acceptance_Status = $_POST['Acceptance_Status'];
		$auditor_name = $_POST['auditor_name'];
		$Date = $_POST['Date'];
		$Action = $_POST['Action'];
		$Approval = $_POST['Approval'];




		if ($E_id == "") {
			$msg['E_id'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($auditee == "") {
			$msg['auditee'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Operational_area == "") {
			$msg['Operational_area'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Finding_number == "") {
			$msg['Finding_number'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Facts == "") {
			$msg['Facts'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Description == "") {
			$msg['Description'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!!</p>';
		} else if ($Criteria == "") {
			$msg['Criteria'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!!</p>';
		} else if ($Cause == "") {
			$msg['Cause'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!!</p>';
		} else if ($Effect == "") {
			$msg['Effect'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!!</p>';
		} else if ($Internal_control == "") {
			$msg['Internal_control'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!!</p>';
		} else if ($Recommendation == "") {
			$msg['Recommendation'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!!</p>';
		} else if ($Auditor_conclusion == "") {
			$msg['Auditor_conclusion'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!!</p>';
		} else if ($Acceptance_Status == "") {
			$msg['Acceptance_Status'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!!</p>';
		} else if ($auditor_name == "") {
			$msg['auditor_name'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!!</p>';
		} else if ($Date == "") {
			$msg['Date'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!!</p>';
		} else if ($Action == "") {
			$msg['Action'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!!</p>';
		} else if ($Approval == "") {
			$msg['Approval'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!!</p>';
		}


		if (!empty($msg)) {
			return $msg;
		}

		$sql = "UPDATE finding_registration SET E_id='$E_id', auditee='$auditee', Operational_area='$Operational_area', Finding_number='$Finding_number', Facts='$Facts', Description='$Description', Criteria='$Criteria', Cause='$Cause', Effect='$Effect', Internal_control='Internal_control', Recommendation='$Recommendation', 
		Auditor_conclusion='$Auditor_conclusion', Acceptance_Status='$Acceptance_Status', auditor_name='$auditor_name', Date='$Date', Action='$Action', Approval='$Approval'  WHERE id='$id'";
		$query = $this->db->conn->prepare($sql);
		$result = $query->execute();

		if ($result) {
			header("Location: approve_finding.php");
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Update</p>';
			return $msg;
		}
		if (!empty($msg)) {
			return $msg;
		}
	}
	//edit quarter exe summary
	public function edit_quarterExec_summary()
	{
		$id = $_POST['up_id'];
		$approve = $_POST['approve'];

		if ($approve == "") {
			$msg['approve'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}

		$sql = "UPDATE quarter_summary SET  approve='$approve' WHERE id='$id'";

		$result = $this->db->conn->prepare($sql);
		$result->execute();


		if ($result) {
			header("Location: qsummary_report_approve.php");
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Update</p>';
			return $msg;
		}
		if (!empty($msg)) {
			return $msg;
		}
	}

	//edit report summary
	//edit quarter exe summary
	public function edit_report_summary()
	{
		$id = $_POST['up_id'];
		$intro = $_POST['intro'];
		$objective = $_POST['objective'];
		$methodology = $_POST['methodology'];
		$scope = $_POST['scope'];
		$technique = $_POST['technique'];
		$rating = $_POST['rating'];
		$summary = $_POST['summary'];

		if ($intro == "") {
			$msg['intro'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($objective == "") {
			$msg['objective'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($methodology == "") {
			$msg['methodology'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($scope == "") {
			$msg['scope'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($technique == "") {
			$msg['technique'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($rating == "") {
			$msg['rating'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($summary == "") {
			$msg['summary'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}

		$sql = "UPDATE report_summary SET intro='$intro', objective='$objective', methodology='$methodology', scope='$scope', technique='$technique',  rating='$rating', summary='$summary' WHERE id='$id'";

		$result = $this->db->conn->prepare($sql);
		$result->execute();


		if ($result) {
			header("Location: modify_report_summary.php");
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Update</p>';
			return $msg;
		}
		if (!empty($msg)) {
			return $msg;
		}
	}
	//Edit Audit Work
	//view Auidt program
	public function edit_audit_program()
	{
		$id = $_POST['up_id'];
		$Objective = $_POST['Objective'];
		$Scope = $_POST['Scope'];
		$Description = $_POST['Description'];
		$Status = $_POST['Status'];
		$Recommendation = $_POST['Recommendation'];
		$Start_date = $_POST['Start_date'];
		$End_date = $_POST['End_date'];



		if ($Objective == "") {
			$msg['Objective'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Scope == "") {
			$msg['Scope'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Description == "") {
			$msg['Description'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Status == "") {
			$msg['Status'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Recommendation == "") {
			$msg['Recommendation'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Start_date == "") {
			$msg['Start_date'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!!</p>';
		} else if ($End_date == "") {
			$msg['End_date'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}

		$sql = "UPDATE audit_program SET Objective='$Objective', Scope='$Scope', Description='$Description', Status='$Status',  Recommendation='$Recommendation', Start_date='$Start_date', End_date='$End_date' WHERE id='$id'";
		$query = $this->db->conn->prepare($sql);
		$result = $query->execute();

		if ($result) {
			header("Location: modify_auditwork.php");
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Update</p>';
			return $msg;
		}
		if (!empty($msg)) {
			return $msg;
		}
	}
	//Approval for Audit Program
	public function approve_audit_program()
	{
		$id = $_POST['up_id'];
		$Objective = $_POST['Objective'];
		$Scope = $_POST['Scope'];
		$Status = $_POST['Status'];
		// $Team = $_POST['Team'];
		$total = $_POST['total'];
		// $Quantity = $_POST['Quantity'];
		$Approval = $_POST['Approval'];

		if ($Objective == "") {
			$msg['Objective'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} 
		else if ($Scope == "") {
			$msg['Scope'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		else if ($Status == "") {
			$msg['Status'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} 
		else if ($total == "") {
			$msg['total'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} 
		 else if ($Approval == "") {
			$msg['Approval'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!!</p>';
		}

		if (!empty($msg)) {
			return $msg;
		}

		$sql = "UPDATE audit_program SET Objective='$Objective', Scope='$Scope',Status='$Status',total='$total', Approval='$Approval' WHERE id='$id'";
		$query = $this->db->conn->prepare($sql);
		$result = $query->execute();

		if ($result) {
			header("Location: view_audit_program.php");
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Update</p>';
			return $msg;
		}
		if (!empty($msg)) {
			return $msg;
		}

	}



	//view_annual plan
	public function edit_annual()
	{
		$id = $_POST['up_id'];

		$audit_object = $_POST['audit_object'];
		
		$risk_item = $_POST['risk_item'];
		$risk_score = $_POST['risk_score'];
		$risk_level = $_POST['risk_level'];
		// $Team = $_POST['Team'];
		$Year = $_POST['Year'];
		// $Quantity = $_POST['Quantity'];
		$Approval = $_POST['Approval'];




		if ($audit_object == "") {
			$msg['audit_object'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} 
		else if ($risk_item == "") {
			$msg['risk_item'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		else if ($risk_score == "") {
			$msg['risk_score'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		else if ($risk_level == "") {
			$msg['risk_level'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} 
		else if ($Year == "") {
			$msg['Year'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} 
		 else if ($Approval == "") {
			$msg['Approval'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!!</p>';
		}

		if (!empty($msg)) {
			return $msg;
		}

		$sql = "UPDATE annual_plan SET audit_object='$audit_object', risk_level='$risk_item',risk_score='$risk_score',risk_level='$risk_level',Year='$Year', Approval='$Approval' WHERE id='$id'";
		$query = $this->db->conn->prepare($sql);
		$result = $query->execute();

		if ($result) {
			header("Location: view-annual-plan.php");
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Update</p>';
			return $msg;
		}
		if (!empty($msg)) {
			return $msg;
		}
	}
	//edit checklist
	public function edit_chk()
	{
		$id = $_POST['up_id'];
		$checklist_number = $_POST['checklist_number'];
		$Operational_area = $_POST['Operational_area'];
		$description = $_POST['description'];
		$objective = $_POST['objective'];
		$risk = $_POST['risk'];
		$risk_level = $_POST['risk_level'];
		$expected_control = $_POST['expected_control'];
		$audit_approach = $_POST['audit_approach'];
		$detail = $_POST['detail'];
		$name	 	= Session::get("name");

		if ($checklist_number == "") {
			$msg['checklist_number'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Operational_area == "") {
			$msg['Operational_area'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($description == "") {
			$msg['description'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($objective == "") {
			$msg['objective'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($risk == "") {
			$msg['risk'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($risk_level == "") {
			$msg['risk_level'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($expected_control == "") {
			$msg['expected_control'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($audit_approach == "") {
			$msg['audit_approach'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($detail == "") {
			$msg['detail'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($name == "") {
			$msg['name'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}

		$sql = "UPDATE checklist SET checklist_number='$checklist_number', Operational_area='$Operational_area', description='$description',
		 objective='$objective', risk='$risk', risk_level='$risk_level', expected_control='$expected_control', audit_approach='$audit_approach', detail='$detail', name='$name' WHERE id='$id'";

		$result = $this->db->conn->prepare($sql);
		$result->execute();


		if ($result) {
			header("Location: checklist.php");
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Update</p>';
			return $msg;
		}
		if (!empty($msg)) {
			return $msg;
		}
	}
	//Edit Auditor Justification Against Auditee Response
	public function edit_ar()
	{
		$id = $_POST['up_id'];

		$just = $_POST['just'];
		$name = Session::get("name");

		if ($just == "") {
			$msg['just'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} elseif ($name == 'name') {
			$msg['name'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		//  else if ($ == "") {
		// 	$msg[''] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		// } 
		if (!empty($msg)) {
			return $msg;
		}

		$sql = "UPDATE auditee_response SET just='$just', name='$name' WHERE id='$id'";

		$result = $this->db->conn->prepare($sql);
		$result->execute();


		if ($result) {
			header("Location: view_auditee_response.php");
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Update</p>';
			return $msg;
		}
		if (!empty($msg)) {
			return $msg;
		}
	}
	public function edit_rC()
	{
		$id = $_POST['up_id'];
		$Risk_code = $_POST['Risk_code'];
		$Control_name = $_POST['Control_name'];
		$Control_description = $_POST['Control_description'];
		$Control_objectives = $_POST['Control_objectives'];
		$Imp_criteria = $_POST['Imp_criteria'];
		$Imp_area = $_POST['Imp_area'];
		$Document = $_POST['Document'];

		if ($Risk_code == "") {
			$msg['Risk_code'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Control_name == "") {
			$msg['Control_name'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Control_description == "") {
			$msg['Control_description'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} elseif ($Control_objectives == "") {
			$msg['Control_objectives'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Imp_criteria == "") {
			$msg['Imp_criteria'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Imp_area == "") {
			$msg['Imp_area'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Document == "") {
			$msg['Document'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}

		$sql = "UPDATE risk_control SET Risk_code='$Risk_code', Control_name='$Control_name', Control_description='$Control_description', Control_objectives='$Control_objectives',
		 Imp_criteria='$Imp_criteria', Imp_area='$Imp_area', Document='$Document' WHERE id='$id'";

		$result = $this->db->conn->prepare($sql);
		$result->execute();


		if ($result) {
			header("Location: view_risk_con.php");
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Update</p>';
			return $msg;
		}
		if (!empty($msg)) {
			return $msg;
		}
	}
	//Edit Finding Registration
	public function edit_findingR()
	{
		$id = $_POST['up_id'];
		$E_id = $_POST['E_id'];
		$auditee = $_POST['auditee'];
		$Operational_area = $_POST['Operational_area'];
		$Finding_number = $_POST['Finding_number'];
		$Facts = $_POST['Facts'];
		$Description = $_POST['Description'];
		$Criteria = $_POST['Criteria'];
		$Cause = $_POST['Cause'];
		$Effect = $_POST['Effect'];
		$Internal_control = $_POST['Internal_control'];
		$Recommendation = $_POST['Recommendation'];
		$Resp = $_POST['Resp'];
		$Auditor_conclusion = $_POST['Auditor_conclusion'];
		$Acceptance_Status = $_POST['Acceptance_Status'];
		$Auditor_name = $_POST['Auditor_name'];
		$Date = $_POST['Date'];
		$Action = $_POST['Action'];



		if ($E_id == "") {
			$msg['E_id'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($auditee == "") {
			$msg['auditee'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Operational_area == "") {
			$msg['Operational_area'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Finding_number == "") {
			$msg['Finding_number'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Facts == "") {
			$msg['Facts'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Description == "") {
			$msg['Description'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Criteria == "") {
			$msg['Criteria'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Cause == "") {
			$msg['Cause'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Effect == "") {
			$msg['Effect'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Internal_control == "") {
			$msg['Internal_control'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Recommendation == "") {
			$msg['Recommendation'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Auditor_conclusion == "") {
			$msg['Auditor_conclusion'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Acceptance_Status == "") {
			$msg['Acceptance_Status'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Auditor_name == "") {
			$msg['Auditor_name'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Auditor_name == "") {
			$msg['Auditor_name'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Date == "") {
			$msg['Date'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Action == "") {
			$msg['Action'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}

		$sql = "UPDATE finding_registration SET E_id='$E_id', auditee='$auditee', Operational_area='$Operational_area',Finding_number='$Finding_number',Facts='$Facts', Description='$Description',
		 Criteria='$Criteria',Cause='$Cause', Effect='$Effect', Internal_control='$Internal_control',Auditor_conclusion='$Auditor_conclusion',Acceptance_Status='$Acceptance_Status' ,Auditor_name='$Auditor_name', Date='$Date', Action='$Action' WHERE id='$id'";

		$result = $this->db->conn->prepare($sql);
		$result->execute();


		if ($result) {
			header("Location: engagement_letter_creation.php");
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Update</p>';
			return $msg;
		}
		if (!empty($msg)) {
			return $msg;
		}
	}
	//edit ts
	// public function edit_ts()
	// {
	// 	$id = $_POST['up_id'];
	// 	$Approval = $_POST['Approval'];


	// 	if ($Approval == "") {
	// 		$msg['Approval'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
	// 	}
	// 	if (!empty($msg)) {
	// 		return $msg;
	// 	}

	// 	$sql = "UPDATE assign_task SET Approval='$Approval' WHERE id='$id'";

	// 	$result = $this->db->conn->prepare($sql);
	// 	$result->execute();


	// 	if ($result) {
	// 		header("Location: view_task.php");
	// 	} else {
	// 		$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Update</p>';
	// 		return $msg;
	// 	}
	// 	if (!empty($msg)) {
	// 		return $msg;
	// 	}
	// }

	//Edit Audit Program Engagement
	public function edit_audit_program_engagement()
	{
		$id = $_POST['up_id'];
		$m_id = $_POST['m_id'];
		// $auditee = $_POST['auditee'];
		// $Team = $_POST['Team'];
		$Description = $_POST['Description'];
		$Assignment_date = $_POST['Assignment_date'];
		$S_date = $_POST['S_date'];
		$E_date = $_POST['E_date'];
		$checklist_number = $_POST['checklist_number'];
		$add_checklist = $_POST['add_checklist'];
		$name	 	= Session::get("name");

		if ($m_id == "") {
			$msg['q_id'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		// else if ($auditee == "") {
		// 	$msg['auditee'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		// } else if ($Team == "") {
		// 	$msg['Team'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		// }
		else if ($Description == "") {
			$msg['Description'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Assignment_date == "") {
			$msg['Assignment_date'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($S_date == "") {
			$msg['S_date'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($E_date == "") {
			$msg['E_date'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		else if ($add_checklist == "") {
			$msg['add_checklist'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} 
		else if ($name == "") {
			$msg['name'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} 
		if (!empty($msg)) {
			return $msg;
		}

		$sql = "UPDATE audit_program_engagement SET m_id='$m_id', Description='$Description',
		 Assignment_date='$Assignment_date', S_date='$S_date', E_date='$E_date', checklist_number='$checklist_number', add_checklist='$add_checklist',name='$name' WHERE id='$id'";

		$result = $this->db->conn->prepare($sql);
		$result->execute();


		if ($result) {
			header("Location: engagement.php");
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Update</p>';
			return $msg;
		}
		if (!empty($msg)) {
			return $msg;
		}
	}

	//Edit Anual Plan Data

	public function edit_anual_plan()
	{
		$id = $_POST['up_id'];
		$audit_object = $_POST['audit_object'];
		// $auditee = $_POST['auditee'];
		// $Team = $_POST['Team'];
		$risk_score = $_POST['risk_score'];
		$risk_level = $_POST['risk_level'];
		$Year = $_POST['Year'];
		// $E_date = $_POST['E_date'];
		// $checklist_number = $_POST['checklist_number'];
		// $add_checklist = $_POST['add_checklist'];
		$name	 	= Session::get("name");

		if ($audit_object == "") {
			$msg['audit_object'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($risk_score == "") {
			$msg['risk_score'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($risk_level == "") {
			$msg['risk_level'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Year == "") {
			$msg['Year'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($name == "") {
			$msg['name'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($name == "") {
			$msg['name'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}

		$sql = "UPDATE annual_plan SET audit_object='$audit_object',
		 risk_score='$risk_score', risk_level='$risk_level', Year='$Year',name='$name' WHERE id='$id'";

		$result = $this->db->conn->prepare($sql);
		$result->execute();


		if ($result) {
			header("Location: view_annualplan.php");
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Update</p>';
			return $msg;
		}
		if (!empty($msg)) {
			return $msg;
		}
	}

	//Edit Quarter Plan
	public function edit_quarter_plan()
	{
		$id = $_POST['up_id'];
		$audit_type = $_POST['audit_type'];
		// $auditee = $_POST['auditee'];
		// $Team = $_POST['Team'];
		$auditee = $_POST['auditee'];
		$Quarter_number = $_POST['Quarter_number'];
		
		$name	 	= Session::get("name");

		if ($audit_type == "") {
			$msg['audit_type'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($auditee == "") {
			$msg['auditee'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Quarter_number == "") {
			$msg['Quarter_number'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} 
		if (!empty($msg)) {
			return $msg;
		}

		$sql = "UPDATE quarter_plan SET audit_type='$audit_type',
		 auditee='$auditee', Quarter_number='$Quarter_number',name='$name' WHERE id='$id'";

		$result = $this->db->conn->prepare($sql);
		$result->execute();


		if ($result) {
			header("Location: view_quarterplan.php");
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Update</p>';
			return $msg;
		}
		if (!empty($msg)) {
			return $msg;
		}
	}

	//Edit Audit Program Engagement
	public function edit_audit_prog_engage()
	{
		$id = $_POST['up_id'];
		$E_id = $_POST['E_id'];
		$Objective = $_POST['Objective'];
		$Scope = $_POST['Scope'];
		$Status = $_POST['Status'];
		$total = $_POST['total'];
		$Approval = $_POST['Approval'];
		

		if ($E_id == "") {
			$msg['E_id'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Objective == "") {
			$msg['Objective'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Scope == "") {
			$msg['Scope'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Status == "") {
			$msg['Status'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($total == "") {
			$msg['total'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		else if ($Approval == "") {
			$msg['Approval'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}

		$sql = "UPDATE audit_program SET E_id='$E_id',Objective='$Objective', Scope='$Scope', Status='$Status', total='$total', Approval='$Approval' WHERE id='$id'";

		$result = $this->db->conn->prepare($sql);
		$result->execute();


		if ($result) {
			header("Location: modify_auditwork.php");
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Update</p>';
			return $msg;
		}
		if (!empty($msg)) {
			return $msg;
		}
	}
	//Edit audit program for prinicipal
	public function edit_audit_prog_engageA()
	{
		$id = $_POST['up_id'];
		$E_id = $_POST['E_id'];
		$Objective = $_POST['Objective'];
		$Scope = $_POST['Scope'];
		$Status = $_POST['Status'];
		$total = $_POST['total'];
		$Approval = $_POST['Approval'];
		

		if ($E_id == "") {
			$msg['E_id'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Objective == "") {
			$msg['Objective'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Scope == "") {
			$msg['Scope'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Status == "") {
			$msg['Status'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($total == "") {
			$msg['total'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		else if ($Approval == "") {
			$msg['Approval'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}

		$sql = "UPDATE audit_program SET E_id='$E_id',Objective='$Objective', Scope='$Scope', Status='$Status', total='$total', Approval='$Approval' WHERE id='$id'";

		$result = $this->db->conn->prepare($sql);
		$result->execute();


		if ($result) {
			header("Location: modify_auditwork.php");
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Update</p>';
			return $msg;
		}
		if (!empty($msg)) {
			return $msg;
		}
	}
	//Edit Introduction Letter
	public function edit_intrL()
	{
		$id = $_POST['up_id'];
		$E_id = $_POST['E_id'];
		$date = $_POST['date'];
		$reference = $_POST['reference'];
		$gene_by_tl = $_POST['gene_by_tl'];
		$ch_tl = $_POST['ch_tl'];
		$audit_type = $_POST['audit_type'];
		$auditee = $_POST['auditee'];
		$auditor_name = $_POST['auditor_name'];
		$detail = $_POST['detail'];
		$name	 	= Session::get("name");

		if ($E_id == "") {
			$msg['E_id'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($date == "") {
			$msg['date'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($reference == "") {
			$msg['reference'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($gene_by_tl == "") {
			$msg['gene_by_tl'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($ch_tl == "") {
			$msg['ch_tl'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($audit_type == "") {
			$msg['audit_type'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($auditee == "") {
			$msg['auditee'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($auditor_name == "") {
			$msg['auditor_name'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($detail == "") {
			$msg['detail'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}  else if ($name == "") {
			$msg['name'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}

		$sql = "UPDATE intro_letter SET E_id='$E_id', date='$date', reference='$reference', gene_by_tl='$gene_by_tl',
		 ch_tl='$ch_tl', audit_type='$audit_type', auditee='$auditee', auditor_name='$auditor_name', detail='$detail', name='$name' WHERE id='$id'";

		$result = $this->db->conn->prepare($sql);
		$result->execute();


		if ($result) {
			header("Location: intro_letter.php");
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Update</p>';
			return $msg;
		}
		if (!empty($msg)) {
			return $msg;
		}
	}
	//Edit Finding Detail
	public function edit_findingDetail()
	{
		$id = $_POST['up_id'];
		$E_id = $_POST['E_id'];
		$Finding_number = $_POST['Finding_number'];
		$Irregularity_description = $_POST['Irregularity_description'];
		$Loss_amount = $_POST['Loss_amount'];
		$name	 	= Session::get("name");


		if ($E_id == "") {
			$msg['E_id'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Finding_number == "") {
			$msg['Finding_number'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Irregularity_description == "") {
			$msg['Irregularity_description'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Loss_amount == "") {
			$msg['Loss_amount'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($name == "") {
			$msg['name'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}

		$sql = "UPDATE finding_detail SET E_id='$E_id',Finding_number='$Finding_number', Irregularity_description='$Irregularity_description', Loss_amount='$Loss_amount', name='$name' WHERE id='$id'";

		$result = $this->db->conn->prepare($sql);
		$result->execute();


		if ($result) {
			header("Location: find_detail_reg.php");
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Update</p>';
			return $msg;
		}
		if (!empty($msg)) {
			return $msg;
		}
	}
	//
	public function edit_findDetail()
	{
		$id = $_POST['up_id'];
		$Finding_number = $_POST['Finding_number'];
		$Irregularity_description = $_POST['Irregularity_description'];
		$Loss_amount = $_POST['Loss_amount'];


		if ($Finding_number == "") {
			$msg['Finding_number'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Irregularity_description == "") {
			$msg['Irregularity_description'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Loss_amount == "") {
			$msg['Loss_amount'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}

		$sql = "UPDATE finding_detail SET Finding_number='$Finding_number', Irregularity_description='$Irregularity_description', Loss_amount='$Loss_amount' WHERE id='$id'";

		$result = $this->db->conn->prepare($sql);
		$result->execute();


		if ($result) {
			header("Location: find_detail.php");
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Update</p>';
			return $msg;
		}
		if (!empty($msg)) {
			return $msg;
		}
	}
	//Change Password
	//edit monthly

	//edit monthly plan
	public function edit_monthly()
	{
		$id = $_POST['up_id'];
		// $Audit_type = $_POST['Audit_type'];
		// $auditee = $_POST['auditee'];
		// $Quantity = $_POST['Quantity'];
		// $Quarter_number = $_POST['Quarter_number'];
		$Start_date = $_POST['Start_date'];
		$End_date = $_POST['End_date'];
		$Approval = $_POST['Approval'];

		// if ($Audit_type == "") {
		// 	$msg['Audit_type'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		// } else if ($auditee == "") {
		// 	$msg['auditee'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		// } else if ($Quantity == "") {
		// 	$msg['Quantity'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		// } else if ($Quarter_number == "") {
		// 	$msg['Quarter_number'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		// } else 
		if ($Start_date == "") {
			$msg['Start_date'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($End_date == "") {
			$msg['End_date'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}

		$sql = "UPDATE monthly_plan SET  Start_date='$Start_date', End_date='$End_date', Approval='$Approval'  WHERE id='$id'";

		$result = $this->db->conn->prepare($sql);
		$result->execute();


		if ($result) {
			header("Location: view_monthly.php");
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Update</p>';
			return $msg;
		}
		if (!empty($msg)) {
			return $msg;
		}
	}
	//modify quarter exec summary
	public function modify_quarter_summary()
	{
		$id = $_POST['up_id'];
		$serial = $_POST['serial'];
		$auditee = $_POST['auditee'];
		$Irregularity_type = $_POST['Irregularity_type'];
		$amt = $_POST['amt'];
		$total = $_POST['total'];

		if ($serial == "") {
			$msg['serial'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($auditee == "") {
			$msg['auditee'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Irregularity_type == "") {
			$msg['Irregularity_type'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($amt == "") {
			$msg['amt'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($total == "") {
			$msg['total'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}

		$sql = "UPDATE quarter_summary SET serial='$serial', auditee='$auditee', Irregularity_type='$Irregularity_type',
		 amt='$amt', total='$total' WHERE id='$id'";

		$result = $this->db->conn->prepare($sql);
		$result->execute();


		if ($result) {
			header("Location: modify_quarter_summary.php");
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Update</p>';
			return $msg;
		}
		if (!empty($msg)) {
			return $msg;
		}
	}

	public function modify_risk_reg()
	{
		$id = $_POST['up_id'];
		$Business_objective = $_POST['Business_objective'];
		$Business_owner = $_POST['Business_owner'];
		$Risk_list = $_POST['Risk_list'];
		$Likely_hood = $_POST['Likely_hood'];
		$Risk_level = $_POST['Risk_level'];
		$Impact_description = $_POST['Impact_description'];

		if ($Business_objective == "") {
			$msg['Business_objective'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Business_owner == "") {
			$msg['Business_owner'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Risk_list == "") {
			$msg['Risk_list'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Likely_hood == "") {
			$msg['Likely_hood'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Risk_level == "") {
			$msg['Risk_level'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Impact_description == "") {
			$msg['Impact_description'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}

		$sql = "UPDATE risk_registration SET Business_objective='$Business_objective', Business_owner='$Business_owner', Risk_list='$Risk_list',
		 Likely_hood='$Likely_hood', Risk_level='$Risk_level', Impact_description='$Impact_description' WHERE id='$id'";

		$result = $this->db->conn->prepare($sql);
		$result->execute();


		if ($result) {
			header("Location: view_risk_reg.php");
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Update</p>';
			return $msg;
		}
		if (!empty($msg)) {
			return $msg;
		}
	}
	public function modify_reg_pp()
	{
		$id = $_POST['up_id'];
		$document_name = $_POST['document_name'];
		$application_area = $_POST['application_area'];
		// $main_number = $_POST['main_number'];
		// $sub_number = $_POST['sub_number'];
		$description = $_POST['description'];

		if ($document_name == "") {
			$msg['document_name'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($application_area == "") {
			$msg['application_area'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
			// } else if ($main_number == "") {
			// 	$msg['main_number'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
			// } else if ($sub_number == "") {
			// 	$msg['sub_number'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
			// } else if ($description == "") {
			$msg['description'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}

		$sql = "UPDATE policy_procedure SET document_name='$document_name', application_area='$application_area', description='$description' WHERE id='$id'";

		$result = $this->db->conn->prepare($sql);
		$result->execute();


		if ($result) {
			header("Location: policy_procedure.php");
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Update</p>';
			return $msg;
		}
		if (!empty($msg)) {
			return $msg;
		}
	}



	//Edit Quarter
	public function edit_quarter()
	{
		$id = $_POST['up_id'];
		$Audit_type = $_POST['Audit_type'];
		$auditee = $_POST['auditee'];
		$Quantity = $_POST['Quantity'];
		$Quarter_number = $_POST['Quarter_number'];

		$Approval = $_POST['Approval'];

		if ($Audit_type == "") {
			$msg['Audit_type'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($auditee == "") {
			$msg['auditee'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Quantity == "") {
			$msg['Quantity'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Quarter_number == "") {
			$msg['Quarter_number'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}

		$sql = "UPDATE quarter_plan SET Audit_type='$Audit_type', auditee='$auditee', Quantity='$Quantity', Quarter_number='$Quarter_number',  Approval='$Approval'  WHERE id='$id'";

		$result = $this->db->conn->prepare($sql);
		$result->execute();


		if ($result) {
			header("Location: view_quarter.php");
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Update</p>';
			return $msg;
		}
		if (!empty($msg)) {
			return $msg;
		}
	}


	//select_designation 
	public function select_annual()
	{
		$sql = "SELECT Audit_activities, Team, Year, Quantity FROM annual_plan ORDER BY id DESC LIMIT 1";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}

	//select annual_plan by ID
	public function select_annual_by_id($getId)
	{
		$sql = "SELECT * FROM annual_plan WHERE id=:getId";
		$query = $this->db->conn->prepare($sql);
		$query->bindValue(":getId", $getId);
		$query->execute();
		$result = $query->fetch(PDO::FETCH_OBJ);
		return $result;
	}
	//Select Designation by id
	public function select_designation_by_id($getId)
	{
		$sql = "SELECT * FROM tbl_designation WHERE id=:getId";
		$query = $this->db->conn->prepare($sql);
		$query->bindValue(":getId", $getId);
		$query->execute();
		$result = $query->fetch(PDO::FETCH_OBJ);
		return $result;
	}
	//delete employee
	public function del_emp()
	{
		$id = $_POST['id'];
		$sql = "DELETE FROM employee WHERE id=:id";
		$query = $this->db->conn->prepare($sql);
		$query->bindParam(':id', $id, PDO::PARAM_INT);
		//$query->bindParam(":id", $id, PDO::PARAM_STR);
		$query->execute();
		// $result = $query->fetch(PDO::FETCH_OBJ);
		// return $result;


		if ($query) {
			echo "<font color='Green'>Record Deleted Successfully";
			header("Location: view-employee.php");
		} else {
			echo "<font color='Red'> Failed to Delete Record";
		}
	}
	//delete finding Detail
	public function del_finding_detail()
	{
		$id = $_POST['id'];
		$sql = "DELETE FROM finding_detail WHERE id=:id";
		$query = $this->db->conn->prepare($sql);
		$query->bindParam(':id', $id, PDO::PARAM_INT);
		//$query->bindParam(":id", $id, PDO::PARAM_STR);
		$query->execute();
		// $result = $query->fetch(PDO::FETCH_OBJ);
		// return $result;


		if ($query) {
			echo "<font color='Green'>Record Deleted Successfully";
			header("Location: finding_detail.php");
		} else {
			echo "<font color='Red'> Failed to Delete Record";
		}
	}
	//delete by chief auditor 
	public function del_findDetail()
	{
		$id = $_POST['id'];
		$sql = "DELETE FROM finding_detail WHERE id=:id";
		$query = $this->db->conn->prepare($sql);
		$query->bindParam(':id', $id, PDO::PARAM_INT);
		//$query->bindParam(":id", $id, PDO::PARAM_STR);
		$query->execute();
		// $result = $query->fetch(PDO::FETCH_OBJ);
		// return $result;


		if ($query) {
			echo "<font color='Green'>Record Deleted Successfully";
			header("Location: find_detail.php");
		} else {
			echo "<font color='Red'> Failed to Delete Record";
		}
	}


	//delete quarter exe summary report
	public function del_quarterExec_summary()
	{
		$id = $_POST['id'];
		$sql = "DELETE FROM quarter_summary WHERE id=:id";
		$query = $this->db->conn->prepare($sql);
		$query->bindParam(':id', $id, PDO::PARAM_INT);
		//$query->bindParam(":id", $id, PDO::PARAM_STR);
		$query->execute();
		// $result = $query->fetch(PDO::FETCH_OBJ);
		// return $result;


		if ($query) {
			echo "<font color='Green'>Record Deleted Successfully";
			header("Location: modify_quarter_summary.php");
		} else {
			echo "<font color='Red'> Failed to Delete Record";
		}
	}
	//delete report summary
	public function del_report_summary()
	{
		$id = $_POST['id'];
		$sql = "DELETE FROM report_summary WHERE id=:id";
		$query = $this->db->conn->prepare($sql);
		$query->bindParam(':id', $id, PDO::PARAM_INT);
		//$query->bindParam(":id", $id, PDO::PARAM_STR);
		$query->execute();
		// $result = $query->fetch(PDO::FETCH_OBJ);
		// return $result;


		if ($query) {
			echo "<font color='Green'>Record Deleted Successfully";
			header("Location: modify_report_summary.php");
		} else {
			echo "<font color='Red'> Failed to Delete Record";
		}
	}
	//delete checklist
	public function del_chk()
	{
		$id = $_POST['id'];
		$sql = "DELETE FROM checklist WHERE id=:id";
		$query = $this->db->conn->prepare($sql);
		$query->bindParam(':id', $id, PDO::PARAM_INT);
		//$query->bindParam(":id", $id, PDO::PARAM_STR);
		$query->execute();
		// $result = $query->fetch(PDO::FETCH_OBJ);
		// return $result;


		if ($query) {
			// echo "<font color='Green'>Record Deleted Successfully";
			header("Location: checklist.php");
		} else {
			echo "<font color='Red'> Failed to Delete Record";
		}
	}
	//delete approve finding
	public function del_af()
	{
		$id = $_POST['id'];
		$sql = "DELETE FROM finding_registration WHERE id=:id";
		$query = $this->db->conn->prepare($sql);
		$query->bindParam(':id', $id, PDO::PARAM_INT);
		//$query->bindParam(":id", $id, PDO::PARAM_STR);
		$query->execute();
		// $result = $query->fetch(PDO::FETCH_OBJ);
		// return $result;


		if ($query) {
			//echo "<font color='Green'>Record Deleted Successfully";
			header("Location: approve_finding.php");
		} else {
			echo "<font color='Red'> Failed to Delete Record";
		}
	}

	//delete engagement creation
	public function del_audit_program_engagement()
	{
		$id = $_POST['id'];
		$sql = "DELETE FROM audit_program_engagement WHERE id=:id";
		$query = $this->db->conn->prepare($sql);
		$query->bindParam(':id', $id, PDO::PARAM_INT);
		//$query->bindParam(":id", $id, PDO::PARAM_STR);
		$query->execute();
		// $result = $query->fetch(PDO::FETCH_OBJ);
		// return $result;


		if ($query) {
			// echo "<font color='Green'>Record Deleted Successfully";
			header("Location: engagement.php");
		} else {
			echo "<font color='Red'> Failed to Delete Record";
		}
	}
	//delete audit program
	public function del_audit_program()
	{
		$id = $_POST['id'];
		$sql = "DELETE FROM audit_program WHERE id=:id";
		$query = $this->db->conn->prepare($sql);
		$query->bindParam(':id', $id, PDO::PARAM_INT);
		//$query->bindParam(":id", $id, PDO::PARAM_STR);
		$query->execute();
		// $result = $query->fetch(PDO::FETCH_OBJ);
		// return $result;


		if ($query) {
			// echo "<font color='Green'>Record Deleted Successfully";
			header("Location: view_audit_program.php");
		} else {
			echo "<font color='Red'> Failed to Delete Record";
		}
	}
	//delete Audit Program
	public function del_audit_prog_engagement()
	{
		$id = $_POST['id'];
		$sql = "DELETE FROM audit_program WHERE id=:id";
		$query = $this->db->conn->prepare($sql);
		$query->bindParam(':id', $id, PDO::PARAM_INT);
		//$query->bindParam(":id", $id, PDO::PARAM_STR);
		$query->execute();
		// $result = $query->fetch(PDO::FETCH_OBJ);
		// return $result;


		if ($query) {
			// echo "<font color='Green'>Record Deleted Successfully";
			header("Location: modify_auditwork.php");
		} else {
			echo "<font color='Red'> Failed to Delete Record";
		}
	}
	public function del_tt()
	{
		$id = $_POST['id'];
		$sql = "DELETE FROM assign_task WHERE id=:id";
		$query = $this->db->conn->prepare($sql);
		$query->bindParam(':id', $id, PDO::PARAM_INT);
		//$query->bindParam(":id", $id, PDO::PARAM_STR);
		$query->execute();
		// $result = $query->fetch(PDO::FETCH_OBJ);
		// return $result;


		if ($query) {
			echo "<font color='Green'>Record Deleted Successfully";
			header("Location: assign_task.php");
		} else {
			echo "<font color='Red'> Failed to Delete Record";
		}
	}
	//delete introduction letter
	public function del_intrL()
	{
		$id = $_POST['id'];
		$sql = "DELETE FROM intro_letter WHERE id=:id";
		$query = $this->db->conn->prepare($sql);
		$query->bindParam(':id', $id, PDO::PARAM_INT);
		//$query->bindParam(":id", $id, PDO::PARAM_STR);
		$query->execute();
		// $result = $query->fetch(PDO::FETCH_OBJ);
		// return $result;


		if ($query) {
			echo "<font color='Green'>Record Deleted Successfully";
			header("Location: intro_letter.php");
		} else {
			echo "<font color='Red'> Failed to Delete Record";
		}
	}
	//it will be avoided
	//delete monthly 
	public function del_monthly()
	{
		$id = $_POST['id'];
		$sql = "DELETE FROM monthly_plan WHERE id=:id";
		$query = $this->db->conn->prepare($sql);
		$query->bindParam(':id', $id, PDO::PARAM_INT);
		//$query->bindParam(":id", $id, PDO::PARAM_STR);
		$query->execute();
		// $result = $query->fetch(PDO::FETCH_OBJ);
		// return $result;


		if ($query) {
			echo "<font color='Green'>Record Deleted Successfully";
			header("Location: view_monthly.php");
		} else {
			echo "<font color='Red'> Failed to Delete Record";
		}
	}
	//delete temp team
	public function del_temp_team()
	{
		$id = $_POST['id'];
		$sql = "DELETE FROM temp_team WHERE id=:id";
		$query = $this->db->conn->prepare($sql);
		$query->bindParam(':id', $id, PDO::PARAM_INT);
		//$query->bindParam(":id", $id, PDO::PARAM_STR);
		$query->execute();
		// $result = $query->fetch(PDO::FETCH_OBJ);
		// return $result;


		if ($query) {
			echo "<font color='Green'>Record Deleted Successfully";
			header("Location: temp_team.php");
		} else {
			echo "<font color='Red'> Failed to Delete Record";
		}
	}
	//delete quarter plan
	public function del_quarterly()
	{
		$id = $_POST['id'];
		$sql = "DELETE FROM quarter_plan WHERE id=:id";
		$query = $this->db->conn->prepare($sql);
		$query->bindParam(':id', $id, PDO::PARAM_INT);
		//$query->bindParam(":id", $id, PDO::PARAM_STR);
		$query->execute();
		// $result = $query->fetch(PDO::FETCH_OBJ);
		// return $result;


		if ($query) {
			echo "<font color='Green'>Record Deleted Successfully";
			header("Location: view_quarter.php");
		} else {
			echo "<font color='Red'> Failed to Delete Record";
		}
	}
	//delete annual plan
	public function del_annual()
	{
		$id = $_POST['id'];
		$sql = "DELETE FROM annual_plan WHERE id=:id";
		$query = $this->db->conn->prepare($sql);
		$query->bindParam(':id', $id, PDO::PARAM_INT);
		//$query->bindParam(":id", $id, PDO::PARAM_STR);
		$query->execute();
		// $result = $query->fetch(PDO::FETCH_OBJ);
		// return $result;


		if ($query) {
			echo "<font color='Green'>Record Deleted Successfully";
			header("Location: view-annual-plan.php");
		} else {
			echo "<font color='Red'> Failed to Delete Record";
		}
	}


	//it will be avoided
	//Edit Annual plan




	//Edit Designation
	public function edit_designation($data)
	{
		$designation_name = $data['designation_name'];
		$id = $data['id'];

		$check_des = $this->check_designation($designation_name);

		if ($designation_name == "") {
			$msg['designation_name'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($designation_name == $check_des->designation) {
			$msg['designation_name'] = '<p class="text-danger"><strong>Error! </strong>Designation already exists!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}

		$sql = "UPDATE tbl_designation SET designation=:designation WHERE id=:id";
		$query = $this->db->conn->prepare($sql);
		$query->bindValue(":designation", $designation_name);
		$query->bindValue(":id", $id);
		$result = $query->execute();
		if ($result) {
			header("Location: add-designation.php");
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Insert!</p>';
			return $msg;
		}
		if (!empty($msg)) {
			return $msg;
		}
	}

	//save leave type
	public function save_leave_type($data)
	{
		$leave_type = $data['leave_type'];
		$check_lea = $this->check_leave($leave_type);
		if ($leave_type == "") {
			$msg['leave_type'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($leave_type == $check_lea->leave_type) {
			$msg['leave_type'] = '<p class="text-danger"><strong>Error! </strong>Leave Type already exists!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}

		$sql = "INSERT INTO tbl_leave_type (leave_type) VALUES (:leave_type)";
		$query = $this->db->conn->prepare($sql);
		$query->bindValue(":leave_type", $leave_type);
		$result = $query->execute();
		if ($result) {
			$msg['su'] = '<p class="text-success"><strong>Success! </strong>Data Inserted.</p>';
			return $msg;
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Insert!</p>';
			return $msg;
		}
		if (!empty($msg)) {
			return $msg;
		}
	}
	//Edit Leave
	public function select_leave_by_id($getId)
	{
		$sql = "SELECT * FROM tbl_leave_type WHERE id=:getId";
		$query = $this->db->conn->prepare($sql);
		$query->bindValue(":getId", $getId);
		$query->execute();
		$result = $query->fetch(PDO::FETCH_OBJ);
		return $result;
	}
	//Save Edit Leave Type
	public function edit_leave_type($data)
	{
		$leave_type = $data['leave_type'];
		$id = $data['id'];

		if ($leave_type == "") {
			$msg['leave_type'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}

		$sql = "UPDATE tbl_leave_type SET leave_type=:leave_type WHERE id=:id";
		$query = $this->db->conn->prepare($sql);
		$query->bindValue(":leave_type", $leave_type);
		$query->bindValue(":id", $id);
		$result = $query->execute();
		if ($result) {
			header("Location: add-leave-type.php");
		} else {
			header("Location: edit-leave-type.php");
		}
	}
	// Check Leave Type
	public function check_leave($leave_type)
	{
		$sql = "SELECT * FROM tbl_leave_type WHERE leave_type = :leave_type LIMIT 1";
		$query = $this->db->conn->prepare($sql);
		$query->bindValue(":leave_type", $leave_type);
		$query->execute();
		$result = $query->fetch(PDO::FETCH_OBJ);
		return $result;
	}
	//view_leave_type
	public function view_leave_type()
	{
		$sql = "SELECT * FROM tbl_leave_type";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}

	// save_employee
	public function save_employee($data)
	{

		$name			= $data['name'];
		$designation	= $data['designation'];
		//$address		= $data['address'];
		$phone			= $data['phone'];
		// $joining_date	= $data['joining_date'];
		// $date 			= date('d-m-Y', strtotime($joining_date));
		$email			= $data['email'];
		$user_name		= $data['user_name'];
		$password		= $data['password'];
		$password = md5($password);
		// $password		= md5($password);
		//$status		= $data['status'];
		// $user_role		= $data['user_role'];

		if ($data['designation'] == "AUDITOR")
			$user_role		= 2;
		elseif ($data['designation'] == "MANAGER")
			$user_role		= 3;
		elseif ($data['designation'] == "CHIEF")
			$user_role		= 1;
		elseif ($data['designation'] == "USER")
			$user_role		= 0;
		elseif ($data['designation'] == "PRINICIPAL")
			$user_role		= 4;


		if ($name == "") {
			$msg['name'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if ($designation == "") {
			$msg['designation'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}

		if ($phone == "") {
			$msg['phone'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if ($email == "") {
			$msg['email'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if ($user_name == "") {
			$msg['user_name'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if ($password == "") {
			$msg['password'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}

		if (!empty($msg)) {
			return $msg;
		}


		$sql = "INSERT INTO employee (name, designation, phone, email, username, password, user_role) VALUES (:name, :designation, :phone, :email, :username, :password, :user_role)";
		$query = $this->db->conn->prepare($sql);
		$query->bindValue(":name", $name);
		$query->bindValue(":designation", $designation);
		//$query->bindValue(":address", $address);
		$query->bindValue(":phone", $phone);
		// $query->bindValue(":joining_date", $date);
		$query->bindValue(":email", $email);
		$query->bindValue(":username", $user_name);
		$query->bindValue(":password", $password);
		// $query->bindValue(":status", $status);
		$query->bindValue(":user_role", $user_role);
		$result = $query->execute();
		if ($result) {
			$msg['su'] = '<p class="text-success"><strong>Success! </strong>Data Inserted.</p>';
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Insert!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}
	}
	//Register Policy
	public function save_policy($data)
	{

		$dname			= $data['dname'];
		$dept	= $data['dept'];
		$description			= $data['description'];
		$attachment	= $data['attachment'];


		if ($dname == "") {
			$msg['dname'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if ($dept == "") {
			$msg['dept'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}

		if ($description == "") {
			$msg['description'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if ($attachment == "") {
			$msg['attachment'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}

		if (!empty($msg)) {
			return $msg;
		}


		$sql = "INSERT INTO policyReg (dname, dept, description, attachment) VALUES (:dname, :dept, :description, :attachment)";
		$query = $this->db->conn->prepare($sql);
		$query->bindValue(":dname", $dname);
		$query->bindValue(":dept", $dept);
		$query->bindValue(":description", $description);
		$query->bindValue(":attachment", $attachment);

		$result = $query->execute();
		if ($result) {
			$msg['su'] = '<p class="text-success"><strong>Success! </strong>Data Inserted.</p>';
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Insert!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}
	}
	// View Introduction Letter
	public function view_intrL()
	{
		$sql = "SELECT * FROM intro_letter";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	//view Finding detail
	public function view_findingDetail()
	{
		$sql = "SELECT * FROM finding_detail";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	//log function
	public function log()
	{

		$r = array();

		// Date & Time
		$r['datetime'] = date('Y-m-d H:i:s');

		// IP
		$r['ip'] = $_SERVER['REMOTE_ADDR'];

		// Hostname
		$r['hostname'] = gethostbyaddr($r['ip']);

		// URI
		$r['uri'] = $_SERVER['REQUEST_URI'];

		// Browser
		$r['agent'] = isset($_SERVER["HTTP_USER_AGENT"]) ? $_SERVER["HTTP_USER_AGENT"] : "";

		// Referer
		$r['referer'] = isset($_SERVER["HTTP_REFERER"]) ? $_SERVER["HTTP_REFERER"] : "";

		// Domain
		$r['domain'] = $_SERVER["HTTP_HOST"];

		// Script file name
		$r['filename'] = $_SERVER["SCRIPT_FILENAME"];

		// Method
		$r['method'] = $_SERVER["REQUEST_METHOD"];

		// Query (GET data)
		$r['query'] = $_SERVER["QUERY_STRING"];

		// POST data
		$r['post'] = file_get_contents("php://input");

		// data
		$r['data'] = trim($r['query'] . " " . $r['post']);


		$sql  = "INSERT INTO `log` (`datetime`, `ip`, `hostname`,`uri`, `agent`, `referer`, `domain`, `filename`, `method`, `data`) VALUES (:date_time, :ip,:hostname,:uri,:agent,:referer,:domain,:filename,:method,:data)";

		$query = $this->db->conn->prepare($sql);
		$query->bindValue(":date_time", $r['datetime']);
		$query->bindValue(":ip", $r['ip']);
		$query->bindValue(":hostname", $r['hostname']);
		$query->bindValue(":uri", $r['uri']);

		$query->bindValue(":agent", $r['agent']);
		$query->bindValue(":referer", $r['referer']);
		$query->bindValue(":domain", $r['domain']);
		$query->bindValue(":filename", $r['filename']);
		$query->bindValue(":method", $r['method']);
		$query->bindValue(":data", $r['data']);
		$query->execute();
	}
	//view log
	public function view_log()
	{
		$limit = 50;
		$sql = "SELECT * FROM log ORDER BY id DESC LIMIT " . $limit;
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	//view checklist
	public function view_ch()
	{
		$sql = "SELECT * FROM checklist";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	//view policy registration
	//view checklist
	public function view_policyreg()
	{
		$sql = "SELECT * FROM policyregistration";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	//view engagement
	public function view_E()
	{
		$sql = "SELECT * FROM register_engagement";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	//view audit engagement
	public function view_audit_programA()
	{
		$sql = "SELECT Objective, Scope, Status, total, Approval FROM audit_program WHERE Approval IN ('Approved', 'yes')";

		// $sql = "SELECT * FROM audit_program WHERE Approval = yes AND Approval= Approved";

		// $sql = "SELECT * FROM audit_program a WHERE NOT EXISTS(SELECT * FROM audit_program
		// WHERE id=$id  AND `Approval` = `Approved`)";
		// $sql = "SELECT Approval FROM audit_program WHERE Approval IN ('yes','approved')";
		// $sql="SELECT E_id FROM audit_program WHERE Approval IN (yes, Approved) GROUP BY E_id HAVING Approval = Approved
		// 	OR GROUP_CONCAT(DISTINCT CASE WHEN Approval = yes) <>
		// 	   GROUP_CONCAT(DISTINCT CASE WHEN Approval = Approved);";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	public function view_audit_program()
	{
		$sql = "SELECT * FROM audit_program";

		// $sql = "SELECT * FROM audit_program WHERE Approval = yes AND Approval= Approved";

		// $sql = "SELECT * FROM audit_program a WHERE NOT EXISTS(SELECT * FROM audit_program
		// WHERE id=$id  AND `Approval` = `Approved`)";
		// $sql = "SELECT Approval FROM audit_program WHERE Approval IN ('yes','approved')";
		// $sql="SELECT E_id FROM audit_program WHERE Approval IN (yes, Approved) GROUP BY E_id HAVING Approval = Approved
		// 	OR GROUP_CONCAT(DISTINCT CASE WHEN Approval = yes) <>
		// 	   GROUP_CONCAT(DISTINCT CASE WHEN Approval = Approved);";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	//View Auditee Response
	public function view_auditee_response()
	{
		$sql = "SELECT * FROM auditee_response";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	//view engagement (audit_program_engagement)
	public function view_engagement()
	{
		$sql = "SELECT * FROM audit_program_engagement";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	//view risk registered
	public function view_rR()
	{
		$sql = "SELECT * FROM risk_registration";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	//view policy_procedures
	public function view_pp()
	{
		$sql = "SELECT * FROM policy_procedure";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	//view supporting_docs table
	public function view_supporting_doc()
	{
		$sql = "SELECT * FROM supporting_doc";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	//view risk control
	public function view_rC()
	{
		$sql = "SELECT * FROM risk_control";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	//Forgot password
	public function forgot_passwd($data)
	{
		$email = $data['email'];
		if ($email == "") {
			$msg['email'] = '<p class="text-danger"><strong>Error! </strong>Invalid Email!</p>';
			return $msg['email'];
		} else if (filter_var($email, FILTER_VALIDATE_EMAIL) === false) {
			$msg['email'] = '<p class="text-danger"><strong>Error! </strong>The email address is not valid!</p>';
			return $msg['email'];
		}
		$sql = "SELECT * FROM employee WHERE email = :email LIMIT 1";
		$query = $this->db->conn->prepare($sql);
		$query->bindValue(":email", $email);
		$query->execute();
		$result = $query->fetch(PDO::FETCH_OBJ);

		if ($result) {


			$temp_key = md5(time() + 123456789 % rand(4000, 55000000));
			//insert this temporary key into database
			$sql_insert = "INSERT INTO forget_password(email,temp_key) VALUES(:email , :temp_key)";
			$query = $this->db->conn->prepare($sql_insert);
			$query->bindValue(":email", $email);
			$query->bindValue(":temp_key", $temp_key);
			$query->execute();


			//sending email about update
			$to      = $email;
			$subject = 'Changing password';
			$msg = "Please copy the link and paste in your browser address bar" . "\r\n" . "http://localhost:8686/AMS/forgot_password_reset.php?key=" . $temp_key . "&email=" . $email;
			$headers = 'From:CBO AMS' . "\r\n";
			mail($to, $subject, $msg, $headers);


			$message_success = " Please check your email inbox or spam folder and follow the steps";
			return $message_success;
		} else {
			$message = "Sorry! no account associated with this email";
			return $message;
		}
	}

	//Forgot reset password
	public function forgot_passwd_reset($data, $getData)
	{

		if (isset($getData['key']) && isset($getData['email'])) {
			$temp_key = $getData['key'];
			$email = $getData['email'];
			$sql = "SELECT * FROM forget_password WHERE email= :email and temp_key= :temp_key";
			$query = $this->db->conn->prepare($sql);
			$query->bindValue(":email", $email);
			$query->bindValue(":temp_key", $temp_key);
			$query->execute();
			$result = $query->fetch(PDO::FETCH_OBJ);
			//if key doesnt matches
			if (!$result) {
				echo "This url is invalid or already been used. Please verify and try again.";
				exit;
			}
		} else {
			header('location:index.php');
		}

		$password1 = $data['password1'];
		$password1 = md5($password1);
		$password2 = $data['password2'];
		$password2 = md5($password2);
		if ($password2 == $password1) {
			$message_success = "New password has been set for " . $email;
			// $password = md5($password1);
			//destroy the key from table

			$sql = "DELETE FROM forget_password where email=:email and temp_key=:temp_key";
			$query = $this->db->conn->prepare($sql);
			$query->bindValue(":email", $email);
			$query->bindValue(":temp_key", $temp_key);
			$query->execute();

			// update password in database
			$sql = "UPDATE employee set password=:password where email=:email";
			$query = $this->db->conn->prepare($sql);
			$query->bindValue(":email", $email);
			$query->bindValue(":password", $password1);
			$query->execute();
			return $message_success;
		} else {
			$message = "Verify your password";
			return $message;
		}
	}
	//Add checklist
	public function chk()
	{

		// $E_id	 	= $_POST['E_id'];
		$checklist_number	 	= $_POST['checklist_number'];
		$Operational_area	= $_POST['Operational_area'];
		$description = $_POST['description'];
		$objective = $_POST['objective'];
		$risk = $_POST['risk'];
		$risk_level = $_POST['risk_level'];
		$expected_control = $_POST['expected_control'];
		$audit_approach = $_POST['audit_approach'];
		$detail = $_POST['detail'];

		// if ($E_id == "") {
		// 	$msg['E_id'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		// }
		if ($checklist_number == "") {
			$msg['checklist_number'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if ($Operational_area == "") {
			$msg['Operational_area'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if ($description == "") {
			$msg['description'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if ($objective == "") {
			$msg['objective'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if ($risk == "") {
			$msg['risk'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if ($risk_level == "") {
			$msg['risk_level'] = '<p class="text-danger"><strong>Error! </strong>Field name must not be empty!</p>';
		}
		if ($expected_control == "") {
			$msg['expected_control'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if ($audit_approach == "") {
			$msg['audit_approach'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if ($detail == "") {
			$msg['detail'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}


		if (!empty($msg)) {
			return $msg;
		}

		$sql = "INSERT INTO  checklist( checklist_number, Operational_area, description, objective, risk, risk_level, expected_control, audit_approach, detail)
		 VALUES (  :checklist_number, :Operational_area, :description, :objective, :risk, :risk_level, :expected_control, :audit_approach, :detail)";
		$query = $this->db->conn->prepare($sql);
		// $query->bindValue(":E_id", $E_id);
		$query->bindValue(":checklist_number", $checklist_number);
		$query->bindValue(":Operational_area", $Operational_area);
		$query->bindValue(":description", $description);
		$query->bindValue(":objective", $objective);
		$query->bindValue(":risk", $risk);
		$query->bindValue(":risk_level", $risk_level);
		$query->bindValue(":expected_control", $expected_control);
		$query->bindValue(":audit_approach", $audit_approach);
		$query->bindValue(":detail", $detail);

		$result = $query->execute();
		if ($result) {
			// $msg['su'] = '<p class="text-success"><strong>Success! </strong>Data Inserted.</p>';
			header("location: checklist.php");
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Insert!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}
	}
	//Add policy and procedures
	public function policy()
	{
		// if (isset($_POST['save'])) {
		$target_dir = "uplds/";
		$target_file = $target_dir . date("dmYhis") . basename($_FILES["file"]["name"]);
		$uploadOk = 1;
		$imageFileType = pathinfo($target_file, PATHINFO_EXTENSION);

		if ($imageFileType != "jpg" || $imageFileType != "png" || $imageFileType != "jpeg" || $imageFileType != "gif") {
			if (move_uploaded_file($_FILES["file"]["tmp_name"], $target_file)) {
				$files = date("dmYhis") . basename($_FILES["file"]["name"]);
			} else {
				echo "Error Uploading File";
				exit;
			}
		} else {
			echo "File Not Supported";
			exit;
		}
		$filename = $_POST['filename'];
		$department = $_POST['department'];
		$description = $_POST['description'];
		$Location = "uplds/" . $files;


		$sql = "INSERT INTO  policyregistration(`FileName`, `department`, `description`, `Location`) VALUES (:filename, :department, :description, :Location)";
		$query = $this->db->conn->prepare($sql);
		$query->bindValue(":filename", $filename);
		$query->bindValue(":department", $department);
		$query->bindValue(":description", $description);
		$query->bindValue(":Location", $Location);


		$result = $query->execute();
		if ($result) {
			// $msg['su'] = '<p class="text-success"><strong>File Uploaded Successfully! </strong>Data Inserted.</p>';
			header("location: plcy.php");
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>File Do not uploaded!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}
		// }
	}
	//Change password
	public function changeP()
	{

		$id = Session::get("id");
		$oldpassword = $_POST['oldpassword'];
		$oldpassword = md5($oldpassword);
		$newpassword = $_POST['newpassword'];
		$newpassword = md5($newpassword);
		$confirmpassword = $_POST['confirmpassword'];
		$confirmpassword = md5($confirmpassword);
		$status = "";
		// $msg = "";
		// $username=$_SESSION['alogin'];
		$sql = "SELECT password FROM employee WHERE id=:id";
		$query = $this->db->conn->prepare($sql);
		$query->bindParam(':id', $id, PDO::PARAM_STR);
		// $query->bindParam(':password', $password, PDO::PARAM_STR);
		$query->execute();
		$result = $query->fetch();

		if ($newpassword == $confirmpassword) {
			if ($result['password'] == $oldpassword) {
				$sql = "UPDATE employee SET password=:newpassword WHERE id=:id";
				$query = $this->db->conn->prepare($sql);
				$query->bindParam(':newpassword', $newpassword, PDO::PARAM_STR);
				$query->bindParam(':id', $id, PDO::PARAM_STR);
				if ($query->execute()) {
					// echo '<font color=green>Your password is Updated</font> <br>';
					$msg['su'] = '<p class="text-success"><strong>Your password is Updated! </strong>Data Inserted.</p>';
					// header("Location: changeP.php");
				} else {
					echo '<font color=red>Unable to Update password</font> <br>';
				}
			} else {
				echo '<font color=green>Your current password is incorrect</font> <br>';
			}
		} else {
			echo '<font color=green>Password does not match</font> <br>';
		}
		// $password = $password;

	}

	//Change password for ADMIN USER

		//Change password
		public function changePA()
		{
	
			$id = Session::get("id");
			$oldpassword = $_POST['oldpassword'];
			$oldpassword = md5($oldpassword);
			$newpassword = $_POST['newpassword'];
			$newpassword = md5($newpassword);
			$confirmpassword = $_POST['confirmpassword'];
			$confirmpassword = md5($confirmpassword);
			$status = "";
			// $msg = "";
			// $username=$_SESSION['alogin'];
			$sql = "SELECT password FROM employee WHERE id=:id";
			$query = $this->db->conn->prepare($sql);
			$query->bindParam(':id', $id, PDO::PARAM_STR);
			// $query->bindParam(':password', $password, PDO::PARAM_STR);
			$query->execute();
			$result = $query->fetch();
	
			if ($newpassword == $confirmpassword) {
				if ($result['password'] == $oldpassword) {
					$sql = "UPDATE employee SET password=:newpassword WHERE id=:id";
					$query = $this->db->conn->prepare($sql);
					$query->bindParam(':newpassword', $newpassword, PDO::PARAM_STR);
					$query->bindParam(':id', $id, PDO::PARAM_STR);
					$result = $query->execute();
				
					if ($result) {
						// echo '<font color=red>Password Updated</font> <br>';
						$msg['su'] = '<p class="text-success"><strong>Success! </strong>Password Updated.</p>';
						header("Location: changeP.php");
					} else {
						echo '<font color=red>Unable to Update password</font> <br>';
						
					}
				} else {
					echo '<font color=green>Your current password is incorrect</font> <br>';
				}
			} else {
				echo '<font color=green>Password does not match</font> <br>';
			}
			// $password = $password;
	
		}


	//Add Introduction Letter
	public function intrL()
	{

		$E_id	 	= $_POST['E_id'];
		$date	 	= $_POST['date'];
		$reference	= $_POST['reference'];
		$gene_by_tl = $_POST['gene_by_tl'];
		$ch_tl = $_POST['ch_tl'];
		$audit_type = $_POST['audit_type'];
		$auditee = $_POST['auditee'];
		$auditor_name = $_POST['auditor_name'];
		$detail = $_POST['detail'];

		if ($E_id == "") {
			$msg['E_id'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if ($date == "") {
			$msg['date'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if ($reference == "") {
			$msg['reference'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if ($gene_by_tl == "") {
			$msg['gene_by_tl'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if ($ch_tl == "") {
			$msg['ch_tl'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if ($audit_type == "") {
			$msg['audit_type'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if ($auditee == "") {
			$msg['auditee'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if ($auditor_name == "") {
			$msg['auditor_name'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}

		if ($detail == "") {
			$msg['detail'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}

		$sql = "INSERT INTO  intro_letter( E_id, date, reference, gene_by_tl, ch_tl, audit_type, auditee, auditor_name, detail)
		 VALUES ( :E_id, :date, :reference, :gene_by_tl, :ch_tl, :audit_type, :auditee, :auditor_name, :detail)";
		$query = $this->db->conn->prepare($sql);
		$query->bindValue(":E_id", $E_id);
		$query->bindValue(":date", $date);
		$query->bindValue(":reference", $reference);
		$query->bindValue(":gene_by_tl", $gene_by_tl);
		$query->bindValue(":ch_tl", $ch_tl);
		$query->bindValue(":audit_type", $audit_type);
		$query->bindValue(":auditee", $auditee);
		$query->bindValue(":auditor_name", $auditor_name);
		$query->bindValue(":detail", $detail);

		$result = $query->execute();
		if ($result) {
			$msg['su'] = '<p class="text-success"><strong>Success! </strong>Data Inserted.</p>';
			header("location: introduction_letter.php");
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Insert!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}
	}
	//Add Introduction Letter
	public function add_finding_detail()
	{

		
		$E_id	 	= $_POST['E_id'];
		$Finding_number	 	= $_POST['Finding_number'];
		$Irregularity_description	= $_POST['Irregularity_description'];
		$Loss_amount = $_POST['Loss_amount'];
		$name	 	= Session::get("name");

		if ($E_id == "") {
			$msg['E_id'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if ($Finding_number == "") {
			$msg['Finding_number'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if ($Irregularity_description == "") {
			$msg['Irregularity_description'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if ($Loss_amount == "") {
			$msg['Loss_amount'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} 
		if ($name == "") {
			$msg['name'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}

		if (!empty($msg)) {
			return $msg;
		}

		

		$sql = "INSERT INTO  finding_detail( E_id, Finding_number, Irregularity_description, Loss_amount, name) VALUES ('$E_id', '$Finding_number', '$Irregularity_description', '$Loss_amount', '$name')";
		$query = $this->db->conn->prepare($sql);
		$query->bindValue(":E_id", $E_id);
		$query->bindValue(":Finding_number", $Finding_number);
		$query->bindValue(":Irregularity_description", $Irregularity_description);
		$query->bindValue(":Loss_amount", $Loss_amount);
		$query->bindValue(":name", $name);


		$result = $query->execute();
		if ($result) {
			// $msg['su'] = '<p class="text-success"><strong>Success! </strong>Data Inserted.</p>';
			header("location: finding_detail_reg.php");
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Insert!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}
	}
	//view Registered Finding
	public function view_risk_reg()
	{
		$sql = "SELECT * FROM risk_registration";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	//view Registered Finding
	public function view_fr()
	{
		$sql = "SELECT * FROM Audit_finding";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;

		// Full texts
		// id	
		// Employee_name	
		// Detail	
		// Office
	}
	public function view_temp_team()
	{
		$sql = "SELECT * FROM temp_team";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	// View Quarter summary
	// public function view_quarter_summary()
	// {
	// 	$sql = "SELECT * FROM quarter_summary";
	// 	$query = $this->db->conn->prepare($sql);
	// 	$query->execute();
	// 	$result = $query->fetchAll();
	// 	return $result;
	// }
	//Update for Approval temporary team 
	public function edit_temp_team()
	{
		$id = $_POST['up_id'];
		$team_foun_date = $_POST['team_foun_date'];
		$Team_member = $_POST['Team_member'];
		$Auditor_in_charge = $_POST['Auditor_in_charge'];
		//$status = $_POST['status'];
		$Approval = $_POST['Approval'];




		if ($team_foun_date == "") {
			$msg['team_foun_date'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Team_member == "") {
			$msg['Team_member'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Auditor_in_charge == "") {
			$msg['Auditor_in_charge'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Approval == "") {
			$msg['Approval'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}

		$sql = "UPDATE temp_team SET  team_foun_date='$team_foun_date',Team_member='$Team_member', Auditor_in_charge='$Auditor_in_charge', Approval='$Approval' WHERE id='$id'";
		$query = $this->db->conn->prepare($sql);
		$result = $query->execute();

		if ($result) {
			header("Location: approve_temp_team.php");
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Update</p>';
			return $msg;
		}
		if (!empty($msg)) {
			return $msg;
		}
	}

	//Update value for temp team
	public function update_temp_team()
	{
		$id = $_POST['up_id'];
		// $Team = $_POST['Team'];
		// $Audit_type = $_POST['Audit_type'];
		$team_foun_date = $_POST['team_foun_date'];
		$Team_member = $_POST['Team_member'];
		$Auditor_in_charge = $_POST['Auditor_in_charge'];
		$audit_type = $_POST['audit_type'];
		$auditee = $_POST['auditee'];
		$sub = $_POST['sub'];
		$Description = $_POST['Description'];

		//$status = $_POST['status'];
		if (isset($_GET['id'])) {

			// Store the value from get to a 
			// local variable "course_id"
			$temp_id = $_GET['id'];

			// SQL query that sets the status
			// to 1 to indicate activation.
			$sql = "UPDATE `temp_team` SET 
			 `status`=1 WHERE id='$temp_id'";
			$query = $this->db->conn->prepare($sql);
			$result = $query->execute();
			if ($result) {
				header("Location: temp_team.php");
			} else {
				$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Update</p>';
				return $msg;
			}
			if (!empty($msg)) {
				return $msg;
			}
		}
		if (isset($_GET['id'])) {

			// Store the value from get to 
			// a local variable "course_id"
			$temp_id = $_GET['id'];

			// SQL query that sets the status to
			// 0 to indicate deactivation.
			$sql = "UPDATE `temp_team` SET 
				`status`=0 WHERE id='$temp_id'";

			// Execute the query
			$query = $this->db->conn->prepare($sql);
			$result = $query->execute();
			if ($result) {
				header("Location: temp_team.php");
			} else {
				$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Update</p>';
				return $msg;
			}
			if (!empty($msg)) {
				return $msg;
			}
		}

		
		if ($team_foun_date == "") {
			$msg['team_foun_date'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Team_member == "") {
			$msg['Team_member'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Auditor_in_charge == "") {
			$msg['Auditor_in_charge'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($audit_type == "") {
			$msg['audit_type'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($auditee == "") {
			$msg['auditee'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($sub == "") {
			$msg['sub'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Description == "") {
			$msg['Description'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}

		$sql = "UPDATE temp_team SET  team_foun_date='$team_foun_date',Team_member='$Team_member', Auditor_in_charge='$Auditor_in_charge',audit_type='$audit_type', auditee='$auditee',sub='$sub',Description='$Description' WHERE id='$id'";
		$query = $this->db->conn->prepare($sql);
		$result = $query->execute();

		if ($result) {
			header("Location: temp_team.php");
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Update</p>';
			return $msg;
		}
		if (!empty($msg)) {
			return $msg;
		}
	}
	//edit risk registration
	public function edit_risk_reg()
	{

		$id = $_POST['up_id'];
		$Business_objective	 	= $_POST['Business_objective'];
		$Business_owner	= $_POST['Business_owner'];
		$Risk_list = $_POST['Risk_list'];
		$Likely_hood = $_POST['Likely_hood'];
		$Risk_level = $_POST['Risk_level'];
		$Impact_description = $_POST['Impact_description'];;




		if ($Business_objective == "") {
			$msg['Business_objective'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Business_owner == "") {
			$msg['Business_owner'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Risk_list == "") {
			$msg['Risk_list'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Likely_hood == "") {
			$msg['Likely_hood'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Risk_level == "") {
			$msg['Risk_level'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} else if ($Impact_description == "") {
			$msg['Impact_description'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}

		if (!empty($msg)) {
			return $msg;
		}

		$sql = "UPDATE risk_registration SET Business_objective='$Business_objective', Business_owner='$Business_owner',Risk_list='$Risk_list', Likely_hood='$Likely_hood', Risk_level='$Risk_level', Impact_description='$Impact_description' WHERE id='$id'";
		$query = $this->db->conn->prepare($sql);
		$result = $query->execute();

		if ($result) {
			header("Location: view_risk_registration.php");
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Update</p>';
			return $msg;
		}
		if (!empty($msg)) {
			return $msg;
		}
	}
	
	//view wbs
	public function view_wbs()
	{
		$sql = "SELECT * FROM wbs";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	//view temporary team
	public function view_tt()
	{
		$sql = "SELECT * FROM assign_task";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	//view audit finding
	public function view_af()
	{
		$sql = "SELECT * FROM finding_registration";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	public function view_auditprog()
	{
		$sql = "SELECT * FROM audit_program";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}

	//view tm_annual_plan.php
	public function view_annual()
	{
		$sql = "SELECT * FROM annual_plan";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	//view report summary
	public function view_report_summary()
	{
		$sql = "SELECT * FROM report_summary";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	//view quarter summary
	public function view_quarter_summary()
	{
		$sql = "SELECT * FROM quarter_summary";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	//view tm_monthly_plan.php
	public function view_monthly()
	{
		$sql = "SELECT * FROM monthly_plan";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	//view tm_quarter_plan.php 
	public function view_quarter()
	{
		$sql = "SELECT * FROM quarter_plan";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
		// $total_rows = $query->rowCount();
	}

	//view_employee
	public function view_employee()
	{
		$sql = "SELECT * FROM employee";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}

	//Save Message
	public function save_message($id, $data)
	{
		$receiver_id 	= $data['receiver_id'];
		$subject		= $data['subject'];
		$body			= $data['body'];
		$date_times		= date('Y-m-d H:i:s');

		if ($receiver_id == "") {
			$msg['receiver_id'] = '<p class="text-danger"><strong>Error! </strong>Receiver must not be empty!</p>';
		}
		if ($subject == "") {
			$msg['subject'] = '<p class="text-danger"><strong>Error! </strong>Subject must not be empty!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}

		$sql = "INSERT INTO message (sender_id, receiver_id, subject, body, date_times) VALUES (:sender_id, :receiver_id, :subject, :body, :date_times)";
		$query = $this->db->conn->prepare($sql);
		$query->bindValue(":sender_id", $id);
		$query->bindValue(":receiver_id", $receiver_id);
		$query->bindValue(":subject", $subject);
		$query->bindValue(":body", $body);
		$query->bindValue(":date_times", $date_times);
		$result = $query->execute();
		if ($result) {
			$msg['su'] = '<p class="text-success"><strong>Success! </strong>Data Inserted.</p>';
			//return $msg;
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Insert!</p>';
			//return $msg;
		}
		if (!empty($msg)) {
			return $msg;
		}
	}

	public function view_inbox_message_by_id($viewId)
	{
		$readMessage = $this->read_message($viewId);
		$sql = "SELECT employee.name, message.* FROM employee INNER JOIN message ON employee.id=message.sender_id WHERE message.id=$viewId";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}

	public function read_message($viewId)
	{
		$sql = "UPDATE message SET message_read=1 WHERE id=$viewId";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
	}

	//Count sent
	public function view_sent($id)
	{
		$sql = "SELECT employee.name, message.* FROM employee INNER JOIN message ON employee.id=message.receiver_id WHERE sender_id=$id";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	public function count_sent($id)
	{
		$sql = "SELECT receiver_id FROM message WHERE sender_id=$id";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		$cou_result = count($result);
		return $cou_result;
	}

	public function view_sent_message_by_id($viewId)
	{
		$sql = "SELECT employee.name, message.* FROM employee INNER JOIN message ON employee.id=message.receiver_id WHERE message.id=$viewId";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}

	//Setting Function
	public function save_setting($data)
	{
		$company_name		= $data['company_name'];
		$company_address	= $data['company_address'];
		$office_start_time	= date('H:i:s', strtotime($data['office_start_time']));
		$office_end_time	= date('H:i:s', strtotime($data['office_end_time']));

		$permited = array('jpg', 'jpeg', 'png', 'gif', 'pdf', 'doc', 'xlsx', 'zip', 'rar');
		$file_name = $_FILES['company_logo']['name'];
		$file_size = $_FILES['company_logo']['size'];
		$file_temp = $_FILES['company_logo']['tmp_name'];
		$folder = "image/";
		$div = explode('.', $file_name);
		$file_ext = strtolower(end($div));
		$file_f_name = rtrim($file_name, '.' . $file_ext);
		$company_logo = $file_f_name . time() . '.' . $file_ext;
		move_uploaded_file($file_temp, $folder . $company_logo);

		if ($company_name == "") {
			$msg['company_name'] = '<p class="text-danger"><strong>Error! </strong>Company Name must not be empty!</p>';
		}
		if ($company_address == "") {
			$msg['company_address'] = '<p class="text-danger"><strong>Error! </strong>Company Address must not be empty!</p>';
		}
		if ($file_name == "") {
			$msg['company_logo'] = '<p class="text-danger"><strong>Error ! </strong>Select any files!</p>';
		} else if ($file_size > 10000000) {
			$msg['company_logo'] = '<p class="text-danger"><strong>Error ! </strong>File size too large!</p>';
		} else if (in_array($file_ext, $permited) === false) {
			$msg['company_logo'] = '<p class="text-danger"><strong>Error ! </strong>You can uploded only: ' . implode(', ', $permited) . '.</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}

		$sql = "INSERT INTO setting (company_name, company_logo, company_address, office_start_time, office_end_time) VALUES (:company_name, :company_logo, :company_address, :office_start_time, :office_end_time)";
		$query = $this->db->conn->prepare($sql);
		$query->bindValue(":company_name", $company_name);
		$query->bindValue(":company_logo", $company_logo);
		$query->bindValue(":company_address", $company_address);
		$query->bindValue(":office_start_time", $office_start_time);
		$query->bindValue(":office_end_time", $office_end_time);
		$result = $query->execute();
		if ($result) {
			$msg['su'] = '<p class="text-success"><strong>Success! </strong>Data Inserted.</p>';
			//return $msg;
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Insert!</p>';
			//return $msg;
		}
		if (!empty($msg)) {
			return $msg;
		}
	}
	//View Setting
	public function view_setting()
	{
		$sql = "SELECT * FROM setting";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetch(PDO::FETCH_OBJ);
		return $result;
	}
	//Edit Setting
	public function edit_setting($data)
	{
		$id 				= $data['id'];
		$company_name		= $data['company_name'];
		$company_address	= $data['company_address'];
		$office_start_time	= date('H:i:s', strtotime($data['office_start_time']));
		$office_end_time	= date('H:i:s', strtotime($data['office_end_time']));

		$permited = array('jpg', 'jpeg', 'png', 'gif');
		$file_name = $_FILES['company_logo']['name'];
		$file_size = $_FILES['company_logo']['size'];
		$file_temp = $_FILES['company_logo']['tmp_name'];
		$folder = "image/";
		$div = explode('.', $file_name);
		$file_ext = strtolower(end($div));
		$file_f_name = rtrim($file_name, '.' . $file_ext);
		$company_logo = $file_f_name . time() . '.' . $file_ext;
		move_uploaded_file($file_temp, $folder . $company_logo);

		if ($company_name == "") {
			$msg['company_name'] = '<p class="text-danger"><strong>Error! </strong>Company Name must not be empty!</p>';
		}
		if ($company_address == "") {
			$msg['company_address'] = '<p class="text-danger"><strong>Error! </strong>Company Address must not be empty!</p>';
		}
		if ($file_size > 10000000) {
			$msg['company_logo'] = '<p class="text-danger"><strong>Error ! </strong>File size too large!</p>';
		} else if (in_array($file_ext, $permited) === true) {
			$msg['company_logo'] = '<p class="text-danger"><strong>Error ! </strong>You can uploded only: ' . implode(', ', $permited) . '.</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}

		$sql = "UPDATE setting SET company_name=:company_name, company_logo=:company_logo, company_address=:company_address, office_start_time=:office_start_time, office_end_time=:office_end_time WHERE id=:id";
		$query = $this->db->conn->prepare($sql);
		$query->bindValue(":company_name", $company_name);
		$query->bindValue(":company_logo", $company_logo);
		$query->bindValue(":company_address", $company_address);
		$query->bindValue(":office_start_time", $office_start_time);
		$query->bindValue(":office_end_time", $office_end_time);
		$query->bindValue(":id", $id);
		$result = $query->execute();
		if ($result) {
			header("Location: setting.php");
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Insert!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}
	}

	//Leave Function
	public function save_leave($data)
	{
		$employee_id	= $data['employee_id'];
		$leave_type 	= $data['leave_type'];
		$reason 		= $data['reason'];
		$date_from 		= date('Y-m-d', strtotime($data['date_from']));
		$date_to		= date('Y-m-d', strtotime($data['date_to']));

		if ($employee_id == "") {
			$msg['employee_id'] = '<p class="text-danger"><strong>Error! </strong>Name must not be empty!</p>';
		}
		if ($leave_type == "") {
			$msg['leave_type'] = '<p class="text-danger"><strong>Error! </strong>Leave Type must not be empty!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}

		$sql = "INSERT INTO leave (employee_id, leave_type, reason, date_from, date_to) VALUES (:employee_id, :leave_type, :reason, :date_from, :date_to)";
		$query = $this->db->conn->prepare($sql);
		$query->bindValue(":employee_id", $employee_id);
		$query->bindValue(":leave_type", $leave_type);
		$query->bindValue(":reason", $reason);
		$query->bindValue(":date_from", $date_from);
		$query->bindValue(":date_to", $date_to);
		$result = $query->execute();
		if ($result) {
			$msg['su'] = '<p class="text-success"><strong>Success! </strong>Data Inserted.</p>';
			//return $msg;
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Insert!</p>';
			//return $msg;
		}
		if (!empty($msg)) {
			return $msg;
		}
	}
	//Assign Field
	public function save_ts($data)
	{
		//$employee_name	= $data['employee_name'];
		$Audit_type	 	= $data['Audit_type'];
		$Team = $data['Team'];
		$task_details	= $data['task_details'];
		$start_date 	= date('Y-m-d', strtotime($data['start_date']));
		$end_date 		= date('Y-m-d', strtotime($data['end_date']));



		if ($Audit_type == "") {
			$msg['Audit_type'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if ($Team == "") {
			$msg['Team'] = '<p class="text-danger"><strong>Error! </strong>Start Date must not be empty!</p>';
		}
		if ($start_date == "") {
			$msg['start_date'] = '<p class="text-danger"><strong>Error! </strong>Start Date must not be empty!</p>';
		}
		if ($end_date == "") {
			$msg['end_date'] = '<p class="text-danger"><strong>Error! </strong>End Date must not be empty!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}

		$sql = "INSERT INTO assign_task(Audit_type, Team,task_details, start_date, end_date) VALUES (:Audit_type, :task_details, :Team,:start_date, :end_date)";
		$query = $this->db->conn->prepare($sql);
		//$query->bindValue(":employee_name", $employee_name);
		$query->bindValue(":Audit_type", $Audit_type);
		$query->bindValue(":Team", $Team);
		$query->bindValue(":task_details", $task_details);
		$query->bindValue(":start_date", $start_date);
		$query->bindValue(":end_date", $end_date);
		$result = $query->execute();
		if ($result) {
			$msg['su'] = '<p class="text-success"><strong>Success! </strong>Data Inserted.</p>';
			header("Location: assign_task.php");
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Insert!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}
	}
	//Assign Field
	public function save_report_summary($data)
	{
		$intro	= $data['intro'];
		$objective	 	= $data['objective'];
		$methodology	= $data['methodology'];
		$scope	= $data['scope'];
		$technique	 	= $data['technique'];
		$rating	= $data['rating'];
		$summary	 	= $data['summary'];

		if ($intro == "") {
			$msg['intro'] = '<p class="text-danger"><strong>Error! </strong>Name must not be empty!</p>';
		}
		if ($objective == "") {
			$msg['objective'] = '<p class="text-danger"><strong>Error! </strong>Field name must not be empty!</p>';
		}
		if ($methodology == "") {
			$msg['methodology'] = '<p class="text-danger"><strong>Error! </strong>Start Date must not be empty!</p>';
		}
		if ($scope == "") {
			$msg['scope'] = '<p class="text-danger"><strong>Error! </strong>End Date must not be empty!</p>';
		}
		if ($technique == "") {
			$msg['technique'] = '<p class="text-danger"><strong>Error! </strong>End Date must not be empty!</p>';
		}
		if ($rating == "") {
			$msg['rating'] = '<p class="text-danger"><strong>Error! </strong>End Date must not be empty!</p>';
		}
		if ($summary == "") {
			$msg['summary'] = '<p class="text-danger"><strong>Error! </strong>End Date must not be empty!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}

		$sql = "INSERT INTO report_summary(intro, objective, methodology, scope, technique, rating, summary) 
		VALUES (:intro, :objective, :methodology, :scope, :technique, :rating, :summary)";
		$query = $this->db->conn->prepare($sql);
		$query->bindValue(":intro", $intro);
		$query->bindValue(":objective", $objective);
		$query->bindValue(":methodology", $methodology);
		$query->bindValue(":scope", $scope);
		$query->bindValue(":technique", $technique);
		$query->bindValue(":rating", $rating);
		$query->bindValue(":summary", $summary);
		$result = $query->execute();
		if ($result) {
			// $msg['su'] = '<p class="text-success"><strong>Success! </strong> Data Inserted to Generate Report!!</p>';
			header("location: report_summary.php");
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Insert!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}
	}

	
	//Audit Engagement
	public function audit_engage($data)
	{
		$E_Id 			= $data['E_Id'];
		$Audit_type	 	= $data['Audit_type'];
		$Auditee	= $data['Auditee'];
		$Quarter_number		= $data['Quarter_number'];
		$S_date 	= date('Y-m-d', strtotime($data['S_date']));
		$E_date 		= date('Y-m-d', strtotime($data['E_date']));

		$sql = "INSERT INTO audit_engage (E_Id, Audit_type, Auditee, Quarter_number, S_date, E_date) VALUES (:E_id, :Auditee, :S_date, :E_date)";
		$query = $this->db->conn->prepare($sql);
		$query->bindValue(":E_id", $E_Id);
		$query->bindValue(":Audit_type", $Audit_type);
		$query->bindValue(":Auditee", $Auditee);
		$query->bindValue(":Quarter_number", $Quarter_number);
		$query->bindValue(":S_date", $S_date);
		$query->bindValue(":E_date", $E_date);
		$result = $query->execute();
	}
	//Finding Registration
	public function Finding_Registration($data)
	{


		$E_id	= $data['E_id'];
		$auditee	= $data['auditee'];
		$Operational_area		= $data['Operational_area'];
		$Finding_number 	= $data['Finding_number'];
		$Facts 	= $data['Facts'];
		$Description = $data['Description'];
		$Criteria = $data['Criteria'];
		$Cause = $data['Cause'];
		$Effect = $data['Effect'];
		$Internal_control = $data['Internal_control'];
		$Recommendation = $data['Recommendation'];
		$Resp = $data['Resp'];
		$Auditor_conclusion = $data['Auditor_conclusion'];
		$Acceptance_Status = $data['Acceptance_Status'];
		$Auditor_name = $data['Auditor_name'];
		$Date 		= Date('Y-m-d H:i:s', strtotime($data['Date']));
		// $date = date('Y-m-d H:i:s');
		$Action = $data['Action'];
		//$Annexes = $data['Annexes'];


		if ($E_id == "") {
			$msg['E_id'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if ($auditee == "") {
			$msg['auditee'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} elseif ($Operational_area == "") {
			$msg['Operational_area'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} elseif ($Finding_number == "") {
			$msg['Finding_number'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} elseif ($Facts == "") {
			$msg['Facts'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} elseif ($Description == "") {
			$msg['Description'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} elseif ($Criteria == "") {
			$msg['Criteria'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} elseif ($Cause == "") {
			$msg['Cause'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} elseif ($Effect == "") {
			$msg['Effect'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} elseif ($Internal_control == "") {
			$msg['Internal_control'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} elseif ($Recommendation == "") {
			$msg['Recommendation'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} elseif ($Resp == "") {
			$msg['Resp'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} elseif ($Auditor_conclusion == "") {
			$msg['Auditor_conclusion'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} elseif ($Acceptance_Status == "") {
			$msg['Acceptance_Status'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} elseif ($Auditor_name == "") {
			$msg['Auditor_name'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} elseif ($Date == "") {
			$msg['Date'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		} elseif ($Action == "") {
			$msg['Action'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}

		$sql = "INSERT INTO Finding_Registration ( E_id, auditee, Operational_area, Finding_number, Facts, Description, Criteria, Cause, Effect, Internal_control, Recommendation, Resp, Auditor_conclusion, Acceptance_Status, Auditor_name, Date, Action)  
		VALUES (:E_id, :auditee, :Operational_area, :Finding_number, :Facts, :Description, :Criteria, :Cause, :Effect, :Internal_control, :Recommendation,:Resp, :Auditor_conclusion, :Acceptance_Status, :Auditor_name, :Date, :Action)";
		$query = $this->db->conn->prepare($sql);


		$query->bindValue(":E_id", $E_id);
		$query->bindValue(":auditee", $auditee);
		$query->bindValue(":Operational_area", $Operational_area);
		$query->bindValue(":Finding_number", $Finding_number);
		$query->bindValue(":Facts", $Facts);
		$query->bindValue(":Description", $Description);
		$query->bindValue(":Criteria", $Criteria);
		$query->bindValue(":Cause", $Cause);
		$query->bindValue(":Effect", $Effect);
		$query->bindValue(":Internal_control", $Internal_control);
		$query->bindValue(":Recommendation", $Recommendation);
		$query->bindValue(":Resp", $Resp);
		$query->bindValue(":Auditor_conclusion", $Auditor_conclusion);
		$query->bindValue(":Acceptance_Status", $Acceptance_Status);
		$query->bindValue(":Auditor_name", $Auditor_name);
		$query->bindValue(":Date", $Date);
		$query->bindValue(":Action", $Action);
		//$query->bindValue(":Annexes", $Annexes);

		$result = $query->execute();
		if ($result) {
			header("Location: auditee_response.php");
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Insert!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}
	}
	//Adding type
	public function adding_type($data)
	{


		$Audit_type	= $data['Audit_type'];


		if ($Audit_type == "") {
			$msg['Audit_type'] = '<p class="text-danger"><strong>Error! </strong>Field name must not be empty!</p>';
		}


		$sql = "INSERT INTO  audit_type( Audit_type) VALUES (:Audit_type)";
		$query = $this->db->conn->prepare($sql);
		$query->bindValue(":Audit_type", $Audit_type);
		$result = $query->execute();

		if ($result) {
			$msg['su'] = '<p class="text-success"><strong>Success! </strong>Data Inserted.</p>';
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Insert!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}
	}
	//add auditee
	public function adding_auditee($data)
	{

		$auditee	= $data['auditee'];


		if ($auditee == "") {
			$msg['auditee'] = '<p class="text-danger"><strong>Error! </strong>Field name must not be empty!</p>';
		}

		$sql = "INSERT INTO  auditee( auditee) VALUES (:auditee)";
		$query = $this->db->conn->prepare($sql);
		$query->bindValue(":auditee", $auditee);
		$result = $query->execute();

		if ($result) {
			$msg['su'] = '<p class="text-success"><strong>Success! </strong>Data Inserted.</p>';
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Insert!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}
	}

	//Response table Audit finding
	// public function auditee_resp()
	// {

	// 	// $E_id	 	= $_POST['E_id'];
	// 	$auditee	 	= Session::get("name");
	// 	$Acceptance_Status = $_POST['Acceptance_Status'];
	// 	$action = $_POST['action'];
	// 	$Resp = $_POST['Resp'];

	// 	// if ($E_id == "") {
	// 	// 	$msg['E_id'] = '<p class="text-danger"><strong>Error! </strong>Engagement ID must not be empty!</p>';
	// 	// }
	// 	if ($auditee == "") {
	// 		$msg['auditee'] = '<p class="text-danger"><strong>Error! </strong>Auditee must not be empty!</p>';
	// 	}
	// 	if ($Acceptance_Status == "") {
	// 		$msg['Acceptance_Status'] = '<p class="text-danger"><strong>Error! </strong>Auditee must not be empty!</p>';
	// 	}
	// 	if ($action == "") {
	// 		$msg['action'] = '<p class="text-danger"><strong>Error! </strong>Auditee must not be empty!</p>';
	// 	}
	// 	if ($Resp == "") {
	// 		$msg['Resp'] = '<p class="text-danger"><strong>Error! </strong>Auditee Response must not be empty!</p>';
	// 	}
	// 	if (!empty($msg)) {
	// 		return $msg;
	// 	}

	// 	$sql = "INSERT INTO  auditee_response( auditee, Acceptance_Status, action, Resp) VALUES ('$auditee', '$Acceptance_Status', '$action', '$Resp')";
	// 	$query = $this->db->conn->prepare($sql);

	// 	$query->bindValue(":auditee", $auditee);
	// 	$query->bindValue(":Acceptance_Status", $Acceptance_Status);
	// 	$query->bindValue(":action", $action);
	// 	$query->bindValue(":Resp", $Resp);

	// 	$result = $query->execute();
	// 	if ($result) {
	// 		$msg['su'] = '<p class="text-success"><strong>Success! </strong>Data Inserted.</p>';
	// 	} else {
	// 		$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Insert!</p>';
	// 	}
	// 	if (!empty($msg)) {
	// 		return $msg;
	// 	}
	// }

	//Audit Program
	public function Audit_program($data)
	{

		$Objectives	 	= $data['Objectives'];
		$Scope	= $data['Scope'];
		$Description = $data['Description'];
		$Status = $data['Status'];
		$Recommendation = $data['Recommendation'];
		$Start_date = $data['Start_date'];
		$End_date = $data['End_date'];

		if ($Objectives == "") {
			$msg['Objectives'] = '<p class="text-danger"><strong>Error! </strong>Field name must not be empty!</p>';
		}
		if ($Scope == "") {
			$msg['Scope'] = '<p class="text-danger"><strong>Error! </strong>Field name must not be empty!</p>';
		}
		if ($Description == "") {
			$msg['Description'] = '<p class="text-danger"><strong>Error! </strong>Field name must not be empty!</p>';
		}
		if ($Status == "") {
			$msg['Status'] = '<p class="text-danger"><strong>Error! </strong>Field name must not be empty!</p>';
		}
		if ($Recommendation == "") {
			$msg['Recommendation'] = '<p class="text-danger"><strong>Error! </strong>Field name must not be empty!</p>';
		}
		if ($Start_date == "") {
			$msg['Start_date'] = '<p class="text-danger"><strong>Error! </strong>Field name must not be empty!</p>';
		}
		if ($End_date == "") {
			$msg['End_date'] = '<p class="text-danger"><strong>Error! </strong>Field name must not be empty!</p>';
		}


		if (!empty($msg)) {
			return $msg;
		}

		$sql = "INSERT INTO  Audit_program( Objectives, Scope, Description, Status, Recommendation, Start_date, End_date) VALUES ( :Objectives, :Scope, :Description, :Status, :Recommendation, :Start_date, :End_date)";
		$query = $this->db->conn->prepare($sql);
		$query->bindValue(":Objectives", $Objectives);
		$query->bindValue(":Scope", $Scope);
		$query->bindValue(":Description", $Description);
		$query->bindValue(":Status", $Status);
		$query->bindValue(":Recommendation", $Recommendation);
		$query->bindValue(":Start_date", $Start_date);
		$query->bindValue(":End_date", $End_date);

		$result = $query->execute();
		if ($result) {
			$msg['su'] = '<p class="text-success"><strong>Success! </strong>Data Inserted.</p>';
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Insert!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}
	}
	//Work Break Down
	public function wbs($data)
	{

		$E_id	 	= $data['E_id'];
		// $t_id	= $data['t_id'];
		$Field_name = $data['Field_name'];
		$str_date 	= $date['str_date'];
		$en_date 	= $date['en_date'];
		$S_date = $data['S_date'];
		$E_date = $data['E_date'];
		// $Duration = $data['Duration'];
		// $Duration = $S_date->diff($E_date);
		$Duration = $E_date - $S_date;
		// $Duration = $S_date->diff($E_date);
		// $diffInHours   = $Duration->h;
		// $Duration = abs(strtotime($E_date) - strtotime($E_date));


		if ($E_id == "") {
			$msg['E_id'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}

		if ($Field_name == "") {
			$msg['Field_name'] = '<p class="text-danger"><strong>Error! </strong>Field name must not be empty!</p>';
		}
		if ($str_date == "") {
			$msg['str_date'] = '<p class="text-danger"><strong>Error! </strong>Start Date be in Date format!</p>';
		}
		if ($en_date == "") {
			$msg['en_date'] = '<p class="text-danger"><strong>Error! </strong>Start Date should be in date format!</p>';
		}
		if ($S_date == "") {
			$msg['S_date'] = '<p class="text-danger"><strong>Error! </strong>Start Time be in time format!</p>';
		}
		if ($E_date == "") {
			$msg['E_date'] = '<p class="text-danger"><strong>Error! </strong>End Time be in time format!</p>';
		}
		if ($Duration == "") {
			$msg['Duration'] = '<p class="text-danger"><strong>Error! </strong>Field name must not be empty!</p>';
		}



		if (!empty($msg)) {
			return $msg;
		}

		$sql = "INSERT INTO  wbs(  E_id, Field_name, str_date,en_date,S_date,  E_date, Duration) VALUES ( :E_id, :Field_name, :str_date,:en_date,:S_date, :E_date, :Duration)";
		$query = $this->db->conn->prepare($sql);
		$query->bindValue(":E_id", $E_id);
		// $query->bindValue(":t_id", $t_id);

		$query->bindValue(":Field_name", $Field_name);
		$query->bindValue(":str_date", $str_date);
		$query->bindValue(":en_date", $en_date);
		$query->bindValue(":S_date", $S_date);
		$query->bindValue(":E_date", $E_date);
		$query->bindValue(":Duration", $Duration);

		$result = $query->execute();
		if ($result) {
			header("Location: WBS.php");
			$msg['su'] = '<p class="text-success"><strong>Success! </strong>Data Inserted.</p>';
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Insert!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}
	}
	//Engagement Creation
	public function reg_engage($data)
	{

		$auditee = $data['auditee'];
		$Team = $data['Team'];
		$Creation_date = $data['Creation_date'];
		$Assignment_date = $data['Assignment_date'];
		$S_date = $data['S_date'];
		$E_date = $data['E_date'];
		$checklist_number = $data['checklist_number'];

		if ($auditee == "") {
			$msg['auditee'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if ($Team == "") {
			$msg['Team'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if ($Creation_date == "") {
			$msg['Creation_date'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if ($Assignment_date == "") {
			$msg['Assignment_date'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if ($S_date == "") {
			$msg['S_date'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if ($E_date == "") {
			$msg['E_date'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if ($checklist_number == "") {
			$msg['checklist_number'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}


		if (!empty($msg)) {
			return $msg;
		}



		$sql = "INSERT INTO  register_engagement( auditee, Team, Creation_date, Assignment_date, S_date, E_date, checklist_number) 
		VALUES ( :auditee, :Team,:Creation_date, :Assignment_date, :S_date, :E_date, :checklist_number)";
		$query = $this->db->conn->prepare($sql);

		$query->bindValue(":auditee", $auditee);
		$query->bindValue(":Team", $Team);
		$query->bindValue(":Creation_date", $Creation_date);
		$query->bindValue(":Assignment_date", $Assignment_date);
		$query->bindValue(":S_date", $S_date);
		$query->bindValue(":E_date", $E_date);
		$query->bindValue(":checklist_number", $checklist_number);

		$result = $query->execute();
		if ($result) {
			// $msg['su'] = '<p class="text-success"><strong>Success! </strong>Data Inserted.</p>';
			header("Location: engagement.php");
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Insert!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}
	}
	//engagement audit program
	public function reg_audit_program_engage()
	{

		$m_id = $_REQUEST['m_id'];
		// $auditee = $_POST['auditee'];
		// $Team = $_POST['Team'];
		$Description = $_POST['Description'];
		// $Assignment_date = $_POST['Assignment_date'];
		$S_date = $_POST['S_date'];
		$E_date = $_POST['E_date'];
		$checklist_number = $_POST['checklist_number'];
		$add_checklist = $_POST['add_checklist'];


		if ($m_id == "") {
			$msg['m_id'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		// if ($auditee == "") {
		// 	$msg['auditee'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		// }
		// if ($Team == "") {
		// 	$msg['Team'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		// }
		if ($Description == "") {
			$msg['Description'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		// if ($Assignment_date == "") {
		// 	$msg['Assignment_date'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		// }
		if ($S_date == "") {
			$msg['S_date'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if ($E_date == "") {
			$msg['E_date'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if ($checklist_number == "") {
			$msg['checklist_number'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if ($add_checklist == "") {
			$msg['add_checklist'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}

		$sql = "INSERT INTO  audit_program_engagement( m_id, Description, S_date, E_date, checklist_number, add_checklist) 
		VALUES ( :m_id, :Description, :S_date, :E_date, :checklist_number, :add_checklist)";
		$query = $this->db->conn->prepare($sql);

		// $query->bindValue(":quarter_plan", $quarter_plan);
		$query->bindValue(":m_id", $m_id);
		// $query->bindValue(":auditee", $auditee);
		// $query->bindValue(":Team", $Team);
		$query->bindValue(":Description", $Description);
		// $query->bindValue(":Assignment_date", $Assignment_date);
		$query->bindValue(":S_date", $S_date);
		$query->bindValue(":E_date", $E_date);
		$query->bindValue(":checklist_number", $checklist_number);
		$query->bindValue(":add_checklist", $add_checklist);

		$result = $query->execute();
		if ($result) {
			// $msg['su'] = '<p class="text-success"><strong>Success! </strong>Data Inserted.</p>';
			header("Location: engagement.php");
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Insert!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}
	}
	//engment


	//engagement audit program
	public function reg_audit_prog_engage()
	{

		$E_id = $_POST['E_id'];
		$name	 	= Session::get("name");
		$Objective = $_POST['Objective'];
		$Scope = $_POST['Scope'];
		$Status = $_POST['Status'];
		$total = $_POST['total'];
		// $Approval = $_POST['Approval'];

		if ($E_id == "") {
			$msg['E_id'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if ($name == "") {
			$msg['name'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if ($Objective == "") {
			$msg['Objective'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if ($Scope == "") {
			$msg['Scope'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if ($Status == "") {
			$msg['Status'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if ($total == "") {
			$msg['total'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		// if ($Approval == "") {
		// 	$msg['Approval'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		// }


		$sql = "INSERT INTO  audit_program( E_id, name, Objective,Scope, Status, total) 
			VALUES ( :E_id, :name, :Objective, :Scope,:Status, :total)";
		$query = $this->db->conn->prepare($sql);

		$query->bindValue(":E_id", $E_id);
		$query->bindValue(":name", $name);
		$query->bindValue(":Objective", $Objective);
		$query->bindValue(":Scope", $Scope);
		$query->bindValue(":Status", $Status);
		$query->bindValue(":total", $total);
		// $query->bindValue(":checklist_number", $checklist_number);

		$result = $query->execute();
		if ($result) {
			$msg['su'] = '<p class="text-success"><strong>Success! </strong>Data Inserted.</p>';
			header("Location: Audit_program.php");
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Insert!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}
	}


	//view Register Finding
	public function view_findR()
	{
		$sql = "SELECT * FROM register_finding";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	//view Finding Registration
	public function view_FindingR()
	{
		$sql = "SELECT * FROM Finding_Registration";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	//view audit finding
	public function view_auditF()
	{
		$sql = "SELECT * FROM audit_finding";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	//Register Finding
	public function reg_finding()
	{

		$Condtion	 	= $_POST['Condtion'];
		$Control	= $_POST['Control'];
		$Cause = $_POST['Cause'];
		$Effect = $_POST['Effect'];
		$Recommendation = $_POST['Recommendation'];
		$Rect = $_POST['Rect'];

		if ($Condtion == "") {
			$msg['Condtion'] = '<p class="text-danger"><strong>Error! </strong>Field name must not be empty!</p>';
		}
		if ($Control == "") {
			$msg['Control'] = '<p class="text-danger"><strong>Error! </strong>Field name must not be empty!</p>';
		}
		if ($Cause == "") {
			$msg['Cause'] = '<p class="text-danger"><strong>Error! </strong>Field name must not be empty!</p>';
		}
		if ($Effect == "") {
			$msg['Effect'] = '<p class="text-danger"><strong>Error! </strong>Field name must not be empty!</p>';
		}
		if ($Recommendation == "") {
			$msg['Recommendation'] = '<p class="text-danger"><strong>Error! </strong>Field name must not be empty!</p>';
		}
		if ($Recommendation == "") {
			$msg['Recommendation'] = '<p class="text-danger"><strong>Error! </strong>Field name must not be empty!</p>';
		}
		if ($Rect == "") {
			$msg['Rect'] = '<p class="text-danger"><strong>Error! </strong>Field name must not be empty!</p>';
		}


		if (!empty($msg)) {
			return $msg;
		}

		$sql = "INSERT INTO  register_finding( Condtion, Control, Cause, Effect, Recommendation, Rect) VALUES ( :Condtion, :Control, :Cause, :Effect, :Recommendation, :Rect)";
		$query = $this->db->conn->prepare($sql);
		$query->bindValue(":Condtion", $Condtion);
		$query->bindValue(":Control", $Control);
		$query->bindValue(":Cause", $Cause);
		$query->bindValue(":Effect", $Effect);
		$query->bindValue(":Recommendation", $Recommendation);
		$query->bindValue(":Rect", $Rect);

		$result = $query->execute();
		if ($result) {
			header("Location: find_register.php");
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Insert!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}
	}
	//Audit Activities
	public function aud_activies()
	{

		$audit_activities	 	= $_POST['audit_activities'];

		if ($audit_activities == "") {
			$msg['audit_activities'] = '<p class="text-danger"><strong>Error! </strong>Field name must not be empty!</p>';
		}

		if (!empty($msg)) {
			return $msg;
		}

		$sql = "INSERT INTO  audit_activities( audit_activities) VALUES ( :audit_activities)";
		$query = $this->db->conn->prepare($sql);
		$query->bindValue(":audit_activities", $audit_activities);


		$result = $query->execute();
		if ($result) {
			$msg['su'] = '<p class="text-success"><strong>Success! </strong>Data Inserted.</p>';
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Update</p>';
			return $msg;
		}
		if (!empty($msg)) {
			return $msg;
		}
	}
	//Audit Object
	public function aud_object()
	{

		$audit_object	 	= $_POST['audit_object'];

		if ($audit_object == "") {
			$msg['audit_object'] = '<p class="text-danger"><strong>Error! </strong>Field name must not be empty!</p>';
		}

		if (!empty($msg)) {
			return $msg;
		}

		$sql = "INSERT INTO  audit_object( audit_object) VALUES ( :audit_object)";
		$query = $this->db->conn->prepare($sql);
		$query->bindValue(":audit_object", $audit_object);


		$result = $query->execute();
		if ($result) {
			$msg['su'] = '<p class="text-success"><strong>Success! </strong>Data Inserted.</p>';
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Update</p>';
			return $msg;
		}
		if (!empty($msg)) {
			return $msg;
		}
	}
	public function audit_type()
	{

		$audit_type	 	= $_POST['audit_type'];

		if ($audit_type == "") {
			$msg['audit_type'] = '<p class="text-danger"><strong>Error! </strong>Field name must not be empty!</p>';
		}

		if (!empty($msg)) {
			return $msg;
		}

		$sql = "INSERT INTO  audit_type( audit_type) VALUES ( :audit_type)";
		$query = $this->db->conn->prepare($sql);
		$query->bindValue(":audit_type", $audit_type);


		$result = $query->execute();
		if ($result) {
			$msg['su'] = '<p class="text-success"><strong>Success! </strong>Data Inserted.</p>';
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Update</p>';
			return $msg;
		}
		if (!empty($msg)) {
			return $msg;
		}
	}
	//Add Auditee
	public function auditee()
	{

		$auditee	 	= $_POST['auditee'];

		if ($auditee == "") {
			$msg['auditee'] = '<p class="text-danger"><strong>Error! </strong>Field name must not be empty!</p>';
		}

		if (!empty($msg)) {
			return $msg;
		}

		$sql = "INSERT INTO  auditee( auditee) VALUES ( :auditee)";
		$query = $this->db->conn->prepare($sql);
		$query->bindValue(":auditee", $auditee);


		$result = $query->execute();
		if ($result) {
			$msg['su'] = '<p class="text-success"><strong>Success! </strong>Data Inserted.</p>';
			//header("Location: auditee.php");
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Update</p>';
			return $msg;
		}
		if (!empty($msg)) {
			return $msg;
		}
	}
	//Contact Person
	public function con_p()
	{

		$auditor_name	 	= $_POST['auditor_name'];

		if ($auditor_name == "") {
			$msg['auditor_name'] = '<p class="text-danger"><strong>Error! </strong>Field name must not be empty!</p>';
		}

		if (!empty($msg)) {
			return $msg;
		}

		$sql = "INSERT INTO  contac_p( auditor_name) VALUES ( :auditor_name)";
		$query = $this->db->conn->prepare($sql);
		$query->bindValue(":auditor_name", $auditor_name);


		$result = $query->execute();
		if ($result) {
			$msg['su'] = '<p class="text-success"><strong>Success! </strong>Data Inserted.</p>';
			//header("Location: con_p.php");
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Update</p>';
			return $msg;
		}
		if (!empty($msg)) {
			return $msg;
		}
	}
	// //User Auditee
	// public function auditeeU()
	// {

	// 	$auditee	 	= $_POST['auditee'];

	// 	if ($auditee == "") {
	// 		$msg['auditee'] = '<p class="text-danger"><strong>Error! </strong>Field name must not be empty!</p>';
	// 	}

	// 	if (!empty($msg)) {
	// 		return $msg;
	// 	}

	// 	$sql = "INSERT INTO  auditeeU( auditee) VALUES ( :auditee)";
	// 	$query = $this->db->conn->prepare($sql);
	// 	$query->bindValue(":auditee", $auditee);


	// 	$result = $query->execute();
	// 	if ($result) {
	// 		$msg['su'] = '<p class="text-success"><strong>Success! </strong>Data Inserted.</p>';
	// 		//header("Location: auditee.php");
	// 	} else {
	// 		$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Update</p>';
	// 		return $msg;
	// 	}
	// 	if (!empty($msg)) {
	// 		return $msg;
	// 	}
	// }
	//Audit type
	public function audit_typeq()
	{

		$audit_type	 	= $_POST['audit_type'];

		if ($audit_type == "") {
			$msg['audit_type'] = '<p class="text-danger"><strong>Error! </strong>Field name must not be empty!</p>';
		}

		if (!empty($msg)) {
			return $msg;
		}

		$sql = "INSERT INTO  audit_typeq( audit_type) VALUES ( :audit_type)";
		$query = $this->db->conn->prepare($sql);
		$query->bindValue(":audit_type", $audit_type);


		$result = $query->execute();
		if ($result) {
			$msg['su'] = '<p class="text-success"><strong>Success! </strong>Data Inserted.</p>';
			//header("Location: audit_typeq.php");
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Update</p>';
			return $msg;
		}
		if (!empty($msg)) {
			return $msg;
		}
	}
	//Audit Object
	public function audit_object()
	{

		$audit_object	 	= $_POST['audit_object'];

		if ($audit_object == "") {
			$msg['audit_object'] = '<p class="text-danger"><strong>Error! </strong>Field name must not be empty!</p>';
		}

		if (!empty($msg)) {
			return $msg;
		}

		$sql = "INSERT INTO  audit_object(audit_object) VALUES (:audit_object)";
		$query = $this->db->conn->prepare($sql);
		$query->bindValue(":audit_object", $audit_object);


		$result = $query->execute();
		if ($result) {
			$msg['su'] = '<p class="text-success"><strong>Success! </strong>Data Inserted.</p>';
			header("Location: view_annualplan.php");
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Update</p>';
			return $msg;
		}
		if (!empty($msg)) {
			return $msg;
		}
	}
	//Add Team
	public function team()
	{

		$Team	 	= $_POST['Team'];

		if ($Team == "") {
			$msg['Team'] = '<p class="text-danger"><strong>Error! </strong>Field name must not be empty!</p>';
		}

		if (!empty($msg)) {
			return $msg;
		}

		$sql = "INSERT INTO  team( Team) VALUES ( :Team)";
		$query = $this->db->conn->prepare($sql);
		$query->bindValue(":Team", $Team);


		$result = $query->execute();
		if ($result) {
			$msg['su'] = '<p class="text-success"><strong>Success! </strong>Data Inserted.</p>';
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Update</p>';
			return $msg;
		}
		if (!empty($msg)) {
			return $msg;
		}
	}
	//Add Cause
	public function cause()
	{

		$cause	 	= $_POST['cause'];

		if ($cause == "") {
			$msg['cause'] = '<p class="text-danger"><strong>Error! </strong>Field name must not be empty!</p>';
		}

		if (!empty($msg)) {
			return $msg;
		}

		$sql = "INSERT INTO  cause( cause) VALUES ( :cause)";
		$query = $this->db->conn->prepare($sql);
		$query->bindValue(":cause", $cause);


		$result = $query->execute();
		if ($result) {
			$msg['su'] = '<p class="text-success"><strong>Success! </strong>Data Inserted.</p>';
			header("Location: cause.php");
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Update</p>';
			return $msg;
		}
		if (!empty($msg)) {
			return $msg;
		}
	}
	//Add Auditor
	public function auditor_name()
	{

		$auditor_name	 	= $_POST['auditor_name'];

		if ($auditor_name == "") {
			$msg['auditor_name'] = '<p class="text-danger"><strong>Error! </strong>Please enter auditor name!</p>';
		}

		if (!empty($msg)) {
			return $msg;
		}

		$sql = "INSERT INTO  auditor_name( auditor_name) VALUES ( :auditor_name)";
		$query = $this->db->conn->prepare($sql);
		$query->bindValue(":auditor_name", $auditor_name);


		$result = $query->execute();
		if ($result) {

			header("Location: auditor.php");
			$msg['su'] = '<p class="text-success"><strong>Success! </strong>Data Inserted.</p>';
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Update</p>';
			return $msg;
		}
		if (!empty($msg)) {
			return $msg;
		}
	}
	//Add Operational Areas
	public function operational()
	{

		$Operational_area	 	= $_POST['Operational_area'];

		if ($Operational_area == "") {
			$msg['Operational_area'] = '<p class="text-danger"><strong>Error! </strong>Please enter auditor name!</p>';
		}

		if (!empty($msg)) {
			return $msg;
		}

		$sql = "INSERT INTO  operational(Operational_area) VALUES ( :Operational_area)";
		$query = $this->db->conn->prepare($sql);
		$query->bindValue(":Operational_area", $Operational_area);


		$result = $query->execute();
		if ($result) {

			header("Location: operational.php");
			$msg['su'] = '<p class="text-success"><strong>Success! </strong>Data Inserted.</p>';
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Update</p>';
			return $msg;
		}
		if (!empty($msg)) {
			return $msg;
		}
	}
	//Add Criteria
	public function criteria()
	{

		$criteria	 	= $_POST['criteria'];

		if ($criteria == "") {
			$msg['criteria'] = '<p class="text-danger"><strong>Error! </strong>Field name must not be empty!</p>';
		}

		if (!empty($msg)) {
			return $msg;
		}

		$sql = "INSERT INTO  criteria( criteria) VALUES ( :criteria)";
		$query = $this->db->conn->prepare($sql);
		$query->bindValue(":criteria", $criteria);


		$result = $query->execute();
		if ($result) {
			$msg['su'] = '<p class="text-success"><strong>Success! </strong>Data Inserted.</p>';
			header("Location: criteria.php");
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Update</p>';
			return $msg;
		}
		if (!empty($msg)) {
			return $msg;
		}
	}
	//Add Effect
	public function effect()
	{

		$effect	 	= $_POST['effect'];

		if ($effect == "") {
			$msg['effect'] = '<p class="text-danger"><strong>Error! </strong>Field name must not be empty!</p>';
		}

		if (!empty($msg)) {
			return $msg;
		}

		$sql = "INSERT INTO  effect( effect) VALUES ( :effect)";
		$query = $this->db->conn->prepare($sql);
		$query->bindValue(":effect", $effect);


		$result = $query->execute();
		if ($result) {
			$msg['su'] = '<p class="text-success"><strong>Success! </strong>Data Inserted.</p>';
			header("Location: effect.php");
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Update</p>';
			return $msg;
		}
		if (!empty($msg)) {
			return $msg;
		}
	}
	//Add Recommendation
	public function recommendation()
	{

		$recommendation	 	= $_POST['recommendation'];

		if ($recommendation == "") {
			$msg['recommendation'] = '<p class="text-danger"><strong>Error! </strong>Field name must not be empty!</p>';
		}

		if (!empty($msg)) {
			return $msg;
		}

		$sql = "INSERT INTO  recommendation( recommendation) VALUES ( :recommendation)";
		$query = $this->db->conn->prepare($sql);
		$query->bindValue(":recommendation", $recommendation);


		$result = $query->execute();
		if ($result) {
			$msg['su'] = '<p class="text-success"><strong>Success! </strong>Data Inserted.</p>';
			header("Location: recommendation.php");
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Update</p>';
			return $msg;
		}
		if (!empty($msg)) {
			return $msg;
		}
	}
	//Add Auditor Justification
	public function auditor_justification()
	{

		$auditor_justification	 	= $_POST['auditor_justification'];

		if ($auditor_justification == "") {
			$msg['auditor_justification'] = '<p class="text-danger"><strong>Error! </strong>Field name must not be empty!</p>';
		}

		if (!empty($msg)) {
			return $msg;
		}

		$sql = "INSERT INTO  auditor_justification( auditor_justification) VALUES ( :auditor_justification)";
		$query = $this->db->conn->prepare($sql);
		$query->bindValue(":auditor_justification", $auditor_justification);


		$result = $query->execute();
		if ($result) {
			$msg['su'] = '<p class="text-success"><strong>Success! </strong>Data Inserted.</p>';
			header("Location: auditor_justification.php");
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Update</p>';
			return $msg;
		}
		if (!empty($msg)) {
			return $msg;
		}
	}
	//Annual plan Registration

	public function annual_tm_plan($data)
	{

		//$ID						= $data['ID'];
		$serial = substr(str_shuffle("abcdefghijklmnopqrstvwxyz"), 0, 4);
		$audit_object	 	= $data['audit_object'];
		$risk_item					= $data['risk_item'];
		$risk_score				= $data['risk_score'];
		$risk_level				= $data['risk_level'];
		$Year 					= $data['Year'];
		// $Quantity 				= $data['Quantity'];


		// if ($ID == "") {
		// 	$msg['ID'] = '<p class="text-danger"><strong>Error! </strong>Field name must not be empty!</p>';
		// }
		if ($serial == "") {
			$msg['serial'] = '<p class="text-danger"><strong>Error! </strong>Field name must not be empty!</p>';
		}
		if ($audit_object == "") {
			$msg['audit_object'] = '<p class="text-danger"><strong>Error! </strong>Field name must not be empty!</p>';
		}

		if ($risk_item == "") {
			$msg['risk_item'] = '<p class="text-danger"><strong>Error! </strong>Field name must not be empty!</p>';
		}
		if ($risk_score == "") {
			$msg['risk_score'] = '<p class="text-danger"><strong>Error! </strong>Field name must not be empty!</p>';
		}
		if ($risk_level == "") {
			$msg['risk_level'] = '<p class="text-danger"><strong>Error! </strong>Field name must not be empty!</p>';
		}
		if ($Year == "") {
			$msg['Year'] = '<p class="text-danger"><strong>Error! </strong>Field name must not be empty!</p>';
		}

		if (!empty($msg)) {
			return $msg;
		}

		$sql = "INSERT INTO annual_plan ( serial, audit_object, risk_item,risk_score, risk_level, Year) VALUES ( :serial, :audit_object, risk_item,:risk_score, :risk_level, :Year)";
		$query = $this->db->conn->prepare($sql);

		$query->bindValue(":serial", $serial);
		$query->bindValue(":audit_object", $audit_object);
		$query->bindValue(":risk_item", $risk_item);
		$query->bindValue(":risk_score", $risk_score);
		$query->bindValue(":risk_level", $risk_level);
		$query->bindValue(":Year", $Year);
		

		$result = $query->execute();
		if ($result) {


			header("Location: view_annualplan.php");
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Insert!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}
	}
	//Quarter Executive Summary Report
	// public function quarter_summary($data)
	// {



	// 	// $serial 		= $data['serial'];
	// 	$serial = substr(str_shuffle("0123456789abcdefghijklmnopqrstvwxyz"), 0, 6);
	// 	$auditee		= $data['auditee'];
	// 	$Irregularity_type			= $data['Irregularity_type'];
	// 	$amt			= $data['amt'];
	// 	$total 		= $data['amt'];



	// 	if ($serial == "") {
	// 		$msg['serial'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
	// 	}
	// 	if ($auditee == "") {
	// 		$msg['auditee'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
	// 	}
	// 	if ($Irregularity_type == "") {
	// 		$msg['Irregularity_type'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
	// 	}
	// 	if ($amt == "") {
	// 		$msg['amt'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
	// 	}
	// 	if ($total == "") {
	// 		$msg['total'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
	// 	}




	// 	if (!empty($msg)) {
	// 		return $msg;
	// 	}

	// 	$sql = "INSERT INTO quarter_summary (serial, auditee, Irregularity_type, amt, total) VALUES ( :serial, :auditee, :Irregularity_type, :amt, :total)";
	// 	$query = $this->db->conn->prepare($sql);

	// 	$query->bindValue(":serial", $serial);
	// 	$query->bindValue(":auditee", $auditee);
	// 	$query->bindValue(":Irregularity_type", $Irregularity_type);
	// 	$query->bindValue(":amt", $amt);
	// 	$query->bindValue(":total", $total);
	// 	//$query->bindValue(":approve", $approve);


	// 	$result = $query->execute();
	// 	if ($result) {
	// 		$msg['su'] = '<p class="text-success"><strong>Success! </strong>Data Inserted.</p>';
	// 	} else {
	// 		$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Insert!</p>';
	// 	}
	// 	if (!empty($msg)) {
	// 		return $msg;
	// 	}
	// }
	
	//Quarter Summary
	// public function quarter_summary()
	// {
	// 	// $id = $_POST['up_id'];
	// 	$serial = $_POST['serial'];
	// 	$serial = substr(str_shuffle("0123456789abcdefghijklmnopqrstvwxyz"), 0, 6);
	// 	$auditee 			= $_POST['auditee'];
	// 	$Irregularity_type 	= $_POST['Irregularity_type '];
	// 	$amt 	= $_POST['amt'];

		
	// 	if ($serial == "") {
	// 		$msg['serial'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
	// 	} else if ($auditee == "") {
	// 		$msg['auditee'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
	// 	} else if ($Irregularity_type == "") {
	// 		$msg['Irregularity_type'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
	// 	}
	// 	if ($amt == "") {
	// 		$msg['amt'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
	// 	}
		
	// 	if (!empty($msg)) {
	// 		return $msg;
	// 	}
	// 	foreach ($auditee as $rowaud) {
	// 		$sql = "INSERT INTO quarter_summary (serial, auditee, Irregularity_type, amt) VALUES ('$s','$rowaud', '$Irregularity_type', '$amt')";
	// 		$query = $this->db->conn->prepare($sql);
	// 		$query->bindValue(":serial", $serial);
	// 		$query->bindValue(":auditee", $rowaud);
	// 		$query->bindValue(":Irregularity_type", $Irregularity_type);
	// 		$query->bindValue(":amt", $amt);
	// 		$result = $query->execute();
	// 	}
	// 	if ($result) {
	// 		header("location: Quarter_summary.php");
	// 		$msg['su'] = '<p class="text-success"><strong>Success! </strong>Data Inserted.</p>';
	// 	} else {
	// 		$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Insert!</p>';
	// 	}
	// 	if (!empty($msg)) {
	// 		return $msg;
	// 	}
	// }

	//NEW QUARTER SUMMARY FORM THAT TAKES MULTIPLE AUDITEE

	// public function add_quarter_summary()
	// {
	// 	//$E_id	 	= $_POST['E_id'];
	// 	// $serial = $_POST['serial'];
	// 	$serial = substr(str_shuffle("0123456789abcdefghijklmnopqrstvwxyz"), 0, 6);

	// 	$tmember 			= $_POST['auditee'];
	// 	$Irregularity_type 	= $_POST['Irregularity_type'];
	// 	$amt 	= $_POST['amt'];
	// 	// $total 	= $_POST['total'];
		

		
	// 	if ($serial == "") {
	// 		$msg['serial'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
	// 		}
	// 	if ($tmember == "") {
	// 		$msg['auditee'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
	// 	}
	// 	if ($Irregularity_type == "") {
	// 		$msg['Irregularity_type'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
	// 	}
	// 	if ($amt== "") {
	// 		$msg['amt'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
	// 	}
	// 	// if ($total == "") {
	// 	// 	$msg['total'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
	// 	// }
		
	// 	if (!empty($msg)) {
	// 		return $msg;
	// 	}
	// 	foreach ($tmember as $rowaud) {
	// 		$sql = "INSERT INTO quarter_summary ( serial, auditee, Irregularity_type, amt) VALUES ('$serial', '$rowaud[auditee]', '$Irregularity_type', '$amt')";
	// 		$query = $this->db->conn->prepare($sql);
	// 		//$query->bindValue(":E_id", $E_id);
	// 		$query->bindValue(":serial", $serial);
	// 		$query->bindValue(":auditee", $rowaud);
	// 		$query->bindValue(":Irregularity_type", $Irregularity_type);
	// 		$query->bindValue(":amt", $amt);
	// 		// $query->bindValue(":total", $total);
	// 		// $query->bindValue(":auditee", $auditee);
	// 		// $query->bindValue(":sub", $sub);
	// 		// $query->bindValue(":Description", $Description);
	// 		$result = $query->execute();
	// 	}
	// 	if ($result) {
	// 		header("location: Quarter_summary.php");
	// 		$msg['su'] = '<p class="text-success"><strong>Success! </strong>Data Inserted.</p>';
	// 	} else {
	// 		$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Insert!</p>';
	// 	}
	// 	if (!empty($msg)) {
	// 		return $msg;
	// 	}
	// }

	//NEW 2 QUARTER SUMMARY

	public function add_quarter_summary()
	{
		//$E_id	 	= $_POST['E_id'];
		// $serial = $_POST['serial'];
		$serial = substr(str_shuffle("0123456789abcdefghijklmnopqrstvwxyz"), 0, 6);

		$auditee 			= $_POST['auditee'];
		$Irregularity_type 	= $_POST['Irregularity_type'];
		$amt 	= $_POST['amt'];
		// $total 	= $_POST['total'];
		

		
		if ($serial == "") {
			$msg['serial'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
			}
		if ($auditee == "") {
			$msg['auditee'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if ($Irregularity_type == "") {
			$msg['Irregularity_type'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if ($amt== "") {
			$msg['amt'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		// if ($total == "") {
		// 	$msg['total'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		// }
		
		if (!empty($msg)) {
			return $msg;
		}
		
			$sql = "INSERT INTO quarter_summary ( serial, auditee, Irregularity_type, amt) VALUES ('$serial', '$auditee', '$Irregularity_type', '$amt')";
			$query = $this->db->conn->prepare($sql);
			//$query->bindValue(":E_id", $E_id);
			$query->bindValue(":serial", $serial);
			$query->bindValue(":auditee", $auditee);
			$query->bindValue(":Irregularity_type", $Irregularity_type);
			$query->bindValue(":amt", $amt);
			// $query->bindValue(":total", $total);
			// $query->bindValue(":auditee", $auditee);
			// $query->bindValue(":sub", $sub);
			// $query->bindValue(":Description", $Description);
			$result = $query->execute();
		
		if ($result) {
			header("location: Quarter_summary.php");
			$msg['su'] = '<p class="text-success"><strong>Success! </strong>Data Inserted.</p>';
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Insert!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}
	}







	//Quarter Plan which is created by Team Manager
	public function quarter_tm_plan()
	{


		$a_id	 		= $_POST['a_id'];
		$audit_type	 		= $_POST['audit_type'];
		$auditee		= $_POST['auditee'];
		// $Quantity 			= $_POST['Quantity'];
		$Quarter_number 			= $_POST['Quarter_number'];

		if ($a_id == "") {
			$msg['a_id'] = '<p class="text-danger"><strong>Error! </strong>Field name must not be empty!</p>';
		}
		if ($audit_type == "") {
			$msg['audit_type'] = '<p class="text-danger"><strong>Error! </strong>Field name must not be empty!</p>';
		}
		if ($auditee == "") {
			$msg['auditee'] = '<p class="text-danger"><strong>Error! </strong>Field name must not be empty!</p>';
		}

		if ($Quarter_number == "") {
			$msg['Quarter_number'] = '<p class="text-danger"><strong>Error! </strong>Field name must not be empty!</p>';
		}

		if (!empty($msg)) {
			return $msg;
		}

		$sql = "INSERT INTO quarter_plan (a_id, audit_type, auditee, Quarter_number ) VALUES ( :a_id, :audit_type,:auditee, :Quarter_number)";
		$query = $this->db->conn->prepare($sql);

		$query->bindValue(":a_id", $a_id);
		$query->bindValue(":audit_type", $audit_type);
		$query->bindValue(":auditee", $auditee);
		$query->bindValue(":Quarter_number", $Quarter_number);
		// $query->bindValue(":Year", $Year);

		$result = $query->execute();
		if ($result) {
			$msg['su'] = '<p class="text-success"><strong>Success! </strong>Data Inserted.</p>';
			header("Location: view_quarterplan.php");
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Insert!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}
	}

	//monthly plan
	public function monthly_tm_plan($data)
	{

		$q_id	 		= $data['q_id'];
		// $audit_type	 		= $data['audit_type'];
		// $auditee	 		= $data['auditee'];
		$s_id 		= $data['s_id'];
		$e_id 			= $data['e_id'];


		if ($q_id == "") {
			$msg['q_id'] = '<p class="text-danger"><strong>Error! </strong>Field must have some value or must not be empty!</p>';
		}
		// if ($audit_type == "") {
		// 	$msg['audit_type'] = '<p class="text-danger"><strong>Error! </strong>Field name must not be empty!</p>';
		// }
		// if ($auditee == "") {
		// 	$msg['auditee'] = '<p class="text-danger"><strong>Error! </strong>Field name must not be empty!</p>';
		// }

		if ($s_id == "") {
			$msg['s_id'] = '<p class="text-danger"><strong>Error! </strong>Field must have some value or must not be empty!</p>';
		}
		if ($e_id == "") {
			$msg['e_id'] = '<p class="text-danger"><strong>Error! </strong>Field must have some value or must not be empty!</p>';
		}

		if (!empty($msg)) {
			return $msg;
		}

		$sql = "INSERT INTO monthly_plan (q_id, s_id, e_id ) VALUES ( :q_id, :s_id, :e_id)";
		$query = $this->db->conn->prepare($sql);

		$query->bindValue(":q_id", $q_id);
		// $query->bindValue(":audit_type", $audit_type);
		// $query->bindValue(":auditee", $auditee);
		$query->bindValue(":s_id", $s_id);
		$query->bindValue(":e_id", $e_id);

		$result = $query->execute();
		if ($result) {
			$msg['su'] = '<p class="text-success"><strong>Success! </strong>Data Inserted.</p>';
			header("location: view_monthlyplan.php");
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Insert!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}
	}


	//Risk Registration	
	public function risk_reg()
	{


		$Business_objective	 	= $_POST['Business_objective'];
		$Business_owner	= $_POST['Business_owner'];
		$Risk_list = $_POST['Risk_list'];
		$Likely_hood = $_POST['Likely_hood'];
		$Risk_level = $_POST['Risk_level'];
		$Impact_description = $_POST['Impact_description'];
		// $Control_list = $_POST['Control_list'];
		// $Rectification = $_POST['Rectification'];




		if ($Business_objective == "") {
			$msg['Business_objective'] = '<p class="text-danger"><strong>Error! </strong>Business objective must not be empty!</p>';
		}
		if ($Business_owner == "") {
			$msg['Business_owner'] = '<p class="text-danger"><strong>Error! </strong>Mention business owner!</p>';
		}
		if ($Risk_list == "") {
			$msg['Risk_list'] = '<p class="text-danger"><strong>Error! </strong>Select Risk List!</p>';
		}
		if ($Likely_hood == "") {
			$msg['Likely_hood'] = '<p class="text-danger"><strong>Error! </strong>Likely hood must not be empty!</p>';
		}
		if ($Risk_level == "") {
			$msg['Risk_level'] = '<p class="text-danger"><strong>Error! </strong>Field name must not be empty!</p>';
		}
		if ($Impact_description == "") {
			$msg['Impact_description'] = '<p class="text-danger"><strong>Error! </strong>Field name must not be empty!</p>';
		}


		if (!empty($msg)) {
			return $msg;
		}

		$sql = "INSERT INTO risk_registration (Business_objective, Business_owner, Risk_list, Likely_hood, Risk_level, Impact_description) VALUES ( :Business_objective, :Business_owner, :Risk_list, :Likely_hood, :Risk_level, :Impact_description)";
		$query = $this->db->conn->prepare($sql);

		$query->bindValue(":Business_objective", $Business_objective);
		$query->bindValue(":Business_owner", $Business_owner);
		$query->bindValue(":Risk_list", $Risk_list);
		$query->bindValue(":Likely_hood", $Likely_hood);
		$query->bindValue(":Risk_level", $Risk_level);
		$query->bindValue(":Impact_description", $Impact_description);

		$result = $query->execute();
		if ($result) {
			// $msg['su'] = '<p class="text-success"><strong>Success! </strong>Data Inserted.</p>';
			header("Location: view_risk_reg.php");
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Insert!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}
	}
	//Policy Registration	
	public function reg_pp()
	{


		$document_name	 	= $_POST['document_name'];
		$application_area	= $_POST['application_area'];
		// $main_number = $_POST['main_number'];
		// $sub_number = $_POST['sub_number'];
		$description = $_POST['description'];





		if ($document_name == "") {
			$msg['document_name'] = '<p class="text-danger"><strong>Error! </strong>Business objective must not be empty!</p>';
		}
		if ($application_area == "") {
			$msg['application_area'] = '<p class="text-danger"><strong>Error! </strong>Mention business owner!</p>';
		}
		// if ($main_number == "") {
		// 	$msg['main_number'] = '<p class="text-danger"><strong>Error! </strong>Select Risk List!</p>';
		// }
		// if ($sub_number == "") {
		// 	$msg['sub_number'] = '<p class="text-danger"><strong>Error! </strong>Likely hood must not be empty!</p>';
		// }

		if ($description == "") {
			$msg['description'] = '<p class="text-danger"><strong>Error! </strong>Field name must not be empty!</p>';
		}


		if (!empty($msg)) {
			return $msg;
		}

		$sql = "INSERT INTO policy_procedure (document_name, application_area,  description) VALUES ( :document_name, :application_area, :description)";
		$query = $this->db->conn->prepare($sql);

		$query->bindValue(":document_name", $document_name);
		$query->bindValue(":application_area", $application_area);
		// $query->bindValue(":main_number", $main_number);
		// $query->bindValue(":sub_number", $sub_number);
		$query->bindValue(":description", $description);
		$result = $query->execute();
		if ($result) {
			// $msg['su'] = '<p class="text-success"><strong>Success! </strong>Data Inserted.</p>';
			header("Location: policy_procedure.php");
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Insert!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}
	}
	//Supporting Docs
	public function supporting_docs()
	{


		$f_id	 	= $_POST['f_id'];
		$document_name	 	= $_POST['document_name'];
		$description = $_POST['description'];
		$auditor_name	= $_POST['auditor_name'];
		$upload_time = $_POST['upload_time'];


		if ($document_name == "") {
			$msg['document_name'] = '<p class="text-danger"><strong>Error! </strong>Business objective must not be empty!</p>';
		}
		if ($f_id == "") {
			$msg['f_id'] = '<p class="text-danger"><strong>Error! </strong>Business objective must not be empty!</p>';
		}
		if ($description == "") {
			$msg['description'] = '<p class="text-danger"><strong>Error! </strong>Field name must not be empty!</p>';
		}
		if ($auditor_name == "") {
			$msg['auditor_name'] = '<p class="text-danger"><strong>Error! </strong>Mention business owner!</p>';
		}
		if ($upload_time == "") {
			$msg['upload_time'] = '<p class="text-danger"><strong>Error! </strong>Select Risk List!</p>';
		}

		if (!empty($msg)) {
			return $msg;
		}

		$sql = "INSERT INTO supporting_doc(f_id, document_name, description, auditor_name, upload_time  ) VALUES ( :f_id, :document_name, :description, :auditor_name, :upload_time)";
		$query = $this->db->conn->prepare($sql);

		$query->bindValue(":f_id", $f_id);
		$query->bindValue(":document_name", $document_name);
		$query->bindValue(":description", $description);
		$query->bindValue(":auditor_name", $auditor_name);
		$query->bindValue(":upload_time", $upload_time);
		// $query->bindValue(":sub_number", $sub_number);

		$result = $query->execute();
		if ($result) {
			// $msg['su'] = '<p class="text-success"><strong>Success! </strong>Data Inserted.</p>';
			header("Location: supporting_doc.php");
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Insert!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}
	}
	//Risk Control
	public function risk_cont()
	{


		// $Risk_code	 	= $_POST['Risk_code'];
		$Risk_code = substr(str_shuffle("0123456789abcdefghijklmnopqrstvwxyz"), 0, 6);
		$Control_name	= $_POST['Control_name'];
		$Control_description = $_POST['Control_description'];
		$Control_objectives = $_POST['Control_objectives'];
		$Imp_criteria = $_POST['Imp_criteria'];
		$Imp_area = $_POST['Imp_area'];
		$Document = $_POST['Document'];




		// if ($Risk_code == "") {
		// 	$msg['Risk_code'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		// }
		if ($Control_name == "") {
			$msg['Control_name'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if ($Control_description == "") {
			$msg['Control_description'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if ($Control_objectives == "") {
			$msg['Control_objectives'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if ($Imp_criteria == "") {
			$msg['Imp_criteria'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if ($Imp_area == "") {
			$msg['Imp_area'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}
		if ($Document == "") {
			$msg['Document'] = '<p class="text-danger"><strong>Error! </strong>Field must not be empty!</p>';
		}

		if (!empty($msg)) {
			return $msg;
		}

		$sql = "INSERT INTO risk_control (Control_name, Control_description, Control_objectives, Imp_criteria, Imp_area, Document) VALUES ( :Control_name, :Control_description, :Control_objectives,:Imp_criteria, :Imp_area, :Document)";
		$query = $this->db->conn->prepare($sql);

		// $query->bindValue(":Risk_code", $Risk_code);
		$query->bindValue(":Control_name", $Control_name);
		$query->bindValue(":Control_description", $Control_description);
		$query->bindValue(":Control_objectives", $Control_objectives);
		$query->bindValue(":Imp_criteria", $Imp_criteria);
		$query->bindValue(":Imp_area", $Imp_area);
		$query->bindValue(":Document", $Document);

		$result = $query->execute();
		if ($result) {
			$msg['su'] = '<p class="text-success"><strong>Success! </strong>Data Inserted.</p>';
		} else {
			$msg['su'] = '<p class="text-danger"><strong>Error! </strong>Data Not Insert!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}
	}

	public function auditor_acc($data)
	{
		$id 			= $data['id'];
		$First_name	 	= $data['First_name'];
		$Last_name	 	= $data['Last_name'];
		$Role	= $data['Role'];
		$Office	= $data['Office'];

		$sql = "INSERT INTO auditor_acc (ID, First_name, Last_name, Role, Office ) VALUES (:ID, :First_name, :Last_name, :Role, :Office )";
		$query = $this->db->conn->prepare($sql);
		$query->bindValue(":id", $id);
		$query->bindValue(":First_name", $First_name);
		$query->bindValue(":Last_name", $Last_name);
		$query->bindValue(":Role", $Role);

		$result = $query->execute();
	}
	//View annual plan
	public function annual_plan()
	{
		$sql = "SELECT FROM annual_plan";
		$query = $this->db->conn->prepare($sql);
		$query->execute();
		$result = $query->fetchAll();
		return $result;
	}
	//Edit Field
	public function edit_task($data)
	{
		$id 			= $data['id'];
		$employee_id	= $data['employee_id'];
		$task_name	 	= $data['task_name'];
		$task_details	= $data['task_details'];
		$start_date 	= date('Y-m-d', strtotime($data['start_date']));
		$end_date 		= date('Y-m-d', strtotime($data['end_date']));
		$completion		= $data['completion'];
		$status			= $data['status'];

		if ($employee_id == "") {
			$msg['employee_id'] = '<p class="text-danger"><strong>Error! </strong>Name must not be empty!</p>';
		}
		if ($task_name == "") {
			$msg['task_name'] = '<p class="text-danger"><strong>Error! </strong>Field name must not be empty!</p>';
		}
		if ($status == "") {
			$msg['status'] = '<p class="text-danger"><strong>Error! </strong>Status must not be empty!</p>';
		}
		if (!empty($msg)) {
			return $msg;
		}

		$sql = "UPDATE task SET employee_id=:employee_id, task_name=:task_name, task_details=:task_details, start_date=:start_date, end_date=:end_date, completion=:completion, status=:status WHERE id=:id";
		$query = $this->db->conn->prepare($sql);
		$query->bindValue(":employee_id", $employee_id);
		$query->bindValue(":task_name", $task_name);
		$query->bindValue(":task_details", $task_details);
		$query->bindValue(":start_date", $start_date);
		$query->bindValue(":end_date", $end_date);
		$query->bindValue(":completion", $completion);
		$query->bindValue(":status", $status);
		$query->bindValue(":id", $id);
		$result = $query->execute();
		if ($result) {
			header('Location: lask-list.php');
		} else {
			$msg['error'] = '<p class="text-danger"><strong>Error! </strong>Data Not Update!</p>';
		}
	}
}

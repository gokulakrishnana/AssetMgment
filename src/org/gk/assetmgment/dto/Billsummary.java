package org.gk.assetmgment.dto;

public class Billsummary {

	int BillId;
	int LeaseId;
	String LeaseDeed;
	String BillDate;
	String BillMonth;
	double LeaseAmt;
	double ElectricityCharge;
	double WaterCharge;
	double MiscCharge1;
	String MiscCharge1comm;
	double MiscCharge2;
	String MiscCharge2comm;
	double MiscCharge3;
	String MiscCharge3comm;
	double FineAmt;
	String FineAmtcomm;
	double TotalAmt;
	String PaidStatus;
	String TenantName;
	
	
	public String getTenantName() {
		return TenantName;
	}
	public void setTenantName(String tenantName) {
		TenantName = tenantName;
	}
	public int getBillId() {
		return BillId;
	}
	public void setBillId(int billId) {
		BillId = billId;
	}
	public int getLeaseId() {
		return LeaseId;
	}
	public void setLeaseId(int leaseId) {
		LeaseId = leaseId;
	}
	public String getLeaseDeed() {
		return LeaseDeed;
	}
	public void setLeaseDeed(String leaseDeed) {
		LeaseDeed = leaseDeed;
	}
	public String getBillDate() {
		return BillDate;
	}
	public void setBillDate(String billDate) {
		BillDate = billDate;
	}
	public String getBillMonth() {
		return BillMonth;
	}
	public void setBillMonth(String billMonth) {
		BillMonth = billMonth;
	}
	public double getLeaseAmt() {
		return LeaseAmt;
	}
	public void setLeaseAmt(double leaseAmt) {
		LeaseAmt = leaseAmt;
	}
	public double getElectricityCharge() {
		return ElectricityCharge;
	}
	public void setElectricityCharge(double electricityCharge) {
		ElectricityCharge = electricityCharge;
	}
	public double getWaterCharge() {
		return WaterCharge;
	}
	public void setWaterCharge(double waterCharge) {
		WaterCharge = waterCharge;
	}
	public double getMiscCharge1() {
		return MiscCharge1;
	}
	public void setMiscCharge1(double miscCharge1) {
		MiscCharge1 = miscCharge1;
	}
	public String getMiscCharge1comm() {
		return MiscCharge1comm;
	}
	public void setMiscCharge1comm(String miscCharge1comm) {
		MiscCharge1comm = miscCharge1comm;
	}
	public double getMiscCharge2() {
		return MiscCharge2;
	}
	public void setMiscCharge2(double miscCharge2) {
		MiscCharge2 = miscCharge2;
	}
	public String getMiscCharge2comm() {
		return MiscCharge2comm;
	}
	public void setMiscCharge2comm(String miscCharge2comm) {
		MiscCharge2comm = miscCharge2comm;
	}
	public double getMiscCharge3() {
		return MiscCharge3;
	}
	public void setMiscCharge3(double miscCharge3) {
		MiscCharge3 = miscCharge3;
	}
	public String getMiscCharge3comm() {
		return MiscCharge3comm;
	}
	public void setMiscCharge3comm(String miscCharge3comm) {
		MiscCharge3comm = miscCharge3comm;
	}
	public double getFineAmt() {
		return FineAmt;
	}
	public void setFineAmt(double fineAmt) {
		FineAmt = fineAmt;
	}
	public String getFineAmtcomm() {
		return FineAmtcomm;
	}
	public void setFineAmtcomm(String fineAmtcomm) {
		FineAmtcomm = fineAmtcomm;
	}
	public double getTotalAmt() {
		
		TotalAmt = this.LeaseAmt + this.ElectricityCharge +this.WaterCharge+this.MiscCharge1+this.MiscCharge2+this.MiscCharge3+this.FineAmt;
		return TotalAmt;
	}
	public void setTotalAmt(double totalAmt) {
		TotalAmt = totalAmt;
	}
	public String getPaidStatus() {
		return PaidStatus;
	}
	public void setPaidStatus(String paidStatus) {
		PaidStatus = paidStatus;
	}
	
	
}


package org.gk.assetmgment.dto;

import java.text.DecimalFormat;
import java.util.Calendar;

public class LeaseDeedDetails {
	
	private int DeedId;
	private String leaseNumber;
	private String leaseLandLordName;
	private String leaseTenant1Name;
	private String leaseTenant2Name;
	private String leaseTenant3Name;
	private String leaseEndDate;
	private String leaseStartDate;
	private String leaseTerminationDate;
	private String leaseStatus;
	private float leaseDeedAmt;
	
	
	
	
	public float getLeaseDeedAmt() {
		return leaseDeedAmt;
	}
	public void setLeaseDeedAmt(float leaseDeedAmt) {
		this.leaseDeedAmt = leaseDeedAmt;
	}
	public int getDeedId() {
		return DeedId;
	}
	public void setDeedId(int deedId) {
		DeedId = deedId;
	}
	public String getLeaseNumber() {
		return leaseNumber;
	}
	public void setLeaseNumber(String leaseNumber) {
		this.leaseNumber = leaseNumber;
	}
	public String getLeaseLandLordName() {
		return leaseLandLordName;
	}
	public void setLeaseLandLordName(String leaseLandLordName) {
		this.leaseLandLordName = leaseLandLordName;
	}
	public String getLeaseTenant1Name() {
		return leaseTenant1Name;
	}
	public void setLeaseTenant1Name(String leaseTenant1Name) {
		this.leaseTenant1Name = leaseTenant1Name;
	}
	public String getLeaseTenant2Name() {
		return leaseTenant2Name;
	}
	public void setLeaseTenant2Name(String leaseTenant2Name) {
		this.leaseTenant2Name = leaseTenant2Name;
	}
	public String getLeaseTenant3Name() {
		return leaseTenant3Name;
	}
	public void setLeaseTenant3Name(String leaseTenant3Name) {
		this.leaseTenant3Name = leaseTenant3Name;
	}
	public String getLeaseEndDate() {
		return leaseEndDate;
	}
	public void setLeaseEndDate(String leaseEndDate) {
		this.leaseEndDate = leaseEndDate;
	}
	public String getLeaseStartDate() {
		return leaseStartDate;
	}
	public void setLeaseStartDate(String leaseStartDate) {
		this.leaseStartDate = leaseStartDate;
	}
	public String getLeaseTerminationDate() {
		return leaseTerminationDate;
	}
	public void setLeaseTerminationDate(String leaseTerminationDate) {
		this.leaseTerminationDate = leaseTerminationDate;
	}
	public String getLeaseStatus() {
		return leaseStatus;
	}
	public void setLeaseStatus(String leaseStatus) {
		this.leaseStatus = leaseStatus;
	}
}

package org.gk.assetmgment.services;

public class Addassetauthservice {

	private int pinCode;
	
	public boolean Addassetauthservice (String pincode){
		
		try{
			pinCode = Integer.parseInt(pincode);
			return true;
		}
		catch (NumberFormatException e){
			return false;
		}

	}
	
}


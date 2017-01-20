package com.crab.param;

public class NorConst {

	// ��������
	public enum CART_TYPE  
	{  		 
	        ONLINE_CLASS(1),
	        DOC(2);	        
		
	        private int value; 
			CART_TYPE(int value) {
	            this.value = value;
	        }
	        public int getValue() {
	            return value;
	        } 
	};	
	
	// ����״̬
	public enum CART_STATUS  
	{  		 
	        NO_PAY(0),
	        PAY_SUCCESS(1);
	        
	        private int value; 
	        CART_STATUS(int value) {
	            this.value = value;
	        }
	        public int getValue() {
	            return value;
	        } 
	};	
	
	// �������
	public enum NEWS_TYPE  
	{  		 
	        WAVE12(1),
	        Industry(2);
	        
	        private int value; 
	        NEWS_TYPE(int value) {
	            this.value = value;
	        }
	        public int getValue() {
	            return value;
	        } 
	};	
	
	// �ĵ�״̬
	public enum DOC_STATUS  
	{  		 
	        NO_CHECK(0),
	        PASS(1);
	        
	        private int value; 
	        DOC_STATUS(int value) {
	            this.value = value;
	        }
	        public int getValue() {
	            return value;
	        } 
	};	
	
}

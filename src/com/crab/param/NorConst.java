package com.crab.param;

public class NorConst {

	// 订单类型
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
	
	// 订单状态
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
	
	// 新闻类别
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
	
	// 文档状态
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

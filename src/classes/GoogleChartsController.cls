global class GoogleChartsController {

	global class eventHandler {
		public List<pieChartData> mainReasonsList            {get; Set;}        
        public Map<String, List<pieChartData>> subReasonsMap {get; Set;} 
        public eventHandler(List<pieChartData> mainReasonsList,  Map<String, List<pieChartData>> subReasonsMap) {
            this.mainReasonsList      = mainReasonsList;
            this.subReasonsMap        = subReasonsMap;
        }       
	}

	global class pieChartData {
		public String chartLabel  { get; set; }
        public Integer dataValue  { get; set; }	
        public pieChartData(String chartLabel, Integer dataValue) {
            this.chartLabel         = chartLabel;
            this.dataValue          = dataValue;
        }	
	}
	
	global class chartData {
	    public String chartLabel { get; set; }
        public Integer core      { get; set; }
        public Integer value1    { get; set; }
        public Integer value2    { get; set; }
        public Integer value3    { get; set; }
        
        public chartData(String chartLabel, Integer core, Integer value1, Integer value2, Integer value3) {
            this.chartLabel  = chartLabel;
            this.core        = core;
            this.value1      = value1;
            this.value2      = value2;
            this.value3      = value3;
        }
	} 
	
	//return data set for combo chart
	@RemoteAction   
    global static List<chartData> getProcessedDataSetForComboChart() {
    	
    	List<chartData> comboChartDataList = new List<chartData>();
		comboChartDataList.add(new chartData('2015/01',  16, 28, 60, 12));
		comboChartDataList.add(new chartData('2015/02',  80, 90,  0, 10));
		comboChartDataList.add(new chartData('2015/03', -15, 35, 15, 50));
		comboChartDataList.add(new chartData('2015/04', -60, 10, 20, 70));
		comboChartDataList.add(new chartData('2015/05',  54, 67, 20, 13));
		return comboChartDataList;
    }
    
    //return data set for column chart
	@RemoteAction   
    global static List<chartData> getProcessedDataSetForColumnChart() {
    	
    	List<chartData> columnChartDataList = new List<chartData>();
    	columnChartDataList.add(new chartData('2010', 2,  30, 40, 30));
		columnChartDataList.add(new chartData('2011', 3,  10, 20, 70));
		columnChartDataList.add(new chartData('2013', 1,  40, 10, 50));
		columnChartDataList.add(new chartData('2014', 5,  20, 60, 20));
		columnChartDataList.add(new chartData('2015', 7,  70, 10, 20));
		
		return columnChartDataList;
    }    
    
    //return data set for pie chart
    @RemoteAction   
    global static eventHandler getProcessedDataSetForEventHandler() {
    	//prepare data for main pie chart
    	List<pieChartData> mainChartDataList = new List<pieChartData>();		
		mainChartDataList.add(new pieChartData('Invoicing',  45));
		mainChartDataList.add(new pieChartData('Odering'  ,  35));
		mainChartDataList.add(new pieChartData('Pricing'  ,  20));
		
		Map<String, List<pieChartData>> pieChartMap = new Map<String, List<pieChartData>>();
		
		//prepare data for sub pie charts
		List<pieChartData> submainChartDataList1 = new List<pieChartData>();
		submainChartDataList1.add(new pieChartData('Accuracy'      ,  10));
		submainChartDataList1.add(new pieChartData('Responsiveness',  55));
		submainChartDataList1.add(new pieChartData('Completeness'  ,  25));
		submainChartDataList1.add(new pieChartData('Availability'  ,  100));
		
		List<pieChartData> submainChartDataList2 = new List<pieChartData>();
		submainChartDataList2.add(new pieChartData('Clearly specified'   ,  33));
		submainChartDataList2.add(new pieChartData('Handling complaints' ,  58));
		submainChartDataList2.add(new pieChartData('Payment terms'       ,  73));
		
		List<pieChartData> submainChartDataList3 = new List<pieChartData>();
		submainChartDataList3.add(new pieChartData('Consistency'        ,  60));
		submainChartDataList3.add(new pieChartData('Competitive pricing',  40));
		
		pieChartMap.put('Invoicing', submainChartDataList1);
		pieChartMap.put('Odering'  , submainChartDataList2);
		pieChartMap.put('Pricing'  , submainChartDataList3);
		
		eventHandler eh = new eventHandler(mainChartDataList, pieChartMap);
		
		return eh;
    }	
	
}
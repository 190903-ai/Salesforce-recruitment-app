@isTest
private class PositionManagerTest {
    public static testMethod void testAddPosition_1(){
        Id recId = PositionManager.AddPosition('Java Sr. Developer', '5+ yrs experience'); //test data (we cannot use actual data)
        Assert.isNotNull(recId);
        
     }
    
     public static testMethod void testAddPosition_2(){
        Id recId = PositionManager.AddPosition('Java Executive Developer', '5+ yrs experience'); //test data (we cannot use actual data)
        Assert.isNull(recId,'It should not create posiiton record');
     }
    
    public static void createPositions(){
        PositionManager.AddPosition('Java Developer', 'Fresher');
        PositionManager.AddPosition('Java Jr. Developer', '1+ yrs exp');
        PositionManager.AddPosition('Java Sr. Developer', '5+ yrs exp');
    }
    
    public static testMethod void testGetAllPositions(){
        createPositions();
        Integer recCnt = PositionManager.getAllPositions().size();
        Assert.areEqual(3, recCnt, 'should create 3 records');
    }
    
    public static testMethod void testGetAllPositions_2(){
        createPositions();
        Integer recCnt = PositionManager.getAllPositions().size();
        Assert.areNotEqual(5, recCnt, 'should not create 5 records');
    }
    
    public static testMethod void testGetAllPositions_3(){
        createPositions();
        Integer recCnt = PositionManager.getAllPositions().size();
        Assert.areNotEqual(0, recCnt, 'should create 3 records');
    }
}
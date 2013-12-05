/**
 * 取引先の新規・編集
 * © 2013 Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
@isTest
private class AccountEditControllerTest {

    /**
     * コンストラクタ テスト
     */
    static testMethod void AccountEditControllerTest() {
        
        Test.startTest();
        
        AccountEditController cls = new AccountEditController(new ApexPages.StandardController(new Account()));
        
        Test.stopTest();
    }
    
    /**
     * 次へボタン処理 テスト
     */
    static testMethod void doNextTest() {
        
        Test.startTest();
        
        AccountEditController cls = new AccountEditController(new ApexPages.StandardController(new Account()));
        cls.doNext();
        
        Test.stopTest();
    }
    
    /**
     * 保存ボタン処理 テスト
     */
    static testMethod void doSaveTest() {
        
        Test.startTest();
        
        AccountEditController cls = new AccountEditController(new ApexPages.StandardController(new Account()));
        cls.account.Name = 'Account Name';
        cls.doSave();
        
        Test.stopTest();
    }
}
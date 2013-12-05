/**
 * 取引先の新規・編集
 * © 2013 Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
public with sharing class AccountEditController {
    
    private Map<String, RecordType> recordTypeMap = new Map<String, RecordType>();
    private RecordType recordType {get; set;}
    
    public Account account {get; set;}
    public String recordTypeId {get; set;}
    public List<SelectOption> recordTypeItems {get; set;}
    
    /**
     * コンストラクタ
     */
    public AccountEditController(ApexPages.StandardController controller) {
    
        this.account = new Account();
        
        List<RecordType> recordTypes = [SELECT Id, Name FROM RecordType WHERE SobjectType = 'Account' ORDER BY Name ASC LIMIT 50];
        
        for (RecordType r : recordTypes) {
            this.recordTypeMap.put(r.Id, r);
        }
        
        this.recordTypeItems = getRecordTypeItems(recordTypes);
        this.recordTypeId = this.recordTypeItems[0].getValue();
    }
    
    /**
     * 取引先のレコードタイプ情報取得
     */
    private List<SelectOption> getRecordTypeItems(List<RecordType> recordTypes) {
        
        List<SelectOption> options = new List<SelectOption>();
        
        for (RecordType r : recordTypes) {
            options.add(new SelectOption(String.valueOf(r.Id), r.Name)); 
        }
        
        return options; 
    }
    
    /**
     * 次へボタン処理
     */
    public PageReference doNext() {
        
        if(this.recordTypeMap.containskey(this.recordTypeId)) {
            this.recordType = this.recordTypeMap.get(this.recordTypeId);
            this.account.RecordTypeId = this.recordType.Id;
        }
        
        return Page.AccountEdit.setRedirect(false);
    }
    
    /**
     * 保存ボタン処理
     */
    public PageReference doSave() {
        
        upsert this.account;
        
        return new PageReference('/' + this.account.Id);
    }
}
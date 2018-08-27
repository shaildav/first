global class newurlPolicyCondition implements TxnSecurity.PolicyCondition {

 public boolean evaluate(TxnSecurity.Event e) {
LoginHistory eObj = [SELECT ApiType FROM LoginHistory WHERE Id = :e.data.get('LoginHistoryId')];
  if(eObj.ApiType == 'besupercarefulwiththis') {
   return true;
 }

 return false; 
}
 }
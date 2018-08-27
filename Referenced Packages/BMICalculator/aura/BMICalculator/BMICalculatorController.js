({
	calculateBMI : function(cmp, event, helper) {
		var weight = cmp.find("weight").get("v.value");
		var heightFeet = cmp.find("heightFeet").get("v.value");
		var heightInch = cmp.find("heightInch").get("v.value");
		var height = heightFeet * 12 + +heightInch;
		helper.getBMIValue(cmp, weight, heightFeet, heightInch);
	}
})
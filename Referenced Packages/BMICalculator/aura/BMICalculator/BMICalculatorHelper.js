({
	getBMIValue : function(cmp, weight, heightFeet, heightInch) {
		this.clear(cmp);
        var errorText = this.validateBMIHeightValue(cmp, heightFeet, heightInch);
        if (errorText != "") {
			cmp.find("errorMsg").set("v.value", errorText);
			return;
		}
        var height = heightFeet * 12 + +heightInch;
        errorText = this.validateBMIValue(weight, height);
		if (errorText != "") {
			cmp.find("errorMsg").set("v.value", errorText);
			return;
		}
        
		var bmiValue = (Math.round((weight / (height * height)) * 703.06957964)),
			resultValue = cmp.find("resultValue"),
			resultCaption = cmp.find("resultCaption"),
			resultCategoryValue = cmp.find("resultCategoryValue");

		cmp.find("resultText").set("v.value", "BMI value is ");
		resultValue.set("v.value", bmiValue);
		cmp.find("resultCategoryTextStart").set("v.value"," indicating weight is in ");
		resultCategoryValue.set("v.value", this.getBMIDesc(bmiValue));
		cmp.find("resultCategoryTextEnd").set("v.value"," category for adults of similar height.");
		resultCaption.set("v.value", "Eat well and Stay Healthy!");

		if (this.getBMIDesc(bmiValue) === "normal") {
			$A.util.removeClass(resultValue, "resultNegative");
			$A.util.addClass(resultValue, "resultPositive");
			$A.util.removeClass(resultCategoryValue, "resultNegative");
			$A.util.addClass(resultCategoryValue, "resultPositive");
		} else {
			$A.util.removeClass(resultValue, "resultPositive");
			$A.util.addClass(resultValue, "resultNegative");
			$A.util.removeClass(resultCategoryValue, "resultPositive");
			$A.util.addClass(resultCategoryValue, "resultNegative");
		}
		$A.util.addClass(resultCaption, "resultCaption");
	},

	getBMIDesc : function(value) {
		var desc = "";
		if (value < 18.5)
			desc = "underweight";
		else if (value >= 18.5 && value <= 24.99)
			desc = "normal";
		else if (value >= 25 && value <= 29.99)
			desc = "overweight";
		else if (value >= 30 && value <= 39.99)
			desc = "obese";
		else if (value >= 40)
			desc = "morbidly obese";
		else
			desc = "Please check your input values, BMI cannot be calculated.";
		return desc;
	},

	/* Error Handling  for invalid data entered*/
	validateBMIValue : function(weight, height) {
		var errorText = "";
		if (weight === undefined || (weight === "") || isNaN(weight)) {
			errorText = "Please enter a valid value for weight.";
			return errorText;
		}
        if (height === undefined || (height === "") || isNaN(height)) {
			errorText = "Please enter a valid value for height.";
			return errorText;
		}
		if (weight <= 0)
			errorText = "Please enter a positive value for weight.";
		else if ((weight > 0 && weight < 30) || (height >= 0 && height < 36))
			errorText = "This BMI calculator is for adult. Inputted weight/height ratio indicates it is of child. Please try again with valid values.";
		return errorText;
	},
    
    /* Error Handling  for invalid height*/
	validateBMIHeightValue : function(cmp, heightFeet, heightInch) {
       
		var errorText = "";
        if (heightFeet === undefined || (heightFeet === "") || isNaN(heightFeet) ) {
			errorText = "Please enter a valid value for height.";
			return errorText;
		}
        if (heightInch === undefined || (heightInch === "") || isNaN(heightInch)) {
			errorText = "Please enter a valid value for height.";
			return errorText;
		}
        
        if (heightFeet <= 0 || heightInch <= 0) {
			errorText = "Please enter a positive value for height.";
        }
        
        if (heightInch > 11) {
			errorText = "Please do not enter a value for height inches greater than 11.";
        }
        
        if (heightFeet > 8) {
			errorText = "Please do not enter a value for height feet greater than 8.";
        }
		return errorText;
	},

	/* Clears value for cmp elements */
	clear : function(cmp) {
		cmp.find("errorMsg").set("v.value", "");
		cmp.find("resultText").set("v.value", "");
		cmp.find("resultValue").set("v.value", "");
		cmp.find("resultCaption").set("v.value", "");
		cmp.find("resultCategoryValue").set("v.value", "");
		cmp.find("resultCategoryTextStart").set("v.value", "");
		cmp.find("resultCategoryTextEnd").set("v.value", "");
	}
})
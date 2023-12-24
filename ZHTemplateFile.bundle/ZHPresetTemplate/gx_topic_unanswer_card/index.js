function main(data){

	var answerCount = data.target.answer_count
	var followerCount = data.target.follower_count

	var resultText = ""
	var separator =  "·"
	var stringQuestionId = ""

	 if(answerCount > 0){
	  var afterAnswerCount = ""
	  if(ZHPlatform == "Android"){
	  	 afterAnswerCount = ZHJSUtil.getInteractFormatNumberThree(answerCount.toString(), "false", "true")
	  }else{
	  	 afterAnswerCount = ZHJSUtil.getInteractFormatNumber(answerCount.toString())
	  }
		resultText = resultText + afterAnswerCount
		resultText = resultText + "回答"
	  }
	if (answerCount > 0 && followerCount > 0) {
		 resultText = resultText+ " "
		 resultText = resultText+ separator
	}
	if (followerCount > 0) {
		var afterFollowerCount = ZHJSUtil.getInteractFormatNumber(followerCount.toString())
		resultText = resultText+ afterFollowerCount
		resultText = resultText+ "关注"
	}



	var bageLabeOne = ""
	var bageLabeTwo = ""

	var author = data.target.author

	var badges =  author.badge
	var badgeV2 =  author.badge_v2


	var drawableList = new Array()

	var isIdentity = false

	if(badgeV2 && badgeV2.merged_badges && badgeV2.merged_badges.length > 0){

		var detailMergedBadges = badgeV2.merged_badges

		for (var i in detailMergedBadges) {

			var type = detailMergedBadges[i].type

			 if("identity" == type){
				 drawableList[i] = "zhtemplate_badge_blue_14"
			 }else if("best" == type || "best_answerer" == type ){
				 drawableList[i]  = "zhtemplate_badge_yellow_14"
			 }else if("reward" == type){
				 drawableList[i] = "zhtemplate_badge_reward"
			 }
		}

	}else {
		 if (badges && badges.length > 0) {
			 for (var i in badges) {
			 	var type = badges[i].type
				if("best" == type || "best_answerer" == type ){
                    drawableList.unshift("zhtemplate_badge_yellow_14")
				}else if("identity" == type){
					 isIdentity = true
			 		 drawableList[i] = "zhtemplate_badge_blue_14"
			 	 }else if("reward" == type){
			 		 drawableList[i] = "zhtemplate_badge_reward"
			 	 }
			 }
		 }

	}

	if(!isIdentity && isZhihuVirtualAccount(author.id)){
		drawableList[0] = "zhtemplate_badge_blue_14"
	}

	if(drawableList.length > 0){
		if(drawableList.length  == 1){
			bageLabeOne = "local:" + drawableList[0]
		}else {
			bageLabeOne = "local:" + drawableList[0]
			bageLabeTwo = "local:" + drawableList[1]
		}
	}

	data.bage_labe_one = bageLabeOne
	data.bage_labe_two = bageLabeTwo
	data.answer_follower_count = resultText
	stringQuestionId = data.target.id + ""

	return {...data, answer_follower_count: resultText,bage_labe_one:bageLabeOne,bage_labe_two:bageLabeTwo,string_question_id:stringQuestionId}

}

function isZhihuVirtualAccount(id) {
	try {
	    if(parseInt(id) < 0){
	    	 return true
	    }
	}catch(err) {

	}
    return false
}
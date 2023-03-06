if(isActive){
	image_alpha = 1;
}else{
	image_alpha = .08;
}

if(isActive){
	if(time >= timeMax){
		isActive = false;
		time = 0;
	}else{
		time++;
	}
}else if(!isActive){
	if(time >= timeMaxOff){
		isActive = true;
		time = 0;
	}else{
		time++;
	}
}
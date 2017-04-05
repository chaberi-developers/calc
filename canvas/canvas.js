window.onload = function(){
	var canvas = document.getElementById('sketcharea');
	if(canvas && canvas.getContext){
		var ctx = canvas.getContext('2d');
		ctx.fillStyle= '#ABC';
		ctx.fillRect(10,20,30,40);
	}
}
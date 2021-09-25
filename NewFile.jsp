<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>背景</title>
   <style type="text/css">
			body{
				margin: 0;
			}
			#canvas{
				display: block;
				background: #000;
				margin: 0 auto;
			}
		</style>
	</head>
	<body>

		<canvas id="canvas"></canvas>
		<script>
			function Starry(){
				this.cxt=canvas.getContext("2d");
				canvas.width=window.innerWidth;
				canvas.height=window.innerHeight;
				this.cW=canvas.width;
				this.cH=canvas.height;
				this.num=200;
				this.data=[];
			}
			Starry.prototype={
				init: function(){
					for (var i=0;i<this.num;i++) {
						this.data[i]={
							x:Math.random()*this.cW,
							y:Math.random()*this.cH,
							cX:Math.random()*0.6-0.3,
							cY:Math.random()*0.6-0.3
						};
						this.drawCircle(this.data[i].x,this.data[i].y);
					}
					
				},
				drawCircle: function(x,y){
					var cxt=canvas.getContext("2d");
					cxt.save();//保存路径
					cxt.fillStyle="pink";
					cxt.beginPath();//开始路径
					cxt.arc(x,y,1,0,Math.PI*2,false);
					cxt.closePath();//结束路径
					cxt.fill();//填充方法
					cxt.restore();//释放路径
				},
				drawLine: function(x1,y1,x2,y2){
					var cxt=this.cxt;
					var color=cxt.createLinearGradient(x1,y1,x2,y2);
					color.addColorStop(0,"yellow");
					color.addColorStop(1,"green");
					cxt.save();
					cxt.strokeStyle=color;
					cxt.beginPath();//开始路径
					cxt.moveTo(x1,y1);
					cxt.lineTo(x2,y2);
					cxt.closePath();//结束路径
					cxt.stroke();//填充方法
					cxt.restore();//释放路径
					
				},
				moveCircle: function(){
					var self=this;
					self.cxt.clearRect(0,0,self.cW,self.cH);
					for(var i=0;i<self.num;i++){
						self.data[i].x+=self.data[i].cX;
						self.data[i].y+=self.data[i].cY;
						if(self.data[i].x>self.cW||self.data[i].x<0){
							self.data[i].cX=-self.data[i].cX;
						}
						if(self.data[i].x>self.cH||self.data[i].y<0){
							self.data[i].cY=-self.data[i].cY;
						}
						this.drawCircle(self.data[i].x,self.data[i].y);
						for(var j=i+1;j<self.num;j++){
							if(Math.pow(self.data[i].x-self.data[j].x,2)
							+Math.pow(self.data[i].y-self.data[j].y,2)
							<=50*50){
								self.drawLine(self.data[i].x,self.data[i].y,
									self.data[j].x,self.data[j].y);
							}
						}
					}
				}
			}
			var starry=new Starry();
			starry.init();
			setInterval(function(){starry.moveCircle();},1);
		</script>
	</body>
</html>


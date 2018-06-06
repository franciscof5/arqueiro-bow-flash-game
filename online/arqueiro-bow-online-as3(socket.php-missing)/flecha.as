package   
{  
                import flash.display.MovieClip;  
//FALTA REBATER NA PARTE DE CIMA E IMPLODIR
public class flecha extends MovieClip {
	// o que tiver $ na frente do comentário pode ser mudado com itens
	
	var rotationFlecha; // essa é passada da função que constrói a flecha
	var bool = false;
	var xdestino:Number;
	var ydestino:Number;
	var yym:Number = 2; //xxm é y-ymouse, a distancia
	var xxm:Number = 2; //xxm é x-xmouse, a distancia
	var vel:Number = 20; //$ a velocidade que a flecha "voa"
	var vel2:Number = vel;
	var grau:Number = 0;
	var rad:Number = 1;
	var rebateu:Number = 0; // a flecha rebate 3 vezes só e vaza
	var rebateNvezes:Number = 3; //$ numero de vezes que a flecha rebate antes de implodior
	var hitter_mc:MovieClip; //tem que ser declarado senão da pau
	var distancia:Number = 0 //importantissima, a flecha só funciona dps que a distancia for maio que uns 5 pixels
	var idFlecha:Number = 0;
	var amiga:Number = 1;
	var amiga_:Boolean;
	
	public function flecha() {
	}
	
	public function calculos() {
		grau = this._rotation;
		rad = grau*Math.PI/180;
	}
	
	public function implodir () {
		
		if(amiga) {
			_root.numeroFlechasAmigasNoPalco--;
		} else {
			_root.numeroFlechasInimigasNoPalco--;
		}
		
		this.removeMovieClip();
	}
	
	private function rebater () {
		//para destruir a flecha
		if(rebateu>=rebateNvezes) {
			implodir();
		} else {
			if(this.hitter_mc.hitTest(_root.dir_mc) || this.hitter_mc.hitTest(_root.esq_mc) ) {
				grau = 180 - grau;
			} else if(this.hitter_mc.hitTest(_root.cima_mc) || this.hitter_mc.hitTest(_root.baixo_mc) ) {
				grau = 360 - grau;
			}
			rad = grau*Math.PI/180;
			rebateu++;
			this._rotation = grau;
		}
	}
	
	private function desacelerar() {
		delete this.onEnterFrame;
		this.onEnterFrame = function () {
			calculos();
		
			this._x += Math.cos(rad)*vel;
			this._y += Math.sin(rad)*vel;

			vel*=0.9;
			this._alpha=vel*8;
			if(vel<3)
			implodir();
		}
	}
	
	private function onEnterFrame () {
		calculos();
		
		this._x += Math.cos(rad)*vel;
		this._y += Math.sin(rad)*vel;
		
		if(distancia>2) {
			//é melhor ter 2 condicionais igual à chamar a função a cada entrade de frame, economiza o processaor
			if(this.hitter_mc.hitTest(_root.dir_mc) || this.hitter_mc.hitTest(_root.esq_mc) || this.hitter_mc.hitTest(_root.cima_mc) || this.hitter_mc.hitTest(_root.baixo_mc))
			rebater();
			
			//bater nos barris
			if(this.hitter_mc.hitTest(_root.bloco1) || this.hitter_mc.hitTest(_root.bloco2))
			implodir();
			
			//bater no jogadores
			if(this.hitter_mc.hitTest(_root.jogador1_mc)) {
				implodir();
				_root.jogador1_mc.atingido(1);
			} else if(this.hitter_mc.hitTest(_root.jogador2_mc)) {
				implodir();
				_root.jogador2_mc.atingido(1);
			}
			
			if(this._x<0 || this._x>640 || this._y<0 || this._y>480)
			implodir ();
			
			vel*=0.975;
			
			if(vel*3<=vel2)
			desacelerar();
		} else {
			distancia++;
		}
	}
}
}
package   
{  
                import flash.display.MovieClip;
		import abow.ArqueiroBow;
/*24 01 2007 23:52 - comecei a agora essa classe, espero que o projeto fique pronto
em no máximo uma semana, acho que o jogo vai ficar legal mas vai demorar
para se difundir pela internet, cabei de pegar meu monitor de 17" e to com dor
no olho, não sei não... bora bora worka

o seguinte... todas as definiç~]oes de variaveis da classe inimigo ou jogador
tem que ser feitas a partir do _root para dinamizar o treco e não ficar estatico,
assim pode-se colocar varios inimigos em campo ão sei pra que ainda
*/
public class inimigo extends ArqueiroBow {
	//
	public function inimigo () {
		setMarcadorDeVida(_root.menu_mc.jogador2vida_mc);
		//alertar("criado o jogador 2");
	};
	
	//redeclarando a funlção calculos
	
	//cada jogador tem sua propria flecha, é preciso recriar essa função tmb
	private function atirar() {
		if(_root.numeroFlechasInimigasNoPalco<_root.numeroMaximoFlechasNoPalco) {
			this.arco_mc.play();
			//idflecha é só um referencial
			idflecha+=1;
			
			_root.numeroFlechasInimigasNoPalco++;

			_root.attachMovie("mcFlecha", "flecha"+idflecha, _root.getNextHighestDepth(), {
																					   _x:this._x, 
																					   _y:this._y, 
																					   _rotation:this._rotation,
																					   _xscale:99,
																					   amiga:0
																					   });
		}
	}
	
	/*private function onEnterFrame () {
		this._rotation = grau;
	}*/
	
	private function receberDados (xdest, ydest, grau) {
		rad = grau*Math.PI/180;
		//this._rotation = grau;
		this.onEnterFrame = function () {
			this._x += (xdest - this._x)*0.2;
			this._y += (ydest - this._y)*0.2;
			this._rotation += (grau - this._rotation)*0.25;
		}
	}
	
	/*private function onPress() {
		atirar();
	}*/
	
}
}
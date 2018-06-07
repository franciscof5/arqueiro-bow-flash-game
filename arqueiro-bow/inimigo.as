/*24 01 2007 23:52 - comecei a agora essa classe, espero que o projeto fique pronto
em no máximo uma semana, acho que o jogo vai ficar legal mas vai demorar
para se difundir pela internet, cabei de pegar meu monitor de 17" e to com dor
no olho, não sei não... bora bora worka

o seguinte... todas as definiç~]oes de variaveis da classe inimigo ou jogador
tem que ser feitas a partir do _root para dinamizar o treco e não ficar estatico,
assim pode-se colocar varios inimigos em campo ão sei pra que ainda
*/
class inimigo extends arqueiro {
	//
	public function inimigo () {
		setMarcadorDeVida(_root.menu_mc.jogador2vida_mc);
		setInterval(atirar, 200*Math.random()+250, this._x, this._y);
		//alertar("criado o jogador 2");
	};
	//redeclarando a funlção calculos
	public function calculos():Void {
		//Essa função serve basicamente para calcular as distancia do mouse
		// com a instancia, como as variaveis sao publicas podem
		// ser acessadas de qualquer local da função, a funcao nao precisa retornar nada
		//declaração de variaveis
		yym = this._y - _root.jogador1_mc._y;
		xxm = this._x - _root.jogador1_mc._x;
		
		rad = Math.atan2(yym, xxm);
		
		grau = rad*180/Math.PI + 180; //o +180 é para o arqueiro ficar virado para frente
	}
	
	//cada jogador tem sua propria flecha, é preciso recriar essa função tmb
	 function atirar(posx:Number, posy:Number) {
		//se não passar nenhum paramentro
		if(posx==undefined) {
			posx = this._x;
			posy = this._y;
		}
		
		if(_root.numeroFlechasInimigasNoPalco<(_root.numeroMaximoFlechasNoPalco+_root.sequencia_vitorias)) {
			this.arco_mc.play();
			//idflecha é só um referencial
			_root.jogador2_mc.idflecha++;
			//trace(_root.jogador2_mc.idflecha);

			//
			_root.numeroFlechasInimigasNoPalco++;
			//setProperty("_root.flechaRest" + numeroFlechas, _visible, false);
			
			//funções
			_root.attachMovie("mcFlechaInimiga", "flecha"+_root.jogador2_mc.idflecha, _root.getNextHighestDepth(), {_x:posx, _y:posy});
		}
	}
	
	private function onPress () {
		//o random é para cada aarqueiro inimigo atirar em um tempo
		//setInterval(atirar, 400*Math.random(), this._x, this._y);
	}
	
	public function onEnterFrame () {
		calculos();
		this._rotation = grau;
		/*if(this._y<20)
		this._y++;
		if(this._y<300)
		this._y--;*/
	}
}
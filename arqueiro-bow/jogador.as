/*
PASSAR A SUJO ESSE CODIGO< PORQUE ELE TA IMUNDO
*/

class jogador extends arqueiro {
	
	//funções
	private function jogador() {
		//funções
		setMarcadorDeVida(_root.menu_mc.jogador1vida_mc);
		setBalaoNome(_root.jogador1balao_mc);
		Key.addListener(this);
	}
	
	// Funções de calculo é específica do jogador pois usa o ponteiro do mouse
	
	private function calculos():Void {
		//Essa função serve basicamente para calcular as distancia do mouse
		// com a instancia, como as variaveis sao privateas podem
		// ser acessadas de qualquer local da função, a funcao nao precisa retornar nada
		//declaração de variaveis
		yym = this._y - _root._ymouse;
		xxm = this._x - _root._xmouse;
		
		rad = Math.atan2(yym, xxm);
		
		grau = rad*180/Math.PI + 180; //o +180 é para o arqueiro ficar virado para frente
	}
	
	//cada jogador tem sua propria flecha, é preciso recriar essa função tmb
	private function atirar(posx:Number, posy:Number) {
		//se não passar nenhum paramentro
		if(posx==undefined) {
			posx = _root._xmouse;
			posy = _root._ymouse;
		}
		
		if(_root.numeroFlechasAmigasNoPalco<_root.numeroMaximoFlechasNoPalco) {
			this.arco_mc.play();
			//idflecha é só um referencial
			idflecha+=1;
			
			_root._root.numeroFlechasAmigasNoPalco++;
			//setProperty("_root.flechaRest" + numeroFlechas, _visible, false);
			
			//funções
			_root.attachMovie("mcFlechaAmiga", "flecha"+idflecha, _root.getNextHighestDepth(), {_x:this._x, _y:this._y});
		}
	}
	
	//Funções de input inheritadas da classe MovieClip
	
	private function onMouseMove () {
		/* o jogador é um ouvinte e a cada movimento do mouse ele gira a instancia */
		//funções
		girarNoProprioEixo();
	}
	
	private function onMouseDown () {
		/* o jogador é um ouvinte e a cada clique ele atira */
		//funções
		atirar();
	}
	
	private function onKeyDown () {
		/* o jogador é um ouvinte e a cada pressionar de tecla */
		
		//funções
		colisao();
		
		//condicionais
		
		if(Key.isDown(Key.UP)) {
			aproximarDoMouse(-1);
		}
		/*if(Key.isDown(Key.DOWN)) {
			aproximarDoMouse(+1);
		};
		if(Key.isDown(Key.LEFT)) {
			girarEmVoltaDoMouse(-0.5);
		};
		if(Key.isDown(Key.RIGHT)) {
			girarEmVoltaDoMouse(+0.5);
		};*/
		else if(Key.isDown(Key.LEFT)) {
			trocaItem(-1);
		}
		else if(Key.isDown(Key.RIGHT)) {
			trocaItem(+1);
		}
		else if(Key.isDown(Key.ENTER)) {
			falar(_root.textoCampo_txt.text, _root.textoCampo_txt);
		}
	};
}
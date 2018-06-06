class balao extends MovieClip{
	var texto:String = "oi";
	var intervaloDoDesaparecimento;
	var tempo:Number = 0;
	var quemFalou:MovieClip;
	var calculoTempo:Number;
	var este;
	var contadorString:Number = 0; // só serve para contar o ponteiro do array da string e fazer aquele efeito bonitinho de escrevendo
	
	private function balao () {
		este = this;
	};
	
	private function setTexto(textoPassado:String) {
		var tempoInicial = _root.tempo;
		contadorString = 0;
		this._alpha = 100;
		this.texto = "";
		
		this.onEnterFrame = function () {
			//início do efeito escrevendo
			this.texto += textoPassado.charAt(contadorString);
			contadorString++;
			//fim do efeito escrevendo
			
			//tem que ajustar aposição quando o jogador andas
			setPosicao();
			calculoTempo = 2 + Math.round(tempoInicial+textoPassado.length/10);
			
			/**if(calculoTempo<4)
			calculoTempo = 4;*/
			
			if(_root.tempo>=calculoTempo) {
				desaparecer();
				delete this.onEnterFrame;
			}
		}
	};
	
	private function setQuemFalou (quem:MovieClip) {
		this.quemFalou = quem;
	}
	
	private function setPosicao () {
		this._x = quemFalou._x;
		this._y = quemFalou._y;
	};
	
	private function desaparecer() {
		//vai tomar no cu o flash é uma merda, ele não acha o valor de this quando é chamdo por setInterval da pra acreditar, setInterval = lixo
		this._alpha = 0;
	};
}
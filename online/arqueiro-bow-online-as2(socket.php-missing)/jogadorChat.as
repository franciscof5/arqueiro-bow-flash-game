class jogadorChat extends MovieClip {
	var nome:String; //o nome que aparece na caixa de texto do movie clip
	var ID:Number; //a ID que é passada pelo _root que ataca esse clip
	
	private function jogadorChat() {
		
	}
	
	private function onRelease() {
		_root.desafio_mc._visible = true;
		_root.desafio_mc.nome = nome;
		_root.desafio_mc.gotoAndStop(2); //vai par o segundo quadro, que é o de aguardar a resposta
		//
		_root.inimigoID = ID;
		_root.jogadores_mc.inimigoID = ID;
		_root.mySocket.desafiar(ID);
	}
}
/*
PASSAR A SUJO ESSE CODIGO< PORQUE ELE TA IMUNDO

colocar um comentario coma ordem de todas as funções
*/

class arqueiro extends MovieClip {
	//o que tiver $ na frente do comentário pode ser mudado com itens dentro do jogo
	
	//Variáveis numéricas
	var numeroFlechadasParaMorrer:Number = 10;// numero de flechadas que o jogador pode tomar
	var vida:Number = 0;// numero de flechadas que o jogador ja tomou
	var grau:Number = 0;
	var rad:Number;
	var yym:Number = 2; //xxm é y-ymouse, a distancia
	var xxm:Number = 2; //xxm é x-xmouse, a distancia
	var velFrente:Number = 5;
	var idflecha:Number = 0;
	var colidindo:Number = 0; //quando colidir com algo vira 1
	
	//Variáveis MovieClipianas
	var marcadorDeVida:MovieClip; //este é movieclip que maraca a vida do jogador
	var balaoNome:MovieClip; //movieclip no palco que é o balão do jogador
	var arco_mc:MovieClip; //o arco que é animado quando atira, tem que ser decladro
	var objetoDaColisao:MovieClip; //eu sou um inútil e não sei a propriedade do movieclip que diz com qual clip ele ta colidindo (acho que nem tem)
	
	// a função tem que ser declarada e todas as classes que herdarem essa terão que redeclara a função calculos
	private function calculos() {}; //na verdade são abstract, mas o flash nao tem
	private function atirar() {}; //na verdade são abstract, mas o flash nao tem
	
	/* funções concretas hehehe
	colisao(); com certeza o calcanhar de aquiles de qualquer jogo, o sistema de colisão, ta quase bom, nota 7
	aproximarDoMouse(); auto-explicavel
	girarNoProprioEixo(); auto-explicavel
	atingido(); quando a flecha atingi o jogador, ela chama essa função (problema, os jogadores precisam ser definidos pois eu não conheço uma propriedade de movieclip que diz o clipe que ele esta em colisão no momento, sei fazer um pog disso só mto ruim)
	setMarcadorDeVida(); função para definir qual o movieclip é "escalado" (de escalar de tamanho) como marcador de vida
	falar(); IMPORTANTE (ela só está dentro do jogador porque ele é um ouvinte de teclas, isso facilita tudo) função que adiciona o balãozinho do jogador com o texto digitado
	trocaItem (); com as setas ele troca o item
	*/
	
	private function colisao():Void {
		if (CollisionDetection.checkForCollision(this,_root.lago1,250)) {
			colidindo = 1; //rebate o jogador para trás muito devagar suavemente
			//afff tive que adicionar isso POIS eu não conheço uma propriedade de movieclip que diz o clipe que ele esta em colisão no momento
			objetoDaColisao = _root.lago1;
		} else if(CollisionDetection.checkForCollision(this,_root.lago2,250)) {
			colidindo = 1;
			//afff tive que adicionar isso POIS eu não conheço uma propriedade de movieclip que diz o clipe que ele esta em colisão no momento
			objetoDaColisao = _root.lago2;
		} else if(CollisionDetection.checkForCollision(this,_root.bloco1,250)) {
			colidindo = 1;
			//afff tive que adicionar isso POIS eu não conheço uma propriedade de movieclip que diz o clipe que ele esta em colisão no momento
			objetoDaColisao = _root.bloco1;
		} else if(CollisionDetection.checkForCollision(this,_root.bloco2,250)) {
			colidindo = 1;
			//afff tive que adicionar isso POIS eu não conheço uma propriedade de movieclip que diz o clipe que ele esta em colisão no momento
			objetoDaColisao = _root.bloco2;
		} else {
			//se não tiver COLIDINDO em nada
			colidindo = 0;
		}
	}
	
	private function aproximarDoMouse(dir:Number):Void {
		//funções
		calculos();
		//
		if(Math.abs(xxm)>5)//maior que 1 para não ficar batendo no ponteiro, para entender comente essa linha e teste, o jogador fica rebatendo no ponteiro do mouse
		this._x += Math.cos(rad)*dir*velFrente;
		if(Math.abs(yym)>5)//maior que 1 para não ficar batendo no ponteiro
		this._y += Math.sin(rad)*dir*velFrente;
		
		if(colidindo) {
			this._x -= Math.cos(rad)*dir*velFrente;
			this._y -= Math.sin(rad)*dir*velFrente;
		}
		
		_root.mySocket.jogar(this._x,this._y,this._rotation,'false',_root.qualLadoVoceComeca);
	}
	
	private function girarNoProprioEixo():Void {
		//funções
		calculos();
		colisao();
		
		// 31 de janeiro de 2007 20:52 isso quebrou minhas pernas, demorei
		// pra descobrir que essa porcaria de colisão tava dando pau
		// quando o jogador girava no proprio eixo, mais processador neles
		// encha de condição isso ae pra dar certo
		if(colidindo) {
			//pega o centro do obejto que o jogador esta colidindo e afasta
			//o jogador, em outra palavras, traça uma linha entre o eixo
			//do jogador e do objeto que ele está colidindo e seguindo
			//essa linha o jogador é afastado
			var yym2 = this._y - objetoDaColisao._y;
			var xxm2 = this._x - objetoDaColisao._x;
			
			var rad2 = Math.atan2(yym2, xxm2);

			this._x += Math.cos(rad2);
			this._y += Math.sin(rad2);
			
			//apesar de banal é bom lembrar que o jogador tem que girar sempre com o mouse
			this._rotation = grau;
		} else {
			this._rotation = grau;
		}
	}
	
	
	private function falar (string:String, deOndeVeioAfala:TextField) {
		//um balão, mas não pode ser dentro do jogador porque o jogador gira (_rotation) e caixas de texots não
		//o balão de cada jogador tem que ja estar atacado no palco para pode ser acessível
		deOndeVeioAfala.text = "";
		balaoNome.setTexto(string);
		balaoNome.setQuemFalou(this);
	}
	
	private function trocaItem(dir:Number) {
		_root.tipoFlecha_mc.gotoAndStop(_root.tipoFlecha_mc._currentframe+dir*10);
		//trace(dir*10);
	}
	
	//setadores
	private function setMarcadorDeVida (novoMarcadorDeVida:MovieClip) {
		this.marcadorDeVida = novoMarcadorDeVida;
	}
	private function setBalaoNome (novoBalao:MovieClip) {
		this.balaoNome = novoBalao;
	}
	
	
	//Funções antigas que agora são comentários
	/*private function girarEmVoltaDoMouse(dir):Void {
		bom, essa função é especial porque se o jogador poque querer se esquivar
		de um tiro, mas não tem como ele pro lado pois está focado no ponteiro do mouse,
		o que ele pode fazer é girar em volta do mouse com a famosa
		equação da cinrcunferencia aplicada ao flash, chora 25 jan 1007 18:11
		//funções
		calculos();
		//
		grau+=90;
		rad = grau*Math.PI/180;
		this._x += Math.cos(rad)*dir*velLado;
		this._y += Math.sin(rad)*dir*velLado;
		
		if(colidindo) {
			this._x -= Math.cos(rad)*dir*velLado;
			this._y -= Math.sin(rad)*dir*velLado;
		} else {
			//Ele precisa girar a cada vez que vai pro lado estar sempre olhando para o mouse
			girarNoProprioEixo();
		}
	}
	
	
	//Antigas variaveis que agora são comentários
	//var bloqueado:Boolean = false; //se for true o jogador fica bloqueado e não pode andar coitado
	// nao utilizado var numeroFlechas:Number = 10; //$ quantas flechas o arqueiro tem (não utilizado)
	// ta no _root var numeroFlechasNoPalco:Number = 0; //o arqueiro não pode "apelar, só pode ter atirar algumas flechas de cada vez
	// ta no _root var numeroMaximoFlechasNoPalco:Number = 0; //$
	//o jogador não vai mais pro lado var velLado:Number = velFrente*1.75;
	//multiplicadorColisao , virou uma boolean colidindo

	
	*/
}